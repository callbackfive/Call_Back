class PaymentsController < ApplicationController
    require 'digest'
      
    before_action :authenticate_user!
    before_action :get_order, only: [:mpg]
  
      
    skip_before_action :verify_authenticity_token, only: [:paid, :not_paid_yet, :notify, :canceled]

      def mpg
        hashKey = 'PED4txrEktTyEDSx8hG0zep0DrKTTT0X'
        hashIV = 'CQBc2k1cpdHqEEkP' 
  
        merchantID = 'MS317365402'
        version = '1.4'
        respondType = 'JSON'
        timeStamp = Time.now.to_i.to_s
        # merchantOrderNo = "CallBack"  + Time.now.to_i.to_s
        merchantOrderNo = @order.merchant_order_no
        amt = @order.giveback_price
        itemDesc = @order.giveback_title
        
        data = "MerchantID=#{merchantID}&RespondType=#{respondType}&TimeStamp=#{timeStamp}&Version=#{version}&MerchantOrderNo=#{merchantOrderNo}&Amt=#{amt}&ItemDesc=#{itemDesc}&TradeLimit=120"
      
        data = addpadding(data)
        aes = encrypt_data(data, hashKey, hashIV, 'AES-256-CBC')
        checkValue = "HashKey=#{hashKey}&#{aes}&HashIV=#{hashIV}"
      
        @merchantID = merchantID
        @tradeInfo = aes
        @tradeSha = Digest::SHA256.hexdigest(checkValue).upcase
        @version = version
        # TODO
        # @pledge.update(merchantOrderNo: merchantOrderNo)
      end
        
      def paid
  
        hashKey = 'PED4txrEktTyEDSx8hG0zep0DrKTTT0X' #填入你的key
        hashIV = 'CQBc2k1cpdHqEEkP' #
        
        if params["Status"] == "SUCCESS"
      
          tradeInfo = params["TradeInfo"]
          tradeSha = params["TradeSha"]
      
            checkValue = "HashKey=#{hashKey}&#{tradeInfo}&HashIV=#{hashIV}"
            
            if tradeSha == Digest::SHA256.hexdigest(checkValue).upcase
              
              rawTradeInfo = decrypt_data(tradeInfo, hashKey, hashIV, 'AES-256-CBC')
              
              jsonResult = JSON.parse(rawTradeInfo)
              
              result = jsonResult["Result"]
              
              Logger.new("#{Rails.root}/paid.log").try("info", result)

              merchantOrderNo = result["MerchantOrderNo"]
              
              pledge = Pledge.not_selected_yet.find_by(merchantOrderNo: merchantOrderNo)

              if order 
                
                # 建立一個新的payment, status會是已付款
                payment = Payment.paid.new(order: order)
                
                # payment裡面也有 merchant_order_no，如果用不到可以拿掉這個column
                payment.merchant_order_no = merchantOrderNo
                
                # transaction_service_provider 設成 mpg
                payment.transaction_service_provider = "mpg"
                
                if result["PaymentType"] == "CREDIT"
                  payment.payment_type = "credit_card"
                  # TODO: add info from result
                elsif result["PaymentType"] == "WEBATM"
                  payment.payment_type = "web_atm"
                  # TODO: add info from result
                end
                
                # 設已付款金額
                payment.end_price = result["Amt"]
                
                # 儲存，加!會導致失敗的時候出現error
                payment.save!
                
                # pledge 改成已付款，Model裡面有override
                pledge.paid!
                
                flash[:alert] = "付款成功"
                redirect_to root_path
                # redirect_to pledges_path(pledge)
                return
            end
          end
        end
      
          flash[:alert] = "付款失敗"
          redirect_to root_path
      end
        
      def not_paid_yet
  
          hashKey = 'PED4txrEktTyEDSx8hG0zep0DrKTTT0X' #填入你的key
          hashIV = 'CQBc2k1cpdHqEEkP' #
      
          if params["Status"] == "SUCCESS"
      
            tradeInfo = params["TradeInfo"]
            tradeSha = params["TradeSha"]
      
            checkValue = "HashKey=#{hashKey}&#{tradeInfo}&HashIV=#{hashIV}"
            if tradeSha == Digest::SHA256.hexdigest(checkValue).upcase
              
              #解碼
              rawTradeInfo = decrypt_data(tradeInfo, hashKey, hashIV, 'AES-256-CBC')
              
              #轉成JSON
              jsonResult = JSON.parse(rawTradeInfo)
              
              result = jsonResult["Result"]
              
              #寫入Log
              Logger.new("#{Rails.root}/not_paid_yet.log").try("info", result)
              
              merchantOrderNo = result["MerchantOrderNo"]
              
              #利用訂單編號找出 pledge，建立非同步交易的情況pledge 會是處於not_selected_yet
              pledge = Pledge.not_selected_yet.find_by(merchant_order_no: merchant_order_no)
              
              if pledge 
                # 建立一個新的payment, status會是未付款
                payment = Payment.not_paid_yet.new(pledge: pledge)
                payment.merchant_order_no = merchantOrderNo
                
                payment.transaction_service_provider = "mpg"
                if result["PaymentType"] == "CVS"
                  payment.payment_type = "cvs"
                  expire_date = result["ExpireDate"]
                  expire_time = result["ExpireTime"]
                  payment.unpaid_payment_expire_date = Time.zone.parse("#{expire_date} #{expire_time}")
                  payment.code_no = result["CodeNo"]
                elsif result["PaymentType"] == "VACC"
                  payment.payment_type = "atm"
                  # TODO: add info from result
                elsif result["PaymentType"] == "BARCODE"
                  payment.payment_type = "bar_code"
                  # TODO: add info from result
                end
                payment.end_price = result["Amt"]
                payment.save!
                
                # pledge改成未付款
                pledge.not_paid!
                
                redirect_to pledge_path(pledge)
                return
              end
            end
          end
          
          flash[:alert] = "選擇付款方式失敗"
          redirect_to root_path()
      end
        
      def canceled
          redirect_to root_path
      end
        
      def notify
  
          hashKey = 'PED4txrEktTyEDSx8hG0zep0DrKTTT0X' #填入你的key
          hashIV = 'CQBc2k1cpdHqEEkP' #
  
          if params["Status"] == "SUCCESS"
            tradeInfo = params["TradeInfo"]
            tradeSha = params["TradeSha"]
      
            checkValue = "HashKey=#{hashKey}&#{tradeInfo}&HashIV=#{hashIV}"
            if tradeSha == Digest::SHA256.hexdigest(checkValue).upcase
              rawTradeInfo = decrypt_data(tradeInfo, hashKey, hashIV, 'AES-256-CBC')
              
              jsonResult = JSON.parse(rawTradeInfo)
              
              result = jsonResult["Result"]
              
              #寫入Log
              Logger.new("#{Rails.root}/notify.log").try("info", result)
              
              merchantOrderNo = result["MerchantOrderNo"]
              
              #利用訂單編號找出 pledge，以建立付款但未付款的情況，pledge為not_paid
              pledge = Pledge.not_paid.find_by(merchantOrderNo: merchantOrderNo)
              if pledge 
                # 只讓特定非即時付款方式狀態變化，避免二次執行
                if result["PaymentType"] == "CVS"
                  pledge.payment.paid!
                  pledge.paid!
                  # TODO: add info from result
                elsif result["PaymentType"] == "VACC"
                  pledge.payment.paid!
                  pledge.paid!
                  # TODO: add info from result
                elsif result["PaymentType"] == "BARCODE"
                  pledge.payment.paid!
                  pledge.paid!
                  # TODO: add info from result
                else
                  #Do Nothing
                end
              end
            end
          end
      
          respond_to do |format|
            format.json {render json: {result: "success"}}
          end
      end
        
      private
      def is_login?
          unless current_user
            flash[:error] = "您尚未登入"
            redirect_to login_path
            return
          end
      end
        
      def get_order
          @order = Order.find_by(id: params[:order_id], user: current_user)
          
          unless @order
            flash[:alert] = "沒有選擇贊助選項"
            redirect_to :root
            return
          end
      end
        
        # =============
        # mpg methods
        # =============
        
      def addpadding(data, blocksize = 32)
          len = data.length
          pad = blocksize - ( len % blocksize)
          data += pad.chr * pad
          return data
      end
      
      def encrypt_data(data, key, iv, cipher_type)
          cipher = OpenSSL::Cipher.new(cipher_type)
          cipher.encrypt
          cipher.key = key
          cipher.iv = iv
          encrypted = cipher.update(data) + cipher.final
          return encrypted.unpack("H*")[0].upcase
      end
      
      def removedPadding(data)
          blocksize = 32
          loop do
            lastHex = data.last.bytes.first
            break if lastHex >= blocksize
            # 每一次只移除最後一個
            data = data[0...-1]
          end
          return data
      end
      
      def decrypt_data(data, key, iv, cipher_type)
          cipher = OpenSSL::Cipher.new(cipher_type)
          cipher.decrypt
          cipher.key = key
          cipher.iv = iv
          packedData = [data.downcase].pack('H*')
          data = removedPadding(cipher.update(packedData))
          begin
            return data + cipher.final
          rescue
            return data
          end
        end
    end
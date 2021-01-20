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
      merchantOrderNo = @order.merchantOrderNo
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

  end

  def notify

      hashKey = 'PED4txrEktTyEDSx8hG0zep0DrKTTT0X'
      hashIV = 'CQBc2k1cpdHqEEkP'

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

          order = Order.not_selected_yet.find_by(merchantOrderNo: merchantOrderNo)
          if order 
            # 只讓特定非即時付款方式狀態變化，避免二次執行
            if result["PaymentType"] == "CVS"
              order.payment.paid!
              order.paid!
   
            elsif result["PaymentType"] == "VACC"
              order.payment.paid!
              order.paid!
            else
            end
          end
        end
      end
  
      respond_to do |format|
        format.json {render json: {result: "success"}}
      end
  end
      
  def paid

    hashKey = 'PED4txrEktTyEDSx8hG0zep0DrKTTT0X'
    hashIV = 'CQBc2k1cpdHqEEkP'
    
    if params["Status"] == "SUCCESS"
  
      tradeInfo = params["TradeInfo"]
      tradeSha = params["TradeSha"]
      checkValue = "HashKey=#{hashKey}&#{tradeInfo}&HashIV=#{hashIV}"
        
      if tradeSha == Digest::SHA256.hexdigest(checkValue).upcase
        #解碼
        rawTradeInfo = decrypt_data(tradeInfo, hashKey, hashIV, 'AES-256-CBC')
            
        jsonResult = JSON.parse(rawTradeInfo)
        result = jsonResult["Result"]
            
        #寫入Log
        Logger.new("#{Rails.root}/paid.log").try("info", result)

        merchantOrderNo = result["MerchantOrderNo"]
        order = Order.order_received.find_by(merchantOrderNo: merchantOrderNo)
          
        if order 
          payment = Payment.paid.new(order: order)
          payment.merchant_order_no = merchantOrderNo

          payment.trade_no = result["TradeNo"]
          payment.card_4no = result["Card4No"]
          payment.paid_date = result["PayTime"]
          payment.end_price = result["Amt"]
          payment.save!
          order.paid!
          flash[:notice] = "付款成功，請至會員中心查看訂單紀錄"
          redirect_to root_path
          return
        end
      end
    end
      flash[:notice] = "付款失敗"
      redirect_to root_path
  end
  
  private
      
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
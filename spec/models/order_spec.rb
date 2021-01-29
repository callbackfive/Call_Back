require "./spec/models/order"

RSpec.describe Order do
    describe "訂單系統基本功能" do
        it "可以建立訂單" do
           
        end
        it "建立訂單的同時，將current_uer,project.title,giveback.title,giveback.price一並更新到訂單裡" do
            order = Order.new
            urrent_user = @current_user
            title =  @project.title
            
            order.assign_attributes(
                user: @current_user,
                project_title: @project.title,
                giveback_title: @giveback.title,
                giveback_price: @giveback.price,
              )
        end
        it "商品可以放到購物車裡，也可以再拿出來"
        it "每個 Cart Item 都可以計算它自己的金額（小計）"
        it "可以計算整台購物車的總消費金額"
      end
end


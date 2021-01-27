require 'rails_helper'

RSpec.describe Order, type: :model do
    describe "購物車基本功能" do
        it "可以把商品丟到到購物車裡，然後購物車裡就有東西了"
        it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變"
        it "商品可以放到購物車裡，也可以再拿出來"
        it "每個 Cart Item 都可以計算它自己的金額（小計）"
        it "可以計算整台購物車的總消費金額"
      end
end

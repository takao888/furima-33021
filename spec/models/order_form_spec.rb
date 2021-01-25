require 'rails_helper'

RSpec.describe OrderForm, type: :model do
before do
  @order_form = FactoryBot.build(:order_form)
end


  it "building以外が正しく入力されていれば登録できる" do
    expect(@order_form).to be_valid
  end

  it "priceとtokenがあれば保存ができること" do
    expect(@order_form).to be_valid
  end

  it "postal_codeが空だと登録できない" do
    @order_form.postal_code = ""
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
  end

  it "postal_codeが全角だと登録できない" do
    @order_form.postal_code = "１１１１１１１"
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
  end

  it "postal_codeは-がないと登録できない" do
    @order_form.postal_code = "1111111"
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
  end

  it "prefecture_idが1だと登録できない" do
    @order_form.prefecture_id = "1"
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Prefecture Select")
  end

  it "cityが空だと登録できない" do
    @order_form.city = ""
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("City can't be blank")
  end

  it "addressが空だと登録できない" do
    @order_form.address = ""
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Address can't be blank")
  end

  it "phone_numberが空だと登録できない" do
    @order_form.phone_number = ""
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
  end

  it "phone_numberは全角だと登録できない" do
    @order_form.phone_number = "０９０１２３４１２３４"
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Phone number Input only number")
  end


  it "tokenが空では登録できないこと" do
    @order_form.token = ""
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Token can't be blank")
  end

end
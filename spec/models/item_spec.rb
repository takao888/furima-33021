require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    end

  describe "正常" do
    it "全ての項目の入力が存在すればok" do
      expect(@item).to be_valid
    end

  describe "異常" do
    it "nameは空だとng" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "descriptionは空だとng" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "category_idは1だとng" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it "sales_status_idは1だとng" do
      @item.sales_status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status Select")
    end

    it "shipping_fee_status_idは1だとng" do
      @item.shipping_fee_status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status Select")
    end

    it "prefecture_idは1だとng" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end

    it "scheduled_delivery_idは1だとng" do
      @item.scheduled_delivery_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery Select")
    end

    it "priceは299以下だとng" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceは9999999を超過するとng" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが全角文字だとng" do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが英数混合だとng" do
      @item.price = "pp00"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが半角英語だけではng" do
      @item.price = "pppp"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it "画像が空ではng" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
end
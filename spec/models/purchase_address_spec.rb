require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do 
    @purchase = FactoryBot.build(:purchase_address)
  end

  it 'フォームが全て記入され、トークンがあれば保存できる' do
    expect(@purchase).to be_valid
  end

  it 'telephone_numberが空の時は保存できない' do
    @purchase.telephone_number = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Telephone number can't be blank")
  end

  it 'telephone_numberにhyphenある時は保存できない' do
    @purchase.telephone_number = "090-1111-1111"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Telephone number must up to 11 characters without hyphens")
  end

  it 'telephone_numberがhyphenあり、11桁以内の時は保存できない' do
    @purchase.telephone_number = "090-1111-1111"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Telephone number must up to 11 characters without hyphens")
  end

  it 'telephone_numberがhyphenなし、12桁以上の時は保存できない' do
    @purchase.telephone_number = "090111111111"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Telephone number must up to 11 characters without hyphens")
  end

  it 'prefecture_idが空の時は保存できない' do
    @purchase.prefecture_id = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'prefecture_idが1の時は保存できない' do
    @purchase.prefecture_id = 1
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it 'municipalityが空の時は保存できない' do
    @purchase.municipality = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
  end

  it 'adderss_numberが空の時は保存できない' do
    @purchase.address_number = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Address number can't be blank")
  end

  it 'postal_codeが空の時は保存できない' do
    @purchase.postal_code = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
  end

  it 'postal_codeのhyphenがない時は保存できない' do
    @purchase.postal_code = "1234567"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Postal code must be 7 characters including hyphen")
  end

  it 'postal_codeがhyphenあり、8桁以上の時は保存できない' do
    @purchase.postal_code = "123-45678"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Postal code must be 7 characters including hyphen")
  end

  it 'user_idが空の時は保存できない' do
    @purchase.user_id = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("User can't be blank")
  end

  it 'item_idが空の時は保存できない' do
    @purchase.item_id = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Item can't be blank")
  end

  it 'tokenが空の時は保存できない' do
    @purchase.token = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Token can't be blank")
  end
end

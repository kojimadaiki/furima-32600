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
    expect(@purchase.errors.full_messages).to include("電話番号を入力してください")
  end

  it 'telephone_numberにhyphenある時は保存できない' do
    @purchase.telephone_number = "090-1111-1111"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("電話番号はハイフンを含まない11字以内です")
  end

  it 'telephone_numberがhyphenあり、11桁以内の時は保存できない' do
    @purchase.telephone_number = "090-1111-1111"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("電話番号はハイフンを含まない11字以内です")
  end

  it 'telephone_numberがhyphenなし、12桁以上の時は保存できない' do
    @purchase.telephone_number = "090111111111"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("電話番号はハイフンを含まない11字以内です")
  end

  it 'prefecture_idが空の時は保存できない' do
    @purchase.prefecture_id = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("発送元の地域を入力してください")
  end

  it 'prefecture_idが1の時は保存できない' do
    @purchase.prefecture_id = 1
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
  end

  it 'municipalityが空の時は保存できない' do
    @purchase.municipality = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("市区町村を入力してください")
  end

  it 'adderss_numberが空の時は保存できない' do
    @purchase.address_number = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("番地を入力してください")
  end

  it 'postal_codeが空の時は保存できない' do
    @purchase.postal_code = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("郵便番号を入力してください")
  end

  it 'postal_codeのhyphenがない時は保存できない' do
    @purchase.postal_code = "1234567"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("郵便番号はハイフンを含む7文字です")
  end

  it 'postal_codeがhyphenあり、8桁以上の時は保存できない' do
    @purchase.postal_code = "123-45678"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("郵便番号はハイフンを含む7文字です")
  end

  it 'user_idが空の時は保存できない' do
    @purchase.user_id = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Userを入力してください")
  end

  it 'item_idが空の時は保存できない' do
    @purchase.item_id = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Itemを入力してください")
  end

  it 'tokenが空の時は保存できない' do
    @purchase.token = ""
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("トークンを入力してください")
  end
end

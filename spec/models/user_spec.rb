require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "フォームを全て入力すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nameが空である" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "emailが空である" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@が含まれていない" do
        @user.email = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空である" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが英数字で構成されていない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "passwordが英数字で構成されていない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "passwordが5文字以下" do
        @user.password = "aa1aa"
        @user.password_confirmation = "aa1aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "password_confirmationがpasswordと一致していない" do
        @user.password = "aaa1aaa"
        @user.password_confirmation = "aaa1aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "full_firstnameが空である" do
        @user.full_firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Full firstname can't be blank")
      end

      it "full_firstnameが漢字でない" do
        @user.full_firstname = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Full firstname Full-width chinese characters")
      end

      it "full_lastnameが空である" do
        @user.full_lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Full lastname can't be blank")
      end

      it "full_lastnameが漢字でない" do
        @user.full_lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Full lastname Full-width chinese characters")
      end

      it "kana_firstnameが空である" do
        @user.kana_firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana firstname can't be blank")
      end

      it "kana_firstnameがカタカナでない" do
        @user.kana_firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana firstname Full-width katakana characters")
      end

      it "kana_lastnameが空である" do
        @user.kana_lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana lastname can't be blank")
      end

      it "kana_lastnameがカタカナでない" do
        @user.kana_lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana lastname Full-width katakana characters")
      end

      it "birth_dateが空" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end

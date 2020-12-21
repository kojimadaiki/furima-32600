require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'フォームを全て入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nameが空である' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it 'emailが空である' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailに@が含まれていない' do
        @user.email = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが空である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが英数字で構成されていない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字です')
      end

      it 'passwordが英数字で構成されていない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字です')
      end

      it 'passwordが5文字以下' do
        @user.password = 'aa1aa'
        @user.password_confirmation = 'aa1aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'password_confirmationがpasswordと一致していない' do
        @user.password = 'aaa1aaa'
        @user.password_confirmation = 'aaa1aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'full_firstnameが空である' do
        @user.full_firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end

      it 'full_firstnameが漢字でない' do
        @user.full_firstname = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は漢字です')
      end

      it 'full_lastnameが空である' do
        @user.full_lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end

      it 'full_lastnameが漢字でない' do
        @user.full_lastname = 'kenji'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は漢字です')
      end

      it 'kana_firstnameが空である' do
        @user.kana_firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ヨミガナ（姓）を入力してください")
      end

      it 'kana_firstnameがカタカナでない' do
        @user.kana_firstname = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('ヨミガナ（姓）は全角カタカナです')
      end

      it 'kana_lastnameが空である' do
        @user.kana_lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ヨミガナ（名）を入力してください")
      end

      it 'kana_lastnameがカタカナでない' do
        @user.kana_lastname = 'hiro'
        @user.valid?
        expect(@user.errors.full_messages).to include('ヨミガナ（名）は全角カタカナです')
      end

      it 'birth_dateが空' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end

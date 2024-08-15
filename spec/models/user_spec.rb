require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての必須項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'testtest99'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'asda1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aabbcc'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は少なくとも1つの英字と1つの数字を含める必要があります"
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'らいおんはつよい'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は少なくとも1つの英字と1つの数字を含める必要があります"
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password_confirmation = 'aabbcc'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '112233'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は少なくとも1つの英字と1つの数字を含める必要があります"
      end
      it '苗字(全角)が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it '苗字(全角)に半角文字が含まれていると登録できない' do
        @user.family_name = 'だいこﾝ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name は全角文字を使用しよう"
      end
      it '名前(全角)が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it '名前(全角)に半角文字が含まれていると登録できない' do
        @user.first_name = 'だいこﾝ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name は全角文字を使用しよう"
      end
      it '苗字(カナ)が空では登録できない' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana family name can't be blank"
      end
      it '苗字(カナ)がにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.kana_family_name = 'とまと'
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana family name は全角カタカナを使用しよう"
      end
      it '名前(カナ)が空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include"Kana first name can't be blank"
      end
      it '名前(カナ)が空では登録できない' do
        @user.kana_first_name = '突然'
        @user.valid?
        expect(@user.errors.full_messages).to include"Kana first name は全角カタカナを使用しよう"
      end
      it '誕生日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
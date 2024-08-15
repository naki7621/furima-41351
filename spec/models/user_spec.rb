require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: 'テスト', first_name: 'テスト2', kana_family_name: 'テスト', kana_first_name: 'テスト2', 
      birthday: '1999-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000', family_name: 'テスト', first_name: 'テスト2', kana_family_name: 'テスト', kana_first_name: 'テスト2', 
      birthday: '1999-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '', family_name: 'テスト', first_name: 'テスト2', kana_family_name: 'テスト', kana_first_name: 'テスト2', 
      birthday: '1999-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが一致していないと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '111111', family_name: 'テスト', first_name: 'テスト2', kana_family_name: 'テスト', kana_first_name: 'テスト2', 
      birthday: '1999-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '苗字が空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: '', first_name: 'テスト2', kana_family_name: 'テスト', kana_first_name: 'テスト2', 
      birthday: '1999-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it '名前が空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: 'テスト', first_name: '', kana_family_name: 'テスト', kana_first_name: 'テスト2', 
      birthday: '1999-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it '苗字カタカナが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: 'テスト', first_name: 'テスト2', kana_family_name: '', kana_first_name: 'テスト2', 
      birthday: '1999-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Kana family name can't be blank")
    end
    it '名前カタカナが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: 'テスト', first_name: 'テスト2', kana_family_name: 'テスト', kana_first_name: '', 
      birthday: '1999-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it '誕生日が空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: 'テスト', first_name: 'テスト2', kana_family_name: 'テスト', kana_first_name: 'テスト2', 
      birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
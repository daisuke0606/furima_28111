require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '登録項目が全て記述されていれば登録できる' do
        @user.save
      end
      it 'nicknameが40文字以下で登録できる' do
        @user.nickname = 'aaaaaaaaaa'
        @user.save
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        @user.save
      end
      it 'パスワードは半角英数字混合' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        @user.save
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'nicknameが41文字以上であれば登録できない' do
        @user.nickname = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 40 characters)')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名字が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
      end
      it '名字が半角では登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it '名前が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角文字を使用してください')
      end
      it '名前が半角では登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it '名字(カタカナ)が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana 全角カタカナを使用してください')
      end
      it '名字(カタカナ)が半角では登録できない' do
        @user.first_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナを使用してください')
      end
      it '名前(カタカナ)が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana 全角カタカナを使用してください')
      end
      it '名字(カタカナ)が半角では登録できない' do
        @user.last_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナを使用してください')
      end
      it '生年月日が空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end

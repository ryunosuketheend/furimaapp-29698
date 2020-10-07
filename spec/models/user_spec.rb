require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname, first_name, last_name, first_name_katakana, last_name_katakana, birthday, email、password, password_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが半角6文字以上英・大文字・小文字・数字それぞれ１文字以上であれば登録できる" do
        @user.password = "Macho123"
        @user.password_confirmation = "Macho123"
        expect(@user).to be_valid
      end
      it "first_nameは全角(漢字、ひらがな、カタカナ)であれば登録できる" do
        @user.first_name = "あア亜"
        expect(@user).to be_valid
      end
      it "last_nameは全角(漢字、ひらがな、カタカナ)であれば登録できる" do
        @user.last_name = "あア亜"
        expect(@user).to be_valid
      end
      it "first_name_katakanaは全角(カタカナ)であれば登録できる" do
        @user.first_name_katakana = "ア"
        expect(@user).to be_valid
      end
      it "last_name_katakanaは全角(カタカナ)であれば登録できる" do
        @user.last_name_katakana = "ア"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors[:last_name]).to include("can't be blank")
      end
      it "first_name_katakanaが空だと登録できない" do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors[:first_name_katakana]).to include("can't be blank")
      end
      it "last_name_katakanaが空だと登録できない" do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors[:last_name_katakana]).to include("can't be blank")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors[:birthday]).to include("can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角6文字以上英・大文字・小文字・数字それぞれ１文字以上でなければ登録できない" do
        @user.password = "ああああああ"
        @user.password_confirmation = "ああああああ"
        @user.valid?
        expect(@user.errors[:password]).to include("は半角6文字以上英・大文字・小文字・数字それぞれ１文字以上含む必要があります")
      end
      it "first_nameは全角(漢字、ひらがな、カタカナ)でなければ登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors[:first_name]).to include("は全角(漢字、ひらがな、カタカナ)である必要があります")
      end
      it "last_nameは全角(漢字、ひらがな、カタカナ)でなければ登録できない" do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors[:last_name]).to include("は全角(漢字、ひらがな、カタカナ)である必要があります")
      end
      it "first_name_katakanaは全角(カタカナ)でなければ登録できない" do
        @user.first_name_katakana = "あ"
        @user.valid?
        expect(@user.errors[:first_name_katakana]).to include("は全角(カタカナ)である必要があります")
      end
      it "last_name_katakanaは全角(カタカナ)でなければ登録できない" do
        @user.last_name_katakana = "あ"
        @user.valid?
        expect(@user.errors[:last_name_katakana]).to include("は全角(カタカナ)である必要があります")
      end
    end
  end
end
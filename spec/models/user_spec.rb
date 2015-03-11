require 'rails_helper'

describe User, :type => :model do
  before { @user = build(:user, password: '111111') }

  context 'model validation' do
    it 'has a valid factory' do
      expect(@user).to be_valid
    end

    it 'is invalid without a name' do
      validate_presence_of(@user, :name)
    end

    it 'is invalid if a name longer then 50 characters' do
      validate_max_length_of(@user, :name, 51)
    end

    it 'is invalid without an email' do
      validate_presence_of(@user, :name)
    end

    it 'is invalid if an email longer then 250 characters' do
      validate_max_length_of(@user, :name, 251)
    end

    it 'is invalid with incorrect email format' do
      @user[:email] = '@gmail.com'
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end

    it 'is invalid if email is not unique' do
      @user.save
      user = build(:user, email: @user[:email])
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it 'is invalid if password length less then 5 characters' do
      user = build(:user, password: '111')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 5 characters)')
    end
  end

  it 'makes email address downcase before save' do
    email = 'NEW_USER@gmail.com'
    @user[:email] = email
    @user.save
    expect(@user[:email]).to include(email.downcase)
  end

  it 'creates activation digest' do
    @user.save
    expect(@user[:activation_digest]).not_to be_empty
  end

  context '#activate' do
    it 'activates user account' do
      user = create(:not_activated_user)
      expect{ user.activate }.to change{ user[:activated] }.from(false).to(true)
    end
  end


    xit 'sends an activation email' do

    end

    context '#create_reset_digest' do
      it 'creates digest for password reset' do
        
      end
    end

    xit 'sends password reset email' do

    end

    it 'returns User.digest' do

    end

    it 'returns random token' do

    end

    it 'creates remember digest' do

    end

    it 'tests authenticated? method' do

    end

    it 'tests forget' do

    end

    it 'tests password reset expired' do

    end
end

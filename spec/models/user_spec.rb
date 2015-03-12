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

    context '#create_reset_digest' do
      it 'creates digest for password reset' do
        @user.save
        @user.create_reset_digest
        expect(@user[:reset_digest]).not_to be_empty
      end
    end

    context 'sends password reset email' do

      it 'renders a correct subject' do
        user = create(:user, password: '111111')
        user.create_reset_digest
        email = user.send_password_reset_email
        expect(email.subject).to eq('Password reset')
      end

      it 'renders a correct from' do
        user = create(:user, password: '111111')
        user.create_reset_digest
        email = user.send_password_reset_email
        expect(email.from).to include('bookshelfnotifications@example.com')
      end

      it 'renders a correct to' do
        user = create(:user, password: '111111')
        user.create_reset_digest
        email = user.send_password_reset_email
        expect(email.to).to include(user[:email])
      end
    end
  
    context 'sends an activation email' do
      it 'renders a correct subject' do
        user = create(:user, password: '111111')
        email = user.send_activation_email
        expect(email.subject).to eq('Account activation')
      end

      it 'renders a correct from' do
        user = create(:user, password: '111111')
        email = user.send_activation_email
        expect(email.from).to include('bookshelfnotifications@example.com')
      end

      it 'renders a correct to' do
        user = create(:user, password: '111111')
        email = user.send_activation_email
        expect(email.to).to include(user[:email])
      end
    end

    context '#digest' do
      it 'returns User.digest' do
        expect(User.digest('11223344')).not_to be_empty
      end
    end

  context '#new_token' do
    it 'generates a random URL-safe base64 string' do
      expect(User.new_token).not_to be_empty
    end
  end

    context '#remember' do
      it 'creates remember digest' do
        @user.save
        @user.remember
        expect(@user[:remember_digest]).not_to be_empty
      end
    end

  context '#forget' do
    it 'tests forget' do
      @user.save
      @user.forget
      expect(@user[:remember_digest]).to be_nil
    end
  end

  context '#authenticated?' do
    it 'with remember_token' do
      @user.save
      @user.remember
      expect(@user.authenticated?(:remember, @user.remember_token)).to eq(true)
    end
    it 'with reset_token' do
      @user.save
      @user.create_reset_digest
      expect(@user.authenticated?(:reset, @user.reset_token)).to eq(true)
    end
    it 'with activation_token' do
      @user.save
      expect(@user.authenticated?(:activation, @user.activation_token)).to eq(true)
    end
    it 'returns false if digest is nil' do
      @user.save
      expect(@user.authenticated?(:activation, '')).to eq(false)
    end
  end

  context '#password_reset_expired?' do
    it 'returns false' do
      @user.save
      @user.create_reset_digest
      expect(@user.password_reset_expired?).to eq(false)
    end

    it 'returns true' do
      user = create(:user_with_expired_password_reset_digest)
      expect(user.password_reset_expired?).to eq(true)
    end
  end

end

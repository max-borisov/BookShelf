require 'rails_helper'

describe User, :type => :model do
  describe 'validation' do
    subject(:user) { build(:user, password: '111111') }

    context 'when model is valid' do
      it 'has a valid factory' do
        expect(user).to be_valid
      end
    end

    context 'when a model is not valid' do
      it 'is invalid without a name' do
        validate_presence_of(user, :name)
      end

      it 'is invalid if a name longer then 50 characters' do
        validate_max_length_of(user, :name, 51)
      end

      it 'is invalid without an email' do
        validate_presence_of(user, :name)
      end

      it 'is invalid if an email longer then 250 characters' do
        validate_max_length_of(user, :name, 251)
      end

      it 'is invalid with incorrect email format' do
        user[:email] = '@gmail.com'
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end

      it 'is invalid if email is not unique' do
        user.save
        new_user = build(:user, email: user[:email])
        new_user.valid?
        expect(new_user.errors[:email]).to include("has already been taken")
      end

      it 'is invalid if password length less then 5 characters' do
        user = build(:user, password: '111')
        user.valid?
        expect(user.errors[:password]).to include('is too short (minimum is 5 characters)')
      end
    end
  end

  context 'when before_save is triggered' do
    describe '#downcase_email' do
      it 'makes email address downcase before save' do
        email = 'NEW_USER@gmail.com'
        user = create(:user, email: email)
        expect(user[:email]).to include(email.downcase)
      end
    end
  end

  context 'when before_create is triggered' do
    describe '#create_activation_digest' do
      it 'creates activation token and digest before save' do
        user = create(:user)
        expect(user[:activation_digest]).not_to be_empty
      end
    end
  end

  describe '#activate' do
    it 'activates user account' do
      user = create(:not_activated_user)
      expect{ user.activate }.to change{ user[:activated] }.from(false).to(true)
    end
  end

  describe '#create_reset_digest' do
    it 'creates a digest for password reset' do
      user = create(:user)
      user.create_reset_digest
      expect(user[:reset_digest]).not_to be_empty
    end
  end

  describe '#send_password_reset_email' do
    subject(:user) { create(:user, password: '111111') }

    before do
      user.create_reset_digest
      @email = user.send_password_reset_email
    end

    it 'has a correct subject' do
      expect(@email.subject).to eq('Password reset')
    end

    it 'has a correct From:' do
      expect(@email.from).to include('bookshelfnotifications@example.com')
    end

    it 'has a correct To:' do
      expect(@email.to).to include(user[:email])
    end
  end

  describe '#send_activation_email' do
    subject(:user) { create(:user, password: '111111') }

    before do
      @email = user.send_activation_email
    end

    it 'has a correct subject' do
      expect(@email.subject).to eq('Account activation')
    end

    it 'has a correct From:' do
      expect(@email.from).to include('bookshelfnotifications@example.com')
    end

    it 'has a correct To:' do
      expect(@email.to).to include(user[:email])
    end
  end

  describe '.digest' do
    it 'returns generated digest string' do
      expect(User.digest('11223344')).not_to be_empty
    end
  end

  describe '.new_token' do
    it 'generates a random URL-safe base64 string' do
      expect(User.new_token).not_to be_empty
    end
  end

  describe '#remember' do
    it 'creates a remember digest' do
      user = create(:user)
      user.remember
      expect(user[:remember_digest]).not_to be_empty
    end
  end

  describe '#forget' do
    it 'sets a remember_digest to nil' do
      user = create(:user)
      user.forget
      expect(user[:remember_digest]).to be_nil
    end
  end

  describe '#authenticated?' do
    subject(:user) { create(:user) }

    context 'with remember_token' do
      it 'checks remember_token for authentication' do
        user.remember
        expect(user.authenticated?(:remember, user.remember_token)).to eq(true)
      end
    end

    context 'with reset_token' do
      it 'checks reset_token for authentication' do
        user.create_reset_digest
        expect(user.authenticated?(:reset, user.reset_token)).to eq(true)
      end
    end

    context 'with activation_token' do
      it 'checks activation_token for authentication' do
        expect(user.authenticated?(:activation, user.activation_token)).to eq(true)
      end
    end

    context 'when activation_digest is nil' do
      it 'returns false' do
        expect(user.authenticated?(:activation, '')).to eq(false)
      end
    end
  end

  describe '#password_reset_expired?' do
    context 'when password reset digest is expired' do
      it 'returns false' do
        user = create(:user)
        user.create_reset_digest
        expect(user.password_reset_expired?).to eq(false)
      end
    end

    context 'when password reset digest is valid' do
      it 'returns true' do
        user = create(:user_with_expired_password_reset_digest)
        expect(user.password_reset_expired?).to eq(true)
      end
    end
  end

  xit 'orders relation'
  xit '#get_orders'
end

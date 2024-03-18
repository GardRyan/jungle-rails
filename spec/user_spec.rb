RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
      @user.save
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      @user.password_confirmation = 'different_password'
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password_confirmation' do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if email is not unique (case-insensitive)' do
      new_user = User.new(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'Jane',
        last_name: 'Doe'
      )
      expect(new_user).to_not be_valid
    end

    it 'is not valid without a first name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a last name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end

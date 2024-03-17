RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'test')
    end

    it 'should create a product with all fields set' do
      @product = Product.new(
        name: 'test',
        price: 100,
        quantity: 10,
        category: @category
      )
      expect(@product).to be_valid
    end

    it 'should validate presence of name' do
      @product = Product.new(
        price: 100,
        quantity: 10,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should validate presence of price' do
      @product = Product.new(
        name: 'test',
        quantity: 10,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should validate presence of quantity' do
      @product = Product.new(
        name: 'test',
        price: 100,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should validate presence of category' do
      @product = Product.new(
        name: 'test',
        price: 100,
        quantity: 10
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

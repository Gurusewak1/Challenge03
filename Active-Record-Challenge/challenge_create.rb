require_relative 'ar'
require_relative 'models/product'  # products table

#Method1

product1 = Product.new(name: 'Laptop', description: 'Asus', price: '800', stock_quantity:5)
product1.save

if product1.save
    puts "Product1 saved successfully"
  else
    puts "Failed to save Product1: #{product1.errors.full_messages.join(', ')}"
  end

#Method2
product2 = Product.create(name: 'Computer', description: 'Microsoft', price: '1000', stock_quantity:60)
if product2.persisted?
    puts "Product2 saved successfully"
  else
    puts "Failed to save Product2: #{product2.errors.full_messages.join(', ')}"
  end

#Method3
product3 = Product.new do |p|
    p.name = 'smartphone'
    p.description = 'samsung'
    p.price = '1300'
    p.stock_quantity = '50'
end
product3.save
if product3.save
    puts "Product3 saved successfully"
  else
    puts "Failed to save Product3: #{product3.errors.full_messages.join(', ')}"
  end
  
#Create a Product object that is missing some required columns.
invalid_product = Product.create(name: 'Invalid Product')
unless invalid_product.save
    puts invalid_product.errors.full_messages
  
end


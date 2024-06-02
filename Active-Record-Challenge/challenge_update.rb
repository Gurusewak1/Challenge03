require_relative 'ar.rb'

# Find all products with a stock quantity greater than 40
products = Product.where("stock_quantity > 40")

# Adding one to the stock quantity of each of these products and then save these changes to the database.
products.each do |product|
    product.update(stock_quantity: product.stock_quantity + 1 )
end
require_relative 'ar.rb'



# Find any product from the database
product = Product.first
puts product

# Inspect the Product object retrieved
puts "First product found: #{product.inspect}"


# 1. Total number of products
number_of_products = Product.count
puts "There are #{number_of_products} in the products table."

# 2. Names of all products above $10 with names that begin with the letter C
products_above_10_with_c = Product.where("price > 10 AND name LIKE ?", "C%").pluck(:name)
puts "Names of products above $10 with names starting with 'C': #{products_above_10_with_c.join(', ')}"

# 3. Total number of products with a low stock quantity (defined as less than 5 in stock)
low_stock_products_count = Product.where("stock_quantity < 5").count
puts "Total number of products with low stock quantity: #{low_stock_products_count}"

# 4. Find the name of the category associated with one of the products you have found.
category_name = product.category.name
puts "The category name for the first product is: #{category_name}"

# 5. Find a specific category and use it to build and persist a new product associated with this category.
specific_category = Category.find_by(name: 'Beverages')

# Create a new product associated with the specific category
new_product = specific_category.products.create(name: 'New Beverage', description:'description', price: 99.99, stock_quantity: 10)

if new_product.persisted?
  puts "New product '#{new_product.name}' has been created and associated with the '#{specific_category.name}' category."
else
  puts "Failed to create new product. Errors: #{new_product.errors.full_messages.join(', ')}"
end
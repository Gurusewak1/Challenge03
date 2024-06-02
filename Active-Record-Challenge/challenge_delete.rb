require_relative 'ar.rb'


# Assuming we want to delete the product named 'Laptop' created in challenge_create.rb

# Find the product by name
product_to_delete = Product.find_by(name: 'Laptop')

if product_to_delete
  # Delete the product from the database
  product_to_delete.destroy
  puts "Product '#{product_to_delete.name}' has been deleted from the database."
end

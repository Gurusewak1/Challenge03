require_relative 'ar'

# Fetch all categories from the database
categories = Category.all

# Iterate over each category and display its name and associated products
categories.each do |category|
  puts "Category: #{category.name}"
  category.products.each do |product|
    puts "  - Product: #{product.name}, Price: $#{'%.2f' % product.price}"
  end
end
class Product < ActiveRecord::Base
  # This AR object is linked with the products table.
  # Columns in the products table:
  # id: integer
  # name: string
  # description: text
  # price: decimal
  # stock_quantity: integer
  # category_id: integer (This indicates an association with the categories table)
  #
  # Associations:
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  belongs_to :category

  # Ensures that the 'name' attribute is present, unique, and has a minimum length of 4 characters.
  validates :name, presence: true, uniqueness: true, length: { minimum: 4 }

  # Ensures that the 'description', 'price', and 'stock_quantity' attributes are present.
  validates :description, :price, :stock_quantity, presence: true
end
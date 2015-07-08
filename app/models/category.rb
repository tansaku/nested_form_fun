class Category < ActiveRecord::Base
  has_many :category_organisations
  has_many :organisations, through: :category_organisations
end

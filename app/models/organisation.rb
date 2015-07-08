class Organisation < ActiveRecord::Base
  has_many :category_organisations
  has_many :categories, through: :category_organisations
end

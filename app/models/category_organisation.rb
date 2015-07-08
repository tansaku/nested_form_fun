class CategoryOrganisation < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :category

end

class CreateCategoryOrganisations < ActiveRecord::Migration
  def change
    create_table :category_organisations do |t|
      t.references :organisation, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

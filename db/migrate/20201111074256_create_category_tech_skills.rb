class CreateCategoryTechSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :category_tech_skills do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

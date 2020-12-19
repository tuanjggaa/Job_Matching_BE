class CreateTechSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :tech_skills do |t|
      t.string :name
      t.text :description
      t.references :category_tech_skill

      t.timestamps
    end
  end
end

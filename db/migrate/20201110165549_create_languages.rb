class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :code
      t.references :user

      t.timestamps
    end
  end
end

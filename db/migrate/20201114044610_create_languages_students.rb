class CreateLanguagesStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :languages_students do |t|
      t.belongs_to :language
      t.belongs_to :student

      t.timestamps
    end
  end
end

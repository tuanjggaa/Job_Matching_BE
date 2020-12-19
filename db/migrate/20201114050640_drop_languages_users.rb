class DropLanguagesUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :languages_users do |t|
      t.belongs_to :language
      t.belongs_to :user

      t.timestamps
    end
  end
end

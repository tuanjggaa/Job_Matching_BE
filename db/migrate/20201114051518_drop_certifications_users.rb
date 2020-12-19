class DropCertificationsUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :certifications_users do |t|
      t.belongs_to :certification
      t.belongs_to :user

      t.timestamps
    end
  end
end

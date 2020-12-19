class CreateCertificationsStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :certifications_students do |t|
      t.belongs_to :certification
      t.belongs_to :student

      t.timestamps
    end
  end
end

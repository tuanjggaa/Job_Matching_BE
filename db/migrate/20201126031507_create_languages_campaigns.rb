class CreateLanguagesCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :languages_campaigns do |t|
   	  t.belongs_to :language
      t.belongs_to :job_campaign

      t.timestamps
    end
  end
end

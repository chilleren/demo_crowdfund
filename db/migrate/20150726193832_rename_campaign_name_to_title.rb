class RenameCampaignNameToTitle < ActiveRecord::Migration
  def change
    rename_column :campaigns, :name, :title
  end
end

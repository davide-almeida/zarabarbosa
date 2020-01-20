class AddLeadFrameToDownloads < ActiveRecord::Migration[5.1]
  def change
    add_column :downloads, :lead_frame, :text
  end
end

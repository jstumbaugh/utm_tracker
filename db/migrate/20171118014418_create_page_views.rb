class CreatePageViews < ActiveRecord::Migration[5.1]
  def change
    create_table :page_views do |t|
      t.datetime :viewed_at
      t.string   :utm_source
      t.string   :utm_medium
      t.string   :utm_campaign
      t.string   :utm_term
      t.string   :utm_content

      t.timestamps
    end
  end
end

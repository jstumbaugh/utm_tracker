class CreatePageViews < ActiveRecord::Migration[5.1]
  def change
    create_table :page_views do |t|
      t.datetime :viewed_at
      t.string   :utm_source
      t.string   :utm_medium
      t.string   :utm_campaign
      t.string   :utm_term
      t.string   :utm_content
      t.string   :ip
      t.string   :city
      t.string   :country_code
      t.string   :country_name
      t.float    :latitude
      t.float    :longitude
      t.integer  :metro_code
      t.string   :region_code
      t.string   :region_name
      t.string   :time_zone
      t.integer  :zip_code

      t.timestamps
    end
  end
end

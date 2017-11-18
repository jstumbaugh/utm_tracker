class PageView < ApplicationRecord
  validates_presence_of :viewed_at, :utm_source, :utm_campaign, :utm_medium
end

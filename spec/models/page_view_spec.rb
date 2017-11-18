require "rails_helper"

RSpec.describe PageView, type: :model do
  describe "validations" do
    it { should validate_presence_of(:viewed_at) }
    it { should validate_presence_of(:utm_source) }
    it { should validate_presence_of(:utm_campaign) }
    it { should validate_presence_of(:utm_medium) }
  end
end

require 'rails_helper'

RSpec.describe Account, type: :model do
  describe "confirm user" do
    it "should be valid" do
      account = create(:account)
      expect { account.valid? }.to eq true
    end
  end

end

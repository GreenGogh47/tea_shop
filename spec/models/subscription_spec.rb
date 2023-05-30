# frozen_string_literal: true

require "rails_helper"

RSpec.describe Subscription, type: :model do
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:frequency) }

    it "defaults status to 0 (active)" do
      tea = create(:tea)
      customer = create(:customer)
      subscription = create(:subscription, tea:, customer:)
      expect(subscription.status).to eq("active")
    end
  end

  context "relationships" do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end
end

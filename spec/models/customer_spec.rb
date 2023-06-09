# frozen_string_literal: true

require "rails_helper"

RSpec.describe Customer, type: :model do
  context "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:address) }
  end

  context "relationships" do
    it { should have_many(:subscriptions) }
    it { should have_many(:teas).through(:subscriptions) }
  end
end

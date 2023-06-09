# frozen_string_literal: true

# MVP is the following
# subscribe a customer to a tea subscription
# cancel a customer’s tea subscription
# see all of a customer’s subsciptions (active and cancelled)

RSpec.describe "Subscriptions API" do
  before :each do
    @customer = create(:customer)
    @tea = create(:tea)
    @subscription = create(:subscription, customer_id: @customer.id, tea_id: @tea.id)
  end

  context "subscription#index" do
    it "see all of a customer’s subsciptions (active and cancelled)" do
      @subscription2 = create(:subscription, customer_id: @customer.id, tea_id: @tea.id, status: "cancelled")
      get "/api/v1/customers/#{@customer[:id]}/subscriptions"

      expect(response).to be_successful
      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data.count).to eq(2)
      expect(data[0][:id]).to eq(@subscription[:id].to_s)
      expect(data[0][:attributes][:status]).to eq("active")
      expect(data[1][:id]).to eq(@subscription2[:id].to_s)
      expect(data[1][:attributes][:status]).to eq("cancelled")
    end

    it "can not find customer (sad path)" do
      get "/api/v1/customers/100/subscriptions"

      expect(response).to_not be_successful
      data = JSON.parse(response.body, symbolize_names: true)[:errors][0]

      expect(data[:status]).to eq(400)
      expect(data[:title]).to eq("Couldn't find Customer with 'id'=100")
    end
  end

  context "subscription#create" do
    it "subscribe a customer to a tea subscription" do
      expect(Subscription.count).to eq(1)
      params = { customer_id: @customer.id, tea_id: @tea.id, title: "Monthly", price: 10.00, status: "active", frequency: 1 }

      post("/api/v1/customers/#{@customer[:id]}/subscriptions", params: params)

      expect(response).to be_successful
      expect(Subscription.count).to eq(2)
    end
  end

  it "cancel a customer’s tea subscription" do
    expect(Subscription.count).to eq(1)

    delete "/api/v1/subscriptions/#{@subscription[:id]}"

    expect(response).to be_successful
    expect(Subscription.count).to eq(0)
  end

  context "subscription#update" do
    it "can cancel a subscription" do
      expect(@subscription[:status]).to eq("active")
      params = { status: "cancelled" }

      patch "/api/v1/subscriptions/#{@subscription[:id]}", params: params

      expect(response).to be_successful
      expect(Subscription.last[:status]).to eq("cancelled")
    end

    it "can not find subscription (sad path)" do
      patch "/api/v1/subscriptions/100"

      expect(response).to_not be_successful
      data = JSON.parse(response.body, symbolize_names: true)[:errors][0]

      expect(data[:status]).to eq(400)
      expect(data[:title]).to eq("Couldn't find Subscription with 'id'=100")
    end
  end
end

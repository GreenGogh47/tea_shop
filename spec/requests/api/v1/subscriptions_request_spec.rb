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

  it "subscribe a customer to a tea subscription" do
    expect(Subscription.count).to eq(1)
    params = { customer_id: @customer.id, tea_id: @tea.id, title: "Monthly", price: 10.00, status: "active", frequency: 1 }

    post("/api/v1/subscriptions", params:)

    expect(response).to be_successful
    expect(Subscription.count).to eq(2)
  end

  it "cancel a customer’s tea subscription" do
    expect(Subscription.count).to eq(1)

    delete "/api/v1/subscriptions/#{@subscription[:id]}"

    expect(response).to be_successful
    expect(Subscription.count).to eq(0)
  end
end

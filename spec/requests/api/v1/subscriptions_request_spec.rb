# MVP is the following
# subscribe a customer to a tea subscription
# cancel a customer’s tea subscription
# see all of a customer’s subsciptions (active and cancelled)

RSpec.describe 'Subscriptions API' do
  before :each do
    @customer = create(:customer)
    @tea = create(:tea)
    @subscription = create(:subscription, customer_id: @customer.id, tea_id: @tea.id)
  end

  it "subscribe a customer to a tea subscription" do
    expect(Subscription.count).to eq(1)
    params = { customer_id: @customer.id, tea_id: @tea.id, title: "Monthly", price: 10.00, status: "active", frequency: 1 }
    
    post "/api/v1/subscriptions", params: params

    expect(response).to be_successful
    expect(Subscription.count).to eq(2)
    require 'pry'; binding.pry
  end
end
# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

2.times do |i|
  instance_variable_set("@customer_#{i+1}", Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.street_address
  ))
end

6.times do |i|
  instance_variable_set("@tea_#{i+1}", Tea.create(
    title: Faker::Tea.variety,
    description: Faker::Tea.type,
    temperature: "Boiling",
    brew_time: "5 minutes"
  ))
end

subscription_1 = Subscription.create(
  customer: @customer_1,
  tea: @tea_1,
  title: "Tea Subscription",
  price: "9.99",
  frequency: "Monthly"
)

subscription_2 = Subscription.create(
  customer: @customer_1,
  tea: @tea_2,
  title: "Tea Subscription",
  price: "9.99",
  frequency: "Monthly"
)

subscription_3 = Subscription.create(
  customer: @customer_1,
  tea: @tea_3,
  title: "Tea Subscription",
  price: "9.99",
  frequency: "Monthly"
)

subscription_4 = Subscription.create(
  customer: @customer_2,
  tea: @tea_4,
  title: "Tea Subscription",
  price: "9.99",
  frequency: "Monthly"
)

subscription_5 = Subscription.create(
  customer: @customer_2,
  tea: @tea_5,
  title: "Tea Subscription",
  price: "9.99",
  frequency: "Monthly"
)

subscription_6 = Subscription.create(
  customer: @customer_2,
  tea: @tea_6,
  title: "Tea Subscription",
  price: "9.99",
  frequency: "Monthly"
)
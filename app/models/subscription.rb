# frozen_string_literal: true

class Subscription < ApplicationRecord
  enum status: %i[active cancelled]

  belongs_to :customer
  belongs_to :tea

  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :frequency
  validates_presence_of :customer_id
  validates_presence_of :tea_id
end

class Order < ApplicationRecord
  belongs_to :customer
  has_many:order_details, dependent: :destroy

  enum payment_method:{credit_card:0,transfer:1}
  enum status:{wait:0,confirmation:1,work:2,preparation:3,sended:4}


end

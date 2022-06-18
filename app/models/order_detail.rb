class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status:{not_work:0,wait_work:1,work:2,complete_work:3}

end

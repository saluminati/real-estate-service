class V1::Property < ApplicationRecord
  validates :title, :length => {:minimum => 5, :maximum => 50 }, :presence => true
  validates :description, :length => {:minimum => 20, :maximum => 1000 }, :presence => true
  validates :street_address, :length => {:minimum => 10, :maximum => 200 }, :presence => true
  validates :state, :length => {:minimum => 3, :maximum => 20 }, :presence => true
  validates :post_code, :length => {:is => 4 }, :presence => true
end

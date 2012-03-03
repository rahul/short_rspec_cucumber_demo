class User < ActiveRecord::Base
  has_one :blog #has_many later

  accepts_nested_attributes_for :blog
  validates_presence_of :name
  validates_uniqueness_of :email
end

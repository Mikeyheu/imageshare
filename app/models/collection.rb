class Collection < ActiveRecord::Base
  belongs_to :site
  has_many :images

  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name, :site_id, :slug
  # validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name
end





  
class Collection < ActiveRecord::Base
  belongs_to :site
  has_many :images, :dependent => :destroy


  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name, :site_id, :slug
  validates_presence_of :name

  # validates_uniqueness_of :name, :case_sensitive => false
end





  
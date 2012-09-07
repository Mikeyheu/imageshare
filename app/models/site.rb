class Site < ActiveRecord::Base
  belongs_to :user
  has_many :collections

  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name, :slug, :user_id
  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name
end

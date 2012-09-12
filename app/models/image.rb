class Image < ActiveRecord::Base
  belongs_to :collection
  acts_as_list :scope => :collection
  attr_accessible :collection_id, :description, :name, :image_file

  mount_uploader :image_file, ImageFileUploader
end

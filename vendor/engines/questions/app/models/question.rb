class Question < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :text1, :text2, :text3]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :image1, :class_name => 'Image'
  belongs_to :image2, :class_name => 'Image'
  belongs_to :image3, :class_name => 'Image'
end

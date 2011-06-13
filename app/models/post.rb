class Post < ActiveRecord::Base
  validates :name, :presence =>true
  validates :title, :presence => true, 
  					:length => {:minimum => 5}
  					
  has_many :comments, :dependent => :destroy
  
  cattr_reader :per_page
  @@per_page = 5
  
end

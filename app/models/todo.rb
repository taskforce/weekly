class Todo < ActiveRecord::Base
  belongs_to :author
  has_many :comments, :order => 'created_at DESC'
end

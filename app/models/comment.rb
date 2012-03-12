class Comment < ActiveRecord::Base
  belongs_to :author
  belongs_to :todo

  attr_accessible :ctype, :content
end

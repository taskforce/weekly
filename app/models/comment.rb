class Comment < ActiveRecord::Base
  belongs_to :author
  belongs_to :todo
end

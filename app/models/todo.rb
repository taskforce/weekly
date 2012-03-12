class Todo < ActiveRecord::Base
  belongs_to :author
  has_many :comments, :order => 'created_at DESC'

  def final_rep(rt = true)
    r = self.comments.find(:first, :conditions => {:ctype => rt})
    if r
      r
    else
      nil
    end
  end

  def final_ref
    final_rep false
  end
end

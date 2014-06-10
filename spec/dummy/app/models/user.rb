class User < ActiveRecord::Base

  def can_blog?
    true
  end

  def by_line
    email
  end

end

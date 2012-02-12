class User < ActiveRecord::Base
  has_many :articles
  belongs_to :school
  
  has_secure_password
    
  def authenticate(sub_username, submitted_password)
      user = User.find_by_username( sub_username)
      # if user.password != submitted_password
      #     user = nil
      
      # end
            
  end
    
end

module SessionHelper
    def sign_in(user)
        cookies.permanent.signed[:remember_token] = [user.id]
        self.current_user = user
    end
    
    def current_user=(user)
        @current_user = user
    end
    
    def current_user
        @current_user ||= user_from_remember_token
    end
    
    private
    def user_from_remember_token
        User.authenticate(*remember_token)
    end
    def remember_token
        cookies.signed[:remember_token] || [nil, nil]
    end
end

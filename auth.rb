module BeerCatalogue

  module Authentication

    def authenticated?
      !session[:user].nil?
    end

    def authenticate( username, password )
      return false if username.nil? || password.nil?
      # TODO: Add auth
      session[:user] = username
    end

    def logout
      session[:user] = nil
    end

    def skip_authentication
      request.env['SKIP_AUTH'] = true
    end

    def require_authentication
      return if request.env['SKIP_AUTH']
      return if authenticated?
      redirect '/login'
    end
  end
end



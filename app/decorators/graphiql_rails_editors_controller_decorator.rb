module GraphiQLRailsEditorsControllerDecorator

  def self.prepended(base)
    puts "#{self} prepended to #{base}"
    base.prepend_before_action :authenticate, if: -> { !Rails.env.development? }
    base.prepend_before_action :set_auth_headers, only: :show
  end

  protected

  def authenticate
    http_basic_authenticate_with name: ENV["HBA_LOGIN"], password: ENV["HBA_PASSWORD"]
  end

  def set_auth_headers
    user = User.find_by_email(params[:email])

    if user.present?
      user_auth_token = user.create_new_auth_token

      GraphiQL::Rails.config.headers['access-token'] = -> (context) { user_auth_token['access-token'] }
      GraphiQL::Rails.config.headers['token-type'] = -> (context) { user_auth_token['token-type'] }
      GraphiQL::Rails.config.headers['client'] = -> (context) { user_auth_token['client'] }
      GraphiQL::Rails.config.headers['expiry'] = -> (context) { user_auth_token['expiry'] }
      GraphiQL::Rails.config.headers['uid'] = -> (context) { user_auth_token['uid'] }
    end
  end
end

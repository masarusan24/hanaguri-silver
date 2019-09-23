module SessionsHelper
  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def test_user?
    logged_in? ? current_user.name == 'test' : false
  end
end

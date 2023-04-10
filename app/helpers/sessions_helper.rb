module SessionsHelper
  def logged_in?
    session[:user_id].present?
  end
  
  def logout_button
    link_to "Logout", logout_path, method: :delete, class: "navbar-brand", style: "transition: color 0.5s ease-out;" if logged_in?
  end
  
  def signup_button
    link_to "Sign up", new_user_path, class: "navbar-brand", style: "transition: color 0.5s ease-out;" unless logged_in?
  end
  
  def login_button
    link_to "Login", new_session_path, class: "navbar-brand", style: "transition: color 0.5s ease-out;" unless logged_in?
  end
end

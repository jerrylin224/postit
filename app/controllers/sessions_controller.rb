class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      # if user.two_factor_auth?
      #   session[:tow_factor] = true
      #   user.generate_pin!

      #   redirect_to pin_path
      # else
        login_user!(user)
      end
    else
      flash[:error] = "There is something wrong with your username or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out."
    redirect_to root_path
  end

  # def pin
  #  # write 2 actions together
  #  #  理論上可行，所以你可以透過request.method、request.post?、request.get?之類的method來判斷
  #   access_denied if session[:tow_factor].nil?

  #   if request.post?
  #     user = User.find_by pin: params[:pin]
  #     if user
  #       session[:tow_factor] = nil
  #       user.remove_pin!
  #       login_user!(user)
  #     else
  #       flash[:error] = "Sorry, something is wrong with your pin number"
  #       redirect_to pin_path
  #     end
  #   end
  # end

  private
    def login_user!(user)
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you've logged in."
      redirect_to root_path
    end
end
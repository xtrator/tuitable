class CallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    response = request.env['omniauth.auth']
    @user = User.find_by(email: response.info.email)
    if @user
      sign_in @user
      flash.notice = 'Signed in succesfully'
      # this is primitive, but i assume the first change
      # a google/github user may do is change their password
      # So if I detect that the user has been updated, I redirect to root
      # path instead of edit user path
      if @user.created_at == @user.updated_at
        redirect_to edit_user_registration_path @user
      else
        redirect_to root_path
      end
      return
    end

    @user = User.new
    @user.name = response.info.name
    @user.email = response.info.email
    @user.username = response.info.email.split('@').first
    @user.password = response.info.email.split('@').first
    @user.save
    sign_in @user
    flash.notice = 'Welcome to Tweetable'
    redirect_to edit_user_registration_path @user
  end

  def github
    response = request.env['omniauth.auth']
    @user = User.find_by(email: response.info.email)
    if @user
      sign_in @user
      flash.notice = 'Signed in succesfully'
      # this is primitive, but i assume the first change
      # a google/github user may do is change their password
      # So if I detect that the user has been updated, I redirect to root
      # path instead of edit user path
      if @user.created_at == @user.updated_at
        redirect_to edit_user_registration_path @user
      else
        redirect_to root_path
      end
      return
    end

    @user = User.new
    @user.name = response.info.name
    @user.email = response.info.email
    @user.username = response.info.email.split('@').first
    @user.password = response.info.email.split('@').first
    @user.save
    sign_in @user
    flash.notice = 'Welcome to Tweetable'
    redirect_to edit_user_registration_path @user
  end
end

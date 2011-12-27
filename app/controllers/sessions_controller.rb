class SessionsController < ApplicationController
  def new
  end

  def create
    account = login params[:email], params[:password], params[:remember_me]
    if account.present?
      correct_path = case account.class
        when King then campaign_features_path
        when Storyteller then team_organizations_path
        when Hero then dashboard_features_path
        else root_url
      end

      notice = "You've been signed into #{account.email}!"
      redirect_back_or_to correct_path, notice: notice
    else
      notice = "The email or password you entered was incorrect, try again!"
      flash.now.notice = notice
      render :new
    end
  end

  def destroy
    logout
    notice = "You've been logged out!"
    redirect_to root_url, notice: notice
  end
end

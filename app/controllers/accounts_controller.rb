class AccountsController < ApplicationController
  before_filter :require_login, only: [:edit, :index, :show]

  def new
    @account = Account.new
  end

  def create
    @account = case params[:account_type]
      when "king" then king.new params[:account]
      when "storyteller" then Storyteller.new params[:account]
      when "hero" then Hero.new params[:account]
      else Account.new params[:account]
    end

    if @account.save
      s = Story.last.hero @account
      s.save
      login params[:account][:email], params[:account][:password]

      correct_path = case @account.class
        when King then "campaign_feature_path"
        when Storyteller then "team_organization_path"
        when Hero then dashboard_features_path
        else root_url
      end

      redirect_to correct_path, notice: "you've been signed up!"
    else
      @account = Account.new params[:account]
      render :new, notice: @account.errors.full_messages
    end
  end

  def edit
  end

  def index
    @accounts = Account.all
  end
end

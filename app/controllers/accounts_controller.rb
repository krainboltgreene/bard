class AccountsController < ApplicationController
  before_filter :require_login, only: [:edit, :index, :show]

  def new
    @account = Account.new
    @errors = []
  end

  def create
    case params[:account_type]
      when "king"
        @account = King.new params[:account]
      when "storyteller"
        @account = Storyteller.new params[:account]
      when "hero"
        @account = Hero.new params[:account]
    end

    if @account.valid?
      @account.save

      login @account.email, params[:account][:password]

      case @account.class
        when King
          path = "campaign_feature_path"
        when Storyteller
          path = "team_organization_path"
        when Hero
          path = dashboard_features_path
        else
          path = root_url
      end

      redirect_to path, notice: "you've been signed up!"
    else
      @errors = @account.errors
      @account = Account.new params[:account]
      render :new, notice: "There were some errors in the information you submitted!"
    end
  end

  def edit
  end

  def index
    @accounts = Account.all
  end
end

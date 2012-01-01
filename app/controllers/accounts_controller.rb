class AccountsController < ApplicationController
  before_filter :require_login, only: [:edit, :index, :show]
  before_filter :new_account, only: [:new]
  before_filter :find_account, only: [:show, :edit, :update, :destroy]
  before_filter :all_accounts, only: [:index]
  before_filter :filter_type, only: [:create]

  def new
    @errors = []
  end

  def create
    if @account.valid?
      @account.save and login @account.email, params[:account][:password]

      path = case @account
        when King then campaign_features_path
        when Storyteller then team_organization_path
        when Hero then dashboard_features_path
        else root_url
      end

      redirect_to path, notice: "you've been signed up!"
    else
      @errors = @account.errors
      new_account
      render :new, notice: "There were some errors in the information you submitted!"
    end
  end

  def edit
  end

  def index
  end

  def destroy
    @account.destroy
  end

  private
    def new_account
      @account = Account.new params[:account]
    end

    def find_account
      @account = Account.find_by_id params[:id]
    end

    def all_accounts
      @accounts = Account.all
    end

    def filter_type
      @account = case params[:account_type]
        when "king" then King.new params[:account]
        when "storyteller" then Storyteller.new params[:account]
        when "hero" then Hero.new params[:account]
        else Account.new params[:account]
      end
    end
end

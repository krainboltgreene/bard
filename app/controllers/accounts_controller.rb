class AccountsController < ApplicationController
  before_filter :require_login, only: [:edit, :index, :show]
  def new
    @account = Account.new
  end

  def create
    @account = case params[:account_type]
      when "master" then Master.new params[:account]
      when "storyteller" then Storyteller.new params[:account]
      when "hero" then Hero.new params[:account]
    end

    if @account.save
      login @account.email, @account.password
      redirect_back_or_to dashboard_path, notice: "Signed up!"
    else
      render :new
    end
  end

  def edit
  end

  def dashboard

  end


  def index
    @accounts = Account.all
  end
end

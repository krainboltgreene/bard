class AccountsController < ApplicationController
  before_filter :require_login, only: [:edit, :index, :show]
  def new
    @account = Account.new
  end

  def create
    @account = Account.new params[:account]
    if @account.save
      login @account
      redirect_to root_url, notice: "Signed up!"
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

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
      login @account.email, @account.password
      redirect_back_or_to root_url, notice: "you've been signed up!"
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

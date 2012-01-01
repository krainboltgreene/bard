class PagesController < ApplicationController
  before_filter -> { redirect_to dashboard_features_path if current_user.present? }, only: [:splash, :beta]
  def about
  end

  def jobs
  end

  def beta
  end

  def policy
  end

  def splash
  end

  def support
  end

  def terms
  end

end

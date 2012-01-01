class FeaturesController < ApplicationController
  before_filter :require_login
  before_filter :new_feature, only: [:new]
  before_filter :filter_type, only: [:create]
  before_filter :find_feature, only: [:show, :edit, :update, :destroy]
  before_filter :all_features, only: [:index]

  def dashboard
    redirect_to campaign_features_path if current_user.is_a? King
  end

  def campaign
    redirect_to dashboard_features_path if current_user.is_a? Hero or current_user.is_a? Storyteller
  end

  # GET /features
  # GET /features.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @features }
    end
  end

  # GET /features/1
  # GET /features/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /features/new
  # GET /features/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /features/1/edit
  def edit
  end

  # POST /features
  # POST /features.json
  def create
    respond_to do |format|
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

      if @feature.save
        format.html { redirect_to @feature, notice: 'Feature was successfully created.' }
        format.json { render json: @feature, status: :created, location: @feature }
      else
        format.html { render action: "new" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /features/1
  # PUT /features/1.json
  def update
    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to @feature, notice: 'Feature was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to features_url }
      format.json { head :ok }
    end
  end

  private
    def new_feature
      @feature = Feature.new params[:feature]
    end

    def find_feature
      @feature = Feature.find_by_id params[:id]
    end

    def all_features
      @features = Feature.all
    end

    def filter_type
      @feature = case params[:feature][:feature_type]
        when "epic" then Epic.new params[:feature]
        when "story" then Story.new params[:feature]
        when "lyric" then Lyric.new params[:feature]
        else Feature.new params[:feature]
      end
    end
end

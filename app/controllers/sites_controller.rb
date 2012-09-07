class SitesController < ApplicationController

  before_filter :get_user

  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  def show

    @site = Site.find(params[:id])
    @collection = Collection.new
    # if current_user
    #   @site = @user.sites.find(params[:id])
    # else
    #   # @site = Site.find(params[:id])
    #   @site = Site.find_by_slug!(request.subdomain)
    # end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end


  def edit
    @site = @user.sites.find(params[:id])
  end


  def create


    # @site = Site.new(params[:site])

    @site = @user.sites.build(params[:site])

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @site = @user.sites.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @site = @user.sites.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.json { head :no_content }
    end
  end

  private

  def get_user
    @user = current_user
  end
  
end

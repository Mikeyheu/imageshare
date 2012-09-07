class CollectionsController < ApplicationController

  before_filter :get_site

  def show
    @collection = @site.collections.find(params[:id])
    @image = Image.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collection }
    end
  end


  def new
    @collection = Collection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collection }
    end
  end

  def create

    @collection = @site.collections.new(params[:collection])

      if @collection.save
        redirect_to site_collection_path(@site, @collection)
      end

  end

  def destroy
    @collection = @site.collections.find(params[:id])
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to site_path(@site) }
      format.json { head :no_content }
    end
  end

  def get_site
    @site = Site.find(params[:site_id])
  end
  
end

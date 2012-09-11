class ImagesController < ApplicationController

  before_filter :get_collection

  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  def new
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = @collection.images.new(params[:image])


      if !@image.save
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end

  end

  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to collection_image_path(@collection, @image), notice: 'Image was successfully updated.' }
        format.js
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        # format.json { render json: @image.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to site_collection_path(@collection.site, @collection) }
      format.json { head :no_content }
    end
  end

  private

  def get_collection
    @collection = Collection.find(params[:collection_id])
  end

end

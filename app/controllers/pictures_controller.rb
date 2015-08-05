class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :require_signed_in!, only: [:new, :edit, :create, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = current_user.pictures.build
  end

  # GET /pictures/1/edit
  def edit
    @imageable = @picture.imageable
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = current_user.pictures.build(permitted_params.picture)
    
    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: ['Picture was successfully created.'] }
        format.json { render action: 'show', status: :created, location: @picture }
      else
        flash.now[:error] = @picture.errors.full_messages
        format.html { render action: 'new' }
        format.json { render json: flash.now[:error], status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(permitted_params.picture)
        format.html { redirect_to @picture, notice: ['Picture was successfully updated.'] }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: ["Picture: #{@picture.title} Deleted."] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
      @project = @picture.imageable
    end
end

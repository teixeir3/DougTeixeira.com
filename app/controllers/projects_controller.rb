class ProjectsController < ApplicationController
  before_action :set_project, only: [:new, :show, :edit, :update, :destroy]
  before_action :require_signed_in!, only: [:new, :edit, :create, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.includes(:pictures).all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    # @project = current_user.projects.build
#     @pictures = [@project.pictures.build]
  end

  # GET /projects/1/edit
  def edit
    
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(permitted_params.project)
    # @project.pictures.build(permitted_params.project[:pictures_attributes])
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: ['Project was successfully created.'] }
        format.json { render action: 'show', status: :created, location: @project }
      else
        flash.now[:error] = @project.errors.full_messages
        format.html { render action: 'new' }
        format.json { render json: flash.now[:error], status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(permitted_params.project)
        format.html { redirect_to @project, notice: ['Project was successfully updated.'] }
        format.json { head :no_content }
      else
        fail
        format.html { render action: 'edit' }
        format.json { render json: @project.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: ["Project: #{@project.title} Deleted."] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.includes(:pictures).where(id: params[:id]).first_or_initialize do |proj|
        proj.user_id = current_user.id if current_user
      end
      @pictures = (@project.pictures.count == 0) ? [@project.pictures.build] : @project.pictures.order(:position)
    end
end

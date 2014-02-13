class MntController < ApplicationController

  # GET /projects
  # GET /projects.json
  def mpindex
    @projects = Project.all
    @users=User.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def mpshow
  end

  # GET /projects/new
  def mpnew
    @project = Project.new
    @users=User.all
  end

  # GET /projects/1/edit
  def mpedit
    @project = Project.find(params[:id])
    @users=User.all
  end

  # POST /projects
  # POST /projects.json
  def mpcreate
    @project = Project.new(project_params)
    @users = User.all

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def mpupdate
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def mpdestroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def mpset_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mpproject_params
      params.require(:project).permit(:name, :tempo, :user_id)
    end
end

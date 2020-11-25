class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update]

  def index
    @workspaces = Workspace.all
  end

  def show
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user = current_user
    if @workspace.save
      redirect_to workspaces_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @workspace.update(workspace_params)
      redirect_to @workspace
    else
      render  'edit'
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:name, :description, :address, :capacity, :daily_rate, :photo)
  end
end

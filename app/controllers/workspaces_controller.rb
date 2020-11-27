class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "address ILIKE :query OR name ILIKE :query"
      @workspaces = Workspace.where(sql_query, query: "%#{params[:query]}%")
    else
      @workspaces = Workspace.all
    end
    # @workspaces = Workspace.all
    @markers = @workspaces.geocoded.map do |workspace|
      {
        lat: workspace.latitude,
        lng: workspace.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { workspace: workspace }),
        image_url: helpers.asset_url('https://www.flaticon.com/svg/static/icons/svg/1297/1297048.svg')
      }
    end
  end

  def show
    @markers =[{
        lat: @workspace.latitude,
        lng: @workspace.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { workspace: @workspace }),
        image_url: helpers.asset_url('https://www.flaticon.com/svg/static/icons/svg/1297/1297048.svg')
      }]
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
      redirect_to workspace_path
    else
      render 'edit'
    end
  end

  def destroy
    @workspace.destroy
    redirect_to workspaces_path
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:name, :description, :address, :capacity, :daily_rate, :photo)
  end
end

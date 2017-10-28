class Gamification::ItemGroupsController < ApplicationController
  before_action :set_gamification_item_group, only: [:show, :edit, :update, :destroy]

  # GET /gamification/item_groups
  def index
    @gamification_item_groups = Gamification::ItemGroup.all
  end

  # GET /gamification/item_groups/1
  def show
  end

  # GET /gamification/item_groups/new
  def new
    @gamification_item_group = Gamification::ItemGroup.new
  end

  # GET /gamification/item_groups/1/edit
  def edit
  end

  # POST /gamification/item_groups
  def create
    @gamification_item_group = Gamification::ItemGroup.new(gamification_item_group_params)

    if @gamification_item_group.save
      redirect_to @gamification_item_group, notice: 'Item group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gamification/item_groups/1
  def update
    if @gamification_item_group.update(gamification_item_group_params)
      redirect_to @gamification_item_group, notice: 'Item group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gamification/item_groups/1
  def destroy
    @gamification_item_group.destroy
    redirect_to gamification_item_groups_url, notice: 'Item group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamification_item_group
      @gamification_item_group = Gamification::ItemGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gamification_item_group_params
      params.require(:gamification_item_group).permit(:name)
    end
end

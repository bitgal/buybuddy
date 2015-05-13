class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /items
  # GET /items.json
  def index
    @items = params[:category] ? current_user.items.find(category: params[:categoty]) : current_user.items.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = current_user.items.new(item_params.merge(
      store: string_to_object('Store', item_params[:store]),
      category: string_to_object('Category', item_params[:category]),
      ))

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item.id), notice: 'Item was successfully created.' }
        format.json { }
        format.js   { }
      else
        format.html { render :new, notice: 'There was a problem creating the item.'  }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        format.js { render :new, notice: 'There was a problem creating the item.' }
      end
    end
  end

  def update_sub_categories
    @sub_categories = SubCategory.where("category_id = ?", params[:category_id])
    respond_to do |format|
      format.js
    end
  end

  def autocomplete_categories
    # check if we should filter results
    @categories = if params.has_key?(:query) && !params[:query].empty?
      Category.where("name ~* ?", ".*#{params[:query]}.*").select(:id, :name)
    else
      []
    end

    render :json => @categories
  end

  def autocomplete_item_names
    @names = if params.has_key?(:query) && !params[:query].empty?
      Item.where("name ~* ?", ".*#{params[:query]}.*").select(:name)
    else
      []
    end

    render :json => @names
  end

  def autocomplete_sub_categories
    @sub_categories = if params.has_key?(:query) && !params[:query].empty?
      SubCategory.where("name ~* ?", ".*#{params[:query]}.*").select(:id, :name)
    else
      []
    end

    render :json => @sub_categories
  end

  def autocomplete_stores
    @stores = if params.has_key?(:query) && !params[:query].empty?
      Store.where("name ~* ?", ".*#{params[:query]}.*").select(:id, :name)
      #toDo add also address field
    else
      []
    end

    render :json => @stores
  end

  def object_to_string(obj)
    # gets the object for categoryand store out of the string in form
    model = obj.class.name
    str = obj.name
  end

  def string_to_object(model_name, str)
    model = model_name.constantize
    object = model.where(name: str).first || model.new(name: str)
    #Client.find_or_create_by(first_name: 'Andy')
  end
  #########################toDo: dry autocomplete_it(model_name)##############################

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params.merge(
      store: string_to_object('Store', item_params[:store]),
      category: string_to_object('Category', item_params[:category]),
      ))
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:price, :tag_list, :category, :sub_category, :purchased_time, :store, :category_attributes => [:name], :sub_category_attributes => [:name], :store_attributes => [:name])
    end
end

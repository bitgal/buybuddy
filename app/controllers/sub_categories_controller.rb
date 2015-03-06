class SubCategoriesController < ApplicationController

  def index
    @sub_categories = SubCategory.all
  end

  def show
  end

  def new
    @sub_category = SubCategory.new
  end

  def edit
  end

  def create
    @sub_category = SubCategory.new(category_params)

  end

  def destroy
    @sub_category.destroy
    respond_to do |format|
      format.html { redirect_to sub_categories_url, notice: 'Sub Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category
      @sub_category = SubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_category_params
      params.require(:sub_category).permit(:name, :category_id)
    end
end

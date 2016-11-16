class CategoryService
  attr_reader :params, :session

  def initialize(params, session)
    @params = params
    @session = session
  end

  def set_selected_category
    if params[:cat_id]
      selected_category = Category.find_by(id: params[:cat_id])
    elsif session[:selected_category_id]
      selected_category = Category.find_by(id: session[:selected_category_id])
    else
      selected_category = Category.first
    end
    session[:selected_category_id] = selected_category&.id
    selected_category
  end
end

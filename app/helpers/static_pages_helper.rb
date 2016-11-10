module StaticPagesHelper

  def books_from_category(category)
    if category && category.books
      category.books.all
    end
  end
end

class BooksController < ApplicationController

  def index
    @book_items = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book_item = Book.new(params.require(:book).permit(:title, :description, :year))

    respond_to do |format|
      if @book_item.save
        format.html { redirect_to books_path, notice: 'Book was updated'}
      else
        format.html { render :new}
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params.require(:book).permit(:title, :description, :year))
        format.html { redirect_to books_path, notice: 'The book was updated' }
      else
        format.html { render :edit }
      end

    end
  end

  def show
    @book_item = Book.find(params[:id])
  end

end

class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update]
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to @book, notice: "Book is listed!"
    else
      render 'new', notice: "Sorry, book can not be listed. Please try again!"
    end
  end

  def edit
  end

  def update
    if @book.update book_params
      redirect_to @book, notice: "Your book details was update"
    else
      render 'edit'
    end
  end


  private

  def book_params
    params.require(:book).permit(:name, :description, :author, :notes, :thumbnail)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end

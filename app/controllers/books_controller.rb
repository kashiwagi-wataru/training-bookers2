class BooksController < ApplicationController
     before_action :correct_user, only: [:edit, :update, :destroy]

     before_action :authenticate_user!, only: [:show, :create, :edit, :index, :update, :new, :destroy, ]
    def home
    end

    def about
    end
    
    def new
        @book =Book.new
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @books=Book.all
        if @book.save
        redirect_to book_path(@book.id)
        flash[:success] = "Book was successfully created."
        else 
        render :index
        end
    end

    def edit
        @book=Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
        @books=Book.all
        if @book.update(book_params)
        redirect_to book_path(@book)
        flash[:success] = "Book was successfully updated."
        else
        render :edit
        end
    end

    def index
        @books = Book.all
        @book=Book.new
        
    end

    def ransack
        @q =Book.search(params[:q])
        @books = @q.result(distinct:true)

    end

    def show
        @book =Book.find(params[:id])
        @book2=Book.new
        @post_comment = PostComment.new
    end

    def destroy
        book=Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    private
    def book_params
        params.require(:book).permit(:book_title, :image, :book_body)
    end

     def correct_user
        book = Book.find(params[:id]) 
        user = User.find_by(id: book.user_id)
         if current_user != user
             redirect_to books_path
         end

     end

end
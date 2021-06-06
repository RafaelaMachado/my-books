module Admin
  class AuthorsController < BaseController
    before_action :set_author, only: %i[edit update destroy]

    def index
      @search = Author.ransack(params[:q])
      @authors = @search.result
      
      respond_with(@authors)
    end

    def new
      @author = Author.new
      respond_with(@author)
    end

    def create
      @author = Author.create(author_params)
      respond_with @author, location: -> { admin_authors_path }
    end

    def edit
      respond_with(@author)
    end

    def update
      @author.update(author_params)
      respond_with @author, location: -> { admin_authors_path }
    end

    def destroy
      @author.destroy
      respond_with @author, location: -> { admin_authors_path }
    end

    private

    def author_params
      params.require(:author).permit(:name)
    end

    def set_author
      @author = Author.friendly.find(params[:id])
    end
  end
end
class GenresController < ApplicationController
    def new
        @genre = Genre.new
        @genres = Genre.all
    end

    def create
        genre = Genre.new(genre_name: params[:genre][:genre_name])
        genre.save
        redirect_to new_genre_path
    end

    def destroy
    end
end

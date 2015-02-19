# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  helper_method :sort_column, :sort_direction
  respond_to :html, :json, :xml

  def index
    direction = sort_direction

    case (column = sort_column)
      when 'rating'
        @movies = Movie.all.sort_by &:rating

        if direction == 'desc'
          @movies.reverse!
        end
      else
        @movies = Movie.order(column + ' ' + direction)
    end

    respond_with @movie
  end

  def show
    begin
      respond_with (@movie = the_movie)
    rescue ActiveRecord::RecordNotFound
      id = params[:id]

      if id.is_a? Fixnum
        flash[:notice] = "No movie with id #{id} found"
      end

      redirect_to root_path
    end
  end

  def new
    @rating_options = Rating.all.map &:label
  end

  def create
    if params[:commit] == 'Cancel'
      redirect_to root_path
    else
      movie = Movie.create! movie_parameters
      flash[:notice] = "\"#{get_title}\" was successfully created"

      respond_with(movie) { |f|
        f.html { redirect_to movie_path(movie) }
      }
    end
  end

  def edit
    @movie = the_movie
    @rating = @movie.rating
    @rating_options = Rating.all.map &:label
  end

  def update
    movie = the_movie

    if params[:commit] == 'Cancel'
      redirect_to movie_path(movie)
    else
      movie.update_attributes! movie_parameters
      flash[:notice] = "\"#{get_title}\" was successfully updated"

      respond_with(movie) { |f|
        f.html { redirect_to root_path }
      }
    end
  end

  def destroy
    movie = the_movie
    title = movie.title
    movie.destroy
    flash[:notice] = "Deleted \"#{title}\""
    redirect_to root_path
  end

  def search_tmdb
    title = params[:search_terms]

    begin
      @movie = Movie.find_in_tmdb title
    rescue ActiveRecord::RecordNotFound
      flash[:warning] = "\"#{title}\" was not found in TMDb."
      redirect_to root_path
    end
  end

  private

  def the_movie
    Movie.find params[:id]
  end

  def movie_parameters
    m = params.require(:movie).permit :title, :release_date, :description
    m[:rating] = Rating.find_by_label params[:rating][:label]
    m
  end

  def get_title
    params[:movie][:title]
  end

  def sort_column
    column = params[:sort]

    if column == 'rating' || Movie.column_names.include?(column)
      column
    else
      'id'
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end

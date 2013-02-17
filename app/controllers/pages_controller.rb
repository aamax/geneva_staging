class PagesController < ApplicationController
  def show

  end

  def edit

  end

  def update

  end

  def new

  end

  def create

  end

  def destroy

  end

  def about
    render "about"
  end

  def contact
    render "/home/construction"
  end

  def x_country
    gallery = "x_country"
    @pics = Gallery.x_country
    render "x_country"
  end
end

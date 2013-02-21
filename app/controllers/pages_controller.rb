class PagesController < ApplicationController
  def about
    render "about"
  end

  def contact
    render "/home/construction"
  end

  def downloads
    @docs = Gallery.clinic_docs
  end
end

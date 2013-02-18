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
    @page_header = "<strong>Welcome to Geneva Equestrian's new Cross Country Schooling course.</strong><br/>

  Below are pictures of some of the cross country elements. Visit the website for further additions throughout the
  summer."

    @pics = Gallery.x_country
    render "gallery_page"
  end

  def facility
    @page_header = "Geneva Equestrian, located at the intersection of Highways 50 and 67 in Lake Geneva is a full-service boarding and training facility serving the equine community. We are situated on over 100 beautiful acres of rolling hills and wooded trails in southeastern Wisconsin. Whatever your riding skill and discipline, Geneva Equestrian is here to serve the equine enthusiast.

Horses on the property are given the highest standard of care and attention. Located on the 100 acres is an indoor heated riding arena, heated barn, outdoor riding arena, large grass pastures, and 40 acres of trails. In addition, the clubhouse offers a country-club atmosphere catering to the comfort of our clients. Enjoy a refreshment on the outdoor deck while visiting with other horse enthusiasts or sit back and watch a lesson from the viewing area.

Visit the Cross Country Page to see pictures of the new Cross Country Schooling Course!!!!

COMING SOON... NEW DRESSAGE ARENAS, OUTDOOR SHOW STABLING AND MORE!!!"

    @pics = Gallery.facility
    render "gallery_page"
  end

  def clinics
    @docs = Gallery.clinic_docs
    @events = Event.clinics
  end
end

class GalleriesController < ApplicationController
  load_and_authorize_resource

  # GET /galleries
  # GET /galleries.json
  def index
    if params[:page] == "facility"
      @page_header = "Geneva Equestrian, located at the intersection of Highways 50 and 67 in Lake Geneva is a
                  full-service boarding and training facility serving the equine community. We are situated
                  on over 100 beautiful acres of rolling hills and wooded trails in southeastern Wisconsin.
                  Whatever your riding skill and discipline, Geneva Equestrian is here to serve the equine
                  enthusiast.

                  Horses on the property are given the highest standard of care and attention. Located on
                  the 100 acres is an indoor heated riding arena, heated barn, outdoor riding arena, large
                  grass pastures, and 40 acres of trails. In addition, the clubhouse offers a country-club
                  atmosphere catering to the comfort of our clients. Enjoy a refreshment on the outdoor deck
                  while visiting with other horse enthusiasts or sit back and watch a lesson from the viewing
                  area.

                  Visit the Cross Country Page to see pictures of the new Cross Country Schooling Course!!!!

                  COMING SOON... NEW DRESSAGE ARENAS, OUTDOOR SHOW STABLING AND MORE!!!"

      @pics = Gallery.facility
    else
      @page_header = "<strong>Welcome to Geneva Equestrian's new Cross Country Schooling course.</strong><br/>

                Below are pictures of some of the cross country elements. Visit the website for further
                additions throughout the summer."

      @pics = Gallery.x_country
    end

    render "gallery_page"
    #@galleries = Gallery.all(:order => :category) #.sort(:category)
    #
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @galleries }
    #end


  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end
end

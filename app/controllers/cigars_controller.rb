class CigarsController < ApplicationController
  def index
    @q = Cigar.ransack(params[:q])
    @cigars = @q.result(:distinct => true).includes(:profile).page(params[:page]).per(10)

    render("cigars/index.html.erb")
  end

  def show
    @cigar = Cigar.find(params[:id])

    render("cigars/show.html.erb")
  end

  def new
    @cigar = Cigar.new

    render("cigars/new.html.erb")
  end

  def create
    @cigar = Cigar.new

    @cigar.boldness_id = params[:boldness_id]
    @cigar.name = params[:name]
    @cigar.price = params[:price]
    @cigar.country = params[:country]
    @cigar.size = params[:size]
    @cigar.image_url = params[:image_url]

    save_status = @cigar.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cigars/new", "/create_cigar"
        redirect_to("/cigars")
      else
        redirect_back(:fallback_location => "/", :notice => "Cigar created successfully.")
      end
    else
      render("cigars/new.html.erb")
    end
  end

  def edit
    @cigar = Cigar.find(params[:id])

    render("cigars/edit.html.erb")
  end

  def update
    @cigar = Cigar.find(params[:id])

    @cigar.boldness_id = params[:boldness_id]
    @cigar.name = params[:name]
    @cigar.price = params[:price]
    @cigar.country = params[:country]
    @cigar.size = params[:size]
    @cigar.image_url = params[:image_url]

    save_status = @cigar.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cigars/#{@cigar.id}/edit", "/update_cigar"
        redirect_to("/cigars/#{@cigar.id}", :notice => "Cigar updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cigar updated successfully.")
      end
    else
      render("cigars/edit.html.erb")
    end
  end

  def destroy
    @cigar = Cigar.find(params[:id])

    @cigar.destroy

    if URI(request.referer).path == "/cigars/#{@cigar.id}"
      redirect_to("/", :notice => "Cigar deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cigar deleted.")
    end
  end
end

class BottlesController < ApplicationController
  def index
    @bottles = Bottle.page(params[:page]).per(10)

    render("bottles/index.html.erb")
  end

  def show
    @pairing = Pairing.new
    @bottle = Bottle.find(params[:id])

    render("bottles/show.html.erb")
  end

  def new
    @bottle = Bottle.new

    render("bottles/new.html.erb")
  end

  def create
    @bottle = Bottle.new

    @bottle.alcohol_id = params[:alcohol_id]

    save_status = @bottle.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bottles/new", "/create_bottle"
        redirect_to("/bottles")
      else
        redirect_back(:fallback_location => "/", :notice => "Bottle created successfully.")
      end
    else
      render("bottles/new.html.erb")
    end
  end

  def edit
    @bottle = Bottle.find(params[:id])

    render("bottles/edit.html.erb")
  end

  def update
    @bottle = Bottle.find(params[:id])

    @bottle.alcohol_id = params[:alcohol_id]

    save_status = @bottle.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bottles/#{@bottle.id}/edit", "/update_bottle"
        redirect_to("/bottles/#{@bottle.id}", :notice => "Bottle updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bottle updated successfully.")
      end
    else
      render("bottles/edit.html.erb")
    end
  end

  def destroy
    @bottle = Bottle.find(params[:id])

    @bottle.destroy

    if URI(request.referer).path == "/bottles/#{@bottle.id}"
      redirect_to("/", :notice => "Bottle deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bottle deleted.")
    end
  end
end

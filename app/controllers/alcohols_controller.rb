class AlcoholsController < ApplicationController
  def index
    @alcohols = Alcohol.page(params[:page]).per(10)

    render("alcohols/index.html.erb")
  end

  def show
    @bottle = Bottle.new
    @alcohol = Alcohol.find(params[:id])

    render("alcohols/show.html.erb")
  end

  def new
    @alcohol = Alcohol.new

    render("alcohols/new.html.erb")
  end

  def create
    @alcohol = Alcohol.new


    save_status = @alcohol.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/alcohols/new", "/create_alcohol"
        redirect_to("/alcohols")
      else
        redirect_back(:fallback_location => "/", :notice => "Alcohol created successfully.")
      end
    else
      render("alcohols/new.html.erb")
    end
  end

  def edit
    @alcohol = Alcohol.find(params[:id])

    render("alcohols/edit.html.erb")
  end

  def update
    @alcohol = Alcohol.find(params[:id])


    save_status = @alcohol.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/alcohols/#{@alcohol.id}/edit", "/update_alcohol"
        redirect_to("/alcohols/#{@alcohol.id}", :notice => "Alcohol updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Alcohol updated successfully.")
      end
    else
      render("alcohols/edit.html.erb")
    end
  end

  def destroy
    @alcohol = Alcohol.find(params[:id])

    @alcohol.destroy

    if URI(request.referer).path == "/alcohols/#{@alcohol.id}"
      redirect_to("/", :notice => "Alcohol deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Alcohol deleted.")
    end
  end
end

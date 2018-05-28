class TastesController < ApplicationController
  def index
    @q = Taste.ransack(params[:q])
    @tastes = @q.result(:distinct => true).includes(:drinks, :pairing, :alcohols, :boldness).page(params[:page]).per(10)

    render("tastes/index.html.erb")
  end

  def show
    @drink = Drink.new
    @taste = Taste.find(params[:id])

    render("tastes/show.html.erb")
  end

  def new
    @taste = Taste.new

    render("tastes/new.html.erb")
  end

  def create
    @taste = Taste.new

    @taste.name = params[:name]

    save_status = @taste.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tastes/new", "/create_taste"
        redirect_to("/tastes")
      else
        redirect_back(:fallback_location => "/", :notice => "Taste created successfully.")
      end
    else
      render("tastes/new.html.erb")
    end
  end

  def edit
    @taste = Taste.find(params[:id])

    render("tastes/edit.html.erb")
  end

  def update
    @taste = Taste.find(params[:id])

    @taste.name = params[:name]

    save_status = @taste.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tastes/#{@taste.id}/edit", "/update_taste"
        redirect_to("/tastes/#{@taste.id}", :notice => "Taste updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Taste updated successfully.")
      end
    else
      render("tastes/edit.html.erb")
    end
  end

  def destroy
    @taste = Taste.find(params[:id])

    @taste.destroy

    if URI(request.referer).path == "/tastes/#{@taste.id}"
      redirect_to("/", :notice => "Taste deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Taste deleted.")
    end
  end
end

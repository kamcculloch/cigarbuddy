class BoldnessesController < ApplicationController
  def index
    @q = Boldness.ransack(params[:q])
    @boldnesses = @q.result(:distinct => true).includes(:cigars, :pairing, :taste).page(params[:page]).per(10)

    render("boldnesses/index.html.erb")
  end

  def show
    @cigar = Cigar.new
    @boldness = Boldness.find(params[:id])

    render("boldnesses/show.html.erb")
  end

  def new
    @boldness = Boldness.new

    render("boldnesses/new.html.erb")
  end

  def create
    @boldness = Boldness.new

    @boldness.name = params[:name]

    save_status = @boldness.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/boldnesses/new", "/create_boldness"
        redirect_to("/boldnesses")
      else
        redirect_back(:fallback_location => "/", :notice => "Boldness created successfully.")
      end
    else
      render("boldnesses/new.html.erb")
    end
  end

  def edit
    @boldness = Boldness.find(params[:id])

    render("boldnesses/edit.html.erb")
  end

  def update
    @boldness = Boldness.find(params[:id])

    @boldness.name = params[:name]

    save_status = @boldness.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/boldnesses/#{@boldness.id}/edit", "/update_boldness"
        redirect_to("/boldnesses/#{@boldness.id}", :notice => "Boldness updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Boldness updated successfully.")
      end
    else
      render("boldnesses/edit.html.erb")
    end
  end

  def destroy
    @boldness = Boldness.find(params[:id])

    @boldness.destroy

    if URI(request.referer).path == "/boldnesses/#{@boldness.id}"
      redirect_to("/", :notice => "Boldness deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Boldness deleted.")
    end
  end
end

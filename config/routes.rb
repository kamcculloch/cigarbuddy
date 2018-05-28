Rails.application.routes.draw do
  # Routes for the Alcohol resource:
  # CREATE
  get "/alcohols/new", :controller => "alcohols", :action => "new"
  post "/create_alcohol", :controller => "alcohols", :action => "create"

  # READ
  get "/alcohols", :controller => "alcohols", :action => "index"
  get "/alcohols/:id", :controller => "alcohols", :action => "show"

  # UPDATE
  get "/alcohols/:id/edit", :controller => "alcohols", :action => "edit"
  post "/update_alcohol/:id", :controller => "alcohols", :action => "update"

  # DELETE
  get "/delete_alcohol/:id", :controller => "alcohols", :action => "destroy"
  #------------------------------

  # Routes for the Cigar resource:
  # CREATE
  get "/cigars/new", :controller => "cigars", :action => "new"
  post "/create_cigar", :controller => "cigars", :action => "create"

  # READ
  get "/cigars", :controller => "cigars", :action => "index"
  get "/cigars/:id", :controller => "cigars", :action => "show"

  # UPDATE
  get "/cigars/:id/edit", :controller => "cigars", :action => "edit"
  post "/update_cigar/:id", :controller => "cigars", :action => "update"

  # DELETE
  get "/delete_cigar/:id", :controller => "cigars", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

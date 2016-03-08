require_relative('../models/petshop.rb')


# INDEX
get '/petshops' do
  @petshops = Petshop.all()
  erb :"petshops/index"
end


# NEW
get '/petshops/new' do  
  erb :"petshops/new"
end

  #CREATE
post '/petshops' do
  @petshop = Petshop.new( params )
  @petshop.save()
  redirect '/petshops'
end

  #SHOW
get '/petshops/:id' do
  @petshop = Petshop.find(params[:id])
  @pets = @petshop.pets()
  erb :"petshops/show"
end

  #EDIT
get '/petshops/:id/edit' do
  @petshop = Petshop.find(params[:id])
  erb :"petshops/edit"
end

 #UPDATE
post '/petshops/:id' do
 
  @petshop = Petshop.new( params )
  @petshop.update()
  redirect to("/petshops/#{params['id']}")
end

  #DELETE
post '/petshops/:id/delete' do
  Petshop.destroy(params[:id])
  redirect to('/petshops')
end
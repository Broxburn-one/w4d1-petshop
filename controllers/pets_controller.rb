require_relative('../models/pet.rb')
require_relative('../models/petshop.rb')

  #CREATE
post '/players' do
  @pet = Pet.new( params )
  @pet.save()
  redirect to("/petshop/#{params['petshop_id']}")
end

  #SHOW
get '/pets/:id' do
  @pet = Pet.find(params[:id])
  @petshop = @petshop_id.team()
  erb :"pets/show"
end

  #EDIT
get '/pets/:id/edit' do
  @pet = Pet.find(params[:id])
  @petshop = Petshop.all()
  erb :"pets/edit"
end

  #UPDATE
post '/pets/:id' do
  @pet = Pet.new( params )
  @pet.update()
  redirect to("/petshops/#{params['petshop_id']}")
end

  #DELETE
post '/pets/:id/delete' do
  Pet.destroy(params[:id])
  redirect to('/pets')
end



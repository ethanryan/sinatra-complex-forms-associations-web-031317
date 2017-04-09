class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  #CREATE ACTION:::
  #new - form to create a new owner via the new form...
  # controllers/owners_controller.rb
  # get '/owners/new' do
  #   @pets = Pet.all #need to add all pets here
  #   erb :'owners/new'
  # end

  get '/pets/new' do
    #@owners = Owner.all #need to add all owners here?
    erb :'/pets/new'
  end

  #create a new owner and post it
  # app/controllers/owners_controller.rb
  # post '/owners' do
  #   @owner = Owner.create(params[:owner])
  #   if !params["pet"]["name"].empty?
  #     @owner.pets << Pet.create(name: params["pet"]["name"])
  #   end
  #   @owner.save
  #   redirect to "owners/#{@owner.id}"
  # end


  #creates a new pet and associates an existing owner
  post '/pets' do
    @pet = Pet.create(params[:pet]) #added this and below
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
      # @pet.owner = in the line above, to associate new owner as pet's owner.
    end
    @pet.save #added this and above
    redirect to "pets/#{@pet.id}"
  end

  # get '/owners/:id/edit' do
  #   @owner = Owner.find(params[:id])
  #   erb :'/owners/edit'
  # end

  get '/pets/:id/edit' do #adding this controller action
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  #show action:
  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end


  #update action::::
  # post '/owners/:id' do
  #   @owner = Owner.find(params[:id])
  #   @owner.update(params["owner"])
  #   if !params["pet"]["name"].empty?
  #     @owner.pets << Pet.create(name: params["pet"]["name"])
  #   end
  #   redirect to "owners/#{@owner.id}"
  # end

  #creates a new pet and a new owner
  post '/pets/:id' do
    @pet = Pet.find(params[:id]) #adding this and below
    @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
      # @pet.owner = in the line above, to associate new owner as pet's owner.
    end #adding this and above
    @pet.save
    redirect to "pets/#{@pet.id}"
  end
end

#########
#
# class OwnersController < ApplicationController
#
#   get '/owners' do
#     @owners = Owner.all
#     erb :'/owners/index'
#   end
#
#   #CREATE ACTION:::
#   #new - form to create a new owner via the new form...
#   # controllers/owners_controller.rb
#   get '/owners/new' do
#     @pets = Pet.all #need to add all pets here
#     erb :'owners/new'
#   end
#
#   #create a new owner and post it
#   # app/controllers/owners_controller.rb
#   post '/owners' do
#     @owner = Owner.create(params[:owner])
#     if !params["pet"]["name"].empty?
#       @owner.pets << Pet.create(name: params["pet"]["name"])
#     end
#     @owner.save
#     redirect to "owners/#{@owner.id}"
#   end
#
#
#   get '/owners/:id/edit' do
#     @owner = Owner.find(params[:id])
#     erb :'/owners/edit'
#   end
#
#   get '/owners/:id' do
#     @owner = Owner.find(params[:id])
#     erb :'/owners/show'
#   end
#
#   #update action::::
#   post '/owners/:id' do
#     @owner = Owner.find(params[:id])
#     @owner.update(params["owner"])
#     if !params["pet"]["name"].empty?
#       @owner.pets << Pet.create(name: params["pet"]["name"])
#     end
#     redirect to "owners/#{@owner.id}"
#   end
# end

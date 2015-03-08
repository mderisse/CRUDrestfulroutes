require 'sinatra'
require 'json'
require 'pry'

pets = {
	0=> {
		id:0,
		name:"FluffPoppy",
		type:"gerbil"
	}
}

counter = 1

#create
get '/pets' do
	erb :index, locals: {pets: pets}
end

#read
post '/pet' do
	newpet = {
		id: counter,
		name: params["name"],
		type: params["type"]
	}

	pets[counter] = newpet
	counter += 1
	#redirects to a different page
	redirect '/pets'
end

#view one pet
get '/pet/:id' do
	thispet = pets[params[:id].to_i]
erb :show, locals: {thispet: thispet}
end

#update pets
put '/pet/:id' do
	pet = pets[params[:id].to_i]
	pet[:name] = params["newname"]
	redirect '/pets'
end

delete '/pet/:id' do
	pets.delete(params[:id].to_i)
	redirect '/pets'
end

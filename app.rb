require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/model' 
require './models/cake' 

get '/' do
  "Hello, world again!"

end 

get '/test' do
	erb :index
end

post '/submit' do
	@model = Model.new(params[:model])
	if @model.save
		redirect '/models'
	else
		"Sorry, there was an error!"
	end
end

get '/models' do
	@models = Model.all
	erb :models
end

get '/cake' do
	#erb :index, :locals => {:name => params[:name]}}
	@name = "Richard"
	@arr = IO.readlines("cake.list")
	#@arr = JSON.parse(arr)
	erb :cake
	# File.open("cake.list", "r") do |f|
	# f.each_line do |line|
	# 	line + ""
	# 	end 
	# end 
 # 	File.read("cake.list")
end 




get '/json' do
	#erb :index, :locals => {:name => params[:name]}}
	arr = IO.readlines("cake.list")
  	#puts arr
  	#puts "JSON"
	#puts JSON.generate(arr)
	@json = JSON.generate(arr)

	dictionary = []

	cake = []

	hash = {}

	arr.each_with_index {|val, index| puts "#{val} => #{index}" 

		cake.push index
		cake.push val
		#puts cake
		dictionary.push cake

		puts hash
		hash[index.to_s] = val

		cake = []
	}

	puts "---Hash---"
	puts hash

	puts "---Dictionary---"
	puts dictionary
	@dictionary = dictionary

	@json_with_numbers = JSON.generate(dictionary)
	@hash = hash 


	erb :json
end



get '/push_cake' do

	arr = IO.readlines("cake.list")

	arr.each_with_index {|val, index| puts "#{val} => #{index}" 

		puts val
		@cake = Cake.new(
			:cake_num => index,
			:name => val 
		)
		@cake.save

	} 
	#@cake = Cake.new(
	#	:integer
	#)
end 

get '/pull_cake' do

	@cakes = Cake.all
	erb :cake_list

end 



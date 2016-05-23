require 'sinatra'
require 'json'

get '/' do
  "Hello, world again!"
  


# File.open("cake.list", "r") do

#arr = IO.readlines("cake.list") 
#puts arr[0]

end 

File.open("cake.list", "r") do |f|
	f.each_line do |line|
		puts line
		end 
	end 


get '/cake' do
	#erb :index, :locals => {:name => params[:name]}}
	@name = "Richard"
	@arr = IO.readlines("cake.list")
	#@arr = JSON.parse(arr)
	erb :index
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
  	puts arr
  	puts "JSON"
	puts JSON.generate(arr)
	@json = JSON.generate(arr)

	erb :json
end







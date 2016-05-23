require 'sinatra'

get '/' do
  "Hello, world again!"



# File.open("cake.list", "r") do

#arr = IO.readlines("cake.list") 
#puts arr[0]

end 

File.open("cake.list", "r") do |f|
	f.each_line do |line|
		line + ""
		end 
	end 


get '/cake' do
	#erb :index, :locals => {:name => params[:name]}}
	@name = "Richard"
	@arr = IO.readlines("cake.list")
	erb :index
	# File.open("cake.list", "r") do |f|
	# f.each_line do |line|
	# 	line + ""
	# 	end 
	# end 
 # 	File.read("cake.list")
end 




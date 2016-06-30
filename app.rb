#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	@tittle = "Записаться"                                                      
	@message = "Здесь вы можете записаться"
	erb :visit			
end

post '/visit' do                                                                        
   	@username = params[:username]                                            
	@phone = params[:phone]                                                    
	@datetime = params[:datetime] 
	@barber = params[:master]                             
	@color = params[:color]              
         
 	c = Client.new
 	c.name = @username
 	c.phone = @phone
 	c.datestamp = @datetime
 	c.barber = @barber
 	c.color = @color
 	c.save
	
	erb "jdnbkjdbkjd"                                                                              
end 
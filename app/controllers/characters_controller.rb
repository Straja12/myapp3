class CharactersController < ApplicationController
	
	before_action :authenticate_user! , except: [:index]

	def new
	end

	def index
		#@characters = Character.all
		@characters = Character.page(params[:page]).per(16)

		
	end

	def create
		@character = current_user.characters.new(character_params)

		@character.save
		redirect_to @character
	end

	def show
		@character = Character.find(params[:id])
	end

	def destroy

		puts "entered character controller for destroy"
		@character = Character.find(params[:id])

		#if was false for things like 5==5 so I had to convert both to string
		prom = "#{@character.user_id}"
		prom1 = "#{current_user.id}"
		puts "TESTING for trenutni user #{current_user.id}"
		puts "#{prom1} , #{prom}"
		puts "TEsting for character user ID #{@character.user_id}"
		if prom1 === prom 

			@character.destroy
			puts "entered here like we should"
		else
			flash[:notice] = "sorry u cant delete this"

		end
		
		redirect_to characters_path 
	end






private
	def character_params
			params.require(:character).permit(:name, :atribute => [:text])
	end

end

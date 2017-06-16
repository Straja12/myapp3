class AtributesController < ApplicationController


	def edit
		puts "entered atribute controller"
		 @character = Character.find(params[:character_id])
  	 	# @atribute = @character.atributes.find(params[:id])
  	 	@atribute = Atribute.find(params[:id])

	end

	 def update
	 	puts "entered atribute controller for update"
	  @character = Character.find(params[:character_id])
      @atribute  = @character.atributes.find(params[:id])

 	  @atribute.update(atribute_params)
 	  redirect_to character_path(@character)
	end

	def create
		puts "entered atribute controller for create"
		@character = Character.find(params[:character_id])
		@atribute = @character.atributes.create(atribute_params)
		redirect_to character_path(@character)
	end


	 def destroy
	 	puts "entered atribute controller for destroy"
 	   	 @character = Character.find(params[:character_id])
  	 	 @atribute = @character.atributes.find(params[:id])
   		 @atribute.destroy
    	redirect_to character_path(@character)
 	 end

 	


	private
		def atribute_params
			params.require(:atribute).permit(:stat, :value)
		end

end

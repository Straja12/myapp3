class AtributesController < ApplicationController

	def create
		@character = Character.find(params[:character_id])
		@atribute = @character.atributes.create(atribute_params)
		redirect_to character_path(@character)
	end


	 def destroy
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

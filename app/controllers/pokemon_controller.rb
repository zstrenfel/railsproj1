class PokemonController < ApplicationController
	def create
		@pokemon = Pokemon.create name: params(:name), level: 1, health: 100
		@pokemon.trainer = current_trainer
		@pokemon.save
		redirect_to current_trainer
	end

	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer = current_trainer
		@pokemon.save
		redirect_to root_url
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health = @pokemon.health - 10

		if @pokemon.health <= 0
			@pokemon.destroy
		else
			@pokemon.save
		end
		redirect_to current_trainer
	end
end

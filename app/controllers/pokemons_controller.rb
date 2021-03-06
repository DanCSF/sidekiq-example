class PokemonsController < ApplicationController
  require 'csv'

  def index
    @pokemons = Pokemon.all
  end

  def upload
    csv_path = File.join Rails.root, 'db', 'pokemon.csv'
    PokemonAddWorker.perform_async(csv_path)
    flash[:notice] = "All 807 pokemons added to database."
    redirect_to pokemons_path
  end

  def destroy_all
    PokemonDeleteWorker.perform_async
    flash[:notice] = "All 807 pokemons have been deleted."
    redirect_to pokemons_path
  end
end

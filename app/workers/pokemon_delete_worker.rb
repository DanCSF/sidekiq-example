class PokemonDeleteWorker < PokemonWorker
  def perform
    Pokemon.destroy_all
  end
end
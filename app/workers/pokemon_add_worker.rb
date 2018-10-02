class PokemonAddWorker < PokemonWorker
  def perform(csv_path)
    CSV.foreach((csv_path), headers: true) do |pokemon|
      Pokemon.create(
        name: pokemon[1],
        height: pokemon[2],
        weight: pokemon[4])
    end
  end
end
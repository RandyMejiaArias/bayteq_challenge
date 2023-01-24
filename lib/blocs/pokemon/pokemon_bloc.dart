import 'package:bayteq_challenge/resources/pokemon_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bayteq_challenge/models/pokemon_model.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonFetched>((event, emit) async {
      Pokemon pokemon;

      try {
        if(state is PokemonInitial) {
          pokemon = await PokemonProvider.fetchPokemon(event.url);
          emit(PokemonLoaded(pokemon: pokemon));
        }
        else {
          PokemonLoaded pokemonLoaded = state as PokemonLoaded;
          emit(PokemonLoaded(pokemon: pokemonLoaded.pokemon));
        }
      } on Exception {
        emit(PokemonError());
      }
    });
  }
}

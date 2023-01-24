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

    on<PokemonAddAbility>((event, emit) {
      PokemonLoaded pokemonLoaded = state as PokemonLoaded;
      Pokemon pokemon = pokemonLoaded.pokemon;
      switch (event.ability) {
        case 'Intimidación':
          pokemon.stats[0].baseStat-=5;
          pokemon.stats[2].baseStat-=10;
          pokemon.stats[1].baseStat+=10;
          pokemon.stats[5].baseStat+=15;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        
        case 'Regeneración':
          pokemon.stats[0].baseStat+=10;
          pokemon.stats[1].baseStat-=20;
          pokemon.stats[2].baseStat+=5;
          pokemon.stats[5].baseStat+=5;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        
        case 'Inmunidad':
          pokemon.stats[0].baseStat+=10;
          pokemon.stats[1].baseStat-=20;
          pokemon.stats[2].baseStat+=20;
          pokemon.stats[5].baseStat-=10;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        
        case 'Potencia':
          pokemon.stats[0].baseStat-=20;
          pokemon.stats[1].baseStat-=10;
          pokemon.stats[2].baseStat-=10;
          pokemon.stats[5].baseStat+=15;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        
        case 'Impasible':
          pokemon.stats[0].baseStat-=10;
          pokemon.stats[1].baseStat-=3;
          pokemon.stats[2].baseStat-=10;
          pokemon.stats[5].baseStat+=30;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        
        case 'Tóxico':
          pokemon.stats[0].baseStat-=15;
          pokemon.stats[2].baseStat+=20;
          pokemon.stats[5].baseStat+=3;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        default:
      }
    });

    on<PokemonRemoveAbility>((event, emit) {
      PokemonLoaded pokemonLoaded = state as PokemonLoaded;
      Pokemon pokemon = pokemonLoaded.pokemon;
      switch (event.ability) {
        case 'Intimidación':
          pokemon.stats[0].baseStat+=5;
          pokemon.stats[2].baseStat+=10;
          pokemon.stats[1].baseStat-=10;
          pokemon.stats[5].baseStat-=15;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        
        case 'Regeneración':
          pokemon.stats[0].baseStat-=10;
          pokemon.stats[1].baseStat+=20;
          pokemon.stats[2].baseStat-=5;
          pokemon.stats[5].baseStat-=5;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        
        case 'Inmunidad':
          pokemon.stats[0].baseStat-=10;
          pokemon.stats[1].baseStat+=20;
          pokemon.stats[2].baseStat-=20;
          pokemon.stats[5].baseStat+=10;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        
        case 'Potencia':
          pokemon.stats[0].baseStat+=20;
          pokemon.stats[1].baseStat+=10;
          pokemon.stats[2].baseStat+=10;
          pokemon.stats[5].baseStat-=15;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        
        case 'Impasible':
          pokemon.stats[0].baseStat+=10;
          pokemon.stats[1].baseStat+=3;
          pokemon.stats[2].baseStat+=10;
          pokemon.stats[5].baseStat-=30;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        
        case 'Tóxico':
          pokemon.stats[0].baseStat+=15;
          pokemon.stats[2].baseStat-=20;
          pokemon.stats[5].baseStat-=3;
          emit(PokemonLoaded(pokemon: pokemon));
          break;
        default:
      }
    });
  }
}

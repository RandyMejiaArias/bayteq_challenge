part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
  
  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final Pokemon pokemon;

  PokemonLoaded({
    required this.pokemon
  });

  PokemonLoaded copyWith({
    required Pokemon pokemon
  }) {
    return PokemonLoaded(
      pokemon: pokemon
    );
  }

  @override
  List<Object> get props => [pokemon];
  
}

class PokemonError extends PokemonState  {}
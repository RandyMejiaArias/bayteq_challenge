part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class PokemonFetched extends PokemonEvent {
  final String url;

  PokemonFetched(this.url);
}
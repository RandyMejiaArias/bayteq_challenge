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

class PokemonAddAbility extends PokemonEvent {
  final String ability;

  PokemonAddAbility(this.ability);
}

class PokemonRemoveAbility extends PokemonEvent {
  final String ability;

  PokemonRemoveAbility(this.ability);
}
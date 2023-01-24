import 'package:bayteq_challenge/blocs/pokemon/pokemon_bloc.dart';
import 'package:bayteq_challenge/widgets/pokemon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonView extends StatefulWidget {
  final String url;
  const PokemonView({Key? key, required this.url}) : super(key: key);

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  _PokemonViewState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: BlocProvider(
        create: (context) => PokemonBloc()..add(PokemonFetched(widget.url)),
        child: const PokemonItem(),
      ),
    );
  }
}

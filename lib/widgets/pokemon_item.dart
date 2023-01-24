import 'package:bayteq_challenge/blocs/pokemon/pokemon_bloc.dart';
import 'package:bayteq_challenge/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonItem extends StatefulWidget {
  const PokemonItem({
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonItem> createState() => _PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem> {
  late PokemonBloc _pokemonBloc;

  List<String> selectedList = [];
  List<String> itemList = [
    'Intimidación',
    'Regeneración',
    'Inmunidad',
    'Potencia',
    'Impasible',
    'Tóxico'
  ];

  @override
  void initState() {
    super.initState();
    _pokemonBloc = context.read<PokemonBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state is PokemonInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PokemonLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Habilidades',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.2,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 2,
                      childAspectRatio: (16 / 8),
                    ),
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if(selectedList.length > 1) {
                              if(selectedList.contains(itemList[index])){
                                selectedList.remove(itemList[index]);
                              }
                            }
                            else {
                              if (selectedList.contains(itemList[index])){
                                selectedList.remove(itemList[index]);
                              } else {
                                selectedList.add(itemList[index]);
                              }
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: selectedList.contains(itemList[index])
                              ? Colors.red[400]
                              : Color(0xffF4F4F6).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: selectedList.contains(itemList[index])
                                ? Color(0xffDEB988)
                                : Colors.transparent,
                              width: 0.5),
                          ),
                          child: Center(
                            child: Text(
                              itemList[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedList.contains(itemList[index])
                                  ? Colors.white
                                  : Colors.black,
                              )
                            ),
                          )
                        )
                      );
                    }
                  ),
                ),
                const SizedBox(height: 16),
                const Center(child: Text('Información de las habilidades seleccionadas')),
                const SizedBox(height: 16),
                const Center(child: Text('Datos de la habilidad seleccionada')),
                const SizedBox(height: 16),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Image.network(
                      state.pokemon.sprites.other!.officialArtwork.frontDefault,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 80, child: Text('Vida:'),),
                    Expanded(
                      child: LinearProgressIndicator(
                        minHeight: 20,
                        color: Colors.amber.shade900,
                        value: state.pokemon.stats[0].baseStat / 250,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 80, child: Text('Ataque:'),),
                    Expanded(
                      child: LinearProgressIndicator(
                        minHeight: 20,
                        color: Colors.amber.shade900,
                        value: state.pokemon.stats[1].baseStat / 250,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 80, child: Text('Defensa:'),),
                    Expanded(
                      child: LinearProgressIndicator(
                        minHeight: 20,
                        color: Colors.amber.shade900,
                        value: state.pokemon.stats[2].baseStat / 250,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 80, child: Text('Velocidad:'),),
                    Expanded(
                      child: LinearProgressIndicator(
                        minHeight: 20,
                        color: Colors.amber.shade900,
                        value: state.pokemon.stats[5].baseStat / 250,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0,)
              ],
            ),
          );
        }
        return const Center(child: Text('Error feched item'));
      },
    );
  }
}
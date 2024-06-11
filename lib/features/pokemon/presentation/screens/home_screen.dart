import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/presentation/bloc/search_pokemon_bloc.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/presentation/widgets/poke_button.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/presentation/widgets/poke_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.linearToSrgbGamma(),
                    fit: BoxFit.fitWidth,
                    image: NetworkImage('https://www.pngall.com/wp-content/uploads/4/Pokeball-PNG-Free-Download.png') 
                  )
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
                    builder: (context, state) {
                      switch( state ){
                        
                        case SearchPokemonInitial():
                        return  Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                  
                              Expanded(
                                child: PokeButton(
                                  icon: Icons.search, 
                                  text: 'Search Random Pokemon',
                                  onPressed: () => BlocProvider.of<SearchPokemonBloc>(context).add(OnSearchPokemon()),
                                ),
                              ),
              
                              const SizedBox(width: 10),
                  
                              Expanded(
                                child: PokeButton(
                                  icon: Icons.book, 
                                  text: 'Captured Pokemons',
                                  onPressed: () => BlocProvider.of<SearchPokemonBloc>(context).add(OnGetCapturedPokemons()),
                                ),
                              ),
                  
                            ],
                          )
                        );
                  
                        case SearchPokemonLoading():
                          return const Center(child: CircularProgressIndicator(color: Colors.red,));
                  
                        case SearchPokemonSuccess():
                          return  Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                  
                                PokemonCard(pokemon: state.pokemon,),
              
                                const SizedBox(height: 10,),
              
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
              
                                    Expanded(
                                      child: PokeButton(
                                        icon: Icons.search, 
                                        text: 'Search Random Pokemon',
                                        onPressed: () => BlocProvider.of<SearchPokemonBloc>(context).add(OnSearchPokemon()),
                                      ),
                                    ),
              
                                    const SizedBox(width: 10),
              
                                    Expanded(
                                      child: PokeButton(
                                        icon: Icons.book, 
                                        text: 'Captured Pokemons',
                                        onPressed: () => BlocProvider.of<SearchPokemonBloc>(context).add(OnGetCapturedPokemons()),
                                      ),
                                    ),
              
                                    const SizedBox(width: 10),
              
                                    Expanded(
                                      child: PokeButton(
                                        icon: Icons.book, 
                                        text: 'Capture Pokemon',
                                        onPressed: () => BlocProvider.of<SearchPokemonBloc>(context).add(OnCapturePokemon(pokemon: state.pokemon)),
                                      ),
                                    ),
                                  ],
                                )
                                
                  
                              ],
                            ),
                          );
                  
                        case SearchPokemonList():
                          return  Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                  
                                SizedBox(
                                  height: 150,
                                  child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: state.pokemons
                                      .map( (p) => PokemonCard(pokemon: p))
                                      .toList(),
                                  ),
                                ),
              
                                const SizedBox(height: 10),
                  
                                FilledButton(
                                  onPressed: (){
                                    BlocProvider.of<SearchPokemonBloc>(context).add(OnSearchPokemon());
                                  }, 
                                  style:  pokeButtonStyle(),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.search),
                                      Text('Search Random Pokemon'),
                                    ],
                                  )
                                ),
                  
                              ],
                            ),
                          );
                  
                        case SearchPokemonFailure():
                          return  const Center(child: Text('An error has occured!...'));
                  
                      }
                    }
                  ),
                ],
              ),
            ]
          ),
        ),
      ) ,
      
    
    );
  }
}




import 'package:flutter_clean_arquitecture_example/features/pokemon/data/datasources/pokemons_local_data_source.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/data/datasources/pokemons_remote_data_source.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/use_cases/search_pokemon.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/presentation/bloc/search_pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

final dataInjection = GetIt.instance;

Future<void> init() async {

  // Bloc
  dataInjection.registerFactory(
    ( ) => SearchPokemonBloc( 
      dataInjection( ), 
      dataInjection( ),
      dataInjection( )));

  // Use Cases
  dataInjection.registerLazySingleton(( ) => CapturePokemonUseCase(repository: dataInjection( )));
  dataInjection.registerLazySingleton(( ) => GetCapturedPokemonsUseCase(repository: dataInjection( )));
  dataInjection.registerLazySingleton(( ) => SearchPokemonUseCase(repository: dataInjection( )));

  // Repositories
  dataInjection.registerLazySingleton<PokemonRepository>(( ) => PokemonsRepositoryImpl(
    pokemonLocalDataSource: dataInjection( ), 
    pokemonsRemoteDataSource: dataInjection( )));

  // Data Source
  dataInjection.registerLazySingleton<PokemonLocalDataSource>(( ) => HivePokemonLocalDataSourceImpl( ));
  dataInjection.registerLazySingleton<PokemonsRemoteDataSource>(( ) => PokemonsRemoteDataSourceImpl( ));

}
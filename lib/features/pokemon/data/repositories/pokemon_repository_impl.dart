import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arquitecture_example/core/error/failures.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/data/datasources/pokemons_local_data_source.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/data/datasources/pokemons_remote_data_source.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonsRepositoryImpl implements PokemonRepository {

  final PokemonLocalDataSource pokemonLocalDataSource;
  final PokemonsRemoteDataSource pokemonsRemoteDataSource;

  PokemonsRepositoryImpl({
    required this.pokemonLocalDataSource, 
    required this.pokemonsRemoteDataSource
  });


  @override
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon) async {
      try {
        final bool resp = await pokemonLocalDataSource.capturePokemon(pokemon);
        return Right(resp);
      } on LocalFailure {
        return Left(LocalFailure());
      }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getCapturedPokemons() async {
      try {
        final List<Pokemon> resp = await pokemonLocalDataSource.getCapturedPokemonsList();
        return Right(resp);
      } on LocalFailure {
        return Left(LocalFailure());
      }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon(int id) async {
    print('entro5');
      try {
        print('entro6');
        final Pokemon resp = await pokemonsRemoteDataSource.getPokemon(id);
        print('resp22');
        print(resp);
        return Right(resp);
      } on HttpException{
        return Left(ServerFailure());
      }
    }
  }

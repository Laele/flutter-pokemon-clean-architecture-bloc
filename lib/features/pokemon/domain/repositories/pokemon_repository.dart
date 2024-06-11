import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arquitecture_example/core/error/failures.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/entities/pokemon.dart';

abstract class PokemonRepository { 

  Future<Either<Failure, Pokemon>> getPokemon( int id );

  Future<Either<Failure, bool>> capturePokemon( Pokemon pokemon );

  Future<Either<Failure, List<Pokemon>>> getCapturedPokemons( );

}
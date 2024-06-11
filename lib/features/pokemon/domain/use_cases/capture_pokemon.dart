import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arquitecture_example/core/error/failures.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/repositories/pokemon_repository.dart';

class CapturePokemonUseCase { 

  final PokemonRepository repository;

  CapturePokemonUseCase({ required this.repository });

  Future<Either<Failure, bool>> call(Pokemon pokemon){
    
    return repository.capturePokemon(pokemon);

  }

}
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arquitecture_example/core/error/failures.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/repositories/pokemon_repository.dart';

class SearchPokemonUseCase {

  final PokemonRepository repository;

  SearchPokemonUseCase({required this.repository});

  Future<Either<Failure, Pokemon>> call( int id ){
    print('entro4');
    return repository.getPokemon(id);
  }

}
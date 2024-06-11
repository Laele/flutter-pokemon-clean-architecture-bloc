import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arquitecture_example/core/error/failures.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/data/models/pokemon_model.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/domain/entities/pokemon.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PokemonLocalDataSource {

  Future<bool> capturePokemon( Pokemon pokemon );
  Future<List<PokemonModel>> getCapturedPokemonsList();
}

class HivePokemonLocalDataSourceImpl implements PokemonLocalDataSource {

  HivePokemonLocalDataSourceImpl(){
    Hive.initFlutter();
  }

  @override
  Future<bool> capturePokemon(Pokemon pokemon) async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');
      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());
      return true;
    } catch( error ){
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getCapturedPokemonsList() async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');
      return box.values.map( (p) => PokemonModel.fromJson(p) ).toList();
    } catch( error ){
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }

}
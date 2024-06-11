import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_clean_arquitecture_example/features/pokemon/data/models/pokemon_model.dart';

abstract class PokemonsRemoteDataSource {
  Future<PokemonModel> getPokemon( int id );
}

class PokemonsRemoteDataSourceImpl implements PokemonsRemoteDataSource {

  @override
  Future<PokemonModel> getPokemon( int id ) async {
    var url = Uri.https( 'pokeapi.co', '/api/v2/pokemon/$id',);

    var response = await http.get( url );
    Map<String, dynamic> data  = jsonDecode(response.body) as Map<String, dynamic>;

    return PokemonModel.fromJson(data);
  }

}
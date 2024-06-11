import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arquitecture_example/data_injection.dart' as data_injection;
import 'package:flutter_clean_arquitecture_example/features/pokemon/presentation/bloc/search_pokemon_bloc.dart';
import 'package:flutter_clean_arquitecture_example/features/pokemon/presentation/screens/home_screen.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await data_injection.init();
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => GetIt.instance.get<SearchPokemonBloc>()),
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: HomeScreen()
      ),
    );
  }
}
import 'package:filmcharacters/business%20logic/cubit/characters_cubit.dart';
import 'package:filmcharacters/constants/strings.dart';
import 'package:filmcharacters/data/api/character_api.dart';
import 'package:filmcharacters/data/repos/character_repo.dart';
import 'package:filmcharacters/presentation/screens/character_details_screen.dart';
import 'package:filmcharacters/presentation/screens/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  late CharacterRepo characterRepo;
  late CharactersCubit charactersCubit;
  AppRoute() {
    characterRepo = CharacterRepo(CharacterApi());
    charactersCubit = CharactersCubit(characterRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (BuildContext context) => charactersCubit,
                child: const CharacterScreen(),
              ),
        );

      case characterDetails:
        return MaterialPageRoute(builder: (_) => const CharacterDetails());
    }
  }
}

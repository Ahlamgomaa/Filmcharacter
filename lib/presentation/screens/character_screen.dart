import 'package:filmcharacters/business%20logic/cubit/characters_cubit.dart';
import 'package:filmcharacters/constants/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../data/models/character.dart';
import '../widgets/character_items.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CharacterScreen> {
  late List<Character> searchedCharacters;
  late List<Character> allchararacter;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: AppColor.white,
      decoration: InputDecoration(
        hintText: ("Search a Character"),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: AppColor.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextStyle(
        color: AppColor.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      onChanged: (searchCharacters) {
        addSearchedCharactersToSearchedList(searchCharacters);
      },
    );
  }

  void addSearchedCharactersToSearchedList(String searchCharacters) {
    searchedCharacters =
        allchararacter
            .where(
              (character) =>
                  character.name.toLowerCase().startsWith(searchCharacters),
            )
            .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarAction() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearching();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: AppColor.white),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search, color: AppColor.white),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearching();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearching() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBloc() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allchararacter = state.characters;
          return buildLoadedList(state.characters);
        } else {
          return Center(
            child: CircularProgressIndicator(color: AppColor.purple),
          );
        }
      },
    );
  }

  Widget buildLoadedList(List<Character> characters) {
    return SingleChildScrollView(
      child: Container(
        color: AppColor.white,
        child: Column(children: [buildCharacterGrid(characters)]),
      ),
    );
  }

  Widget buildCharacterGrid(List<Character> characters) {
    final isSearching = _searchTextController.text.isNotEmpty;
    final listToShow = isSearching ? searchedCharacters : characters;

    if (listToShow.isEmpty) {
      return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white, // ← الخلفية البيضاء
        child: Center(
          child: Text(
            'No character found !',
            style: TextStyle(
              color: AppColor.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisExtent: 250,
        childAspectRatio: 2 / 3,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: listToShow.length,
      itemBuilder: (context, index) {
        return CharacterItems(character: listToShow[index]);
      },
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(
        color: AppColor.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget noInternet() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Can\'t Connect....Check Internet !!',
              style: TextStyle(
                color: AppColor.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: Image.asset(
                "assets/images/notFound.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected =
              !connectivity.contains(ConnectivityResult.none);

          return Scaffold(
            appBar:
                connected
                    ? AppBar(
                      backgroundColor: AppColor.purple,
                      title:
                          _isSearching
                              ? _buildSearchField()
                              : _buildAppBarTitle(),
                      actions: _buildAppBarAction(),
                      iconTheme: IconThemeData(
                        color: _isSearching ? Colors.white : AppColor.grey,
                      ),
                    )
                    : null,

            body: connected ? buildBloc() : noInternet(),
          );
        },
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../data/models/character.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;

  const CharacterDetails({super.key, required this.character});

  Widget buildSilverAppBar() {
    return SliverAppBar(
      expandedHeight: 700,
      pinned: true,
      stretch: true,
      backgroundColor: AppColor.yellow,

      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.name,
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(character.imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: AppColor.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: Colors.yellow,
      height: 32,
      endIndent: endIndent,
      thickness: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.grey,
        body: CustomScrollView(
          slivers: [
            buildSilverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Gender :  ', character.gender),
                      buildDivider(290),
                      characterInfo('Species :  ', character.species),
                      buildDivider(285),
                      characterInfo('Status :  ', character.status),
                      buildDivider(295),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 600),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

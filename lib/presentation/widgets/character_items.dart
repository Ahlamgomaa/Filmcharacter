import 'package:filmcharacters/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../../data/models/character.dart';

class CharacterItems extends StatelessWidget {
  final Character character;

  const CharacterItems({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(10, 10, 1, 10),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap:
            () => Navigator.pushNamed(
              context,
              characterDetails,
              arguments: character,
            ),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name,
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: character.id,
            child: Container(
              color: AppColor.grey,
              child:
                  character.imageUrl.isNotEmpty
                      ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: 'assets/images/loading.gif',
                        image: character.imageUrl,
                        fit: BoxFit.cover,
                      )
                      : Image.asset(
                        'assets/images/placeholder.png',
                        fit: BoxFit.cover,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}

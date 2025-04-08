class Character {
  int charId;
  String name;
  String nickNmae;
  String imageUrl;
  List<dynamic> jobs;
  String status;
  List<dynamic> appearance;
  String portrayed;
  String category;
  List<dynamic> betterCallSaulAppearance;
  Character.fromJson(Map<String, dynamic> json)
      : charId = json['char_id'],
        name = json['name'],
        nickNmae = json['nickname'],
        imageUrl = json['img'],
        jobs = json['occupation'],
        status = json['status'],
        appearance = json['appearance'],
        portrayed = json['portrayed'],
        category = json['category'],
        betterCallSaulAppearance = json['better_call_saul_appearance'];
  


}
class Information {
  int? id;
  double? average_score;
  String? adjustment;

  Information({ required this.id, required this.average_score, required this.adjustment});

  // from json
   Information.fromJson(Map json):
      this.id = json['id'],
      this.average_score = json['average_score'],
      this.adjustment = json['adjustment'];


  // toJson
    toJson(){
      return {
        'id': this.id,
        'average_score': this.average_score,
        'adjustment': this.adjustment
      };
    }



}
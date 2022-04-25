class WordModel {
  int? word_id;
  String? word;
  String? pronounce;
  String? meaning;

  WordModel({ required this.word_id, required this.word, required this.pronounce, required this.meaning});

  WordModel.fromJson(Map json):
      this.word_id = json['word_id'],
        this.word = json['word'],
        this.pronounce = json['pronounce'],
        this.meaning = json['meaning'];
/*
 factory WordModel.fromJson2(Map json){
    return WordModel(
        word_id : json['word_id'],
        word : json['word'],
        pronounce : json['pronounce'],
        meaning : json['meaning']
    );
    }
 */
  toJson(){
    return {
      'word_id': this.word_id,
      'word': this.word,
      'pronounce': this.pronounce,
      'meaning': this.meaning
    };
  }





}
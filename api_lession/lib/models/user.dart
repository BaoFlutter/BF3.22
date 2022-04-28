
class User {
  String? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Registered? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  User({this.gender, this.name, this.location, this.email, this.login, this.dob, this.registered, this.phone, this.cell, this.id, this.picture, this.nat});

  User.fromJson(Map<String, dynamic> json) {
    if(json["gender"] is String)
      this.gender = json["gender"];
    if(json["name"] is Map)
      this.name = json["name"] == null ? null : Name.fromJson(json["name"]);
    if(json["location"] is Map)
      this.location = json["location"] == null ? null : Location.fromJson(json["location"]);
    if(json["email"] is String)
      this.email = json["email"];
    if(json["login"] is Map)
      this.login = json["login"] == null ? null : Login.fromJson(json["login"]);
    if(json["dob"] is Map)
      this.dob = json["dob"] == null ? null : Dob.fromJson(json["dob"]);
    if(json["registered"] is Map)
      this.registered = json["registered"] == null ? null : Registered.fromJson(json["registered"]);
    if(json["phone"] is String)
      this.phone = json["phone"];
    if(json["cell"] is String)
      this.cell = json["cell"];
    if(json["id"] is Map)
      this.id = json["id"] == null ? null : Id.fromJson(json["id"]);
    if(json["picture"] is Map)
      this.picture = json["picture"] == null ? null : Picture.fromJson(json["picture"]);
    if(json["nat"] is String)
      this.nat = json["nat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["gender"] = this.gender;
    if(this.name != null)
      data["name"] = this.name?.toJson();
    if(this.location != null)
      data["location"] = this.location?.toJson();
    data["email"] = this.email;
    if(this.login != null)
      data["login"] = this.login?.toJson();
    if(this.dob != null)
      data["dob"] = this.dob?.toJson();
    if(this.registered != null)
      data["registered"] = this.registered?.toJson();
    data["phone"] = this.phone;
    data["cell"] = this.cell;
    if(this.id != null)
      data["id"] = this.id?.toJson();
    if(this.picture != null)
      data["picture"] = this.picture?.toJson();
    data["nat"] = this.nat;
    return data;
  }
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    if(json["large"] is String)
      this.large = json["large"];
    if(json["medium"] is String)
      this.medium = json["medium"];
    if(json["thumbnail"] is String)
      this.thumbnail = json["thumbnail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["large"] = this.large;
    data["medium"] = this.medium;
    data["thumbnail"] = this.thumbnail;
    return data;
  }
}

class Id {
  String? name;
  String? value;

  Id({this.name, this.value});

  Id.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String)
      this.name = json["name"];
    if(json["value"] is String)
      this.value = json["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["value"] = this.value;
    return data;
  }
}

class Registered {
  String? date;
  int? age;

  Registered({this.date, this.age});

  Registered.fromJson(Map<String, dynamic> json) {
    if(json["date"] is String)
      this.date = json["date"];
    if(json["age"] is int)
      this.age = json["age"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["date"] = this.date;
    data["age"] = this.age;
    return data;
  }
}

class Dob {
  String? date;
  int? age;

  Dob({this.date, this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    if(json["date"] is String)
      this.date = json["date"];
    if(json["age"] is int)
      this.age = json["age"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["date"] = this.date;
    data["age"] = this.age;
    return data;
  }
}

class Login {
  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  Login({this.uuid, this.username, this.password, this.salt, this.md5, this.sha1, this.sha256});

  Login.fromJson(Map<String, dynamic> json) {
    if(json["uuid"] is String)
      this.uuid = json["uuid"];
    if(json["username"] is String)
      this.username = json["username"];
    if(json["password"] is String)
      this.password = json["password"];
    if(json["salt"] is String)
      this.salt = json["salt"];
    if(json["md5"] is String)
      this.md5 = json["md5"];
    if(json["sha1"] is String)
      this.sha1 = json["sha1"];
    if(json["sha256"] is String)
      this.sha256 = json["sha256"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["uuid"] = this.uuid;
    data["username"] = this.username;
    data["password"] = this.password;
    data["salt"] = this.salt;
    data["md5"] = this.md5;
    data["sha1"] = this.sha1;
    data["sha256"] = this.sha256;
    return data;
  }
}

class Location {
  Street? street;
  String? city;
  String? state;
  String? country;
  String? postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  Location({this.street, this.city, this.state, this.country, this.postcode, this.coordinates, this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    if(json["street"] is Map)
      this.street = json["street"] == null ? null : Street.fromJson(json["street"]);
    if(json["city"] is String)
      this.city = json["city"];
    if(json["state"] is String)
      this.state = json["state"];
    if(json["country"] is String)
      this.country = json["country"];
    if(json["postcode"] is String)
      this.postcode = json["postcode"];
    if(json["coordinates"] is Map)
      this.coordinates = json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]);
    if(json["timezone"] is Map)
      this.timezone = json["timezone"] == null ? null : Timezone.fromJson(json["timezone"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.street != null)
      data["street"] = this.street?.toJson();
    data["city"] = this.city;
    data["state"] = this.state;
    data["country"] = this.country;
    data["postcode"] = this.postcode;
    if(this.coordinates != null)
      data["coordinates"] = this.coordinates?.toJson();
    if(this.timezone != null)
      data["timezone"] = this.timezone?.toJson();
    return data;
  }
}

class Timezone {
  String? offset;
  String? description;

  Timezone({this.offset, this.description});

  Timezone.fromJson(Map<String, dynamic> json) {
    if(json["offset"] is String)
      this.offset = json["offset"];
    if(json["description"] is String)
      this.description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["offset"] = this.offset;
    data["description"] = this.description;
    return data;
  }
}

class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    if(json["latitude"] is String)
      this.latitude = json["latitude"];
    if(json["longitude"] is String)
      this.longitude = json["longitude"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["latitude"] = this.latitude;
    data["longitude"] = this.longitude;
    return data;
  }
}

class Street {
  int? number;
  String? name;

  Street({this.number, this.name});

  Street.fromJson(Map<String, dynamic> json) {
    if(json["number"] is int)
      this.number = json["number"];
    if(json["name"] is String)
      this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["number"] = this.number;
    data["name"] = this.name;
    return data;
  }
}

class Name {
  String? title;
  String? first;
  String? last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    if(json["title"] is String)
      this.title = json["title"];
    if(json["first"] is String)
      this.first = json["first"];
    if(json["last"] is String)
      this.last = json["last"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["first"] = this.first;
    data["last"] = this.last;
    return data;
  }
}
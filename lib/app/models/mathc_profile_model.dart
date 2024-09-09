class MatchProfile {
  String? profileId;
  String? name;
  String? dob;
  String? caste;
  String? religion;
  String? height;
  String? location;
  String? photo1;
  String? photo2;
  String? photo3;
  String? photo4;

  MatchProfile(
      {this.profileId,
      this.name,
      this.dob,
      this.caste,
      this.religion,
      this.height,
      this.location,
      this.photo1,
      this.photo2,
      this.photo3,
      this.photo4});

  MatchProfile.fromJson(Map<String, dynamic> json) {
    profileId = json['profile_id'] ?? json["id"];
    name = json['name'];
    dob = json['dob'];
    caste = json['caste'];
    religion = json['religion'];
    height = json['height'];
    location = json['location'];
    photo1 = json['photo1'];
    photo2 = json['photo2'];
    photo3 = json['photo3'];
    photo4 = json['photo4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_id'] = this.profileId;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['caste'] = this.caste;
    data['religion'] = this.religion;
    data['height'] = this.height;
    data['location'] = this.location;
    data['photo1'] = this.photo1;
    data['photo2'] = this.photo2;
    data['photo3'] = this.photo3;
    data['photo4'] = this.photo4;
    return data;
  }
}

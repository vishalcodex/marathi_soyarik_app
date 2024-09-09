class Search {
  String? id;
  String? gender;
  String? religion;
  String? caste;
  String? maritalStatus;
  String? motherTongue;
  String? ageFrom;
  String? ageTo;
  String? heightFrom;
  String? heightTo;
  String? country;
  String? state;
  String? city;
  String? education;

  Search(
      {this.gender,
      this.religion,
      this.caste,
      this.maritalStatus,
      this.motherTongue,
      this.ageFrom,
      this.ageTo,
      this.heightFrom,
      this.heightTo,
      this.country,
      this.state,
      this.city,
      this.education});

  Search.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['Gender'];
    religion = json['Religion'];
    caste = json['Caste'];
    maritalStatus = json['Marital Status'];
    motherTongue = json['Mother Tongue'];
    ageFrom = json['Age (From)'];
    ageTo = json['Age (To)'];
    heightFrom = json['Height (From)'];
    heightTo = json['Height (To)'];
    country = json['Country'];
    state = json['State'];
    city = json['City'];
    education = json['Education'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Gender'] = this.gender;
    data['Religion'] = this.religion;
    data['Caste'] = this.caste;
    data['Marital Status'] = this.maritalStatus;
    data['Mother Tongue'] = this.motherTongue;
    data['Age (From)'] = this.ageFrom;
    data['Age (To)'] = this.ageTo;
    data['Height (From)'] = heightFrom
        .toString()
        .replaceAll(" ft", ".")
        .replaceAll(" ", "")
        .replaceAll("inches", "")
        .trim();
    if (data["from_height"].toString().length == 2) {
      data["from_height"] = "${data["from_height"]}0";
    }
    data['Height (To)'] = heightTo
        .toString()
        .replaceAll(" ft", ".")
        .replaceAll(" ", "")
        .replaceAll("inches", "")
        .trim();
    if (data["to_height"].toString().length == 2) {
      data["to_height"] = "${data["to_height"]}0";
    }
    data['Country'] = this.country;
    data['State'] = this.state;
    data['City'] = this.city;
    data['Education'] = this.education;
    return data;
  }
}

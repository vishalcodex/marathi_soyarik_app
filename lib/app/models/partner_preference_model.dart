class BasicPreference {
  String? vId;
  String? lookingFor;
  String? skinTone;
  String? mothertounge;
  String? fromAge;
  String? toAge;
  String? fromHeight;
  String? toHeight;
  String? eatingHabit;
  String? drinkingHabit;
  String? generalExpt;

  BasicPreference(
      {this.vId,
      this.lookingFor,
      this.skinTone,
      this.mothertounge,
      this.fromAge,
      this.toAge,
      this.fromHeight,
      this.toHeight,
      this.eatingHabit,
      this.drinkingHabit,
      this.generalExpt});

  BasicPreference.fromJson(Map<String, dynamic> json) {
    vId = json['v_id'];
    lookingFor = json['looking_for'];
    skinTone = json['skin_tone'];
    mothertounge = json['mothertounge'];
    fromAge = json['from_age'];
    toAge = json['to_age'];
    fromHeight =
        "${json['from_height'].toString().replaceAll(".", " ft ").trim()}${json['from_height'].toString().contains(".") ? " inches" : ""}"
            .replaceAll(" 0 inches", "")
            .trim();
    toHeight =
        "${json['to_height'].toString().replaceAll(".", " ft ").trim()}${json['to_height'].toString().contains(".") ? " inches" : ""}"
            .replaceAll(" 0 inches", "")
            .trim();
    eatingHabit = json['eating_habit'];
    drinkingHabit = json['drinking_habit'];
    generalExpt = json['general_expt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['v_id'] = vId;
    data['looking_for'] = lookingFor;
    data['skin_tone'] = skinTone;
    data['mothertounge'] = mothertounge;
    data['from_age'] = fromAge;
    data['to_age'] = toAge;
    data['from_height'] = fromHeight
        .toString()
        .replaceAll(" ft", ".")
        .replaceAll(" ", "")
        .replaceAll("inches", "")
        .trim();
    if (data["from_height"].toString().length == 2) {
      data["from_height"] = "${data["from_height"]}0";
    }
    data['to_height'] = toHeight
        .toString()
        .replaceAll(" ft", ".")
        .replaceAll(" ", "")
        .replaceAll("inches", "")
        .trim();
    if (data["to_height"].toString().length == 2) {
      data["to_height"] = "${data["to_height"]}0";
    }
    data['eating_habit'] = eatingHabit;
    data['drinking_habit'] = drinkingHabit;
    data['general_expt'] = generalExpt;
    return data;
  }
}

class ReligiousPreference {
  String? vId;
  String? religon;
  String? caste;
  String? manglik;
  String? star;

  ReligiousPreference(
      {this.vId, this.religon, this.caste, this.manglik, this.star});

  ReligiousPreference.fromJson(Map<String, dynamic> json) {
    vId = json['v_id'];
    religon = json['religon'];
    caste = json['caste'];
    manglik = json['manglik'];
    star = json['star'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['v_id'] = vId;
    data['religon'] = religon;
    data['caste'] = caste;
    data['manglik'] = manglik;
    data['star'] = star;
    return data;
  }
}

class LocationPreference {
  String? vId;
  String? city;
  String? state;
  String? country;
  String? residence;

  LocationPreference(
      {this.vId, this.city, this.state, this.country, this.residence});

  LocationPreference.fromJson(Map<String, dynamic> json) {
    vId = json['v_id'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    residence = json['residence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['v_id'] = vId;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['residence'] = residence;
    return data;
  }
}

class EducationPreference {
  String? education;
  String? occupation;
  String? annualIncome;
  String? vId;

  EducationPreference(
      {this.education, this.occupation, this.annualIncome, this.vId});

  EducationPreference.fromJson(Map<String, dynamic> json) {
    education = json['education'];
    occupation = json['occupation'];
    annualIncome = json['annual_income'];
    vId = json['v_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['education'] = education;
    data['occupation'] = occupation;
    data['annual_income'] = annualIncome;
    data['v_id'] = vId;
    return data;
  }
}

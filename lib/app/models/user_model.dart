class User {
  String? userId;
  String? email;
  String? password;
  String? name;
  String? dOB;
  String? location;
  String? mobile;
  String? gender;
  String? maritalStatus;
  String? religion;
  String? caste;
  String? token;
  String? profileImg;

  User(
      {this.email,
      this.password,
      this.name,
      this.dOB,
      this.location,
      this.mobile,
      this.gender,
      this.maritalStatus,
      this.religion,
      this.caste});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? json["id"];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    dOB = json['DOB'];
    location = json['location'];
    mobile = json['mobile'];
    gender = json['gender'];
    maritalStatus = json['marital-status'];
    religion = json['religion'];
    caste = json['caste'];
    token = json["token"];
    profileImg = json["photo1"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['DOB'] = dOB;
    data['location'] = location;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['marital-status'] = maritalStatus;
    data['religion'] = religion;
    data['caste'] = caste;
    return data;
  }
}

class BasicDetails {
  String? id;
  String? name;
  String? dOB;
  String? height;
  String? weight;
  String? gender;
  String? maritalStatus;
  String? hobbies;
  String? birthtime;
  String? birthplace;
  String? noofchildren;
  String? mothertounge;
  String? languages;
  String? createdBy;
  String? mobile;

  BasicDetails(
      {this.name,
      this.dOB,
      this.height,
      this.weight,
      this.gender,
      this.maritalStatus,
      this.hobbies,
      this.birthtime,
      this.birthplace,
      this.noofchildren,
      this.mothertounge,
      this.languages,
      this.createdBy});

  BasicDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dOB = json['dob'];
    mobile = json['mobile'];
    height =
        "${json['height'].toString().replaceAll(".", " ft ").trim()}${json['height'].toString().contains(".") ? " inches" : ""}"
            .replaceAll(" 0 inches", "")
            .trim();
    weight = json['weight'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    hobbies = json["hobby"];
    birthtime = json['birthtime'];
    birthplace = json['birthplace'];
    noofchildren = json['children'];
    mothertounge = json['mother_tongue'];
    languages = json['language'];
    createdBy = json['created_by'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['dob'] = dOB;
    data['height'] = height
        .toString()
        .replaceAll(" ft", ".")
        .replaceAll(" ", "")
        .replaceAll("inches", "")
        .trim();
    if (data["height"].toString().length == 2) {
      data["height"] = "${data["height"]}0";
    }
    data['weight'] = weight;
    data['gender'] = gender;
    data['marital_status'] = maritalStatus;
    data['hobby'] = hobbies;
    data['birthtime'] = birthtime;
    data['birthplace'] = birthplace;
    data['children'] = noofchildren;
    data['mothertounge'] = mothertounge;
    data['languages'] = languages;
    data['created_by'] = createdBy;
    data['id'] = id;
    return data;
  }
}

class ReligiousDetails {
  String? religion;
  String? star;
  String? caste;
  String? horoscope;
  String? subcaste;
  String? gotra;
  String? manglik;
  String? moonsign;
  String? id;

  ReligiousDetails(
      {this.religion,
      this.star,
      this.caste,
      this.horoscope,
      this.subcaste,
      this.gotra,
      this.manglik,
      this.moonsign,
      this.id});

  ReligiousDetails.fromJson(Map<String, dynamic> json) {
    religion = json['religion'];
    star = json['star'];
    caste = json['caste'];
    horoscope = json['horoscope'];
    subcaste = json['subcaste'];
    gotra = json['gotra'];
    manglik = json['manglik'];
    moonsign = json['moonsign'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['religion'] = religion;
    data['star'] = star;
    data['caste'] = caste;
    data['horoscope'] = horoscope;
    data['subcaste'] = subcaste;
    data['gotra'] = gotra;
    data['manglik'] = manglik;
    data['moonsign'] = moonsign;
    data['id'] = id;
    return data;
  }
}

class EducationDetails {
  String? education;
  String? occupation;
  String? employeeIn;
  String? designation;
  String? annualIncome;
  String? id;

  EducationDetails(
      {this.education,
      this.occupation,
      this.employeeIn,
      this.designation,
      this.annualIncome,
      this.id});

  EducationDetails.fromJson(Map<String, dynamic> json) {
    education = json['education'];
    occupation = json['occupation'];
    employeeIn = json['employee_in'];
    designation = json['designation'];
    annualIncome = json['annual_income'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['education'] = education;
    data['occupation'] = occupation;
    data['employee_in'] = employeeIn;
    data['designation'] = designation;
    data['annual_income'] = annualIncome;
    data['id'] = id;
    return data;
  }
}

class LifestyleDetails {
  String? bodyType;
  String? eatingHabbit;
  String? skinTone;
  String? smokingHabbit;
  String? bloodGroup;
  String? drinkingHabbit;
  String? id;

  LifestyleDetails(
      {this.bodyType,
      this.eatingHabbit,
      this.skinTone,
      this.smokingHabbit,
      this.bloodGroup,
      this.drinkingHabbit,
      this.id});

  LifestyleDetails.fromJson(Map<String, dynamic> json) {
    bodyType = json['body_type'];
    eatingHabbit = json['eating_habbit'];
    skinTone = json['skin_tone'];
    smokingHabbit = json['smoking_habbit'];
    bloodGroup = json['blood_group'];
    drinkingHabbit = json['drinking_habbit'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body_type'] = bodyType;
    data['eating_habbit'] = eatingHabbit;
    data['skin_tone'] = skinTone;
    data['smoking_habbit'] = smokingHabbit;
    data['blood_group'] = bloodGroup;
    data['drinking_habbit'] = drinkingHabbit;
    data['id'] = id;
    return data;
  }
}

class LocationDetails {
  String? country;
  String? state;
  String? city;
  String? address;
  String? residance;
  String? timeToCall;
  String? id;

  LocationDetails(
      {this.country,
      this.state,
      this.city,
      this.address,
      this.residance,
      this.timeToCall,
      this.id});

  LocationDetails.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    residance = json['residance'];
    timeToCall = json['time_to_call'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['address'] = address;
    data['residance'] = residance;
    data['time_to_call'] = timeToCall;
    data['id'] = id;
    return data;
  }
}

class FamilyDetails {
  String? id;
  String? familyType;
  String? fathersName;
  String? fathersOccupation;
  String? mothersName;
  String? mothersOccupation;
  String? noOfBrothers;
  String? noOfMarriedBrothers;
  String? noOfSisters;
  String? noOfMarriedSisters;
  String? aboutFamily;

  FamilyDetails(
      {this.id,
      this.familyType,
      this.fathersName,
      this.fathersOccupation,
      this.mothersName,
      this.mothersOccupation,
      this.noOfBrothers,
      this.noOfMarriedBrothers,
      this.noOfSisters,
      this.noOfMarriedSisters,
      this.aboutFamily});

  FamilyDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    familyType = json['family_type'];
    fathersName = json['fathers_name'];
    fathersOccupation = json['fathers_occupation'];
    mothersName = json['mothers_name'];
    mothersOccupation = json['mothers_occupation'];
    noOfBrothers = json['no_of_brothers'];
    noOfMarriedBrothers = json['no_of_married_brothers'];
    noOfSisters = json['no_of_sisters'];
    noOfMarriedSisters = json['no_of_married_sisters'];
    aboutFamily = json['about_family'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['family_type'] = familyType;
    data['fathers_name'] = fathersName;
    data['fathers_occupation'] = fathersOccupation;
    data['mothers_name'] = mothersName;
    data['mothers_occupation'] = mothersOccupation;
    data['no_of_brothers'] = noOfBrothers;
    data['no_of_married_brothers'] = noOfMarriedBrothers;
    data['no_of_sisters'] = noOfSisters;
    data['no_of_married_sisters'] = noOfMarriedSisters;
    data['about_family'] = aboutFamily;
    return data;
  }
}

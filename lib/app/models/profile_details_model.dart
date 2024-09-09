class ProfileDetails {
  String? id;
  String? name;
  String? dob;
  String? location;
  String? email;
  String? mobile;
  String? gender;
  String? maritalStatus;
  String? religion;
  String? motherTongue;
  String? caste;
  String? message;
  String? status;
  String? aadhar;
  String? photo1;
  String? photo2;
  String? photo3;
  String? photo4;
  String? hobby;
  String? height;
  String? weight;
  String? language;
  String? birthtime;
  String? birthplace;
  String? children;
  String? createdBy;
  String? subcaste;
  String? manglik;
  String? star;
  String? horoscope;
  String? gotra;
  String? moonsign;
  String? education;
  String? employeeIn;
  String? annualIncome;
  String? occupation;
  String? designation;
  String? bodyType;
  String? skinTone;
  String? bloodGroup;
  String? eatingHabbit;
  String? smokingHabbit;
  String? drinkingHabbit;
  String? country;
  String? state;
  String? city;
  String? address;
  String? phone;
  String? timeToCall;
  String? residance;
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
  String? addHoroscope;
  String? packageReq;
  String? package;
  String? allowPackage;
  String? totalInterest;
  String? totalChat;
  String? totalContact;
  String? packStartDate;
  String? packEndDate;
  String? picVisibilibity;
  String? contactVisibilibity;
  String? emailVisibilibity;
  String? createdDt;
  PartnerPreferance? partnerPreferance;

  ProfileDetails(
      {this.id,
      this.name,
      this.dob,
      this.location,
      this.email,
      this.mobile,
      this.gender,
      this.maritalStatus,
      this.religion,
      this.motherTongue,
      this.caste,
      this.message,
      this.status,
      this.aadhar,
      this.photo1,
      this.photo2,
      this.photo3,
      this.photo4,
      this.hobby,
      this.height,
      this.weight,
      this.language,
      this.birthtime,
      this.birthplace,
      this.children,
      this.createdBy,
      this.subcaste,
      this.manglik,
      this.star,
      this.horoscope,
      this.gotra,
      this.moonsign,
      this.education,
      this.employeeIn,
      this.annualIncome,
      this.occupation,
      this.designation,
      this.bodyType,
      this.skinTone,
      this.bloodGroup,
      this.eatingHabbit,
      this.smokingHabbit,
      this.drinkingHabbit,
      this.country,
      this.state,
      this.city,
      this.address,
      this.phone,
      this.timeToCall,
      this.residance,
      this.familyType,
      this.fathersName,
      this.fathersOccupation,
      this.mothersName,
      this.mothersOccupation,
      this.noOfBrothers,
      this.noOfMarriedBrothers,
      this.noOfSisters,
      this.noOfMarriedSisters,
      this.aboutFamily,
      this.addHoroscope,
      this.packageReq,
      this.package,
      this.allowPackage,
      this.totalInterest,
      this.totalChat,
      this.totalContact,
      this.packStartDate,
      this.packEndDate,
      this.picVisibilibity,
      this.contactVisibilibity,
      this.emailVisibilibity,
      this.createdDt,
      this.partnerPreferance});

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dob = json['dob'];
    location = json['location'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    religion = json['religion'];
    motherTongue = json['mother_tongue'];
    caste = json['caste'];
    message = json['message'];
    status = json['status'];
    aadhar = json['aadhar'];
    photo1 = json['photo1'];
    photo2 = json['photo2'];
    photo3 = json['photo3'];
    photo4 = json['photo4'];
    hobby = json['hobby'];
    height = json['height'];
    weight = json['weight'];
    language = json['language'];
    birthtime = json['birthtime'];
    birthplace = json['birthplace'];
    children = json['children'];
    createdBy = json['created_by'];
    subcaste = json['subcaste'];
    manglik = json['manglik'];
    star = json['star'];
    horoscope = json['horoscope'];
    gotra = json['gotra'];
    moonsign = json['moonsign'];
    education = json['education'];
    employeeIn = json['employee_in'];
    annualIncome = json['annual_income'];
    occupation = json['occupation'];
    designation = json['designation'];
    bodyType = json['body_type'];
    skinTone = json['skin_tone'];
    bloodGroup = json['blood_group'];
    eatingHabbit = json['eating_habbit'];
    smokingHabbit = json['smoking_habbit'];
    drinkingHabbit = json['drinking_habbit'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    phone = json['phone'];
    timeToCall = json['time_to_call'];
    residance = json['residance'];
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
    addHoroscope = json['add_horoscope'];
    packageReq = json['package_req'];
    package = json['package'];
    allowPackage = json['allow_package'];
    totalInterest = json['total_interest'];
    totalChat = json['total_chat'];
    totalContact = json['total_contact'];
    packStartDate = json['pack_start_date'];
    packEndDate = json['pack_end_date'];
    picVisibilibity = json['pic_visibilibity'];
    contactVisibilibity = json['contact_visibilibity'];
    emailVisibilibity = json['email_visibilibity'];
    createdDt = json['created_dt'];
    partnerPreferance = json['partner_preferance'] != null
        ? new PartnerPreferance.fromJson(json['partner_preferance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['location'] = this.location;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['marital_status'] = this.maritalStatus;
    data['religion'] = this.religion;
    data['mother_tongue'] = this.motherTongue;
    data['caste'] = this.caste;
    data['message'] = this.message;
    data['status'] = this.status;
    data['aadhar'] = this.aadhar;
    data['photo1'] = this.photo1;
    data['photo2'] = this.photo2;
    data['photo3'] = this.photo3;
    data['photo4'] = this.photo4;
    data['hobby'] = this.hobby;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['language'] = this.language;
    data['birthtime'] = this.birthtime;
    data['birthplace'] = this.birthplace;
    data['children'] = this.children;
    data['created_by'] = this.createdBy;
    data['subcaste'] = this.subcaste;
    data['manglik'] = this.manglik;
    data['star'] = this.star;
    data['horoscope'] = this.horoscope;
    data['gotra'] = this.gotra;
    data['moonsign'] = this.moonsign;
    data['education'] = this.education;
    data['employee_in'] = this.employeeIn;
    data['annual_income'] = this.annualIncome;
    data['occupation'] = this.occupation;
    data['designation'] = this.designation;
    data['body_type'] = this.bodyType;
    data['skin_tone'] = this.skinTone;
    data['blood_group'] = this.bloodGroup;
    data['eating_habbit'] = this.eatingHabbit;
    data['smoking_habbit'] = this.smokingHabbit;
    data['drinking_habbit'] = this.drinkingHabbit;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['time_to_call'] = this.timeToCall;
    data['residance'] = this.residance;
    data['family_type'] = this.familyType;
    data['fathers_name'] = this.fathersName;
    data['fathers_occupation'] = this.fathersOccupation;
    data['mothers_name'] = this.mothersName;
    data['mothers_occupation'] = this.mothersOccupation;
    data['no_of_brothers'] = this.noOfBrothers;
    data['no_of_married_brothers'] = this.noOfMarriedBrothers;
    data['no_of_sisters'] = this.noOfSisters;
    data['no_of_married_sisters'] = this.noOfMarriedSisters;
    data['about_family'] = this.aboutFamily;
    data['add_horoscope'] = this.addHoroscope;
    data['package_req'] = this.packageReq;
    data['package'] = this.package;
    data['allow_package'] = this.allowPackage;
    data['total_interest'] = this.totalInterest;
    data['total_chat'] = this.totalChat;
    data['total_contact'] = this.totalContact;
    data['pack_start_date'] = this.packStartDate;
    data['pack_end_date'] = this.packEndDate;
    data['pic_visibilibity'] = this.picVisibilibity;
    data['contact_visibilibity'] = this.contactVisibilibity;
    data['email_visibilibity'] = this.emailVisibilibity;
    data['created_dt'] = this.createdDt;
    if (this.partnerPreferance != null) {
      data['partner_preferance'] = this.partnerPreferance!.toJson();
    }
    return data;
  }
}

class PartnerPreferance {
  String? id;
  String? vId;
  String? lookingFor;
  String? fromAge;
  String? toAge;
  String? skinTone;
  String? fromHeight;
  String? toHeight;
  String? generalExpt;
  String? mothertounge;
  String? eatingHabit;
  String? drinkingHabit;
  String? religon;
  String? caste;
  String? manglik;
  String? star;
  String? education;
  String? employeeIn;
  String? annualIncome;
  String? occupation;
  String? designation;
  String? country;
  String? city;
  String? state;
  String? residence;
  String? createdDt;

  PartnerPreferance(
      {this.id,
      this.vId,
      this.lookingFor,
      this.fromAge,
      this.toAge,
      this.skinTone,
      this.fromHeight,
      this.toHeight,
      this.generalExpt,
      this.mothertounge,
      this.eatingHabit,
      this.drinkingHabit,
      this.religon,
      this.caste,
      this.manglik,
      this.star,
      this.education,
      this.employeeIn,
      this.annualIncome,
      this.occupation,
      this.designation,
      this.country,
      this.city,
      this.state,
      this.residence,
      this.createdDt});

  PartnerPreferance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vId = json['v_id'];
    lookingFor = json['looking_for'];
    fromAge = json['from_age'];
    toAge = json['to_age'];
    skinTone = json['skin_tone'];
    fromHeight = json['from_height'];
    toHeight = json['to_height'];
    generalExpt = json['general_expt'];
    mothertounge = json['mothertounge'];
    eatingHabit = json['eating_habit'];
    drinkingHabit = json['drinking_habit'];
    religon = json['religon'];
    caste = json['caste'];
    manglik = json['manglik'];
    star = json['star'];
    education = json['education'];
    employeeIn = json['employee_in'];
    annualIncome = json['annual_income'];
    occupation = json['occupation'];
    designation = json['designation'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    residence = json['residence'];
    createdDt = json['created_dt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['v_id'] = this.vId;
    data['looking_for'] = this.lookingFor;
    data['from_age'] = this.fromAge;
    data['to_age'] = this.toAge;
    data['skin_tone'] = this.skinTone;
    data['from_height'] = this.fromHeight;
    data['to_height'] = this.toHeight;
    data['general_expt'] = this.generalExpt;
    data['mothertounge'] = this.mothertounge;
    data['eating_habit'] = this.eatingHabit;
    data['drinking_habit'] = this.drinkingHabit;
    data['religon'] = this.religon;
    data['caste'] = this.caste;
    data['manglik'] = this.manglik;
    data['star'] = this.star;
    data['education'] = this.education;
    data['employee_in'] = this.employeeIn;
    data['annual_income'] = this.annualIncome;
    data['occupation'] = this.occupation;
    data['designation'] = this.designation;
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['residence'] = this.residence;
    data['created_dt'] = this.createdDt;
    return data;
  }
}

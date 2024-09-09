class MyPackageDetails {
  UserCount? userCount;
  PackageDetails? packageDetails;

  MyPackageDetails({this.userCount, this.packageDetails});

  MyPackageDetails.fromJson(Map<String, dynamic> json) {
    userCount =
        json['user'] != null ? new UserCount.fromJson(json['user']) : null;
    packageDetails = json['package_details'] != null
        ? new PackageDetails.fromJson(json['package_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userCount != null) {
      data['user'] = this.userCount!.toJson();
    }
    if (this.packageDetails != null) {
      data['package_details'] = this.packageDetails!.toJson();
    }
    return data;
  }
}

class UserCount {
  String? id;
  String? package;
  String? packEndDate;
  String? totalAmountPaid;
  int? totalInterest;
  int? totalChat;
  int? totalContact;
  int? daysRemaining;
  bool? isActive;

  UserCount(
      {this.id,
      this.package,
      this.packEndDate,
      this.totalAmountPaid,
      this.totalInterest,
      this.totalChat,
      this.totalContact,
      this.daysRemaining,
      this.isActive});

  UserCount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    package = json['package'];
    packEndDate = json['pack_end_date'];
    totalAmountPaid = json['total_amount_paid'];
    totalInterest = json['total_interest'];
    totalChat = json['total_chat'];
    totalContact = json['total_contact'];
    daysRemaining = json['days_remaining'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package'] = this.package;
    data['pack_end_date'] = this.packEndDate;
    data['total_amount_paid'] = this.totalAmountPaid;
    data['total_interest'] = this.totalInterest;
    data['total_chat'] = this.totalChat;
    data['total_contact'] = this.totalContact;
    data['days_remaining'] = this.daysRemaining;
    data['is_active'] = this.isActive;
    return data;
  }
}

class PackageDetails {
  int? id;
  String? packId;
  String? packName;
  String? packAmmount;
  int? totalInterest;
  int? totalChat;
  int? totalContact;
  String? duration;
  String? createdAt;

  PackageDetails(
      {this.id,
      this.packId,
      this.packName,
      this.packAmmount,
      this.totalInterest,
      this.totalChat,
      this.totalContact,
      this.duration,
      this.createdAt});

  PackageDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packId = json['pack_id'];
    packName = json['pack_name'];
    packAmmount = json['pack_ammount'];
    totalInterest = json['total_interest'];
    totalChat = json['total_chat'];
    totalContact = json['total_contact'];
    duration = json['duration'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pack_id'] = this.packId;
    data['pack_name'] = this.packName;
    data['pack_ammount'] = this.packAmmount;
    data['total_interest'] = this.totalInterest;
    data['total_chat'] = this.totalChat;
    data['total_contact'] = this.totalContact;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    return data;
  }
}

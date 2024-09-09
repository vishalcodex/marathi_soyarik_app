class Package {
  String? id;
  String? packId;
  String? packName;
  String? packAmmount;
  String? totalInterest;
  String? totalChat;
  String? totalContact;
  String? duration;

  Package(
      {this.id,
      this.packId,
      this.packName,
      this.packAmmount,
      this.totalInterest,
      this.totalChat,
      this.totalContact,
      this.duration});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packId = json['pack_id'];
    packName = json['pack_name'];
    packAmmount = json['pack_ammount'];
    totalInterest = json['total_interest'];
    totalChat = json['total_chat'];
    totalContact = json['total_contact'];
    duration = json['duration'];
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
    return data;
  }
}

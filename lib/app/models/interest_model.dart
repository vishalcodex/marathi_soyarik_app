import 'package:marathi_soyarik/app/models/mathc_profile_model.dart';

class Interest {
  String? id;
  String? senderId;
  String? recipientId;
  String? message;
  String? status;
  String? createdAt;
  MatchProfile? profile;

  Interest(
      {this.id,
      this.senderId,
      this.recipientId,
      this.message,
      this.status,
      this.createdAt,
      this.profile});

  Interest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    recipientId = json['recipient_id'];
    message = json['message'];
    status = json['status'];
    createdAt = json['created_at'];
    profile = json['recipient_profile'] != null
        ? new MatchProfile.fromJson(json['recipient_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    data['recipient_id'] = this.recipientId;
    data['message'] = this.message;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    if (this.profile != null) {
      data['recipient_profile'] = this.profile!.toJson();
    }
    return data;
  }
}

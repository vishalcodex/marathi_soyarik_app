class SuccessStory {
  String? id;
  String? title;
  String? desc1;
  String? image;

  SuccessStory({this.id, this.title, this.desc1, this.image});

  SuccessStory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc1 = json['desc1'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc1'] = this.desc1;
    data['image'] = this.image;
    return data;
  }
}

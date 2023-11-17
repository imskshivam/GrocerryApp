class storeModel {
  String? name;
  String? address;
  String? phone;
  String? email;
  String? website;
  Hours? hours;
  String? description;

  storeModel(
      {this.name,
      this.address,
      this.phone,
      this.email,
      this.website,
      this.hours,
      this.description});

  storeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    website = json['website'];
    hours = json['hours'] != null ? new Hours.fromJson(json['hours']) : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['website'] = this.website;
    if (this.hours != null) {
      data['hours'] = this.hours!.toJson();
    }
    data['description'] = this.description;
    return data;
  }
}

class Hours {
  Monday? monday;
  Monday? tuesday;
  Monday? wednesday;
  Monday? thursday;
  Monday? friday;
  Monday? saturday;
  Monday? sunday;

  Hours(
      {this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday});

  Hours.fromJson(Map<String, dynamic> json) {
    monday =
        json['Monday'] != null ? new Monday.fromJson(json['Monday']) : null;
    tuesday =
        json['Tuesday'] != null ? new Monday.fromJson(json['Tuesday']) : null;
    wednesday = json['Wednesday'] != null
        ? new Monday.fromJson(json['Wednesday'])
        : null;
    thursday =
        json['Thursday'] != null ? new Monday.fromJson(json['Thursday']) : null;
    friday =
        json['Friday'] != null ? new Monday.fromJson(json['Friday']) : null;
    saturday =
        json['Saturday'] != null ? new Monday.fromJson(json['Saturday']) : null;
    sunday =
        json['Sunday'] != null ? new Monday.fromJson(json['Sunday']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.monday != null) {
      data['Monday'] = this.monday!.toJson();
    }
    if (this.tuesday != null) {
      data['Tuesday'] = this.tuesday!.toJson();
    }
    if (this.wednesday != null) {
      data['Wednesday'] = this.wednesday!.toJson();
    }
    if (this.thursday != null) {
      data['Thursday'] = this.thursday!.toJson();
    }
    if (this.friday != null) {
      data['Friday'] = this.friday!.toJson();
    }
    if (this.saturday != null) {
      data['Saturday'] = this.saturday!.toJson();
    }
    if (this.sunday != null) {
      data['Sunday'] = this.sunday!.toJson();
    }
    return data;
  }
}

class Monday {
  String? open;
  String? close;

  Monday({this.open, this.close});

  Monday.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    close = json['close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this.open;
    data['close'] = this.close;
    return data;
  }
}

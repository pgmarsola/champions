import 'abilities.model.dart';

class Data {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  List<Abilities>? abilities;

  Data(
      {this.uuid,
      this.displayName,
      this.description,
      this.displayIcon,
      this.displayIconSmall,
      this.bustPortrait,
      this.fullPortrait,
      this.abilities});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
    displayIconSmall = json['displayIconSmall'];
    bustPortrait = json['bustPortrait'];
    fullPortrait = json['fullPortrait'];
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities?.add(Abilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['description'] = description;
    data['displayIcon'] = displayIcon;
    data['displayIconSmall'] = displayIconSmall;
    data['bustPortrait'] = bustPortrait;
    data['fullPortrait'] = fullPortrait;
    if (abilities != null) {
      data['abilities'] = abilities?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

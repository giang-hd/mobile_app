import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? address;
  String? phone;
  String? img;

  ProfileModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.img,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

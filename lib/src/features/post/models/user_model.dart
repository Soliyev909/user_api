import 'package:users_api/src/features/post/models/adderss_model.dart';
import 'package:users_api/src/features/post/models/company.dart';

import 'bank_model.dart';
import 'hair_model.dart';

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  num? height;
  num? weight;
  String? eyeColor;
  Hair? hair;
  String? domain;
  String? ip;

  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.domain,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
  });

  factory UserModel.fromJson(Map<String, Object?> json) => UserModel(
        id: json["id"] as int?,
        firstName: json["firstName"] as String?,
        lastName: json["lastName"] as String?,
        maidenName: json["maidenName"] as String?,
        age: json["age"] as int?,
        gender: json["gender"] as String?,
        email: json["email"] as String?,
        phone: json["phone"] as String?,
        username: json["username"] as String?,
        password: json["password"] as String?,
        birthDate: json["birthDate"] as String?,
        image: json["image"] as String?,
        bloodGroup: json["bloodGroup"] as String?,
        height: json["height"] as num?,
        weight: json["weight"] as num?,
        eyeColor: json["eyeColor"] as String?,
        hair: json['hair'] != null
            ? Hair.fromJson(json["hair"] as Map<String, Object?>)
            : null,
        domain: json["domain"] as String?,
        ip: json["ip"] as String?,
        address: json["address"] != null
            ? Address.fromJson(json["address"] as Map<String, Object?>)
            : null,
        macAddress: json["macAddress"] as String?,
        university: json["university"] as String?,
        bank: json["bank"] != null
            ? Bank.fromJson(json["bank"] as Map<String, Object?>)
            : null,
        company: json["company"] != null
            ? Company.fromJson(json["company"] as Map<String, Object?>)
            : null,
        ein: json["ein"] as String?,
        ssn: json["ssn"] as String?,
      );

  Map<String, Object?> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
        "age": age,
        "gender": gender,
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "birthDate": birthDate,
        "image": image,
        "bloodGroup": bloodGroup,
        "height": height,
        "weight": weight,
        "eyeColor": eyeColor,
        "hair": hair,
        "domain": domain,
        "ip": ip,
        "address": address,
        "macAddress": macAddress,
        "university": university,
        "bank": bank,
        "company": company,
        "ein": ein,
        "ssn": ssn,
        "userAgent": userAgent,
      };


}

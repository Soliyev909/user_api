import 'user_model.dart';

class BaseModel {
  List<UserModel> users;
  int? total;
  int? limit;
  int? skip;

  BaseModel({
    required this.users,
    this.total,
    this.limit,
    this.skip,
  });

  factory BaseModel.fromJson(Map<String, Object?> json) => BaseModel(
        users: json["users"] != null
            ? List<Map<String, Object?>>.from(json["users"] as List)
                .map(UserModel.fromJson)
                .toList()
            : [],
        total: json["total"] as int?,
        limit: json["limit"] as int?,
        skip: json["skip"] as int?,
      );

  Map<String, Object?> toJson() => {
        "users": users.map((e) => e.toJson()).toList(),
        "total": total,
        "limit": limit,
        "skip": skip,
      };

}

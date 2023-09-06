import 'dart:convert';

import '../../../common/constants/api_constants.dart';
import '../../../common/services/api_service.dart';
import '../models/base_model.dart';
import '../models/user_model.dart';

abstract interface class IUserRepository {
  const IUserRepository();

  Future<List<UserModel>> getAllUser();

  Future<BaseModel> searchUsers(String text);

  Future<UserModel> singleUsers(int id);
}

class PostRepositoryImpl implements IUserRepository {
  final APIService apiService;

  const PostRepositoryImpl(this.apiService);

  @override
  Future<List<UserModel>> getAllUser() async {
    String response = await apiService.request(ApiConst.allusersPath);
    BaseModel base = BaseModel.fromJson(jsonDecode(response));

    return base.users;
  }

  @override
  Future<BaseModel> searchUsers(String text) async {
    String response = await apiService.request(ApiConst.searchusersPath,
        queryParametersAll: ApiConst.searchQuery(text));
    BaseModel searchResult = BaseModel.fromJson(jsonDecode(response));
    return searchResult;
  }

  @override
  Future<UserModel> singleUsers(int id) async {
    String response = await apiService.request(ApiConst.getUsers(id));
    UserModel base = UserModel.fromJson(jsonDecode(response));
    return base;
  }
}

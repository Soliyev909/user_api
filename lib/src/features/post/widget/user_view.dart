import 'dart:async';

import 'package:flutter/material.dart';
import 'package:users_api/src/features/post/widget/single_user.dart';

import '../../../common/services/api_service.dart';
import '../data/repository.dart';
import '../models/base_model.dart';
import '../models/user_model.dart';
import 'user_view_shimmer.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late final IUserRepository userRepository;
  late final TextEditingController controller;
  List<UserModel> users = [];
  Timer? _timer;
  bool isLoading = false;
  BaseModel baseModel = BaseModel(users: []);
  UserModel user = UserModel();

  @override
  void initState() {
    super.initState();
    userRepository = PostRepositoryImpl(APIService());
    getAllUsers();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void getAllUsers() async {
    setState(() {
      isLoading = true;
    });

    users = await userRepository.getAllUser();

    setState(() {
      isLoading = false;
    });
  }

  void searchUsers(String text) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    }

    _timer?.cancel();

    _timer = Timer(
      const Duration(milliseconds: 300),
      () async {
        debugPrint("searching... : $text");
        baseModel = await userRepository.searchUsers(text.trim());

        if (text.isNotEmpty) {
          users = baseModel.users;

          setState(() {
            isLoading = false;
          });
        } else {
          getAllUsers();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        toolbarHeight: 70,
        title: SearchBar(
          elevation: const MaterialStatePropertyAll(0.0),
          onChanged: searchUsers,
        ),
      ),
      body: isLoading
          ? ListView.separated(
              itemBuilder: (context, index) => const UserViewShimmer(),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 10,
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const EdgeInsets.all(16),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleUser(id: user.id),
                          ));
                    },
                    leading: Image(
                      image: NetworkImage(user.image ?? ''),
                    ),
                    title: Text(user.firstName ?? ""),
                    subtitle: RichText(
                      text: TextSpan(
                        text: "${user.username}\n",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

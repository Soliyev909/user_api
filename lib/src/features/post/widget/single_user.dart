import 'package:flutter/material.dart';
import 'package:users_api/src/common/services/api_service.dart';
import 'package:users_api/src/features/post/models/user_model.dart';
import 'package:users_api/src/features/post/widget/user_view.dart';

import '../data/repository.dart';

class SingleUser extends StatefulWidget {
  const SingleUser({this.id, super.key});

  final int? id;

  @override
  State<SingleUser> createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  late final IUserRepository userRepository;
  UserModel user = UserModel();

  @override
  void initState() {
    userRepository = PostRepositoryImpl(APIService());
    singleUser(widget.id!);
    super.initState();
  }

  void singleUser(int id) async {
    user = await userRepository.singleUsers(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const UserView())),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 20, color: Colors.black),
                children: [
                  TextSpan(text: "id: ${user.id}\n\n"),
                  TextSpan(text: "firstName: ${user.firstName}\n\n"),
                  TextSpan(text: "lastName: ${user.lastName}\n\n"),
                  TextSpan(text: "maidenName: ${user.maidenName}\n\n"),
                  TextSpan(text: "age: ${user.age}\n\n"),
                  TextSpan(text: "gender: ${user.gender}\n\n"),
                  TextSpan(text: "email: ${user.email}\n\n"),
                  TextSpan(text: "phone: ${user.phone}\n\n"),
                  TextSpan(text: "username: ${user.username}\n\n"),
                  TextSpan(text: "password: ${user.password}\n\n"),
                  TextSpan(text: "birthDate: ${user.birthDate}\n\n"),
                  TextSpan(text: "bloodGroup: ${user.bloodGroup}\n\n"),
                  TextSpan(text: "height: ${user.height}\n\n"),
                  TextSpan(text: "weight: ${user.weight}\n\n"),
                  TextSpan(text: "eyeColor: ${user.eyeColor}\n\n"),
                  TextSpan(text: "hair: ${user.hair}\n\n"),
                  TextSpan(text: "domain: ${user.domain}\n\n"),
                  TextSpan(text: "ip: ${user.ip}"),
                  TextSpan(text: "address: ${user.address}\n\n"),
                  TextSpan(text: "macAddress: ${user.macAddress}\n\n"),
                  TextSpan(text: "university: ${user.university}\n\n"),
                  TextSpan(text: "bank: ${user.bank}\n\n"),
                  TextSpan(text: "company: ${user.company}\n\n"),
                  TextSpan(text: "ein: ${user.ein}\n\n"),
                  TextSpan(text: "ssn: ${user.ssn}\n\n"),
                  TextSpan(text: "userAgent: ${user.userAgent}\n\n"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          side: BorderSide(width: 2, color: Colors.black),
        ),
      ),
      body: const UserListView(),
    );
  }
}

class UserListView extends StatefulWidget {
  const UserListView({super.key});
  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final box = GetStorage();
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    const jsonString = '''
      [
        {
          "users": [
            {"name": "Krishna", "id": "1", "atype": "Permanent"},
            {"name": "Sameera", "id": "2", "atype": "Permanent"},
            {"name": "Radhika", "id": "3", "atype": "Permanent"},
            {"name": "Yogesh", "id": "4", "atype": "Permanent"},
            {"name": "Radhe", "id": "5", "atype": "Permanent"},
            {"name": "Anshu", "id": "6", "atype": "Permanent"},
            {"name": "Balay", "id": "7", "atype": "Permanent"},
            {"name": "Julie", "id": "8", "atype": "Permanent"},
            {"name": "Swaminathan", "id": "9", "atype": "Permanent"},
            {"name": "Charandeep", "id": "10", "atype": "Permanent"},
            {"name": "Sankaran", "id": "11", "atype": "Permanent"},
            {"name": "Alpa", "id": "12", "atype": "Permanent"},
            {"name": "Sheth", "id": "13", "atype": "Temporary"},
            {"name": "Sabina", "id": "14", "atype": "Temporary"}
          ]
        }
      ]
    ''';

    final parsedJson = json.decode(jsonString);

    List<User> loadedUsers = [];
    for (var user in parsedJson[0]['users']) {
      loadedUsers.add(User.fromJson(user));
    }

    setState(() {
      users = loadedUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserListItem(user: users[index]);
      },
    );
  }
}

class UserListItem extends StatefulWidget {
  final User user;

  const UserListItem({required this.user, super.key});

  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.user.name),
      trailing: ElevatedButton(
        onPressed: () {
          _handleButtonPress(widget.user);
        },
        child: Text(widget.user.isSignedIn ? 'Sign Out' : 'Sign In'),
      ),
    );
  }

  void _handleButtonPress(User user) async {
    if (user.isSignedIn) {
      // Sign Out
      await box.remove(user.id);
      setState(() {
        user.isSignedIn = false;
      });
    } else {
      // Sign In
      await showDialog(
        context: context,
        builder: (context) => SignInDialog(user: widget.user, box: box),
      );

      setState(() {
        user.isSignedIn = true;
      });
    }
  }
}

class User {
  final String id;
  final String name;
  final String atype;
  bool isSignedIn;
  String? age;
  String? gender;

  User({
    required this.id,
    required this.name,
    required this.atype,
    this.isSignedIn = false,
    this.age,
    this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      atype: json['atype'],
      isSignedIn: false,
    );
  }
}

class SignInDialog extends StatefulWidget {
  final User user;
  final GetStorage box;

  const SignInDialog({required this.user, required this.box, super.key});

  @override
  State<SignInDialog> createState() => _SignInDialogState();
}

class _SignInDialogState extends State<SignInDialog> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sign In'),
      content: Column(
        children: [
          TextField(
            controller: ageController,
            decoration: const InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: genderController,
            decoration: const InputDecoration(labelText: 'Gender'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            _handleSignIn(widget.user);
            Navigator.of(context).pop();
          },
          child: const Text('Sign In'),
        ),
      ],
    );
  }

  void _handleSignIn(User user) async {
    user.age = ageController.text;
    user.gender = genderController.text;

    await widget.box.write(user.id, {'age': user.age, 'gender': user.gender});
  }
}

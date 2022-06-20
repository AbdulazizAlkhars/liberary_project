import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:liberary_project/providers/members_provider.dart';

import 'package:provider/provider.dart';

class AddMember extends StatelessWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstName = TextEditingController();
    var lastName = TextEditingController();
    var memberShip = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Librarian"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: firstName,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              hintText: 'First Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: lastName,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  hintText: 'Last Nmae',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                      )))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: memberShip,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  hintText: 'Member Ship',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                      )))),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<MemberProvider>().addMember(
                  firstName: firstName.text,
                  lastName: lastName.text,
                  memberShip: memberShip.text);
              context.pop();
            },
            child: const Text("Add New Member"))
      ]),
    );
  }
}
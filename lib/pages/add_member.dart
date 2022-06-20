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
        backgroundColor: Color.fromRGBO(53, 66, 89, 10),
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
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
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
                  hintText: 'Last Name',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromRGBO(236, 229, 199, 10))))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: memberShip,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  hintText: 'Member Ship',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromRGBO(236, 229, 199, 10))))),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<MemberProvider>().addMember(
                  firstName: firstName.text,
                  lastName: lastName.text,
                  memberShip: memberShip.text);
              context.pop();
            },
            child: const Text("Add New Member"),
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(205, 194, 174, 10)))
      ]),
    );
  }
}

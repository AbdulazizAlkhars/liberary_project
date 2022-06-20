import 'package:flutter/material.dart';
import 'package:liberary_project/providers/members_provider.dart';
import 'package:liberary_project/widgets/member_tile.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class Members extends StatelessWidget {
  const Members({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(53, 66, 89, 10),
            title: const Text("Members"),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  context.push("/add-member");
                },
              ),
            ],
          ),
          body: ListView.builder(
              itemCount: context.watch<MemberProvider>().members.length,
              itemBuilder: (BuildContext context, int index) {
                return MemberTile(
                    member: context.watch<MemberProvider>().members[index]);
              }),
        ));
  }
}

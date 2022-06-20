import 'package:flutter/material.dart';
import 'package:liberary_project/providers/members_provider.dart';
import 'package:liberary_project/widgets/member_tile.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class Members extends StatelessWidget {
  const Members({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
    ;
  }
}

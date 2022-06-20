import 'package:flutter/material.dart';
import 'package:liberary_project/models/members.dart';
import 'package:liberary_project/models/members.dart';

class MemberProvider extends ChangeNotifier {
  List<Member> members = Member.members;
  List getMembersName(List borrowedBy) {
    List<String> names = [];
    for (Member member in Member.members) {
      if (borrowedBy.any((element) => element == member.id)) {
        names.add("${member.firstName} ${member.lastName}");
      }
    }
    return names;
  }

  String getMemberName(int borrowedBy) {
    Member name =
        Member.members.firstWhere((element) => element.id == borrowedBy);
    return "${name.firstName} ${name.lastName}";
  }

  void addMember({required lastName, required firstName, required memberShip}) {
    var item = Member(
        id: members[members.length - 1].id + 1,
        firstName: firstName,
        lastName: lastName,
        membership: memberShip);

    members.add(item);
    notifyListeners();
  }
}

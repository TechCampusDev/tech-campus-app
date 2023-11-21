import 'package:flutter/material.dart';
import 'package:tcapp/ui/widgets/common_app_bar.dart';
import 'package:tcapp/ui/widgets/user_profile/user_profile_list/user_profile_list.dart';

class EventPage extends StatelessWidget {
  const EventPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'イベント詳細'),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ListView(
      children: [
        UserProfileList(eventId: id),
      ],
    );
  }
}

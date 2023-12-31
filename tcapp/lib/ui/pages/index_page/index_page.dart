import 'package:flutter/material.dart';
import 'package:tcapp/ui/widgets/common_app_bar.dart';
import 'package:tcapp/ui/widgets/user_profile/user_profile_list/user_profile_list.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'TechCampusメンバー'),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ListView(
      children: const [
        UserProfileList(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tcapp/models/user_profile.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    required this.userProfile,
    super.key,
  });

  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 360,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    userProfile.imageUrl,
                    width: 60,
                    height: 60,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              userProfile.name,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 2),
            Text(
              userProfile.career.join('\n'),
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            buildSns(userProfile.urls),
            const SizedBox(height: 12),
            Text(
              userProfile.profile,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            if (userProfile.specialties.isNotEmpty) ...[
              const Text(
                '得意な事',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              buildChips(userProfile.specialties),
              const SizedBox(height: 8),
            ],
            if (userProfile.compatibilities.isNotEmpty) ...[
              const Text(
                'その他答えれそうなこと',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              buildChips(userProfile.compatibilities),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildSns(List<String> urls) {
    const buttonSize = 30.0;
    const size = 16.0;
    return Row(
      children: [
        for (final url in urls)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () {
                launchUrlString(url);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(buttonSize, buttonSize),
                shape: const CircleBorder(),
                backgroundColor: Colors.grey[300],
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: 0,
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
              ),
              child: Icon(getIcon(url), size: size, color: Colors.grey[700]),
            ),
          ),
      ],
    );
  }

  IconData getIcon(String url) {
    if (url.contains('x.com') || url.contains('twitter.com')) {
      return FontAwesomeIcons.xTwitter;
    }
    if (url.contains('instagram.com')) {
      return FontAwesomeIcons.instagram;
    }
    return Icons.public;
  }

  Widget buildChips(List<String> items) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: items
          .map(
            (e) => Chip(
              label: Text(e, style: const TextStyle(fontSize: 12)),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              backgroundColor: Colors.grey[200],
            ),
          )
          .toList(),
    );
  }
}

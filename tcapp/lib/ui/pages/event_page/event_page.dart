import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tcapp/models/event/event.dart';
import 'package:tcapp/ui/pages/event_page/event_page_provider.dart';
import 'package:tcapp/ui/widgets/buttons/google_form_button.dart';
import 'package:tcapp/ui/widgets/common_app_bar.dart';
import 'package:tcapp/ui/widgets/user_profile/user_profile_list/user_profile_list.dart';
import 'package:tcapp/utils/strings.dart';

class EventPage extends StatelessWidget {
  const EventPage({required this.eventId, super.key});

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'イベント詳細'),
      body: ProviderScope(
        overrides: [
          eventPageProvider.overrideWith((ref) {
            return EventPageController(eventId: eventId);
          }),
        ],
        child: HookConsumer(
          builder: (context, ref, _) {
            return buildBody();
          },
        ),
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 16),
        buildEventInfo(),
        UserProfileList(eventId: eventId),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget buildEventInfo() {
    return Consumer(
      builder: (context, ref, _) {
        final event = ref.watch(eventPageProvider.select((s) => s.event));
        if (event == null) return const SizedBox.shrink();
        final eventTimeString = formatEventTime(event.startTime, event.endTime);
        return Column(
          children: [
            Text(
              event.title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            buildEventTime(eventTimeString),
            buildDescription(event.description),
            buildGoogleForm(event),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'スピーカー',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget buildEventTime(String eventTimeString) {
    if (eventTimeString.isEmpty) return const SizedBox.shrink();
    return Text(
      eventTimeString,
      style: const TextStyle(fontSize: 16, color: Colors.black54),
    );
  }

  Widget buildDescription(String description) {
    if (description.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        description,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }

  Widget buildGoogleForm(Event event) {
    final now = DateTime.now();
    final endTime = event.endTime;
    final beforeUrl = event.surveyBeforeUrl;
    final beforeTitle = event.surveyBeforeTitle;
    final afterUrl = event.surveyAfterUrl;
    final afterTitle = event.surveyAfterTitle;

    Widget btn;

    if (endTime == null) {
      if (beforeUrl != null) {
        btn = GoogleFormButton(title: beforeTitle, url: beforeUrl);
      } else {
        return const SizedBox.shrink();
      }
    } else if (now.isBefore(endTime)) {
      if (beforeUrl != null) {
        btn = GoogleFormButton(title: beforeTitle, url: beforeUrl);
      } else {
        return const SizedBox.shrink();
      }
    } else {
      if (afterUrl != null) {
        btn = GoogleFormButton(title: afterTitle, url: afterUrl);
      } else {
        return const SizedBox.shrink();
      }
    }

    return Padding(padding: const EdgeInsets.only(top: 12), child: btn);
  }
}

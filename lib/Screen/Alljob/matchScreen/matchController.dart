import 'package:flutter/material.dart';

import '../../../models/userModel/meetings.dart';
import 'matchService.dart';

class MatchController extends ChangeNotifier {
  MatchController({this.matchService = const MatchService()});

  MatchService matchService;
  List<Meetings> meetings = [];

  Future<void> getMeetings(
    int id,
  ) async {
    final _loadMeetings = await MatchService.getMeetings(userId: id);
    meetings = (_loadMeetings);

    notifyListeners();
  }
}

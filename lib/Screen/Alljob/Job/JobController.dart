import 'package:flutter/material.dart';

import '../../../models/userCompany/compay.dart';
import '../../../models/userCompany/position.dart';
import 'JobService.dart';

class JobController extends ChangeNotifier {
  JobController({this.jarketService = const JobService()});

  JobService jarketService;
  List<Compay> logoCompay = [];
  List<Position> positionCompany = [];

  Future<void> loadLogoCompay() async {
    final _loadItem = await JobService.listCompany();
    logoCompay = (_loadItem);

    notifyListeners();
  }

  Future<void> loadPositionCompay({
    required int Id,
  }) async {
    final _loadPosition = await JobService.getPosition(companyId: Id);
    positionCompany = (_loadPosition);

    notifyListeners();
  }
}

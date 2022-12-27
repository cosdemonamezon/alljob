import 'dart:developer';

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
    logoCompay.clear();
    final _loadItem = await JobService.listCompany();

    // for (var company in _loadItem) {
    //   final positions = await JobService.getPosition(companyId: company.id!);
    //   inspect(positions[0].recruitment_companies);
    //   if (positions[0].recruitment_companies!.isNotEmpty) {
    //     logoCompay.add(company);
    //   }
    // }

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

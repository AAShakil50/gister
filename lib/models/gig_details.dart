import 'package:gister/models/company_info.dart';

class GigDetails {
  final CompanyInfo company;
  final String status;
  final String location;
  final GigType gigType;
  final int salary;
  final String details;
  final List<String> requirements;

  GigDetails(
    this.company,
    this.status,
    this.location,
    this.gigType,
    this.salary,
    this.details,
    this.requirements,
  );
}

enum GigType { partTime, fullTime }

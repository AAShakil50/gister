class CompanyInfo {
  final String name;
  final String identifier;

  CompanyInfo(this.name, this.identifier);

  String get iconPath => "assets/images/icon_$identifier.png";
}

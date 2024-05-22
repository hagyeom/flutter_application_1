class ParRegistration {
  final int holeNumber;
  final int parValue;

  ParRegistration({required this.holeNumber, required this.parValue});

  Map<String, dynamic> toJson() => {
    'holeNumber': holeNumber,
    'parValue': parValue,
  };

  factory ParRegistration.fromJson(Map<String, dynamic> json) {
    return ParRegistration(
      holeNumber: json['holeNumber'],
      parValue: json['parValue'],
    );
  }
}

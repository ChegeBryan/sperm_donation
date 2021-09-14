class SpermBank {
  String? name;
  String? location;

  SpermBank({this.name, this.location});

  factory SpermBank.fromJson(Map<String, dynamic> responseData) {
    return SpermBank(
      name: responseData['name'],
      location: responseData['location'],
    );
  }
}

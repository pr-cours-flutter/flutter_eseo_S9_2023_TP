class Address {
  String street;
  String city;
  String postCode;

  Address(this.street, this.city, this.postCode);

  factory Address.fromGeoJson(Map<String, dynamic> json) {
    final properties = json['properties'];
    final street = properties['name'];
    final city = properties['city'];
    final postCode = properties['postcode'];
    return Address(street, city, postCode);
  }
}

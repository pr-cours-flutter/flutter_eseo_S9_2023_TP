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

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'postcode': postCode,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(json['street'], json['city'], json['postcode']);
  }
}

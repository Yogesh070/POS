class Customer {
  final String name;
  final String email;
  final String phone;
  final String? note;
  final String? image;
  final String address;
  Customer({
    required this.email,
    required this.name,
    this.note,
    required this.phone,
    this.image,
    required this.address,
  });
}

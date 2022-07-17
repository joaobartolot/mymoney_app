class Expense {
  Expense({
    this.uid,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }

  final String? uid;
  final String name;
  final double price;

  static Expense fromMap(String? uid, Map<String, dynamic> data) {
    return Expense(
      uid: uid ?? '',
      name: data['name'],
      price: data['price'],
    );
  }
}

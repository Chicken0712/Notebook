class Pharmacy {
  int? id;
  String name;
  String type; // loại thuốc (viên, siro, gel...)
  double quantity; // số lượng (viên, ml...)
  double price;
  String usage; // cách dùng, liều lượng
  String note;

  // --- Thêm chi tiết ---
  String? brand;
  String? origin;
  String? ingredient; // hoạt chất chính
  String? effect; // công dụng chính
  String? sideEffects;
  String? storage; // bảo quản
  String? expiryDate;
  String? imageUrl;

  Pharmacy({
    this.id,
    required this.name,
    required this.type,
    required this.quantity,
    required this.price,
    required this.usage,
    required this.note,
    this.brand,
    this.origin,
    this.ingredient,
    this.effect,
    this.sideEffects,
    this.storage,
    this.expiryDate,
    this.imageUrl,
  });

  factory Pharmacy.fromMap(Map<String, dynamic> json) => Pharmacy(
    id: json['id'],
    name: json['name'],
    type: json['type'],
    quantity: json['quantity'],
    price: json['price'],
    usage: json['usage'],
    note: json['note'],
    brand: json['brand'],
    origin: json['origin'],
    ingredient: json['ingredient'],
    effect: json['effect'],
    sideEffects: json['sideEffects'],
    storage: json['storage'],
    expiryDate: json['expiryDate'],
    imageUrl: json['imageUrl'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'type': type,
    'quantity': quantity,
    'price': price,
    'usage': usage,
    'note': note,
    'brand': brand,
    'origin': origin,
    'ingredient': ingredient,
    'effect': effect,
    'sideEffects': sideEffects,
    'storage': storage,
    'expiryDate': expiryDate,
    'imageUrl': imageUrl,
  };
}

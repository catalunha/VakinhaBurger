import 'dart:convert';

class OrderPix {
  String image;
  String code;
  double totalValue;
  OrderPix({
    required this.image,
    required this.code,
    required this.totalValue,
  });

  OrderPix copyWith({
    String? image,
    String? code,
    double? totalValue,
  }) {
    return OrderPix(
      image: image ?? this.image,
      code: code ?? this.code,
      totalValue: totalValue ?? this.totalValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'code': code,
      'totalValue': totalValue,
    };
  }

  factory OrderPix.fromMap(Map<String, dynamic> map) {
    return OrderPix(
      image: map['image'] ?? '',
      code: map['code'] ?? '',
      totalValue: map['totalValue']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderPix.fromJson(String source) =>
      OrderPix.fromMap(json.decode(source));

  @override
  String toString() =>
      'OrderPix(image: $image, code: $code, totalValue: $totalValue)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderPix &&
        other.image == image &&
        other.code == code &&
        other.totalValue == totalValue;
  }

  @override
  int get hashCode => image.hashCode ^ code.hashCode ^ totalValue.hashCode;
}

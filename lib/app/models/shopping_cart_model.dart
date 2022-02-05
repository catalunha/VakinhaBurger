import 'dart:convert';

import 'package:introducao_flutter/app/models/product_model.dart';

class ShoppingCartModel {
  int quantity;
  ProductModel product;
  ShoppingCartModel({
    required this.quantity,
    required this.product,
  });

  ShoppingCartModel copyWith({
    int? quantity,
    ProductModel? product,
  }) {
    return ShoppingCartModel(
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  factory ShoppingCartModel.fromMap(Map<String, dynamic> map) {
    return ShoppingCartModel(
      quantity: map['quantity']?.toInt() ?? 0,
      product: ProductModel.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingCartModel.fromJson(String source) =>
      ShoppingCartModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ShoppingCartModel(quantity: $quantity, product: $product)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShoppingCartModel &&
        other.quantity == quantity &&
        other.product == product;
  }

  @override
  int get hashCode => quantity.hashCode ^ product.hashCode;
}

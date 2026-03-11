class Product {
  int? productId;
  int? productQuantity;
  int? productUnitPrice;

  Product({this.productId, this.productQuantity, this.productUnitPrice});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json['product_id'] as int?,
    productQuantity: json['product_quantity'] as int?,
    productUnitPrice: json['product_unit_price'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'product_quantity': productQuantity,
    'product_unit_price': productUnitPrice,
  };
}

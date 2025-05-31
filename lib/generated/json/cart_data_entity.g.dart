import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/cart_data_entity.dart';

CartDataEntity $CartDataEntityFromJson(Map<String, dynamic> json) {
  final CartDataEntity cartDataEntity = CartDataEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    cartDataEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    cartDataEntity.message = message;
  }
  final List<CartDataData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<CartDataData>(e) as CartDataData).toList();
  if (data != null) {
    cartDataEntity.data = data;
  }
  return cartDataEntity;
}

Map<String, dynamic> $CartDataEntityToJson(CartDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension CartDataEntityExtension on CartDataEntity {
  CartDataEntity copyWith({
    int? status,
    String? message,
    List<CartDataData>? data,
  }) {
    return CartDataEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

CartDataData $CartDataDataFromJson(Map<String, dynamic> json) {
  final CartDataData cartDataData = CartDataData();
  final String? cartid = jsonConvert.convert<String>(json['cartid']);
  if (cartid != null) {
    cartDataData.cartid = cartid;
  }
  final String? ppredemption = jsonConvert.convert<String>(
      json['ppredemption']);
  if (ppredemption != null) {
    cartDataData.ppredemption = ppredemption;
  }
  final String? quantity = jsonConvert.convert<String>(json['quantity']);
  if (quantity != null) {
    cartDataData.quantity = quantity;
  }
  final String? pointsRedeemed = jsonConvert.convert<String>(
      json['points_redeemed']);
  if (pointsRedeemed != null) {
    cartDataData.pointsRedeemed = pointsRedeemed;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    cartDataData.price = price;
  }
  final String? savekartprice = jsonConvert.convert<String>(
      json['savekartprice']);
  if (savekartprice != null) {
    cartDataData.savekartprice = savekartprice;
  }
  final String? stockid = jsonConvert.convert<String>(json['stockid']);
  if (stockid != null) {
    cartDataData.stockid = stockid;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    cartDataData.productName = productName;
  }
  final String? primeImage = jsonConvert.convert<String>(json['prime_image']);
  if (primeImage != null) {
    cartDataData.primeImage = primeImage;
  }
  final String? size = jsonConvert.convert<String>(json['size']);
  if (size != null) {
    cartDataData.size = size;
  }
  final String? currentQty = jsonConvert.convert<String>(json['current_qty']);
  if (currentQty != null) {
    cartDataData.currentQty = currentQty;
  }
  return cartDataData;
}

Map<String, dynamic> $CartDataDataToJson(CartDataData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cartid'] = entity.cartid;
  data['ppredemption'] = entity.ppredemption;
  data['quantity'] = entity.quantity;
  data['points_redeemed'] = entity.pointsRedeemed;
  data['price'] = entity.price;
  data['savekartprice'] = entity.savekartprice;
  data['stockid'] = entity.stockid;
  data['product_name'] = entity.productName;
  data['prime_image'] = entity.primeImage;
  data['size'] = entity.size;
  data['current_qty'] = entity.currentQty;
  return data;
}

extension CartDataDataExtension on CartDataData {
  CartDataData copyWith({
    String? cartid,
    String? ppredemption,
    String? quantity,
    String? pointsRedeemed,
    String? price,
    String? savekartprice,
    String? stockid,
    String? productName,
    String? primeImage,
    String? size,
    String? currentQty,
  }) {
    return CartDataData()
      ..cartid = cartid ?? this.cartid
      ..ppredemption = ppredemption ?? this.ppredemption
      ..quantity = quantity ?? this.quantity
      ..pointsRedeemed = pointsRedeemed ?? this.pointsRedeemed
      ..price = price ?? this.price
      ..savekartprice = savekartprice ?? this.savekartprice
      ..stockid = stockid ?? this.stockid
      ..productName = productName ?? this.productName
      ..primeImage = primeImage ?? this.primeImage
      ..size = size ?? this.size
      ..currentQty = currentQty ?? this.currentQty;
  }
}
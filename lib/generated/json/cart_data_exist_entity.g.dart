import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/cart_data_exist_entity.dart';

CartDataExistEntity $CartDataExistEntityFromJson(Map<String, dynamic> json) {
  final CartDataExistEntity cartDataExistEntity = CartDataExistEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    cartDataExistEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    cartDataExistEntity.message = message;
  }
  final List<CartDataExistData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CartDataExistData>(e) as CartDataExistData)
      .toList();
  if (data != null) {
    cartDataExistEntity.data = data;
  }
  return cartDataExistEntity;
}

Map<String, dynamic> $CartDataExistEntityToJson(CartDataExistEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension CartDataExistEntityExtension on CartDataExistEntity {
  CartDataExistEntity copyWith({
    int? status,
    String? message,
    List<CartDataExistData>? data,
  }) {
    return CartDataExistEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

CartDataExistData $CartDataExistDataFromJson(Map<String, dynamic> json) {
  final CartDataExistData cartDataExistData = CartDataExistData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    cartDataExistData.id = id;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    cartDataExistData.productId = productId;
  }
  final String? quantity = jsonConvert.convert<String>(json['quantity']);
  if (quantity != null) {
    cartDataExistData.quantity = quantity;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    cartDataExistData.userId = userId;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    cartDataExistData.status = status;
  }
  final String? stockId = jsonConvert.convert<String>(json['stock_id']);
  if (stockId != null) {
    cartDataExistData.stockId = stockId;
  }
  final String? pointsRedeemed = jsonConvert.convert<String>(
      json['points_redeemed']);
  if (pointsRedeemed != null) {
    cartDataExistData.pointsRedeemed = pointsRedeemed;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    cartDataExistData.createdAt = createdAt;
  }
  return cartDataExistData;
}

Map<String, dynamic> $CartDataExistDataToJson(CartDataExistData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['product_id'] = entity.productId;
  data['quantity'] = entity.quantity;
  data['user_id'] = entity.userId;
  data['status'] = entity.status;
  data['stock_id'] = entity.stockId;
  data['points_redeemed'] = entity.pointsRedeemed;
  data['created_at'] = entity.createdAt;
  return data;
}

extension CartDataExistDataExtension on CartDataExistData {
  CartDataExistData copyWith({
    String? id,
    String? productId,
    String? quantity,
    String? userId,
    String? status,
    String? stockId,
    String? pointsRedeemed,
    String? createdAt,
  }) {
    return CartDataExistData()
      ..id = id ?? this.id
      ..productId = productId ?? this.productId
      ..quantity = quantity ?? this.quantity
      ..userId = userId ?? this.userId
      ..status = status ?? this.status
      ..stockId = stockId ?? this.stockId
      ..pointsRedeemed = pointsRedeemed ?? this.pointsRedeemed
      ..createdAt = createdAt ?? this.createdAt;
  }
}
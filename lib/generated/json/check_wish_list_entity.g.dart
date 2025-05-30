import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/check_wish_list_entity.dart';

CheckWishListEntity $CheckWishListEntityFromJson(Map<String, dynamic> json) {
  final CheckWishListEntity checkWishListEntity = CheckWishListEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    checkWishListEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    checkWishListEntity.message = message;
  }
  final List<CheckWishListData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CheckWishListData>(e) as CheckWishListData)
      .toList();
  if (data != null) {
    checkWishListEntity.data = data;
  }
  return checkWishListEntity;
}

Map<String, dynamic> $CheckWishListEntityToJson(CheckWishListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension CheckWishListEntityExtension on CheckWishListEntity {
  CheckWishListEntity copyWith({
    int? status,
    String? message,
    List<CheckWishListData>? data,
  }) {
    return CheckWishListEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

CheckWishListData $CheckWishListDataFromJson(Map<String, dynamic> json) {
  final CheckWishListData checkWishListData = CheckWishListData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    checkWishListData.id = id;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    checkWishListData.productId = productId;
  }
  final String? productStockId = jsonConvert.convert<String>(
      json['product_stock_id']);
  if (productStockId != null) {
    checkWishListData.productStockId = productStockId;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    checkWishListData.userId = userId;
  }
  return checkWishListData;
}

Map<String, dynamic> $CheckWishListDataToJson(CheckWishListData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['product_id'] = entity.productId;
  data['product_stock_id'] = entity.productStockId;
  data['user_id'] = entity.userId;
  return data;
}

extension CheckWishListDataExtension on CheckWishListData {
  CheckWishListData copyWith({
    String? id,
    String? productId,
    String? productStockId,
    String? userId,
  }) {
    return CheckWishListData()
      ..id = id ?? this.id
      ..productId = productId ?? this.productId
      ..productStockId = productStockId ?? this.productStockId
      ..userId = userId ?? this.userId;
  }
}
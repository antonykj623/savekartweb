import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/wishlist_entity.dart';

WishlistEntity $WishlistEntityFromJson(Map<String, dynamic> json) {
  final WishlistEntity wishlistEntity = WishlistEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    wishlistEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    wishlistEntity.message = message;
  }
  final List<WishlistData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<WishlistData>(e) as WishlistData).toList();
  if (data != null) {
    wishlistEntity.data = data;
  }
  return wishlistEntity;
}

Map<String, dynamic> $WishlistEntityToJson(WishlistEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension WishlistEntityExtension on WishlistEntity {
  WishlistEntity copyWith({
    int? status,
    String? message,
    List<WishlistData>? data,
  }) {
    return WishlistEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

WishlistData $WishlistDataFromJson(Map<String, dynamic> json) {
  final WishlistData wishlistData = WishlistData();
  final String? wishlistid = jsonConvert.convert<String>(json['wishlistid']);
  if (wishlistid != null) {
    wishlistData.wishlistid = wishlistid;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    wishlistData.price = price;
  }
  final String? stockid = jsonConvert.convert<String>(json['stockid']);
  if (stockid != null) {
    wishlistData.stockid = stockid;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    wishlistData.productName = productName;
  }
  final String? primeImage = jsonConvert.convert<String>(json['prime_image']);
  if (primeImage != null) {
    wishlistData.primeImage = primeImage;
  }
  return wishlistData;
}

Map<String, dynamic> $WishlistDataToJson(WishlistData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['wishlistid'] = entity.wishlistid;
  data['price'] = entity.price;
  data['stockid'] = entity.stockid;
  data['product_name'] = entity.productName;
  data['prime_image'] = entity.primeImage;
  return data;
}

extension WishlistDataExtension on WishlistData {
  WishlistData copyWith({
    String? wishlistid,
    String? price,
    String? stockid,
    String? productName,
    String? primeImage,
  }) {
    return WishlistData()
      ..wishlistid = wishlistid ?? this.wishlistid
      ..price = price ?? this.price
      ..stockid = stockid ?? this.stockid
      ..productName = productName ?? this.productName
      ..primeImage = primeImage ?? this.primeImage;
  }
}
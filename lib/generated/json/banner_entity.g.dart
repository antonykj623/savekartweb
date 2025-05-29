import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/banner_entity.dart';

BannerEntity $BannerEntityFromJson(Map<String, dynamic> json) {
  final BannerEntity bannerEntity = BannerEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    bannerEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    bannerEntity.message = message;
  }
  final List<BannerData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<BannerData>(e) as BannerData).toList();
  if (data != null) {
    bannerEntity.data = data;
  }
  return bannerEntity;
}

Map<String, dynamic> $BannerEntityToJson(BannerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension BannerEntityExtension on BannerEntity {
  BannerEntity copyWith({
    int? status,
    String? message,
    List<BannerData>? data,
  }) {
    return BannerEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

BannerData $BannerDataFromJson(Map<String, dynamic> json) {
  final BannerData bannerData = BannerData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    bannerData.id = id;
  }
  final String? imageFile = jsonConvert.convert<String>(json['image_file']);
  if (imageFile != null) {
    bannerData.imageFile = imageFile;
  }
  final String? orderNumber = jsonConvert.convert<String>(json['order_number']);
  if (orderNumber != null) {
    bannerData.orderNumber = orderNumber;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    bannerData.status = status;
  }
  return bannerData;
}

Map<String, dynamic> $BannerDataToJson(BannerData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['image_file'] = entity.imageFile;
  data['order_number'] = entity.orderNumber;
  data['status'] = entity.status;
  return data;
}

extension BannerDataExtension on BannerData {
  BannerData copyWith({
    String? id,
    String? imageFile,
    String? orderNumber,
    String? status,
  }) {
    return BannerData()
      ..id = id ?? this.id
      ..imageFile = imageFile ?? this.imageFile
      ..orderNumber = orderNumber ?? this.orderNumber
      ..status = status ?? this.status;
  }
}
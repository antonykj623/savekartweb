import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/product_with_category_entity.dart';

ProductWithCategoryEntity $ProductWithCategoryEntityFromJson(
    Map<String, dynamic> json) {
  final ProductWithCategoryEntity productWithCategoryEntity = ProductWithCategoryEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    productWithCategoryEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    productWithCategoryEntity.message = message;
  }
  final List<ProductWithCategoryData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ProductWithCategoryData>(
          e) as ProductWithCategoryData)
      .toList();
  if (data != null) {
    productWithCategoryEntity.data = data;
  }
  return productWithCategoryEntity;
}

Map<String, dynamic> $ProductWithCategoryEntityToJson(
    ProductWithCategoryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension ProductWithCategoryEntityExtension on ProductWithCategoryEntity {
  ProductWithCategoryEntity copyWith({
    int? status,
    String? message,
    List<ProductWithCategoryData>? data,
  }) {
    return ProductWithCategoryEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

ProductWithCategoryData $ProductWithCategoryDataFromJson(
    Map<String, dynamic> json) {
  final ProductWithCategoryData productWithCategoryData = ProductWithCategoryData();
  final ProductWithCategoryDataCategory? category = jsonConvert.convert<
      ProductWithCategoryDataCategory>(json['category']);
  if (category != null) {
    productWithCategoryData.category = category;
  }
  final List<ProductWithCategoryDataData>? data = (json['data'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ProductWithCategoryDataData>(
          e) as ProductWithCategoryDataData).toList();
  if (data != null) {
    productWithCategoryData.data = data;
  }
  return productWithCategoryData;
}

Map<String, dynamic> $ProductWithCategoryDataToJson(
    ProductWithCategoryData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['category'] = entity.category?.toJson();
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension ProductWithCategoryDataExtension on ProductWithCategoryData {
  ProductWithCategoryData copyWith({
    ProductWithCategoryDataCategory? category,
    List<ProductWithCategoryDataData>? data,
  }) {
    return ProductWithCategoryData()
      ..category = category ?? this.category
      ..data = data ?? this.data;
  }
}

ProductWithCategoryDataCategory $ProductWithCategoryDataCategoryFromJson(
    Map<String, dynamic> json) {
  final ProductWithCategoryDataCategory productWithCategoryDataCategory = ProductWithCategoryDataCategory();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    productWithCategoryDataCategory.id = id;
  }
  final String? categoryName = jsonConvert.convert<String>(
      json['category_name']);
  if (categoryName != null) {
    productWithCategoryDataCategory.categoryName = categoryName;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    productWithCategoryDataCategory.status = status;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    productWithCategoryDataCategory.image = image;
  }
  return productWithCategoryDataCategory;
}

Map<String, dynamic> $ProductWithCategoryDataCategoryToJson(
    ProductWithCategoryDataCategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['category_name'] = entity.categoryName;
  data['status'] = entity.status;
  data['image'] = entity.image;
  return data;
}

extension ProductWithCategoryDataCategoryExtension on ProductWithCategoryDataCategory {
  ProductWithCategoryDataCategory copyWith({
    String? id,
    String? categoryName,
    String? status,
    String? image,
  }) {
    return ProductWithCategoryDataCategory()
      ..id = id ?? this.id
      ..categoryName = categoryName ?? this.categoryName
      ..status = status ?? this.status
      ..image = image ?? this.image;
  }
}

ProductWithCategoryDataData $ProductWithCategoryDataDataFromJson(
    Map<String, dynamic> json) {
  final ProductWithCategoryDataData productWithCategoryDataData = ProductWithCategoryDataData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    productWithCategoryDataData.id = id;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    productWithCategoryDataData.productName = productName;
  }
  final String? productCode = jsonConvert.convert<String>(json['product_code']);
  if (productCode != null) {
    productWithCategoryDataData.productCode = productCode;
  }
  final dynamic hsncode = json['hsncode'];
  if (hsncode != null) {
    productWithCategoryDataData.hsncode = hsncode;
  }
  final String? categoryId = jsonConvert.convert<String>(json['category_id']);
  if (categoryId != null) {
    productWithCategoryDataData.categoryId = categoryId;
  }
  final String? subCategoryId = jsonConvert.convert<String>(
      json['sub_category_id']);
  if (subCategoryId != null) {
    productWithCategoryDataData.subCategoryId = subCategoryId;
  }
  final String? productDescription = jsonConvert.convert<String>(
      json['product_description']);
  if (productDescription != null) {
    productWithCategoryDataData.productDescription = productDescription;
  }
  final String? productSpec = jsonConvert.convert<String>(json['product_spec']);
  if (productSpec != null) {
    productWithCategoryDataData.productSpec = productSpec;
  }
  final String? primeImage = jsonConvert.convert<String>(json['prime_image']);
  if (primeImage != null) {
    productWithCategoryDataData.primeImage = primeImage;
  }
  final String? sideImage1 = jsonConvert.convert<String>(json['side_image1']);
  if (sideImage1 != null) {
    productWithCategoryDataData.sideImage1 = sideImage1;
  }
  final String? sideImage2 = jsonConvert.convert<String>(json['side_image2']);
  if (sideImage2 != null) {
    productWithCategoryDataData.sideImage2 = sideImage2;
  }
  final String? sideImage3 = jsonConvert.convert<String>(json['side_image3']);
  if (sideImage3 != null) {
    productWithCategoryDataData.sideImage3 = sideImage3;
  }
  final String? sideImage4 = jsonConvert.convert<String>(json['side_image4']);
  if (sideImage4 != null) {
    productWithCategoryDataData.sideImage4 = sideImage4;
  }
  final String? unitId = jsonConvert.convert<String>(json['unit_id']);
  if (unitId != null) {
    productWithCategoryDataData.unitId = unitId;
  }
  final String? sizeEnabled = jsonConvert.convert<String>(json['size_enabled']);
  if (sizeEnabled != null) {
    productWithCategoryDataData.sizeEnabled = sizeEnabled;
  }
  final String? colorEnabled = jsonConvert.convert<String>(
      json['color_enabled']);
  if (colorEnabled != null) {
    productWithCategoryDataData.colorEnabled = colorEnabled;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    productWithCategoryDataData.color = color;
  }
  final String? size = jsonConvert.convert<String>(json['size']);
  if (size != null) {
    productWithCategoryDataData.size = size;
  }
  final String? vendorId = jsonConvert.convert<String>(json['vendor_id']);
  if (vendorId != null) {
    productWithCategoryDataData.vendorId = vendorId;
  }
  final String? returnPolicyId = jsonConvert.convert<String>(
      json['return_policy_id']);
  if (returnPolicyId != null) {
    productWithCategoryDataData.returnPolicyId = returnPolicyId;
  }
  final String? offeredItemStatus = jsonConvert.convert<String>(
      json['offered_item_status']);
  if (offeredItemStatus != null) {
    productWithCategoryDataData.offeredItemStatus = offeredItemStatus;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    productWithCategoryDataData.status = status;
  }
  final String? returnable = jsonConvert.convert<String>(json['returnable']);
  if (returnable != null) {
    productWithCategoryDataData.returnable = returnable;
  }
  final String? returnDays = jsonConvert.convert<String>(json['return_days']);
  if (returnDays != null) {
    productWithCategoryDataData.returnDays = returnDays;
  }
  final String? upd = jsonConvert.convert<String>(json['upd']);
  if (upd != null) {
    productWithCategoryDataData.upd = upd;
  }
  return productWithCategoryDataData;
}

Map<String, dynamic> $ProductWithCategoryDataDataToJson(
    ProductWithCategoryDataData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['product_name'] = entity.productName;
  data['product_code'] = entity.productCode;
  data['hsncode'] = entity.hsncode;
  data['category_id'] = entity.categoryId;
  data['sub_category_id'] = entity.subCategoryId;
  data['product_description'] = entity.productDescription;
  data['product_spec'] = entity.productSpec;
  data['prime_image'] = entity.primeImage;
  data['side_image1'] = entity.sideImage1;
  data['side_image2'] = entity.sideImage2;
  data['side_image3'] = entity.sideImage3;
  data['side_image4'] = entity.sideImage4;
  data['unit_id'] = entity.unitId;
  data['size_enabled'] = entity.sizeEnabled;
  data['color_enabled'] = entity.colorEnabled;
  data['color'] = entity.color;
  data['size'] = entity.size;
  data['vendor_id'] = entity.vendorId;
  data['return_policy_id'] = entity.returnPolicyId;
  data['offered_item_status'] = entity.offeredItemStatus;
  data['status'] = entity.status;
  data['returnable'] = entity.returnable;
  data['return_days'] = entity.returnDays;
  data['upd'] = entity.upd;
  return data;
}

extension ProductWithCategoryDataDataExtension on ProductWithCategoryDataData {
  ProductWithCategoryDataData copyWith({
    String? id,
    String? productName,
    String? productCode,
    dynamic hsncode,
    String? categoryId,
    String? subCategoryId,
    String? productDescription,
    String? productSpec,
    String? primeImage,
    String? sideImage1,
    String? sideImage2,
    String? sideImage3,
    String? sideImage4,
    String? unitId,
    String? sizeEnabled,
    String? colorEnabled,
    String? color,
    String? size,
    String? vendorId,
    String? returnPolicyId,
    String? offeredItemStatus,
    String? status,
    String? returnable,
    String? returnDays,
    String? upd,
  }) {
    return ProductWithCategoryDataData()
      ..id = id ?? this.id
      ..productName = productName ?? this.productName
      ..productCode = productCode ?? this.productCode
      ..hsncode = hsncode ?? this.hsncode
      ..categoryId = categoryId ?? this.categoryId
      ..subCategoryId = subCategoryId ?? this.subCategoryId
      ..productDescription = productDescription ?? this.productDescription
      ..productSpec = productSpec ?? this.productSpec
      ..primeImage = primeImage ?? this.primeImage
      ..sideImage1 = sideImage1 ?? this.sideImage1
      ..sideImage2 = sideImage2 ?? this.sideImage2
      ..sideImage3 = sideImage3 ?? this.sideImage3
      ..sideImage4 = sideImage4 ?? this.sideImage4
      ..unitId = unitId ?? this.unitId
      ..sizeEnabled = sizeEnabled ?? this.sizeEnabled
      ..colorEnabled = colorEnabled ?? this.colorEnabled
      ..color = color ?? this.color
      ..size = size ?? this.size
      ..vendorId = vendorId ?? this.vendorId
      ..returnPolicyId = returnPolicyId ?? this.returnPolicyId
      ..offeredItemStatus = offeredItemStatus ?? this.offeredItemStatus
      ..status = status ?? this.status
      ..returnable = returnable ?? this.returnable
      ..returnDays = returnDays ?? this.returnDays
      ..upd = upd ?? this.upd;
  }
}
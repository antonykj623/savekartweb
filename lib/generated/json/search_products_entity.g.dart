import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/search_products_entity.dart';

SearchProductsEntity $SearchProductsEntityFromJson(Map<String, dynamic> json) {
  final SearchProductsEntity searchProductsEntity = SearchProductsEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    searchProductsEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    searchProductsEntity.message = message;
  }
  final List<SearchProductsData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<SearchProductsData>(e) as SearchProductsData)
      .toList();
  if (data != null) {
    searchProductsEntity.data = data;
  }
  return searchProductsEntity;
}

Map<String, dynamic> $SearchProductsEntityToJson(SearchProductsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension SearchProductsEntityExtension on SearchProductsEntity {
  SearchProductsEntity copyWith({
    int? status,
    String? message,
    List<SearchProductsData>? data,
  }) {
    return SearchProductsEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

SearchProductsData $SearchProductsDataFromJson(Map<String, dynamic> json) {
  final SearchProductsData searchProductsData = SearchProductsData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    searchProductsData.id = id;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    searchProductsData.productName = productName;
  }
  final String? productCode = jsonConvert.convert<String>(json['product_code']);
  if (productCode != null) {
    searchProductsData.productCode = productCode;
  }
  final dynamic hsncode = json['hsncode'];
  if (hsncode != null) {
    searchProductsData.hsncode = hsncode;
  }
  final String? categoryId = jsonConvert.convert<String>(json['category_id']);
  if (categoryId != null) {
    searchProductsData.categoryId = categoryId;
  }
  final String? subCategoryId = jsonConvert.convert<String>(
      json['sub_category_id']);
  if (subCategoryId != null) {
    searchProductsData.subCategoryId = subCategoryId;
  }
  final String? productDescription = jsonConvert.convert<String>(
      json['product_description']);
  if (productDescription != null) {
    searchProductsData.productDescription = productDescription;
  }
  final String? productSpec = jsonConvert.convert<String>(json['product_spec']);
  if (productSpec != null) {
    searchProductsData.productSpec = productSpec;
  }
  final String? primeImage = jsonConvert.convert<String>(json['prime_image']);
  if (primeImage != null) {
    searchProductsData.primeImage = primeImage;
  }
  final dynamic sideImage1 = json['side_image1'];
  if (sideImage1 != null) {
    searchProductsData.sideImage1 = sideImage1;
  }
  final dynamic sideImage2 = json['side_image2'];
  if (sideImage2 != null) {
    searchProductsData.sideImage2 = sideImage2;
  }
  final dynamic sideImage3 = json['side_image3'];
  if (sideImage3 != null) {
    searchProductsData.sideImage3 = sideImage3;
  }
  final dynamic sideImage4 = json['side_image4'];
  if (sideImage4 != null) {
    searchProductsData.sideImage4 = sideImage4;
  }
  final String? unitId = jsonConvert.convert<String>(json['unit_id']);
  if (unitId != null) {
    searchProductsData.unitId = unitId;
  }
  final String? sizeEnabled = jsonConvert.convert<String>(json['size_enabled']);
  if (sizeEnabled != null) {
    searchProductsData.sizeEnabled = sizeEnabled;
  }
  final String? colorEnabled = jsonConvert.convert<String>(
      json['color_enabled']);
  if (colorEnabled != null) {
    searchProductsData.colorEnabled = colorEnabled;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    searchProductsData.color = color;
  }
  final String? size = jsonConvert.convert<String>(json['size']);
  if (size != null) {
    searchProductsData.size = size;
  }
  final String? vendorId = jsonConvert.convert<String>(json['vendor_id']);
  if (vendorId != null) {
    searchProductsData.vendorId = vendorId;
  }
  final String? returnPolicyId = jsonConvert.convert<String>(
      json['return_policy_id']);
  if (returnPolicyId != null) {
    searchProductsData.returnPolicyId = returnPolicyId;
  }
  final String? offeredItemStatus = jsonConvert.convert<String>(
      json['offered_item_status']);
  if (offeredItemStatus != null) {
    searchProductsData.offeredItemStatus = offeredItemStatus;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    searchProductsData.status = status;
  }
  final String? returnable = jsonConvert.convert<String>(json['returnable']);
  if (returnable != null) {
    searchProductsData.returnable = returnable;
  }
  final String? returnDays = jsonConvert.convert<String>(json['return_days']);
  if (returnDays != null) {
    searchProductsData.returnDays = returnDays;
  }
  final String? upd = jsonConvert.convert<String>(json['upd']);
  if (upd != null) {
    searchProductsData.upd = upd;
  }
  return searchProductsData;
}

Map<String, dynamic> $SearchProductsDataToJson(SearchProductsData entity) {
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

extension SearchProductsDataExtension on SearchProductsData {
  SearchProductsData copyWith({
    String? id,
    String? productName,
    String? productCode,
    dynamic hsncode,
    String? categoryId,
    String? subCategoryId,
    String? productDescription,
    String? productSpec,
    String? primeImage,
    dynamic sideImage1,
    dynamic sideImage2,
    dynamic sideImage3,
    dynamic sideImage4,
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
    return SearchProductsData()
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
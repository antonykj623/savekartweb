import 'package:savekartweb/generated/json/base/json_field.dart';
import 'package:savekartweb/generated/json/product_with_category_entity.g.dart';
import 'dart:convert';
export 'package:savekartweb/generated/json/product_with_category_entity.g.dart';

@JsonSerializable()
class ProductWithCategoryEntity {
	int? status = 0;
	String? message = '';
	List<ProductWithCategoryData>? data = [];

	ProductWithCategoryEntity();

	factory ProductWithCategoryEntity.fromJson(Map<String, dynamic> json) => $ProductWithCategoryEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProductWithCategoryEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductWithCategoryData {
	ProductWithCategoryDataCategory? category;
	List<ProductWithCategoryDataData>? data = [];

	ProductWithCategoryData();

	factory ProductWithCategoryData.fromJson(Map<String, dynamic> json) => $ProductWithCategoryDataFromJson(json);

	Map<String, dynamic> toJson() => $ProductWithCategoryDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductWithCategoryDataCategory {
	String? id = '';
	@JSONField(name: "category_name")
	String? categoryName = '';
	String? status = '';
	String? image = '';

	ProductWithCategoryDataCategory();

	factory ProductWithCategoryDataCategory.fromJson(Map<String, dynamic> json) => $ProductWithCategoryDataCategoryFromJson(json);

	Map<String, dynamic> toJson() => $ProductWithCategoryDataCategoryToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductWithCategoryDataData {
	String? id = '';
	@JSONField(name: "product_name")
	String? productName = '';
	@JSONField(name: "product_code")
	String? productCode = '';
	dynamic hsncode;
	@JSONField(name: "category_id")
	String? categoryId = '';
	@JSONField(name: "sub_category_id")
	String? subCategoryId = '';
	@JSONField(name: "product_description")
	String? productDescription = '';
	@JSONField(name: "product_spec")
	String? productSpec = '';
	@JSONField(name: "prime_image")
	String? primeImage = '';
	@JSONField(name: "side_image1")
	String? sideImage1 = '';
	@JSONField(name: "side_image2")
	String? sideImage2 = '';
	@JSONField(name: "side_image3")
	String? sideImage3 = '';
	@JSONField(name: "side_image4")
	String? sideImage4 = '';
	@JSONField(name: "unit_id")
	String? unitId = '';
	@JSONField(name: "size_enabled")
	String? sizeEnabled = '';
	@JSONField(name: "color_enabled")
	String? colorEnabled = '';
	String? color = '';
	String? size = '';
	@JSONField(name: "vendor_id")
	String? vendorId = '';
	@JSONField(name: "return_policy_id")
	String? returnPolicyId = '';
	@JSONField(name: "offered_item_status")
	String? offeredItemStatus = '';
	String? status = '';
	String? returnable = '';
	@JSONField(name: "return_days")
	String? returnDays = '';
	String? upd = '';

	ProductWithCategoryDataData();

	factory ProductWithCategoryDataData.fromJson(Map<String, dynamic> json) => $ProductWithCategoryDataDataFromJson(json);

	Map<String, dynamic> toJson() => $ProductWithCategoryDataDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
import 'package:savekartweb/generated/json/base/json_field.dart';
import 'package:savekartweb/generated/json/search_products_entity.g.dart';
import 'dart:convert';
export 'package:savekartweb/generated/json/search_products_entity.g.dart';

@JsonSerializable()
class SearchProductsEntity {
	int? status = 0;
	String? message = '';
	List<SearchProductsData>? data = [];

	SearchProductsEntity();

	factory SearchProductsEntity.fromJson(Map<String, dynamic> json) => $SearchProductsEntityFromJson(json);

	Map<String, dynamic> toJson() => $SearchProductsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SearchProductsData {
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
	dynamic sideImage1;
	@JSONField(name: "side_image2")
	dynamic sideImage2;
	@JSONField(name: "side_image3")
	dynamic sideImage3;
	@JSONField(name: "side_image4")
	dynamic sideImage4;
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

	SearchProductsData();

	factory SearchProductsData.fromJson(Map<String, dynamic> json) => $SearchProductsDataFromJson(json);

	Map<String, dynamic> toJson() => $SearchProductsDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
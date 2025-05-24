import 'package:savekartweb/generated/json/base/json_field.dart';
import 'package:savekartweb/generated/json/category_list_entity.g.dart';
import 'dart:convert';
export 'package:savekartweb/generated/json/category_list_entity.g.dart';

@JsonSerializable()
class CategoryListEntity {
	int? status = 0;
	String? message = '';
	List<CategoryListData>? data = [];

	CategoryListEntity();

	factory CategoryListEntity.fromJson(Map<String, dynamic> json) => $CategoryListEntityFromJson(json);

	Map<String, dynamic> toJson() => $CategoryListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryListData {
	CategoryListDataCategory? category;
	@JSONField(name: "sub_category")
	List<CategoryListDataSubCategory>? subCategory = [];

	CategoryListData();

	factory CategoryListData.fromJson(Map<String, dynamic> json) => $CategoryListDataFromJson(json);

	Map<String, dynamic> toJson() => $CategoryListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryListDataCategory {
	String? id = '';
	@JSONField(name: "category_name")
	String? categoryName = '';
	String? status = '';
	String? image = '';

	CategoryListDataCategory();

	factory CategoryListDataCategory.fromJson(Map<String, dynamic> json) => $CategoryListDataCategoryFromJson(json);

	Map<String, dynamic> toJson() => $CategoryListDataCategoryToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryListDataSubCategory {
	String? id = '';
	@JSONField(name: "sub_category_name")
	String? subCategoryName = '';
	@JSONField(name: "category_id")
	String? categoryId = '';
	String? status = '';
	String? image = '';

	CategoryListDataSubCategory();

	factory CategoryListDataSubCategory.fromJson(Map<String, dynamic> json) => $CategoryListDataSubCategoryFromJson(json);

	Map<String, dynamic> toJson() => $CategoryListDataSubCategoryToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
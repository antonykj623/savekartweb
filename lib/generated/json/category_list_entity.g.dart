import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/category_list_entity.dart';

CategoryListEntity $CategoryListEntityFromJson(Map<String, dynamic> json) {
  final CategoryListEntity categoryListEntity = CategoryListEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    categoryListEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    categoryListEntity.message = message;
  }
  final List<CategoryListData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CategoryListData>(e) as CategoryListData)
      .toList();
  if (data != null) {
    categoryListEntity.data = data;
  }
  return categoryListEntity;
}

Map<String, dynamic> $CategoryListEntityToJson(CategoryListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension CategoryListEntityExtension on CategoryListEntity {
  CategoryListEntity copyWith({
    int? status,
    String? message,
    List<CategoryListData>? data,
  }) {
    return CategoryListEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

CategoryListData $CategoryListDataFromJson(Map<String, dynamic> json) {
  final CategoryListData categoryListData = CategoryListData();
  final CategoryListDataCategory? category = jsonConvert.convert<
      CategoryListDataCategory>(json['category']);
  if (category != null) {
    categoryListData.category = category;
  }
  final List<
      CategoryListDataSubCategory>? subCategory = (json['sub_category'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<CategoryListDataSubCategory>(
          e) as CategoryListDataSubCategory).toList();
  if (subCategory != null) {
    categoryListData.subCategory = subCategory;
  }
  return categoryListData;
}

Map<String, dynamic> $CategoryListDataToJson(CategoryListData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['category'] = entity.category?.toJson();
  data['sub_category'] = entity.subCategory?.map((v) => v.toJson()).toList();
  return data;
}

extension CategoryListDataExtension on CategoryListData {
  CategoryListData copyWith({
    CategoryListDataCategory? category,
    List<CategoryListDataSubCategory>? subCategory,
  }) {
    return CategoryListData()
      ..category = category ?? this.category
      ..subCategory = subCategory ?? this.subCategory;
  }
}

CategoryListDataCategory $CategoryListDataCategoryFromJson(
    Map<String, dynamic> json) {
  final CategoryListDataCategory categoryListDataCategory = CategoryListDataCategory();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    categoryListDataCategory.id = id;
  }
  final String? categoryName = jsonConvert.convert<String>(
      json['category_name']);
  if (categoryName != null) {
    categoryListDataCategory.categoryName = categoryName;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    categoryListDataCategory.status = status;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    categoryListDataCategory.image = image;
  }
  return categoryListDataCategory;
}

Map<String, dynamic> $CategoryListDataCategoryToJson(
    CategoryListDataCategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['category_name'] = entity.categoryName;
  data['status'] = entity.status;
  data['image'] = entity.image;
  return data;
}

extension CategoryListDataCategoryExtension on CategoryListDataCategory {
  CategoryListDataCategory copyWith({
    String? id,
    String? categoryName,
    String? status,
    String? image,
  }) {
    return CategoryListDataCategory()
      ..id = id ?? this.id
      ..categoryName = categoryName ?? this.categoryName
      ..status = status ?? this.status
      ..image = image ?? this.image;
  }
}

CategoryListDataSubCategory $CategoryListDataSubCategoryFromJson(
    Map<String, dynamic> json) {
  final CategoryListDataSubCategory categoryListDataSubCategory = CategoryListDataSubCategory();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    categoryListDataSubCategory.id = id;
  }
  final String? subCategoryName = jsonConvert.convert<String>(
      json['sub_category_name']);
  if (subCategoryName != null) {
    categoryListDataSubCategory.subCategoryName = subCategoryName;
  }
  final String? categoryId = jsonConvert.convert<String>(json['category_id']);
  if (categoryId != null) {
    categoryListDataSubCategory.categoryId = categoryId;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    categoryListDataSubCategory.status = status;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    categoryListDataSubCategory.image = image;
  }
  return categoryListDataSubCategory;
}

Map<String, dynamic> $CategoryListDataSubCategoryToJson(
    CategoryListDataSubCategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['sub_category_name'] = entity.subCategoryName;
  data['category_id'] = entity.categoryId;
  data['status'] = entity.status;
  data['image'] = entity.image;
  return data;
}

extension CategoryListDataSubCategoryExtension on CategoryListDataSubCategory {
  CategoryListDataSubCategory copyWith({
    String? id,
    String? subCategoryName,
    String? categoryId,
    String? status,
    String? image,
  }) {
    return CategoryListDataSubCategory()
      ..id = id ?? this.id
      ..subCategoryName = subCategoryName ?? this.subCategoryName
      ..categoryId = categoryId ?? this.categoryId
      ..status = status ?? this.status
      ..image = image ?? this.image;
  }
}
import 'package:savekartweb/generated/json/base/json_field.dart';
import 'package:savekartweb/generated/json/check_wish_list_entity.g.dart';
import 'dart:convert';
export 'package:savekartweb/generated/json/check_wish_list_entity.g.dart';

@JsonSerializable()
class CheckWishListEntity {
	int? status = 0;
	String? message = '';
	List<CheckWishListData>? data = [];

	CheckWishListEntity();

	factory CheckWishListEntity.fromJson(Map<String, dynamic> json) => $CheckWishListEntityFromJson(json);

	Map<String, dynamic> toJson() => $CheckWishListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CheckWishListData {
	String? id = '';
	@JSONField(name: "product_id")
	String? productId = '';
	@JSONField(name: "product_stock_id")
	String? productStockId = '';
	@JSONField(name: "user_id")
	String? userId = '';

	CheckWishListData();

	factory CheckWishListData.fromJson(Map<String, dynamic> json) => $CheckWishListDataFromJson(json);

	Map<String, dynamic> toJson() => $CheckWishListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
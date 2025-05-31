import 'package:savekartweb/generated/json/base/json_field.dart';
import 'package:savekartweb/generated/json/cart_data_entity.g.dart';
import 'dart:convert';
export 'package:savekartweb/generated/json/cart_data_entity.g.dart';

@JsonSerializable()
class CartDataEntity {
	int? status = 0;
	String? message = '';
	List<CartDataData>? data = [];

	CartDataEntity();

	factory CartDataEntity.fromJson(Map<String, dynamic> json) => $CartDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $CartDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CartDataData {
	String? cartid = '';
	String? ppredemption = '';
	String? quantity = '';
	@JSONField(name: "points_redeemed")
	String? pointsRedeemed = '';
	String? price = '';
	String? savekartprice = '';
	String? stockid = '';
	@JSONField(name: "product_name")
	String? productName = '';
	@JSONField(name: "prime_image")
	String? primeImage = '';
	String? size = '';
	@JSONField(name: "current_qty")
	String? currentQty = '';

	CartDataData();

	factory CartDataData.fromJson(Map<String, dynamic> json) => $CartDataDataFromJson(json);

	Map<String, dynamic> toJson() => $CartDataDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
import 'package:savekartweb/generated/json/base/json_field.dart';
import 'package:savekartweb/generated/json/wishlist_entity.g.dart';
import 'dart:convert';
export 'package:savekartweb/generated/json/wishlist_entity.g.dart';

@JsonSerializable()
class WishlistEntity {
	int? status = 0;
	String? message = '';
	List<WishlistData>? data = [];

	WishlistEntity();

	factory WishlistEntity.fromJson(Map<String, dynamic> json) => $WishlistEntityFromJson(json);

	Map<String, dynamic> toJson() => $WishlistEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WishlistData {
	String? wishlistid = '';
	String? price = '';
	String? stockid = '';
	@JSONField(name: "product_name")
	String? productName = '';
	@JSONField(name: "prime_image")
	String? primeImage = '';

	WishlistData();

	factory WishlistData.fromJson(Map<String, dynamic> json) => $WishlistDataFromJson(json);

	Map<String, dynamic> toJson() => $WishlistDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
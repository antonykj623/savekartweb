import 'package:savekartweb/generated/json/base/json_field.dart';
import 'package:savekartweb/generated/json/banner_entity.g.dart';
import 'dart:convert';
export 'package:savekartweb/generated/json/banner_entity.g.dart';

@JsonSerializable()
class BannerEntity {
	int? status = 0;
	String? message = '';
	List<BannerData>? data = [];

	BannerEntity();

	factory BannerEntity.fromJson(Map<String, dynamic> json) => $BannerEntityFromJson(json);

	Map<String, dynamic> toJson() => $BannerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BannerData {
	String? id = '';
	@JSONField(name: "image_file")
	String? imageFile = '';
	@JSONField(name: "order_number")
	String? orderNumber = '';
	String? status = '';

	BannerData();

	factory BannerData.fromJson(Map<String, dynamic> json) => $BannerDataFromJson(json);

	Map<String, dynamic> toJson() => $BannerDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
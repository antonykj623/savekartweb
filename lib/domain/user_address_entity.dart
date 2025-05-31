import 'package:savekartweb/generated/json/base/json_field.dart';
import 'package:savekartweb/generated/json/user_address_entity.g.dart';
import 'dart:convert';
export 'package:savekartweb/generated/json/user_address_entity.g.dart';

@JsonSerializable()
class UserAddressEntity {
	int? status = 0;
	String? message = '';
	List<UserAddressData>? data = [];

	UserAddressEntity();

	factory UserAddressEntity.fromJson(Map<String, dynamic> json) => $UserAddressEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserAddressEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserAddressData {
	String? id = '';
	String? name = '';
	String? housename = '';
	String? flatno = '';
	@JSONField(name: "user_id")
	String? userId = '';
	String? landmark = '';
	String? place = '';
	String? district = '';
	String? phone = '';
	String? pincode = '';
	String? state = '';
	String? country = '';

	UserAddressData();

	factory UserAddressData.fromJson(Map<String, dynamic> json) => $UserAddressDataFromJson(json);

	Map<String, dynamic> toJson() => $UserAddressDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
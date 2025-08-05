import 'package:savekartweb/generated/json/base/json_field.dart';
import 'package:savekartweb/generated/json/wallet_list_entity.g.dart';
import 'dart:convert';
export 'package:savekartweb/generated/json/wallet_list_entity.g.dart';

@JsonSerializable()
class WalletListEntity {
	int? status = 0;
	String? message = '';
	List<WalletListData>? data = [];

	WalletListEntity();

	factory WalletListEntity.fromJson(Map<String, dynamic> json) => $WalletListEntityFromJson(json);

	Map<String, dynamic> toJson() => $WalletListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WalletListData {
	String? id = '';
	@JSONField(name: "user_id")
	String? userId = '';
	String? credit = '';
	String? debit = '';
	String? balance = '';
	@JSONField(name: "transaction_date")
	String? transactionDate = '';
	String? description = '';
	String? type = '';

	WalletListData();

	factory WalletListData.fromJson(Map<String, dynamic> json) => $WalletListDataFromJson(json);

	Map<String, dynamic> toJson() => $WalletListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
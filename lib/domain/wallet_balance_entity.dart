import 'package:savekartweb/generated/json/base/json_field.dart';
import 'package:savekartweb/generated/json/wallet_balance_entity.g.dart';
import 'dart:convert';
export 'package:savekartweb/generated/json/wallet_balance_entity.g.dart';

@JsonSerializable()
class WalletBalanceEntity {
	int? status = 0;
	String? message = '';
	WalletBalanceData? data;

	WalletBalanceEntity();

	factory WalletBalanceEntity.fromJson(Map<String, dynamic> json) => $WalletBalanceEntityFromJson(json);

	Map<String, dynamic> toJson() => $WalletBalanceEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WalletBalanceData {
	int? id = 0;
	@JSONField(name: "user_id")
	int? userId = 0;
	int? credit = 0;
	double? debit;
	int? balance = 0;
	@JSONField(name: "transaction_date")
	String? transactionDate = '';
	String? description = '';
	int? type = 0;

	WalletBalanceData();

	factory WalletBalanceData.fromJson(Map<String, dynamic> json) => $WalletBalanceDataFromJson(json);

	Map<String, dynamic> toJson() => $WalletBalanceDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
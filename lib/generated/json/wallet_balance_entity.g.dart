import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/wallet_balance_entity.dart';

WalletBalanceEntity $WalletBalanceEntityFromJson(Map<String, dynamic> json) {
  final WalletBalanceEntity walletBalanceEntity = WalletBalanceEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    walletBalanceEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    walletBalanceEntity.message = message;
  }
  final WalletBalanceData? data = jsonConvert.convert<WalletBalanceData>(
      json['data']);
  if (data != null) {
    walletBalanceEntity.data = data;
  }
  return walletBalanceEntity;
}

Map<String, dynamic> $WalletBalanceEntityToJson(WalletBalanceEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension WalletBalanceEntityExtension on WalletBalanceEntity {
  WalletBalanceEntity copyWith({
    int? status,
    String? message,
    WalletBalanceData? data,
  }) {
    return WalletBalanceEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

WalletBalanceData $WalletBalanceDataFromJson(Map<String, dynamic> json) {
  final WalletBalanceData walletBalanceData = WalletBalanceData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    walletBalanceData.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    walletBalanceData.userId = userId;
  }
  final int? credit = jsonConvert.convert<int>(json['credit']);
  if (credit != null) {
    walletBalanceData.credit = credit;
  }
  final double? debit = jsonConvert.convert<double>(json['debit']);
  if (debit != null) {
    walletBalanceData.debit = debit;
  }
  final int? balance = jsonConvert.convert<int>(json['balance']);
  if (balance != null) {
    walletBalanceData.balance = balance;
  }
  final String? transactionDate = jsonConvert.convert<String>(
      json['transaction_date']);
  if (transactionDate != null) {
    walletBalanceData.transactionDate = transactionDate;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    walletBalanceData.description = description;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    walletBalanceData.type = type;
  }
  return walletBalanceData;
}

Map<String, dynamic> $WalletBalanceDataToJson(WalletBalanceData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['credit'] = entity.credit;
  data['debit'] = entity.debit;
  data['balance'] = entity.balance;
  data['transaction_date'] = entity.transactionDate;
  data['description'] = entity.description;
  data['type'] = entity.type;
  return data;
}

extension WalletBalanceDataExtension on WalletBalanceData {
  WalletBalanceData copyWith({
    int? id,
    int? userId,
    int? credit,
    double? debit,
    int? balance,
    String? transactionDate,
    String? description,
    int? type,
  }) {
    return WalletBalanceData()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..credit = credit ?? this.credit
      ..debit = debit ?? this.debit
      ..balance = balance ?? this.balance
      ..transactionDate = transactionDate ?? this.transactionDate
      ..description = description ?? this.description
      ..type = type ?? this.type;
  }
}
import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/wallet_list_entity.dart';

WalletListEntity $WalletListEntityFromJson(Map<String, dynamic> json) {
  final WalletListEntity walletListEntity = WalletListEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    walletListEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    walletListEntity.message = message;
  }
  final List<WalletListData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<WalletListData>(e) as WalletListData)
      .toList();
  if (data != null) {
    walletListEntity.data = data;
  }
  return walletListEntity;
}

Map<String, dynamic> $WalletListEntityToJson(WalletListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension WalletListEntityExtension on WalletListEntity {
  WalletListEntity copyWith({
    int? status,
    String? message,
    List<WalletListData>? data,
  }) {
    return WalletListEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

WalletListData $WalletListDataFromJson(Map<String, dynamic> json) {
  final WalletListData walletListData = WalletListData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    walletListData.id = id;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    walletListData.userId = userId;
  }
  final String? credit = jsonConvert.convert<String>(json['credit']);
  if (credit != null) {
    walletListData.credit = credit;
  }
  final String? debit = jsonConvert.convert<String>(json['debit']);
  if (debit != null) {
    walletListData.debit = debit;
  }
  final String? balance = jsonConvert.convert<String>(json['balance']);
  if (balance != null) {
    walletListData.balance = balance;
  }
  final String? transactionDate = jsonConvert.convert<String>(
      json['transaction_date']);
  if (transactionDate != null) {
    walletListData.transactionDate = transactionDate;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    walletListData.description = description;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    walletListData.type = type;
  }
  return walletListData;
}

Map<String, dynamic> $WalletListDataToJson(WalletListData entity) {
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

extension WalletListDataExtension on WalletListData {
  WalletListData copyWith({
    String? id,
    String? userId,
    String? credit,
    String? debit,
    String? balance,
    String? transactionDate,
    String? description,
    String? type,
  }) {
    return WalletListData()
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
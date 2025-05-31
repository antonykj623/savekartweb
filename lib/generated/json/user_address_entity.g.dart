import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/user_address_entity.dart';

UserAddressEntity $UserAddressEntityFromJson(Map<String, dynamic> json) {
  final UserAddressEntity userAddressEntity = UserAddressEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    userAddressEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    userAddressEntity.message = message;
  }
  final List<UserAddressData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<UserAddressData>(e) as UserAddressData)
      .toList();
  if (data != null) {
    userAddressEntity.data = data;
  }
  return userAddressEntity;
}

Map<String, dynamic> $UserAddressEntityToJson(UserAddressEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension UserAddressEntityExtension on UserAddressEntity {
  UserAddressEntity copyWith({
    int? status,
    String? message,
    List<UserAddressData>? data,
  }) {
    return UserAddressEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

UserAddressData $UserAddressDataFromJson(Map<String, dynamic> json) {
  final UserAddressData userAddressData = UserAddressData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userAddressData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userAddressData.name = name;
  }
  final String? housename = jsonConvert.convert<String>(json['housename']);
  if (housename != null) {
    userAddressData.housename = housename;
  }
  final String? flatno = jsonConvert.convert<String>(json['flatno']);
  if (flatno != null) {
    userAddressData.flatno = flatno;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    userAddressData.userId = userId;
  }
  final String? landmark = jsonConvert.convert<String>(json['landmark']);
  if (landmark != null) {
    userAddressData.landmark = landmark;
  }
  final String? place = jsonConvert.convert<String>(json['place']);
  if (place != null) {
    userAddressData.place = place;
  }
  final String? district = jsonConvert.convert<String>(json['district']);
  if (district != null) {
    userAddressData.district = district;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    userAddressData.phone = phone;
  }
  final String? pincode = jsonConvert.convert<String>(json['pincode']);
  if (pincode != null) {
    userAddressData.pincode = pincode;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    userAddressData.state = state;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    userAddressData.country = country;
  }
  return userAddressData;
}

Map<String, dynamic> $UserAddressDataToJson(UserAddressData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['housename'] = entity.housename;
  data['flatno'] = entity.flatno;
  data['user_id'] = entity.userId;
  data['landmark'] = entity.landmark;
  data['place'] = entity.place;
  data['district'] = entity.district;
  data['phone'] = entity.phone;
  data['pincode'] = entity.pincode;
  data['state'] = entity.state;
  data['country'] = entity.country;
  return data;
}

extension UserAddressDataExtension on UserAddressData {
  UserAddressData copyWith({
    String? id,
    String? name,
    String? housename,
    String? flatno,
    String? userId,
    String? landmark,
    String? place,
    String? district,
    String? phone,
    String? pincode,
    String? state,
    String? country,
  }) {
    return UserAddressData()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..housename = housename ?? this.housename
      ..flatno = flatno ?? this.flatno
      ..userId = userId ?? this.userId
      ..landmark = landmark ?? this.landmark
      ..place = place ?? this.place
      ..district = district ?? this.district
      ..phone = phone ?? this.phone
      ..pincode = pincode ?? this.pincode
      ..state = state ?? this.state
      ..country = country ?? this.country;
  }
}
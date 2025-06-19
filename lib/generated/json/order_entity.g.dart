import 'package:savekartweb/generated/json/base/json_convert_content.dart';
import 'package:savekartweb/domain/order_entity.dart';

OrderEntity $OrderEntityFromJson(Map<String, dynamic> json) {
  final OrderEntity orderEntity = OrderEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    orderEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    orderEntity.message = message;
  }
  final String? serverDate = jsonConvert.convert<String>(json['server_date']);
  if (serverDate != null) {
    orderEntity.serverDate = serverDate;
  }
  final List<OrderData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<OrderData>(e) as OrderData).toList();
  if (data != null) {
    orderEntity.data = data;
  }
  return orderEntity;
}

Map<String, dynamic> $OrderEntityToJson(OrderEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['server_date'] = entity.serverDate;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension OrderEntityExtension on OrderEntity {
  OrderEntity copyWith({
    int? status,
    String? message,
    String? serverDate,
    List<OrderData>? data,
  }) {
    return OrderEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..serverDate = serverDate ?? this.serverDate
      ..data = data ?? this.data;
  }
}

OrderData $OrderDataFromJson(Map<String, dynamic> json) {
  final OrderData orderData = OrderData();
  final OrderDataCartOrder? cartOrder = jsonConvert.convert<OrderDataCartOrder>(
      json['cart_order']);
  if (cartOrder != null) {
    orderData.cartOrder = cartOrder;
  }
  final OrderDataCartStock? cartStock = jsonConvert.convert<OrderDataCartStock>(
      json['cart_stock']);
  if (cartStock != null) {
    orderData.cartStock = cartStock;
  }
  final OrderDataCartProduct? cartProduct = jsonConvert.convert<
      OrderDataCartProduct>(json['cart_product']);
  if (cartProduct != null) {
    orderData.cartProduct = cartProduct;
  }
  final OrderDataCartReturnRequests? cartReturnRequests = jsonConvert.convert<
      OrderDataCartReturnRequests>(json['cart_return_requests']);
  if (cartReturnRequests != null) {
    orderData.cartReturnRequests = cartReturnRequests;
  }
  final OrderDataPaymentDetails? paymentDetails = jsonConvert.convert<
      OrderDataPaymentDetails>(json['payment_details']);
  if (paymentDetails != null) {
    orderData.paymentDetails = paymentDetails;
  }
  return orderData;
}

Map<String, dynamic> $OrderDataToJson(OrderData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cart_order'] = entity.cartOrder?.toJson();
  data['cart_stock'] = entity.cartStock?.toJson();
  data['cart_product'] = entity.cartProduct?.toJson();
  data['cart_return_requests'] = entity.cartReturnRequests?.toJson();
  data['payment_details'] = entity.paymentDetails?.toJson();
  return data;
}

extension OrderDataExtension on OrderData {
  OrderData copyWith({
    OrderDataCartOrder? cartOrder,
    OrderDataCartStock? cartStock,
    OrderDataCartProduct? cartProduct,
    OrderDataCartReturnRequests? cartReturnRequests,
    OrderDataPaymentDetails? paymentDetails,
  }) {
    return OrderData()
      ..cartOrder = cartOrder ?? this.cartOrder
      ..cartStock = cartStock ?? this.cartStock
      ..cartProduct = cartProduct ?? this.cartProduct
      ..cartReturnRequests = cartReturnRequests ?? this.cartReturnRequests
      ..paymentDetails = paymentDetails ?? this.paymentDetails;
  }
}

OrderDataCartOrder $OrderDataCartOrderFromJson(Map<String, dynamic> json) {
  final OrderDataCartOrder orderDataCartOrder = OrderDataCartOrder();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    orderDataCartOrder.id = id;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    orderDataCartOrder.productId = productId;
  }
  final String? quantity = jsonConvert.convert<String>(json['quantity']);
  if (quantity != null) {
    orderDataCartOrder.quantity = quantity;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    orderDataCartOrder.price = price;
  }
  final String? stockid = jsonConvert.convert<String>(json['stockid']);
  if (stockid != null) {
    orderDataCartOrder.stockid = stockid;
  }
  final String? netpayablecommission = jsonConvert.convert<String>(
      json['netpayablecommission']);
  if (netpayablecommission != null) {
    orderDataCartOrder.netpayablecommission = netpayablecommission;
  }
  final String? sponsorCasback = jsonConvert.convert<String>(
      json['sponsor_casback']);
  if (sponsorCasback != null) {
    orderDataCartOrder.sponsorCasback = sponsorCasback;
  }
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    orderDataCartOrder.orderId = orderId;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    orderDataCartOrder.status = status;
  }
  final dynamic statusUpdDate = json['status_upd_date'];
  if (statusUpdDate != null) {
    orderDataCartOrder.statusUpdDate = statusUpdDate;
  }
  final String? orderItemStatus = jsonConvert.convert<String>(
      json['order_item_status']);
  if (orderItemStatus != null) {
    orderDataCartOrder.orderItemStatus = orderItemStatus;
  }
  final String? itemPointsRedeemed = jsonConvert.convert<String>(
      json['item_points_redeemed']);
  if (itemPointsRedeemed != null) {
    orderDataCartOrder.itemPointsRedeemed = itemPointsRedeemed;
  }
  final String? initiateConfirm = jsonConvert.convert<String>(
      json['initiate_confirm']);
  if (initiateConfirm != null) {
    orderDataCartOrder.initiateConfirm = initiateConfirm;
  }
  final String? orderItemUpdDate = jsonConvert.convert<String>(
      json['order_item_upd_date']);
  if (orderItemUpdDate != null) {
    orderDataCartOrder.orderItemUpdDate = orderItemUpdDate;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    orderDataCartOrder.userId = userId;
  }
  final dynamic updateBy = json['update_by'];
  if (updateBy != null) {
    orderDataCartOrder.updateBy = updateBy;
  }
  final String? vendorConfirmationUpdatedBy = jsonConvert.convert<String>(
      json['vendor_confirmation_updated_by']);
  if (vendorConfirmationUpdatedBy != null) {
    orderDataCartOrder.vendorConfirmationUpdatedBy =
        vendorConfirmationUpdatedBy;
  }
  final String? vendorConfirmationUpdatedAt = jsonConvert.convert<String>(
      json['vendor_confirmation_updated_at']);
  if (vendorConfirmationUpdatedAt != null) {
    orderDataCartOrder.vendorConfirmationUpdatedAt =
        vendorConfirmationUpdatedAt;
  }
  final String? packingEmpoyeeId = jsonConvert.convert<String>(
      json['packing_empoyee_id']);
  if (packingEmpoyeeId != null) {
    orderDataCartOrder.packingEmpoyeeId = packingEmpoyeeId;
  }
  final String? packedAt = jsonConvert.convert<String>(json['packed_at']);
  if (packedAt != null) {
    orderDataCartOrder.packedAt = packedAt;
  }
  final String? invoiceStatus = jsonConvert.convert<String>(
      json['invoice_status']);
  if (invoiceStatus != null) {
    orderDataCartOrder.invoiceStatus = invoiceStatus;
  }
  final dynamic shippedEmpId = json['shipped_emp_id'];
  if (shippedEmpId != null) {
    orderDataCartOrder.shippedEmpId = shippedEmpId;
  }
  final dynamic shippedAt = json['shipped_at'];
  if (shippedAt != null) {
    orderDataCartOrder.shippedAt = shippedAt;
  }
  final dynamic deliveringAgencyId = json['delivering_agency_id'];
  if (deliveringAgencyId != null) {
    orderDataCartOrder.deliveringAgencyId = deliveringAgencyId;
  }
  final dynamic podNumber = json['pod_number'];
  if (podNumber != null) {
    orderDataCartOrder.podNumber = podNumber;
  }
  final String? podRate = jsonConvert.convert<String>(json['pod_rate']);
  if (podRate != null) {
    orderDataCartOrder.podRate = podRate;
  }
  final String? deliveryStatusFromAgency = jsonConvert.convert<String>(
      json['delivery_status_from_agency']);
  if (deliveryStatusFromAgency != null) {
    orderDataCartOrder.deliveryStatusFromAgency = deliveryStatusFromAgency;
  }
  final dynamic deliveryRecvedDateFromAgency = json['delivery_recved_date_from_agency'];
  if (deliveryRecvedDateFromAgency != null) {
    orderDataCartOrder.deliveryRecvedDateFromAgency =
        deliveryRecvedDateFromAgency;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    orderDataCartOrder.createdAt = createdAt;
  }
  final String? cancelledAt = jsonConvert.convert<String>(json['cancelled_at']);
  if (cancelledAt != null) {
    orderDataCartOrder.cancelledAt = cancelledAt;
  }
  return orderDataCartOrder;
}

Map<String, dynamic> $OrderDataCartOrderToJson(OrderDataCartOrder entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['product_id'] = entity.productId;
  data['quantity'] = entity.quantity;
  data['price'] = entity.price;
  data['stockid'] = entity.stockid;
  data['netpayablecommission'] = entity.netpayablecommission;
  data['sponsor_casback'] = entity.sponsorCasback;
  data['order_id'] = entity.orderId;
  data['status'] = entity.status;
  data['status_upd_date'] = entity.statusUpdDate;
  data['order_item_status'] = entity.orderItemStatus;
  data['item_points_redeemed'] = entity.itemPointsRedeemed;
  data['initiate_confirm'] = entity.initiateConfirm;
  data['order_item_upd_date'] = entity.orderItemUpdDate;
  data['user_id'] = entity.userId;
  data['update_by'] = entity.updateBy;
  data['vendor_confirmation_updated_by'] = entity.vendorConfirmationUpdatedBy;
  data['vendor_confirmation_updated_at'] = entity.vendorConfirmationUpdatedAt;
  data['packing_empoyee_id'] = entity.packingEmpoyeeId;
  data['packed_at'] = entity.packedAt;
  data['invoice_status'] = entity.invoiceStatus;
  data['shipped_emp_id'] = entity.shippedEmpId;
  data['shipped_at'] = entity.shippedAt;
  data['delivering_agency_id'] = entity.deliveringAgencyId;
  data['pod_number'] = entity.podNumber;
  data['pod_rate'] = entity.podRate;
  data['delivery_status_from_agency'] = entity.deliveryStatusFromAgency;
  data['delivery_recved_date_from_agency'] =
      entity.deliveryRecvedDateFromAgency;
  data['created_at'] = entity.createdAt;
  data['cancelled_at'] = entity.cancelledAt;
  return data;
}

extension OrderDataCartOrderExtension on OrderDataCartOrder {
  OrderDataCartOrder copyWith({
    String? id,
    String? productId,
    String? quantity,
    String? price,
    String? stockid,
    String? netpayablecommission,
    String? sponsorCasback,
    String? orderId,
    String? status,
    dynamic statusUpdDate,
    String? orderItemStatus,
    String? itemPointsRedeemed,
    String? initiateConfirm,
    String? orderItemUpdDate,
    String? userId,
    dynamic updateBy,
    String? vendorConfirmationUpdatedBy,
    String? vendorConfirmationUpdatedAt,
    String? packingEmpoyeeId,
    String? packedAt,
    String? invoiceStatus,
    dynamic shippedEmpId,
    dynamic shippedAt,
    dynamic deliveringAgencyId,
    dynamic podNumber,
    String? podRate,
    String? deliveryStatusFromAgency,
    dynamic deliveryRecvedDateFromAgency,
    String? createdAt,
    String? cancelledAt,
  }) {
    return OrderDataCartOrder()
      ..id = id ?? this.id
      ..productId = productId ?? this.productId
      ..quantity = quantity ?? this.quantity
      ..price = price ?? this.price
      ..stockid = stockid ?? this.stockid
      ..netpayablecommission = netpayablecommission ?? this.netpayablecommission
      ..sponsorCasback = sponsorCasback ?? this.sponsorCasback
      ..orderId = orderId ?? this.orderId
      ..status = status ?? this.status
      ..statusUpdDate = statusUpdDate ?? this.statusUpdDate
      ..orderItemStatus = orderItemStatus ?? this.orderItemStatus
      ..itemPointsRedeemed = itemPointsRedeemed ?? this.itemPointsRedeemed
      ..initiateConfirm = initiateConfirm ?? this.initiateConfirm
      ..orderItemUpdDate = orderItemUpdDate ?? this.orderItemUpdDate
      ..userId = userId ?? this.userId
      ..updateBy = updateBy ?? this.updateBy
      ..vendorConfirmationUpdatedBy = vendorConfirmationUpdatedBy ??
          this.vendorConfirmationUpdatedBy
      ..vendorConfirmationUpdatedAt = vendorConfirmationUpdatedAt ??
          this.vendorConfirmationUpdatedAt
      ..packingEmpoyeeId = packingEmpoyeeId ?? this.packingEmpoyeeId
      ..packedAt = packedAt ?? this.packedAt
      ..invoiceStatus = invoiceStatus ?? this.invoiceStatus
      ..shippedEmpId = shippedEmpId ?? this.shippedEmpId
      ..shippedAt = shippedAt ?? this.shippedAt
      ..deliveringAgencyId = deliveringAgencyId ?? this.deliveringAgencyId
      ..podNumber = podNumber ?? this.podNumber
      ..podRate = podRate ?? this.podRate
      ..deliveryStatusFromAgency = deliveryStatusFromAgency ??
          this.deliveryStatusFromAgency
      ..deliveryRecvedDateFromAgency = deliveryRecvedDateFromAgency ??
          this.deliveryRecvedDateFromAgency
      ..createdAt = createdAt ?? this.createdAt
      ..cancelledAt = cancelledAt ?? this.cancelledAt;
  }
}

OrderDataCartStock $OrderDataCartStockFromJson(Map<String, dynamic> json) {
  final OrderDataCartStock orderDataCartStock = OrderDataCartStock();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    orderDataCartStock.id = id;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    orderDataCartStock.productId = productId;
  }
  final dynamic dType = json['d_type'];
  if (dType != null) {
    orderDataCartStock.dType = dType;
  }
  final dynamic proidFrom = json['proid_from'];
  if (proidFrom != null) {
    orderDataCartStock.proidFrom = proidFrom;
  }
  final dynamic sz = json['sz'];
  if (sz != null) {
    orderDataCartStock.sz = sz;
  }
  final String? vendorId = jsonConvert.convert<String>(json['vendor_id']);
  if (vendorId != null) {
    orderDataCartStock.vendorId = vendorId;
  }
  final String? currentQty = jsonConvert.convert<String>(json['current_qty']);
  if (currentQty != null) {
    orderDataCartStock.currentQty = currentQty;
  }
  final String? priceStock = jsonConvert.convert<String>(json['price_stock']);
  if (priceStock != null) {
    orderDataCartStock.priceStock = priceStock;
  }
  final String? mrp = jsonConvert.convert<String>(json['mrp']);
  if (mrp != null) {
    orderDataCartStock.mrp = mrp;
  }
  final String? savecartPrice = jsonConvert.convert<String>(
      json['savecart_price']);
  if (savecartPrice != null) {
    orderDataCartStock.savecartPrice = savecartPrice;
  }
  final String? ppRedemption = jsonConvert.convert<String>(
      json['pp_redemption']);
  if (ppRedemption != null) {
    orderDataCartStock.ppRedemption = ppRedemption;
  }
  final String? priceSales = jsonConvert.convert<String>(json['price_sales']);
  if (priceSales != null) {
    orderDataCartStock.priceSales = priceSales;
  }
  final String? igst = jsonConvert.convert<String>(json['igst']);
  if (igst != null) {
    orderDataCartStock.igst = igst;
  }
  final String? sgst = jsonConvert.convert<String>(json['sgst']);
  if (sgst != null) {
    orderDataCartStock.sgst = sgst;
  }
  final String? csgt = jsonConvert.convert<String>(json['csgt']);
  if (csgt != null) {
    orderDataCartStock.csgt = csgt;
  }
  final String? igstAmt = jsonConvert.convert<String>(json['igst_amt']);
  if (igstAmt != null) {
    orderDataCartStock.igstAmt = igstAmt;
  }
  final String? sgstAmt = jsonConvert.convert<String>(json['sgst_amt']);
  if (sgstAmt != null) {
    orderDataCartStock.sgstAmt = sgstAmt;
  }
  final String? cgstAmt = jsonConvert.convert<String>(json['cgst_amt']);
  if (cgstAmt != null) {
    orderDataCartStock.cgstAmt = cgstAmt;
  }
  final String? priceWithoutGst = jsonConvert.convert<String>(
      json['price_without_gst']);
  if (priceWithoutGst != null) {
    orderDataCartStock.priceWithoutGst = priceWithoutGst;
  }
  final String? margin = jsonConvert.convert<String>(json['margin']);
  if (margin != null) {
    orderDataCartStock.margin = margin;
  }
  final String? genShareAmt = jsonConvert.convert<String>(
      json['gen_share_amt']);
  if (genShareAmt != null) {
    orderDataCartStock.genShareAmt = genShareAmt;
  }
  final String? cashBack = jsonConvert.convert<String>(json['cash_back']);
  if (cashBack != null) {
    orderDataCartStock.cashBack = cashBack;
  }
  final String? stockEntryDate = jsonConvert.convert<String>(
      json['stock_entry_date']);
  if (stockEntryDate != null) {
    orderDataCartStock.stockEntryDate = stockEntryDate;
  }
  return orderDataCartStock;
}

Map<String, dynamic> $OrderDataCartStockToJson(OrderDataCartStock entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['product_id'] = entity.productId;
  data['d_type'] = entity.dType;
  data['proid_from'] = entity.proidFrom;
  data['sz'] = entity.sz;
  data['vendor_id'] = entity.vendorId;
  data['current_qty'] = entity.currentQty;
  data['price_stock'] = entity.priceStock;
  data['mrp'] = entity.mrp;
  data['savecart_price'] = entity.savecartPrice;
  data['pp_redemption'] = entity.ppRedemption;
  data['price_sales'] = entity.priceSales;
  data['igst'] = entity.igst;
  data['sgst'] = entity.sgst;
  data['csgt'] = entity.csgt;
  data['igst_amt'] = entity.igstAmt;
  data['sgst_amt'] = entity.sgstAmt;
  data['cgst_amt'] = entity.cgstAmt;
  data['price_without_gst'] = entity.priceWithoutGst;
  data['margin'] = entity.margin;
  data['gen_share_amt'] = entity.genShareAmt;
  data['cash_back'] = entity.cashBack;
  data['stock_entry_date'] = entity.stockEntryDate;
  return data;
}

extension OrderDataCartStockExtension on OrderDataCartStock {
  OrderDataCartStock copyWith({
    String? id,
    String? productId,
    dynamic dType,
    dynamic proidFrom,
    dynamic sz,
    String? vendorId,
    String? currentQty,
    String? priceStock,
    String? mrp,
    String? savecartPrice,
    String? ppRedemption,
    String? priceSales,
    String? igst,
    String? sgst,
    String? csgt,
    String? igstAmt,
    String? sgstAmt,
    String? cgstAmt,
    String? priceWithoutGst,
    String? margin,
    String? genShareAmt,
    String? cashBack,
    String? stockEntryDate,
  }) {
    return OrderDataCartStock()
      ..id = id ?? this.id
      ..productId = productId ?? this.productId
      ..dType = dType ?? this.dType
      ..proidFrom = proidFrom ?? this.proidFrom
      ..sz = sz ?? this.sz
      ..vendorId = vendorId ?? this.vendorId
      ..currentQty = currentQty ?? this.currentQty
      ..priceStock = priceStock ?? this.priceStock
      ..mrp = mrp ?? this.mrp
      ..savecartPrice = savecartPrice ?? this.savecartPrice
      ..ppRedemption = ppRedemption ?? this.ppRedemption
      ..priceSales = priceSales ?? this.priceSales
      ..igst = igst ?? this.igst
      ..sgst = sgst ?? this.sgst
      ..csgt = csgt ?? this.csgt
      ..igstAmt = igstAmt ?? this.igstAmt
      ..sgstAmt = sgstAmt ?? this.sgstAmt
      ..cgstAmt = cgstAmt ?? this.cgstAmt
      ..priceWithoutGst = priceWithoutGst ?? this.priceWithoutGst
      ..margin = margin ?? this.margin
      ..genShareAmt = genShareAmt ?? this.genShareAmt
      ..cashBack = cashBack ?? this.cashBack
      ..stockEntryDate = stockEntryDate ?? this.stockEntryDate;
  }
}

OrderDataCartProduct $OrderDataCartProductFromJson(Map<String, dynamic> json) {
  final OrderDataCartProduct orderDataCartProduct = OrderDataCartProduct();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    orderDataCartProduct.id = id;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    orderDataCartProduct.productName = productName;
  }
  final String? productCode = jsonConvert.convert<String>(json['product_code']);
  if (productCode != null) {
    orderDataCartProduct.productCode = productCode;
  }
  final dynamic hsncode = json['hsncode'];
  if (hsncode != null) {
    orderDataCartProduct.hsncode = hsncode;
  }
  final String? categoryId = jsonConvert.convert<String>(json['category_id']);
  if (categoryId != null) {
    orderDataCartProduct.categoryId = categoryId;
  }
  final String? subCategoryId = jsonConvert.convert<String>(
      json['sub_category_id']);
  if (subCategoryId != null) {
    orderDataCartProduct.subCategoryId = subCategoryId;
  }
  final String? productDescription = jsonConvert.convert<String>(
      json['product_description']);
  if (productDescription != null) {
    orderDataCartProduct.productDescription = productDescription;
  }
  final String? productSpec = jsonConvert.convert<String>(json['product_spec']);
  if (productSpec != null) {
    orderDataCartProduct.productSpec = productSpec;
  }
  final String? primeImage = jsonConvert.convert<String>(json['prime_image']);
  if (primeImage != null) {
    orderDataCartProduct.primeImage = primeImage;
  }
  final String? sideImage1 = jsonConvert.convert<String>(json['side_image1']);
  if (sideImage1 != null) {
    orderDataCartProduct.sideImage1 = sideImage1;
  }
  final String? sideImage2 = jsonConvert.convert<String>(json['side_image2']);
  if (sideImage2 != null) {
    orderDataCartProduct.sideImage2 = sideImage2;
  }
  final String? sideImage3 = jsonConvert.convert<String>(json['side_image3']);
  if (sideImage3 != null) {
    orderDataCartProduct.sideImage3 = sideImage3;
  }
  final String? sideImage4 = jsonConvert.convert<String>(json['side_image4']);
  if (sideImage4 != null) {
    orderDataCartProduct.sideImage4 = sideImage4;
  }
  final String? unitId = jsonConvert.convert<String>(json['unit_id']);
  if (unitId != null) {
    orderDataCartProduct.unitId = unitId;
  }
  final String? sizeEnabled = jsonConvert.convert<String>(json['size_enabled']);
  if (sizeEnabled != null) {
    orderDataCartProduct.sizeEnabled = sizeEnabled;
  }
  final String? colorEnabled = jsonConvert.convert<String>(
      json['color_enabled']);
  if (colorEnabled != null) {
    orderDataCartProduct.colorEnabled = colorEnabled;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    orderDataCartProduct.color = color;
  }
  final String? size = jsonConvert.convert<String>(json['size']);
  if (size != null) {
    orderDataCartProduct.size = size;
  }
  final String? vendorId = jsonConvert.convert<String>(json['vendor_id']);
  if (vendorId != null) {
    orderDataCartProduct.vendorId = vendorId;
  }
  final String? returnPolicyId = jsonConvert.convert<String>(
      json['return_policy_id']);
  if (returnPolicyId != null) {
    orderDataCartProduct.returnPolicyId = returnPolicyId;
  }
  final String? offeredItemStatus = jsonConvert.convert<String>(
      json['offered_item_status']);
  if (offeredItemStatus != null) {
    orderDataCartProduct.offeredItemStatus = offeredItemStatus;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    orderDataCartProduct.status = status;
  }
  final String? returnable = jsonConvert.convert<String>(json['returnable']);
  if (returnable != null) {
    orderDataCartProduct.returnable = returnable;
  }
  final String? returnDays = jsonConvert.convert<String>(json['return_days']);
  if (returnDays != null) {
    orderDataCartProduct.returnDays = returnDays;
  }
  final String? upd = jsonConvert.convert<String>(json['upd']);
  if (upd != null) {
    orderDataCartProduct.upd = upd;
  }
  return orderDataCartProduct;
}

Map<String, dynamic> $OrderDataCartProductToJson(OrderDataCartProduct entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['product_name'] = entity.productName;
  data['product_code'] = entity.productCode;
  data['hsncode'] = entity.hsncode;
  data['category_id'] = entity.categoryId;
  data['sub_category_id'] = entity.subCategoryId;
  data['product_description'] = entity.productDescription;
  data['product_spec'] = entity.productSpec;
  data['prime_image'] = entity.primeImage;
  data['side_image1'] = entity.sideImage1;
  data['side_image2'] = entity.sideImage2;
  data['side_image3'] = entity.sideImage3;
  data['side_image4'] = entity.sideImage4;
  data['unit_id'] = entity.unitId;
  data['size_enabled'] = entity.sizeEnabled;
  data['color_enabled'] = entity.colorEnabled;
  data['color'] = entity.color;
  data['size'] = entity.size;
  data['vendor_id'] = entity.vendorId;
  data['return_policy_id'] = entity.returnPolicyId;
  data['offered_item_status'] = entity.offeredItemStatus;
  data['status'] = entity.status;
  data['returnable'] = entity.returnable;
  data['return_days'] = entity.returnDays;
  data['upd'] = entity.upd;
  return data;
}

extension OrderDataCartProductExtension on OrderDataCartProduct {
  OrderDataCartProduct copyWith({
    String? id,
    String? productName,
    String? productCode,
    dynamic hsncode,
    String? categoryId,
    String? subCategoryId,
    String? productDescription,
    String? productSpec,
    String? primeImage,
    String? sideImage1,
    String? sideImage2,
    String? sideImage3,
    String? sideImage4,
    String? unitId,
    String? sizeEnabled,
    String? colorEnabled,
    String? color,
    String? size,
    String? vendorId,
    String? returnPolicyId,
    String? offeredItemStatus,
    String? status,
    String? returnable,
    String? returnDays,
    String? upd,
  }) {
    return OrderDataCartProduct()
      ..id = id ?? this.id
      ..productName = productName ?? this.productName
      ..productCode = productCode ?? this.productCode
      ..hsncode = hsncode ?? this.hsncode
      ..categoryId = categoryId ?? this.categoryId
      ..subCategoryId = subCategoryId ?? this.subCategoryId
      ..productDescription = productDescription ?? this.productDescription
      ..productSpec = productSpec ?? this.productSpec
      ..primeImage = primeImage ?? this.primeImage
      ..sideImage1 = sideImage1 ?? this.sideImage1
      ..sideImage2 = sideImage2 ?? this.sideImage2
      ..sideImage3 = sideImage3 ?? this.sideImage3
      ..sideImage4 = sideImage4 ?? this.sideImage4
      ..unitId = unitId ?? this.unitId
      ..sizeEnabled = sizeEnabled ?? this.sizeEnabled
      ..colorEnabled = colorEnabled ?? this.colorEnabled
      ..color = color ?? this.color
      ..size = size ?? this.size
      ..vendorId = vendorId ?? this.vendorId
      ..returnPolicyId = returnPolicyId ?? this.returnPolicyId
      ..offeredItemStatus = offeredItemStatus ?? this.offeredItemStatus
      ..status = status ?? this.status
      ..returnable = returnable ?? this.returnable
      ..returnDays = returnDays ?? this.returnDays
      ..upd = upd ?? this.upd;
  }
}

OrderDataCartReturnRequests $OrderDataCartReturnRequestsFromJson(
    Map<String, dynamic> json) {
  final OrderDataCartReturnRequests orderDataCartReturnRequests = OrderDataCartReturnRequests();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    orderDataCartReturnRequests.id = id;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    orderDataCartReturnRequests.productId = productId;
  }
  final String? productReturnPolicyId = jsonConvert.convert<String>(
      json['product_return_policy_id']);
  if (productReturnPolicyId != null) {
    orderDataCartReturnRequests.productReturnPolicyId = productReturnPolicyId;
  }
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    orderDataCartReturnRequests.orderId = orderId;
  }
  final String? image1 = jsonConvert.convert<String>(json['image1']);
  if (image1 != null) {
    orderDataCartReturnRequests.image1 = image1;
  }
  final String? image2 = jsonConvert.convert<String>(json['image2']);
  if (image2 != null) {
    orderDataCartReturnRequests.image2 = image2;
  }
  final String? image3 = jsonConvert.convert<String>(json['image3']);
  if (image3 != null) {
    orderDataCartReturnRequests.image3 = image3;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    orderDataCartReturnRequests.userId = userId;
  }
  final String? reason = jsonConvert.convert<String>(json['reason']);
  if (reason != null) {
    orderDataCartReturnRequests.reason = reason;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    orderDataCartReturnRequests.createdAt = createdAt;
  }
  final String? refundedDate = jsonConvert.convert<String>(
      json['refunded_date']);
  if (refundedDate != null) {
    orderDataCartReturnRequests.refundedDate = refundedDate;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    orderDataCartReturnRequests.status = status;
  }
  final String? refundStatus = jsonConvert.convert<String>(
      json['refund_status']);
  if (refundStatus != null) {
    orderDataCartReturnRequests.refundStatus = refundStatus;
  }
  return orderDataCartReturnRequests;
}

Map<String, dynamic> $OrderDataCartReturnRequestsToJson(
    OrderDataCartReturnRequests entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['product_id'] = entity.productId;
  data['product_return_policy_id'] = entity.productReturnPolicyId;
  data['order_id'] = entity.orderId;
  data['image1'] = entity.image1;
  data['image2'] = entity.image2;
  data['image3'] = entity.image3;
  data['user_id'] = entity.userId;
  data['reason'] = entity.reason;
  data['created_at'] = entity.createdAt;
  data['refunded_date'] = entity.refundedDate;
  data['status'] = entity.status;
  data['refund_status'] = entity.refundStatus;
  return data;
}

extension OrderDataCartReturnRequestsExtension on OrderDataCartReturnRequests {
  OrderDataCartReturnRequests copyWith({
    String? id,
    String? productId,
    String? productReturnPolicyId,
    String? orderId,
    String? image1,
    String? image2,
    String? image3,
    String? userId,
    String? reason,
    String? createdAt,
    String? refundedDate,
    String? status,
    String? refundStatus,
  }) {
    return OrderDataCartReturnRequests()
      ..id = id ?? this.id
      ..productId = productId ?? this.productId
      ..productReturnPolicyId = productReturnPolicyId ??
          this.productReturnPolicyId
      ..orderId = orderId ?? this.orderId
      ..image1 = image1 ?? this.image1
      ..image2 = image2 ?? this.image2
      ..image3 = image3 ?? this.image3
      ..userId = userId ?? this.userId
      ..reason = reason ?? this.reason
      ..createdAt = createdAt ?? this.createdAt
      ..refundedDate = refundedDate ?? this.refundedDate
      ..status = status ?? this.status
      ..refundStatus = refundStatus ?? this.refundStatus;
  }
}

OrderDataPaymentDetails $OrderDataPaymentDetailsFromJson(
    Map<String, dynamic> json) {
  final OrderDataPaymentDetails orderDataPaymentDetails = OrderDataPaymentDetails();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    orderDataPaymentDetails.id = id;
  }
  final String? retriedOrderItemId = jsonConvert.convert<String>(
      json['retried_order_item_id']);
  if (retriedOrderItemId != null) {
    orderDataPaymentDetails.retriedOrderItemId = retriedOrderItemId;
  }
  final String? regId = jsonConvert.convert<String>(json['reg_id']);
  if (regId != null) {
    orderDataPaymentDetails.regId = regId;
  }
  final String? dateOrder = jsonConvert.convert<String>(json['date_order']);
  if (dateOrder != null) {
    orderDataPaymentDetails.dateOrder = dateOrder;
  }
  final dynamic deliveryDate = json['delivery_date'];
  if (deliveryDate != null) {
    orderDataPaymentDetails.deliveryDate = deliveryDate;
  }
  final String? addressId = jsonConvert.convert<String>(json['address_id']);
  if (addressId != null) {
    orderDataPaymentDetails.addressId = addressId;
  }
  final String? totalprice = jsonConvert.convert<String>(json['totalprice']);
  if (totalprice != null) {
    orderDataPaymentDetails.totalprice = totalprice;
  }
  final String? isWalletUsed = jsonConvert.convert<String>(
      json['isWalletUsed']);
  if (isWalletUsed != null) {
    orderDataPaymentDetails.isWalletUsed = isWalletUsed;
  }
  final String? paidAmount = jsonConvert.convert<String>(json['paid_amount']);
  if (paidAmount != null) {
    orderDataPaymentDetails.paidAmount = paidAmount;
  }
  final String? usedWalletAmount = jsonConvert.convert<String>(
      json['used_wallet_amount']);
  if (usedWalletAmount != null) {
    orderDataPaymentDetails.usedWalletAmount = usedWalletAmount;
  }
  final String? paymentType = jsonConvert.convert<String>(json['payment_type']);
  if (paymentType != null) {
    orderDataPaymentDetails.paymentType = paymentType;
  }
  final String? transactionId = jsonConvert.convert<String>(
      json['transaction_id']);
  if (transactionId != null) {
    orderDataPaymentDetails.transactionId = transactionId;
  }
  final String? transactionDetails = jsonConvert.convert<String>(
      json['transaction_details']);
  if (transactionDetails != null) {
    orderDataPaymentDetails.transactionDetails = transactionDetails;
  }
  final String? billingStatus = jsonConvert.convert<String>(
      json['billing_status']);
  if (billingStatus != null) {
    orderDataPaymentDetails.billingStatus = billingStatus;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    orderDataPaymentDetails.description = description;
  }
  final String? paymentStatus = jsonConvert.convert<String>(
      json['payment_status']);
  if (paymentStatus != null) {
    orderDataPaymentDetails.paymentStatus = paymentStatus;
  }
  return orderDataPaymentDetails;
}

Map<String, dynamic> $OrderDataPaymentDetailsToJson(
    OrderDataPaymentDetails entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['retried_order_item_id'] = entity.retriedOrderItemId;
  data['reg_id'] = entity.regId;
  data['date_order'] = entity.dateOrder;
  data['delivery_date'] = entity.deliveryDate;
  data['address_id'] = entity.addressId;
  data['totalprice'] = entity.totalprice;
  data['isWalletUsed'] = entity.isWalletUsed;
  data['paid_amount'] = entity.paidAmount;
  data['used_wallet_amount'] = entity.usedWalletAmount;
  data['payment_type'] = entity.paymentType;
  data['transaction_id'] = entity.transactionId;
  data['transaction_details'] = entity.transactionDetails;
  data['billing_status'] = entity.billingStatus;
  data['description'] = entity.description;
  data['payment_status'] = entity.paymentStatus;
  return data;
}

extension OrderDataPaymentDetailsExtension on OrderDataPaymentDetails {
  OrderDataPaymentDetails copyWith({
    String? id,
    String? retriedOrderItemId,
    String? regId,
    String? dateOrder,
    dynamic deliveryDate,
    String? addressId,
    String? totalprice,
    String? isWalletUsed,
    String? paidAmount,
    String? usedWalletAmount,
    String? paymentType,
    String? transactionId,
    String? transactionDetails,
    String? billingStatus,
    String? description,
    String? paymentStatus,
  }) {
    return OrderDataPaymentDetails()
      ..id = id ?? this.id
      ..retriedOrderItemId = retriedOrderItemId ?? this.retriedOrderItemId
      ..regId = regId ?? this.regId
      ..dateOrder = dateOrder ?? this.dateOrder
      ..deliveryDate = deliveryDate ?? this.deliveryDate
      ..addressId = addressId ?? this.addressId
      ..totalprice = totalprice ?? this.totalprice
      ..isWalletUsed = isWalletUsed ?? this.isWalletUsed
      ..paidAmount = paidAmount ?? this.paidAmount
      ..usedWalletAmount = usedWalletAmount ?? this.usedWalletAmount
      ..paymentType = paymentType ?? this.paymentType
      ..transactionId = transactionId ?? this.transactionId
      ..transactionDetails = transactionDetails ?? this.transactionDetails
      ..billingStatus = billingStatus ?? this.billingStatus
      ..description = description ?? this.description
      ..paymentStatus = paymentStatus ?? this.paymentStatus;
  }
}
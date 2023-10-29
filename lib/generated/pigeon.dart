// Autogenerated from Pigeon (v12.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';
List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

enum RequestStatus {
  successful,
  failed,
  notSupported,
}

enum PurchaseRequestStatus {
  successful,
  failed,
  invalidSku,
  alreadyPurchased,
  notSupported,
}

enum ProductType {
  consumable,
  entitled,
  subscription,
}

enum FulfillmentResult {
  fulfilled,
  unavailable,
}

class UserData {
  UserData({
    required this.userId,
    required this.marketplace,
  });

  String userId;

  String marketplace;

  Object encode() {
    return <Object?>[
      userId,
      marketplace,
    ];
  }

  static UserData decode(Object result) {
    result as List<Object?>;
    return UserData(
      userId: result[0]! as String,
      marketplace: result[1]! as String,
    );
  }
}

class UserDataResponse {
  UserDataResponse({
    required this.requestStatus,
    required this.userData,
  });

  RequestStatus requestStatus;

  UserData userData;

  Object encode() {
    return <Object?>[
      requestStatus.index,
      userData.encode(),
    ];
  }

  static UserDataResponse decode(Object result) {
    result as List<Object?>;
    return UserDataResponse(
      requestStatus: RequestStatus.values[result[0]! as int],
      userData: UserData.decode(result[1]! as List<Object?>),
    );
  }
}

class Receipt {
  Receipt({
    required this.receiptId,
    required this.sku,
    this.termSku,
    required this.productType,
    required this.purchaseDate,
    this.cancelDate,
    this.deferredDate,
    this.deferredSku,
    required this.isCanceled,
    required this.isDeferred,
  });

  String receiptId;

  String sku;

  String? termSku;

  ProductType productType;

  int purchaseDate;

  int? cancelDate;

  int? deferredDate;

  String? deferredSku;

  bool isCanceled;

  bool isDeferred;

  Object encode() {
    return <Object?>[
      receiptId,
      sku,
      termSku,
      productType.index,
      purchaseDate,
      cancelDate,
      deferredDate,
      deferredSku,
      isCanceled,
      isDeferred,
    ];
  }

  static Receipt decode(Object result) {
    result as List<Object?>;
    return Receipt(
      receiptId: result[0]! as String,
      sku: result[1]! as String,
      termSku: result[2] as String?,
      productType: ProductType.values[result[3]! as int],
      purchaseDate: result[4]! as int,
      cancelDate: result[5] as int?,
      deferredDate: result[6] as int?,
      deferredSku: result[7] as String?,
      isCanceled: result[8]! as bool,
      isDeferred: result[9]! as bool,
    );
  }
}

class PurchaseUpdatesResponse {
  PurchaseUpdatesResponse({
    this.userData,
    required this.requestStatus,
    required this.receipts,
    required this.hasMore,
  });

  UserData? userData;

  RequestStatus requestStatus;

  List<Receipt?> receipts;

  bool hasMore;

  Object encode() {
    return <Object?>[
      userData?.encode(),
      requestStatus.index,
      receipts,
      hasMore,
    ];
  }

  static PurchaseUpdatesResponse decode(Object result) {
    result as List<Object?>;
    return PurchaseUpdatesResponse(
      userData: result[0] != null
          ? UserData.decode(result[0]! as List<Object?>)
          : null,
      requestStatus: RequestStatus.values[result[1]! as int],
      receipts: (result[2] as List<Object?>?)!.cast<Receipt?>(),
      hasMore: result[3]! as bool,
    );
  }
}

class Product {
  Product({
    required this.description,
    this.freeTrialPeriod,
    required this.price,
    required this.productType,
    required this.sku,
    required this.smallIconUrl,
    this.subscriptionPeriod,
    required this.title,
  });

  String description;

  String? freeTrialPeriod;

  String price;

  ProductType productType;

  String sku;

  String smallIconUrl;

  String? subscriptionPeriod;

  String title;

  Object encode() {
    return <Object?>[
      description,
      freeTrialPeriod,
      price,
      productType.index,
      sku,
      smallIconUrl,
      subscriptionPeriod,
      title,
    ];
  }

  static Product decode(Object result) {
    result as List<Object?>;
    return Product(
      description: result[0]! as String,
      freeTrialPeriod: result[1] as String?,
      price: result[2]! as String,
      productType: ProductType.values[result[3]! as int],
      sku: result[4]! as String,
      smallIconUrl: result[5]! as String,
      subscriptionPeriod: result[6] as String?,
      title: result[7]! as String,
    );
  }
}

class ProductDataResponse {
  ProductDataResponse({
    required this.unavailableSkus,
    required this.requestStatus,
    required this.productData,
  });

  List<String?> unavailableSkus;

  RequestStatus requestStatus;

  Map<String?, Product?> productData;

  Object encode() {
    return <Object?>[
      unavailableSkus,
      requestStatus.index,
      productData,
    ];
  }

  static ProductDataResponse decode(Object result) {
    result as List<Object?>;
    return ProductDataResponse(
      unavailableSkus: (result[0] as List<Object?>?)!.cast<String?>(),
      requestStatus: RequestStatus.values[result[1]! as int],
      productData: (result[2] as Map<Object?, Object?>?)!.cast<String?, Product?>(),
    );
  }
}

class PurchaseResponse {
  PurchaseResponse({
    this.userData,
    this.receipt,
    required this.requestStatus,
  });

  UserData? userData;

  Receipt? receipt;

  PurchaseRequestStatus requestStatus;

  Object encode() {
    return <Object?>[
      userData?.encode(),
      receipt?.encode(),
      requestStatus.index,
    ];
  }

  static PurchaseResponse decode(Object result) {
    result as List<Object?>;
    return PurchaseResponse(
      userData: result[0] != null
          ? UserData.decode(result[0]! as List<Object?>)
          : null,
      receipt: result[1] != null
          ? Receipt.decode(result[1]! as List<Object?>)
          : null,
      requestStatus: PurchaseRequestStatus.values[result[2]! as int],
    );
  }
}

class InstallDetails {
  InstallDetails({
    required this.isAmazonStoreInstalled,
    required this.installedFromAmazonStore,
  });

  bool isAmazonStoreInstalled;

  bool installedFromAmazonStore;

  Object encode() {
    return <Object?>[
      isAmazonStoreInstalled,
      installedFromAmazonStore,
    ];
  }

  static InstallDetails decode(Object result) {
    result as List<Object?>;
    return InstallDetails(
      isAmazonStoreInstalled: result[0]! as bool,
      installedFromAmazonStore: result[1]! as bool,
    );
  }
}

class _AmazonIapApiCodec extends StandardMessageCodec {
  const _AmazonIapApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is InstallDetails) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return InstallDetails.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class AmazonIapApi {
  /// Constructor for [AmazonIapApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  AmazonIapApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _AmazonIapApiCodec();

  Future<void> setup() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amazon_iap.AmazonIapApi.setup', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> getUserData() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amazon_iap.AmazonIapApi.getUserData', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> getPurchaseUpdates(bool arg_reset) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amazon_iap.AmazonIapApi.getPurchaseUpdates', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_reset]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> getProductData(List<String?> arg_skus) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amazon_iap.AmazonIapApi.getProductData', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_skus]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> purchase(String arg_sku) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amazon_iap.AmazonIapApi.purchase', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_sku]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> notifyFulfillment(String arg_receiptId, FulfillmentResult arg_fulfillmentResult) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amazon_iap.AmazonIapApi.notifyFulfillment', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_receiptId, arg_fulfillmentResult.index]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<InstallDetails> getInstallationDetails() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.amazon_iap.AmazonIapApi.getInstallationDetails', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as InstallDetails?)!;
    }
  }
}

class _AmazonIapCallbackApiCodec extends StandardMessageCodec {
  const _AmazonIapCallbackApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is Product) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is ProductDataResponse) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is PurchaseResponse) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is PurchaseUpdatesResponse) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is Receipt) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is UserData) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is UserData) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is UserDataResponse) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return Product.decode(readValue(buffer)!);
      case 129: 
        return ProductDataResponse.decode(readValue(buffer)!);
      case 130: 
        return PurchaseResponse.decode(readValue(buffer)!);
      case 131: 
        return PurchaseUpdatesResponse.decode(readValue(buffer)!);
      case 132: 
        return Receipt.decode(readValue(buffer)!);
      case 133: 
        return UserData.decode(readValue(buffer)!);
      case 134: 
        return UserData.decode(readValue(buffer)!);
      case 135: 
        return UserDataResponse.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class AmazonIapCallbackApi {
  static const MessageCodec<Object?> codec = _AmazonIapCallbackApiCodec();

  void onUserDataResponse(UserDataResponse data);

  void onPurchaseUpdatesResponse(PurchaseUpdatesResponse data);

  void onProductDataResponse(ProductDataResponse data);

  void onPurchaseResponse(PurchaseResponse data);

  static void setup(AmazonIapCallbackApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onUserDataResponse', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onUserDataResponse was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final UserDataResponse? arg_data = (args[0] as UserDataResponse?);
          assert(arg_data != null,
              'Argument for dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onUserDataResponse was null, expected non-null UserDataResponse.');
          try {
            api.onUserDataResponse(arg_data!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onPurchaseUpdatesResponse', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onPurchaseUpdatesResponse was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PurchaseUpdatesResponse? arg_data = (args[0] as PurchaseUpdatesResponse?);
          assert(arg_data != null,
              'Argument for dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onPurchaseUpdatesResponse was null, expected non-null PurchaseUpdatesResponse.');
          try {
            api.onPurchaseUpdatesResponse(arg_data!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onProductDataResponse', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onProductDataResponse was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final ProductDataResponse? arg_data = (args[0] as ProductDataResponse?);
          assert(arg_data != null,
              'Argument for dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onProductDataResponse was null, expected non-null ProductDataResponse.');
          try {
            api.onProductDataResponse(arg_data!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onPurchaseResponse', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onPurchaseResponse was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PurchaseResponse? arg_data = (args[0] as PurchaseResponse?);
          assert(arg_data != null,
              'Argument for dev.flutter.pigeon.amazon_iap.AmazonIapCallbackApi.onPurchaseResponse was null, expected non-null PurchaseResponse.');
          try {
            api.onPurchaseResponse(arg_data!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

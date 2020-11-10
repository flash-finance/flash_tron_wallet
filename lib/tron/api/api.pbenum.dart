///
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Return_response_code extends $pb.ProtobufEnum {
  static const Return_response_code SUCCESS = Return_response_code._(0, 'SUCCESS');
  static const Return_response_code SIGERROR = Return_response_code._(1, 'SIGERROR');
  static const Return_response_code CONTRACT_VALIDATE_ERROR = Return_response_code._(2, 'CONTRACT_VALIDATE_ERROR');
  static const Return_response_code CONTRACT_EXE_ERROR = Return_response_code._(3, 'CONTRACT_EXE_ERROR');
  static const Return_response_code BANDWITH_ERROR = Return_response_code._(4, 'BANDWITH_ERROR');
  static const Return_response_code DUP_TRANSACTION_ERROR = Return_response_code._(5, 'DUP_TRANSACTION_ERROR');
  static const Return_response_code TAPOS_ERROR = Return_response_code._(6, 'TAPOS_ERROR');
  static const Return_response_code TOO_BIG_TRANSACTION_ERROR = Return_response_code._(7, 'TOO_BIG_TRANSACTION_ERROR');
  static const Return_response_code TRANSACTION_EXPIRATION_ERROR = Return_response_code._(8, 'TRANSACTION_EXPIRATION_ERROR');
  static const Return_response_code SERVER_BUSY = Return_response_code._(9, 'SERVER_BUSY');
  static const Return_response_code NO_CONNECTION = Return_response_code._(10, 'NO_CONNECTION');
  static const Return_response_code NOT_ENOUGH_EFFECTIVE_CONNECTION = Return_response_code._(11, 'NOT_ENOUGH_EFFECTIVE_CONNECTION');
  static const Return_response_code OTHER_ERROR = Return_response_code._(20, 'OTHER_ERROR');

  static const $core.List<Return_response_code> values = <Return_response_code> [
    SUCCESS,
    SIGERROR,
    CONTRACT_VALIDATE_ERROR,
    CONTRACT_EXE_ERROR,
    BANDWITH_ERROR,
    DUP_TRANSACTION_ERROR,
    TAPOS_ERROR,
    TOO_BIG_TRANSACTION_ERROR,
    TRANSACTION_EXPIRATION_ERROR,
    SERVER_BUSY,
    NO_CONNECTION,
    NOT_ENOUGH_EFFECTIVE_CONNECTION,
    OTHER_ERROR,
  ];

  static final $core.Map<$core.int, Return_response_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Return_response_code valueOf($core.int value) => _byValue[value];

  const Return_response_code._($core.int v, $core.String n) : super(v, n);
}

class TransactionSignWeight_Result_response_code extends $pb.ProtobufEnum {
  static const TransactionSignWeight_Result_response_code ENOUGH_PERMISSION = TransactionSignWeight_Result_response_code._(0, 'ENOUGH_PERMISSION');
  static const TransactionSignWeight_Result_response_code NOT_ENOUGH_PERMISSION = TransactionSignWeight_Result_response_code._(1, 'NOT_ENOUGH_PERMISSION');
  static const TransactionSignWeight_Result_response_code SIGNATURE_FORMAT_ERROR = TransactionSignWeight_Result_response_code._(2, 'SIGNATURE_FORMAT_ERROR');
  static const TransactionSignWeight_Result_response_code COMPUTE_ADDRESS_ERROR = TransactionSignWeight_Result_response_code._(3, 'COMPUTE_ADDRESS_ERROR');
  static const TransactionSignWeight_Result_response_code PERMISSION_ERROR = TransactionSignWeight_Result_response_code._(4, 'PERMISSION_ERROR');
  static const TransactionSignWeight_Result_response_code OTHER_ERROR = TransactionSignWeight_Result_response_code._(20, 'OTHER_ERROR');

  static const $core.List<TransactionSignWeight_Result_response_code> values = <TransactionSignWeight_Result_response_code> [
    ENOUGH_PERMISSION,
    NOT_ENOUGH_PERMISSION,
    SIGNATURE_FORMAT_ERROR,
    COMPUTE_ADDRESS_ERROR,
    PERMISSION_ERROR,
    OTHER_ERROR,
  ];

  static final $core.Map<$core.int, TransactionSignWeight_Result_response_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionSignWeight_Result_response_code valueOf($core.int value) => _byValue[value];

  const TransactionSignWeight_Result_response_code._($core.int v, $core.String n) : super(v, n);
}

class TransactionApprovedList_Result_response_code extends $pb.ProtobufEnum {
  static const TransactionApprovedList_Result_response_code SUCCESS = TransactionApprovedList_Result_response_code._(0, 'SUCCESS');
  static const TransactionApprovedList_Result_response_code SIGNATURE_FORMAT_ERROR = TransactionApprovedList_Result_response_code._(1, 'SIGNATURE_FORMAT_ERROR');
  static const TransactionApprovedList_Result_response_code COMPUTE_ADDRESS_ERROR = TransactionApprovedList_Result_response_code._(2, 'COMPUTE_ADDRESS_ERROR');
  static const TransactionApprovedList_Result_response_code OTHER_ERROR = TransactionApprovedList_Result_response_code._(20, 'OTHER_ERROR');

  static const $core.List<TransactionApprovedList_Result_response_code> values = <TransactionApprovedList_Result_response_code> [
    SUCCESS,
    SIGNATURE_FORMAT_ERROR,
    COMPUTE_ADDRESS_ERROR,
    OTHER_ERROR,
  ];

  static final $core.Map<$core.int, TransactionApprovedList_Result_response_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionApprovedList_Result_response_code valueOf($core.int value) => _byValue[value];

  const TransactionApprovedList_Result_response_code._($core.int v, $core.String n) : super(v, n);
}


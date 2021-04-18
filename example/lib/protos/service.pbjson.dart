///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'phoneNumber', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'wallets', '3': 6, '4': 3, '5': 11, '6': '.service.Wallet', '10': 'wallets'},
    const {'1': 'friends', '3': 7, '4': 3, '5': 9, '10': 'friends'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3N3b3JkEhIKBG5hbWUYBCABKAlSBG5hbWUSIAoLcGhvbmVOdW1iZXIYBSABKAlSC3Bob25lTnVtYmVyEikKB3dhbGxldHMYBiADKAsyDy5zZXJ2aWNlLldhbGxldFIHd2FsbGV0cxIYCgdmcmllbmRzGAcgAygJUgdmcmllbmRz');
@$core.Deprecated('Use walletDescriptor instead')
const Wallet$json = const {
  '1': 'Wallet',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `Wallet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List walletDescriptor = $convert.base64Decode('CgZXYWxsZXQSFAoFdGl0bGUYASABKAlSBXRpdGxlEhgKB2FkZHJlc3MYAiABKAlSB2FkZHJlc3M=');
@$core.Deprecated('Use createUserReqDescriptor instead')
const CreateUserReq$json = const {
  '1': 'CreateUserReq',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.service.User', '10': 'user'},
  ],
};

/// Descriptor for `CreateUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserReqDescriptor = $convert.base64Decode('Cg1DcmVhdGVVc2VyUmVxEiEKBHVzZXIYASABKAsyDS5zZXJ2aWNlLlVzZXJSBHVzZXI=');
@$core.Deprecated('Use createUserResDescriptor instead')
const CreateUserRes$json = const {
  '1': 'CreateUserRes',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.service.User', '10': 'user'},
    const {'1': 'AccessToken', '3': 2, '4': 1, '5': 9, '10': 'AccessToken'},
  ],
};

/// Descriptor for `CreateUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserResDescriptor = $convert.base64Decode('Cg1DcmVhdGVVc2VyUmVzEiEKBHVzZXIYASABKAsyDS5zZXJ2aWNlLlVzZXJSBHVzZXISIAoLQWNjZXNzVG9rZW4YAiABKAlSC0FjY2Vzc1Rva2Vu');
@$core.Deprecated('Use loginUserReqDescriptor instead')
const LoginUserReq$json = const {
  '1': 'LoginUserReq',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserReqDescriptor = $convert.base64Decode('CgxMb2dpblVzZXJSZXESFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginUserResDescriptor instead')
const LoginUserRes$json = const {
  '1': 'LoginUserRes',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.service.User', '10': 'user'},
    const {'1': 'AccessToken', '3': 2, '4': 1, '5': 9, '10': 'AccessToken'},
  ],
};

/// Descriptor for `LoginUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserResDescriptor = $convert.base64Decode('CgxMb2dpblVzZXJSZXMSIQoEdXNlchgBIAEoCzINLnNlcnZpY2UuVXNlclIEdXNlchIgCgtBY2Nlc3NUb2tlbhgCIAEoCVILQWNjZXNzVG9rZW4=');
@$core.Deprecated('Use readUserReqDescriptor instead')
const ReadUserReq$json = const {
  '1': 'ReadUserReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `ReadUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readUserReqDescriptor = $convert.base64Decode('CgtSZWFkVXNlclJlcRIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use readUserResDescriptor instead')
const ReadUserRes$json = const {
  '1': 'ReadUserRes',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.service.User', '10': 'user'},
  ],
};

/// Descriptor for `ReadUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readUserResDescriptor = $convert.base64Decode('CgtSZWFkVXNlclJlcxIhCgR1c2VyGAEgASgLMg0uc2VydmljZS5Vc2VyUgR1c2Vy');
@$core.Deprecated('Use updateUserReqDescriptor instead')
const UpdateUserReq$json = const {
  '1': 'UpdateUserReq',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.service.User', '10': 'user'},
  ],
};

/// Descriptor for `UpdateUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserReqDescriptor = $convert.base64Decode('Cg1VcGRhdGVVc2VyUmVxEiEKBHVzZXIYASABKAsyDS5zZXJ2aWNlLlVzZXJSBHVzZXI=');
@$core.Deprecated('Use updateUserResDescriptor instead')
const UpdateUserRes$json = const {
  '1': 'UpdateUserRes',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.service.User', '10': 'user'},
  ],
};

/// Descriptor for `UpdateUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserResDescriptor = $convert.base64Decode('Cg1VcGRhdGVVc2VyUmVzEiEKBHVzZXIYASABKAsyDS5zZXJ2aWNlLlVzZXJSBHVzZXI=');
@$core.Deprecated('Use deleteUserReqDescriptor instead')
const DeleteUserReq$json = const {
  '1': 'DeleteUserReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserReqDescriptor = $convert.base64Decode('Cg1EZWxldGVVc2VyUmVxEg4KAmlkGAEgASgJUgJpZA==');
@$core.Deprecated('Use deleteUserResDescriptor instead')
const DeleteUserRes$json = const {
  '1': 'DeleteUserRes',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserResDescriptor = $convert.base64Decode('Cg1EZWxldGVVc2VyUmVzEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use listUsersReqDescriptor instead')
const ListUsersReq$json = const {
  '1': 'ListUsersReq',
};

/// Descriptor for `ListUsersReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersReqDescriptor = $convert.base64Decode('CgxMaXN0VXNlcnNSZXE=');
@$core.Deprecated('Use listUsersResDescriptor instead')
const ListUsersRes$json = const {
  '1': 'ListUsersRes',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.service.User', '10': 'user'},
  ],
};

/// Descriptor for `ListUsersRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersResDescriptor = $convert.base64Decode('CgxMaXN0VXNlcnNSZXMSIQoEdXNlchgBIAEoCzINLnNlcnZpY2UuVXNlclIEdXNlcg==');
@$core.Deprecated('Use updateFriendUserReqDescriptor instead')
const UpdateFriendUserReq$json = const {
  '1': 'UpdateFriendUserReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 3, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `UpdateFriendUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateFriendUserReqDescriptor = $convert.base64Decode('ChNVcGRhdGVGcmllbmRVc2VyUmVxEg4KAmlkGAEgAygJUgJpZA==');
@$core.Deprecated('Use updateFriendUserResDescriptor instead')
const UpdateFriendUserRes$json = const {
  '1': 'UpdateFriendUserRes',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateFriendUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateFriendUserResDescriptor = $convert.base64Decode('ChNVcGRhdGVGcmllbmRVc2VyUmVzEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use listFriendsUserReqDescriptor instead')
const ListFriendsUserReq$json = const {
  '1': 'ListFriendsUserReq',
  '2': const [
    const {'1': 'AccessToken', '3': 1, '4': 1, '5': 9, '10': 'AccessToken'},
  ],
};

/// Descriptor for `ListFriendsUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listFriendsUserReqDescriptor = $convert.base64Decode('ChJMaXN0RnJpZW5kc1VzZXJSZXESIAoLQWNjZXNzVG9rZW4YASABKAlSC0FjY2Vzc1Rva2Vu');
@$core.Deprecated('Use listFriendsUserResDescriptor instead')
const ListFriendsUserRes$json = const {
  '1': 'ListFriendsUserRes',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.service.User', '10': 'user'},
  ],
};

/// Descriptor for `ListFriendsUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listFriendsUserResDescriptor = $convert.base64Decode('ChJMaXN0RnJpZW5kc1VzZXJSZXMSIQoEdXNlchgBIAEoCzINLnNlcnZpY2UuVXNlclIEdXNlcg==');
@$core.Deprecated('Use listXFriendsUserReqDescriptor instead')
const ListXFriendsUserReq$json = const {
  '1': 'ListXFriendsUserReq',
  '2': const [
    const {'1': 'number', '3': 1, '4': 1, '5': 9, '10': 'number'},
  ],
};

/// Descriptor for `ListXFriendsUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listXFriendsUserReqDescriptor = $convert.base64Decode('ChNMaXN0WEZyaWVuZHNVc2VyUmVxEhYKBm51bWJlchgBIAEoCVIGbnVtYmVy');
@$core.Deprecated('Use listXFriendsUserResDescriptor instead')
const ListXFriendsUserRes$json = const {
  '1': 'ListXFriendsUserRes',
  '2': const [
    const {'1': 'friends', '3': 1, '4': 3, '5': 11, '6': '.service.User', '10': 'friends'},
  ],
};

/// Descriptor for `ListXFriendsUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listXFriendsUserResDescriptor = $convert.base64Decode('ChNMaXN0WEZyaWVuZHNVc2VyUmVzEicKB2ZyaWVuZHMYASADKAsyDS5zZXJ2aWNlLlVzZXJSB2ZyaWVuZHM=');
@$core.Deprecated('Use updateWalletUserReqDescriptor instead')
const UpdateWalletUserReq$json = const {
  '1': 'UpdateWalletUserReq',
  '2': const [
    const {'1': 'wallet', '3': 1, '4': 1, '5': 11, '6': '.service.Wallet', '10': 'wallet'},
  ],
};

/// Descriptor for `UpdateWalletUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWalletUserReqDescriptor = $convert.base64Decode('ChNVcGRhdGVXYWxsZXRVc2VyUmVxEicKBndhbGxldBgBIAEoCzIPLnNlcnZpY2UuV2FsbGV0UgZ3YWxsZXQ=');
@$core.Deprecated('Use updateWalletUserResDescriptor instead')
const UpdateWalletUserRes$json = const {
  '1': 'UpdateWalletUserRes',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateWalletUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWalletUserResDescriptor = $convert.base64Decode('ChNVcGRhdGVXYWxsZXRVc2VyUmVzEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use listWalletUserReqDescriptor instead')
const ListWalletUserReq$json = const {
  '1': 'ListWalletUserReq',
  '2': const [
    const {'1': 'AccessToken', '3': 1, '4': 1, '5': 9, '10': 'AccessToken'},
  ],
};

/// Descriptor for `ListWalletUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listWalletUserReqDescriptor = $convert.base64Decode('ChFMaXN0V2FsbGV0VXNlclJlcRIgCgtBY2Nlc3NUb2tlbhgBIAEoCVILQWNjZXNzVG9rZW4=');
@$core.Deprecated('Use listWalletUserResDescriptor instead')
const ListWalletUserRes$json = const {
  '1': 'ListWalletUserRes',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.service.User', '10': 'user'},
  ],
};

/// Descriptor for `ListWalletUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listWalletUserResDescriptor = $convert.base64Decode('ChFMaXN0V2FsbGV0VXNlclJlcxIhCgR1c2VyGAEgASgLMg0uc2VydmljZS5Vc2VyUgR1c2Vy');
@$core.Deprecated('Use eventDescriptor instead')
const Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'author_id', '3': 2, '4': 1, '5': 9, '10': 'authorId'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode('CgVFdmVudBIOCgJpZBgBIAEoCVICaWQSGwoJYXV0aG9yX2lkGAIgASgJUghhdXRob3JJZBIUCgV0aXRsZRgDIAEoCVIFdGl0bGUSGAoHY29udGVudBgEIAEoCVIHY29udGVudA==');
@$core.Deprecated('Use createEventReqDescriptor instead')
const CreateEventReq$json = const {
  '1': 'CreateEventReq',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.service.Event', '10': 'event'},
  ],
};

/// Descriptor for `CreateEventReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEventReqDescriptor = $convert.base64Decode('Cg5DcmVhdGVFdmVudFJlcRIkCgVldmVudBgBIAEoCzIOLnNlcnZpY2UuRXZlbnRSBWV2ZW50');
@$core.Deprecated('Use createEventResDescriptor instead')
const CreateEventRes$json = const {
  '1': 'CreateEventRes',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.service.Event', '10': 'event'},
  ],
};

/// Descriptor for `CreateEventRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEventResDescriptor = $convert.base64Decode('Cg5DcmVhdGVFdmVudFJlcxIkCgVldmVudBgBIAEoCzIOLnNlcnZpY2UuRXZlbnRSBWV2ZW50');
@$core.Deprecated('Use readEventReqDescriptor instead')
const ReadEventReq$json = const {
  '1': 'ReadEventReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `ReadEventReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readEventReqDescriptor = $convert.base64Decode('CgxSZWFkRXZlbnRSZXESDgoCaWQYASABKAlSAmlk');
@$core.Deprecated('Use readEventResDescriptor instead')
const ReadEventRes$json = const {
  '1': 'ReadEventRes',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.service.Event', '10': 'event'},
  ],
};

/// Descriptor for `ReadEventRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readEventResDescriptor = $convert.base64Decode('CgxSZWFkRXZlbnRSZXMSJAoFZXZlbnQYASABKAsyDi5zZXJ2aWNlLkV2ZW50UgVldmVudA==');
@$core.Deprecated('Use updateEventReqDescriptor instead')
const UpdateEventReq$json = const {
  '1': 'UpdateEventReq',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.service.Event', '10': 'event'},
  ],
};

/// Descriptor for `UpdateEventReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEventReqDescriptor = $convert.base64Decode('Cg5VcGRhdGVFdmVudFJlcRIkCgVldmVudBgBIAEoCzIOLnNlcnZpY2UuRXZlbnRSBWV2ZW50');
@$core.Deprecated('Use updateEventResDescriptor instead')
const UpdateEventRes$json = const {
  '1': 'UpdateEventRes',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.service.Event', '10': 'event'},
  ],
};

/// Descriptor for `UpdateEventRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEventResDescriptor = $convert.base64Decode('Cg5VcGRhdGVFdmVudFJlcxIkCgVldmVudBgBIAEoCzIOLnNlcnZpY2UuRXZlbnRSBWV2ZW50');
@$core.Deprecated('Use deleteEventReqDescriptor instead')
const DeleteEventReq$json = const {
  '1': 'DeleteEventReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteEventReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEventReqDescriptor = $convert.base64Decode('Cg5EZWxldGVFdmVudFJlcRIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use deleteEventResDescriptor instead')
const DeleteEventRes$json = const {
  '1': 'DeleteEventRes',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteEventRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEventResDescriptor = $convert.base64Decode('Cg5EZWxldGVFdmVudFJlcxIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use listEventsReqDescriptor instead')
const ListEventsReq$json = const {
  '1': 'ListEventsReq',
};

/// Descriptor for `ListEventsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEventsReqDescriptor = $convert.base64Decode('Cg1MaXN0RXZlbnRzUmVx');
@$core.Deprecated('Use listEventsResDescriptor instead')
const ListEventsRes$json = const {
  '1': 'ListEventsRes',
  '2': const [
    const {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.service.Event', '10': 'event'},
  ],
};

/// Descriptor for `ListEventsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEventsResDescriptor = $convert.base64Decode('Cg1MaXN0RXZlbnRzUmVzEiQKBWV2ZW50GAEgASgLMg4uc2VydmljZS5FdmVudFIFZXZlbnQ=');
@$core.Deprecated('Use chunkDescriptor instead')
const Chunk$json = const {
  '1': 'Chunk',
  '2': const [
    const {'1': 'Content', '3': 1, '4': 1, '5': 12, '10': 'Content'},
  ],
};

/// Descriptor for `Chunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkDescriptor = $convert.base64Decode('CgVDaHVuaxIYCgdDb250ZW50GAEgASgMUgdDb250ZW50');
@$core.Deprecated('Use downloadReqDescriptor instead')
const DownloadReq$json = const {
  '1': 'DownloadReq',
  '2': const [
    const {'1': 'fileName', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
  ],
};

/// Descriptor for `DownloadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadReqDescriptor = $convert.base64Decode('CgtEb3dubG9hZFJlcRIaCghmaWxlTmFtZRgBIAEoCVIIZmlsZU5hbWU=');

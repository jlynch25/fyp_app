///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'service.pb.dart' as $0;
export 'service.pb.dart';

class ServiceClient extends $grpc.Client {
  static final _$createUser =
      $grpc.ClientMethod<$0.CreateUserReq, $0.CreateUserRes>(
          '/service.Service/CreateUser',
          ($0.CreateUserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.CreateUserRes.fromBuffer(value));
  static final _$loginUser =
      $grpc.ClientMethod<$0.LoginUserReq, $0.LoginUserRes>(
          '/service.Service/LoginUser',
          ($0.LoginUserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.LoginUserRes.fromBuffer(value));
  static final _$readUser = $grpc.ClientMethod<$0.ReadUserReq, $0.ReadUserRes>(
      '/service.Service/ReadUser',
      ($0.ReadUserReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReadUserRes.fromBuffer(value));
  static final _$updateUser =
      $grpc.ClientMethod<$0.UpdateUserReq, $0.UpdateUserRes>(
          '/service.Service/UpdateUser',
          ($0.UpdateUserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UpdateUserRes.fromBuffer(value));
  static final _$deleteUser =
      $grpc.ClientMethod<$0.DeleteUserReq, $0.DeleteUserRes>(
          '/service.Service/DeleteUser',
          ($0.DeleteUserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DeleteUserRes.fromBuffer(value));
  static final _$listUsers =
      $grpc.ClientMethod<$0.ListUsersReq, $0.ListUsersRes>(
          '/service.Service/ListUsers',
          ($0.ListUsersReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ListUsersRes.fromBuffer(value));
  static final _$addFriendUser =
      $grpc.ClientMethod<$0.UpdateFriendUserReq, $0.UpdateFriendUserRes>(
          '/service.Service/AddFriendUser',
          ($0.UpdateFriendUserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateFriendUserRes.fromBuffer(value));
  static final _$removeFriendUser =
      $grpc.ClientMethod<$0.UpdateFriendUserReq, $0.UpdateFriendUserRes>(
          '/service.Service/RemoveFriendUser',
          ($0.UpdateFriendUserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateFriendUserRes.fromBuffer(value));
  static final _$listFriendsUser =
      $grpc.ClientMethod<$0.ListFriendsUserReq, $0.ListFriendsUserRes>(
          '/service.Service/ListFriendsUser',
          ($0.ListFriendsUserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListFriendsUserRes.fromBuffer(value));
  static final _$listXFriendsUser =
      $grpc.ClientMethod<$0.ListXFriendsUserReq, $0.ListXFriendsUserRes>(
          '/service.Service/ListXFriendsUser',
          ($0.ListXFriendsUserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListXFriendsUserRes.fromBuffer(value));
  static final _$addWalletUser =
      $grpc.ClientMethod<$0.UpdateWalletUserReq, $0.UpdateWalletUserRes>(
          '/service.Service/AddWalletUser',
          ($0.UpdateWalletUserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateWalletUserRes.fromBuffer(value));
  static final _$removeWalletUser =
      $grpc.ClientMethod<$0.UpdateWalletUserReq, $0.UpdateWalletUserRes>(
          '/service.Service/RemoveWalletUser',
          ($0.UpdateWalletUserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateWalletUserRes.fromBuffer(value));
  static final _$createEvent =
      $grpc.ClientMethod<$0.CreateEventReq, $0.CreateEventRes>(
          '/service.Service/CreateEvent',
          ($0.CreateEventReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.CreateEventRes.fromBuffer(value));
  static final _$readEvent =
      $grpc.ClientMethod<$0.ReadEventReq, $0.ReadEventRes>(
          '/service.Service/ReadEvent',
          ($0.ReadEventReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ReadEventRes.fromBuffer(value));
  static final _$updateEvent =
      $grpc.ClientMethod<$0.UpdateEventReq, $0.UpdateEventRes>(
          '/service.Service/UpdateEvent',
          ($0.UpdateEventReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UpdateEventRes.fromBuffer(value));
  static final _$deleteEvent =
      $grpc.ClientMethod<$0.DeleteEventReq, $0.DeleteEventRes>(
          '/service.Service/DeleteEvent',
          ($0.DeleteEventReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DeleteEventRes.fromBuffer(value));
  static final _$listEvents =
      $grpc.ClientMethod<$0.ListEventsReq, $0.ListEventsRes>(
          '/service.Service/ListEvents',
          ($0.ListEventsReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ListEventsRes.fromBuffer(value));
  static final _$download = $grpc.ClientMethod<$0.DownloadReq, $0.Chunk>(
      '/service.Service/Download',
      ($0.DownloadReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Chunk.fromBuffer(value));

  ServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateUserRes> createUser($0.CreateUserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginUserRes> loginUser($0.LoginUserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loginUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReadUserRes> readUser($0.ReadUserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateUserRes> updateUser($0.UpdateUserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteUserRes> deleteUser($0.DeleteUserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseStream<$0.ListUsersRes> listUsers($0.ListUsersReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listUsers, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.UpdateFriendUserRes> addFriendUser(
      $0.UpdateFriendUserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addFriendUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateFriendUserRes> removeFriendUser(
      $0.UpdateFriendUserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeFriendUser, request, options: options);
  }

  $grpc.ResponseStream<$0.ListFriendsUserRes> listFriendsUser(
      $0.ListFriendsUserReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listFriendsUser, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.ListXFriendsUserRes> listXFriendsUser(
      $0.ListXFriendsUserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listXFriendsUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateWalletUserRes> addWalletUser(
      $0.UpdateWalletUserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addWalletUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateWalletUserRes> removeWalletUser(
      $0.UpdateWalletUserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeWalletUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateEventRes> createEvent($0.CreateEventReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createEvent, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReadEventRes> readEvent($0.ReadEventReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readEvent, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateEventRes> updateEvent($0.UpdateEventReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateEvent, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteEventRes> deleteEvent($0.DeleteEventReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteEvent, request, options: options);
  }

  $grpc.ResponseStream<$0.ListEventsRes> listEvents($0.ListEventsReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listEvents, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.Chunk> download($0.DownloadReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$download, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ServiceBase extends $grpc.Service {
  $core.String get $name => 'service.Service';

  ServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateUserReq, $0.CreateUserRes>(
        'CreateUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateUserReq.fromBuffer(value),
        ($0.CreateUserRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginUserReq, $0.LoginUserRes>(
        'LoginUser',
        loginUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginUserReq.fromBuffer(value),
        ($0.LoginUserRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReadUserReq, $0.ReadUserRes>(
        'ReadUser',
        readUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReadUserReq.fromBuffer(value),
        ($0.ReadUserRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateUserReq, $0.UpdateUserRes>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateUserReq.fromBuffer(value),
        ($0.UpdateUserRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteUserReq, $0.DeleteUserRes>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteUserReq.fromBuffer(value),
        ($0.DeleteUserRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListUsersReq, $0.ListUsersRes>(
        'ListUsers',
        listUsers_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ListUsersReq.fromBuffer(value),
        ($0.ListUsersRes value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateFriendUserReq, $0.UpdateFriendUserRes>(
            'AddFriendUser',
            addFriendUser_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateFriendUserReq.fromBuffer(value),
            ($0.UpdateFriendUserRes value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateFriendUserReq, $0.UpdateFriendUserRes>(
            'RemoveFriendUser',
            removeFriendUser_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateFriendUserReq.fromBuffer(value),
            ($0.UpdateFriendUserRes value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListFriendsUserReq, $0.ListFriendsUserRes>(
            'ListFriendsUser',
            listFriendsUser_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.ListFriendsUserReq.fromBuffer(value),
            ($0.ListFriendsUserRes value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListXFriendsUserReq, $0.ListXFriendsUserRes>(
            'ListXFriendsUser',
            listXFriendsUser_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListXFriendsUserReq.fromBuffer(value),
            ($0.ListXFriendsUserRes value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateWalletUserReq, $0.UpdateWalletUserRes>(
            'AddWalletUser',
            addWalletUser_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateWalletUserReq.fromBuffer(value),
            ($0.UpdateWalletUserRes value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateWalletUserReq, $0.UpdateWalletUserRes>(
            'RemoveWalletUser',
            removeWalletUser_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateWalletUserReq.fromBuffer(value),
            ($0.UpdateWalletUserRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateEventReq, $0.CreateEventRes>(
        'CreateEvent',
        createEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateEventReq.fromBuffer(value),
        ($0.CreateEventRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReadEventReq, $0.ReadEventRes>(
        'ReadEvent',
        readEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReadEventReq.fromBuffer(value),
        ($0.ReadEventRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateEventReq, $0.UpdateEventRes>(
        'UpdateEvent',
        updateEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateEventReq.fromBuffer(value),
        ($0.UpdateEventRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteEventReq, $0.DeleteEventRes>(
        'DeleteEvent',
        deleteEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteEventReq.fromBuffer(value),
        ($0.DeleteEventRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListEventsReq, $0.ListEventsRes>(
        'ListEvents',
        listEvents_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ListEventsReq.fromBuffer(value),
        ($0.ListEventsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DownloadReq, $0.Chunk>(
        'Download',
        download_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.DownloadReq.fromBuffer(value),
        ($0.Chunk value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateUserRes> createUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CreateUserReq> request) async {
    return createUser(call, await request);
  }

  $async.Future<$0.LoginUserRes> loginUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginUserReq> request) async {
    return loginUser(call, await request);
  }

  $async.Future<$0.ReadUserRes> readUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ReadUserReq> request) async {
    return readUser(call, await request);
  }

  $async.Future<$0.UpdateUserRes> updateUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UpdateUserReq> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$0.DeleteUserRes> deleteUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DeleteUserReq> request) async {
    return deleteUser(call, await request);
  }

  $async.Stream<$0.ListUsersRes> listUsers_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListUsersReq> request) async* {
    yield* listUsers(call, await request);
  }

  $async.Future<$0.UpdateFriendUserRes> addFriendUser_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateFriendUserReq> request) async {
    return addFriendUser(call, await request);
  }

  $async.Future<$0.UpdateFriendUserRes> removeFriendUser_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateFriendUserReq> request) async {
    return removeFriendUser(call, await request);
  }

  $async.Stream<$0.ListFriendsUserRes> listFriendsUser_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListFriendsUserReq> request) async* {
    yield* listFriendsUser(call, await request);
  }

  $async.Future<$0.ListXFriendsUserRes> listXFriendsUser_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListXFriendsUserReq> request) async {
    return listXFriendsUser(call, await request);
  }

  $async.Future<$0.UpdateWalletUserRes> addWalletUser_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateWalletUserReq> request) async {
    return addWalletUser(call, await request);
  }

  $async.Future<$0.UpdateWalletUserRes> removeWalletUser_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateWalletUserReq> request) async {
    return removeWalletUser(call, await request);
  }

  $async.Future<$0.CreateEventRes> createEvent_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CreateEventReq> request) async {
    return createEvent(call, await request);
  }

  $async.Future<$0.ReadEventRes> readEvent_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ReadEventReq> request) async {
    return readEvent(call, await request);
  }

  $async.Future<$0.UpdateEventRes> updateEvent_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UpdateEventReq> request) async {
    return updateEvent(call, await request);
  }

  $async.Future<$0.DeleteEventRes> deleteEvent_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DeleteEventReq> request) async {
    return deleteEvent(call, await request);
  }

  $async.Stream<$0.ListEventsRes> listEvents_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListEventsReq> request) async* {
    yield* listEvents(call, await request);
  }

  $async.Stream<$0.Chunk> download_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DownloadReq> request) async* {
    yield* download(call, await request);
  }

  $async.Future<$0.CreateUserRes> createUser(
      $grpc.ServiceCall call, $0.CreateUserReq request);
  $async.Future<$0.LoginUserRes> loginUser(
      $grpc.ServiceCall call, $0.LoginUserReq request);
  $async.Future<$0.ReadUserRes> readUser(
      $grpc.ServiceCall call, $0.ReadUserReq request);
  $async.Future<$0.UpdateUserRes> updateUser(
      $grpc.ServiceCall call, $0.UpdateUserReq request);
  $async.Future<$0.DeleteUserRes> deleteUser(
      $grpc.ServiceCall call, $0.DeleteUserReq request);
  $async.Stream<$0.ListUsersRes> listUsers(
      $grpc.ServiceCall call, $0.ListUsersReq request);
  $async.Future<$0.UpdateFriendUserRes> addFriendUser(
      $grpc.ServiceCall call, $0.UpdateFriendUserReq request);
  $async.Future<$0.UpdateFriendUserRes> removeFriendUser(
      $grpc.ServiceCall call, $0.UpdateFriendUserReq request);
  $async.Stream<$0.ListFriendsUserRes> listFriendsUser(
      $grpc.ServiceCall call, $0.ListFriendsUserReq request);
  $async.Future<$0.ListXFriendsUserRes> listXFriendsUser(
      $grpc.ServiceCall call, $0.ListXFriendsUserReq request);
  $async.Future<$0.UpdateWalletUserRes> addWalletUser(
      $grpc.ServiceCall call, $0.UpdateWalletUserReq request);
  $async.Future<$0.UpdateWalletUserRes> removeWalletUser(
      $grpc.ServiceCall call, $0.UpdateWalletUserReq request);
  $async.Future<$0.CreateEventRes> createEvent(
      $grpc.ServiceCall call, $0.CreateEventReq request);
  $async.Future<$0.ReadEventRes> readEvent(
      $grpc.ServiceCall call, $0.ReadEventReq request);
  $async.Future<$0.UpdateEventRes> updateEvent(
      $grpc.ServiceCall call, $0.UpdateEventReq request);
  $async.Future<$0.DeleteEventRes> deleteEvent(
      $grpc.ServiceCall call, $0.DeleteEventReq request);
  $async.Stream<$0.ListEventsRes> listEvents(
      $grpc.ServiceCall call, $0.ListEventsReq request);
  $async.Stream<$0.Chunk> download(
      $grpc.ServiceCall call, $0.DownloadReq request);
}

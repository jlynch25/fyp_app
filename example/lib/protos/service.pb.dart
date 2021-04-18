///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phoneNumber', protoName: 'phoneNumber')
    ..pc<Wallet>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wallets', $pb.PbFieldType.PM, subBuilder: Wallet.create)
    ..pPS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friends')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User({
    $core.String? id,
    $core.String? email,
    $core.String? password,
    $core.String? name,
    $core.String? phoneNumber,
    $core.Iterable<Wallet>? wallets,
    $core.Iterable<$core.String>? friends,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    if (name != null) {
      _result.name = name;
    }
    if (phoneNumber != null) {
      _result.phoneNumber = phoneNumber;
    }
    if (wallets != null) {
      _result.wallets.addAll(wallets);
    }
    if (friends != null) {
      _result.friends.addAll(friends);
    }
    return _result;
  }
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phoneNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhoneNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<Wallet> get wallets => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get friends => $_getList(6);
}

class Wallet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Wallet', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  Wallet._() : super();
  factory Wallet({
    $core.String? title,
    $core.String? address,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory Wallet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Wallet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Wallet clone() => Wallet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Wallet copyWith(void Function(Wallet) updates) => super.copyWith((message) => updates(message as Wallet)) as Wallet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Wallet create() => Wallet._();
  Wallet createEmptyInstance() => create();
  static $pb.PbList<Wallet> createRepeated() => $pb.PbList<Wallet>();
  @$core.pragma('dart2js:noInline')
  static Wallet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Wallet>(create);
  static Wallet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
}

class CreateUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateUserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  CreateUserReq._() : super();
  factory CreateUserReq({
    User? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory CreateUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserReq clone() => CreateUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserReq copyWith(void Function(CreateUserReq) updates) => super.copyWith((message) => updates(message as CreateUserReq)) as CreateUserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUserReq create() => CreateUserReq._();
  CreateUserReq createEmptyInstance() => create();
  static $pb.PbList<CreateUserReq> createRepeated() => $pb.PbList<CreateUserReq>();
  @$core.pragma('dart2js:noInline')
  static CreateUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserReq>(create);
  static CreateUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class CreateUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'AccessToken', protoName: 'AccessToken')
    ..hasRequiredFields = false
  ;

  CreateUserRes._() : super();
  factory CreateUserRes({
    User? user,
    $core.String? accessToken,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    return _result;
  }
  factory CreateUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserRes clone() => CreateUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserRes copyWith(void Function(CreateUserRes) updates) => super.copyWith((message) => updates(message as CreateUserRes)) as CreateUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUserRes create() => CreateUserRes._();
  CreateUserRes createEmptyInstance() => create();
  static $pb.PbList<CreateUserRes> createRepeated() => $pb.PbList<CreateUserRes>();
  @$core.pragma('dart2js:noInline')
  static CreateUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserRes>(create);
  static CreateUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get accessToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set accessToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccessToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessToken() => clearField(2);
}

class LoginUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginUserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  LoginUserReq._() : super();
  factory LoginUserReq({
    $core.String? email,
    $core.String? password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory LoginUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUserReq clone() => LoginUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUserReq copyWith(void Function(LoginUserReq) updates) => super.copyWith((message) => updates(message as LoginUserReq)) as LoginUserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginUserReq create() => LoginUserReq._();
  LoginUserReq createEmptyInstance() => create();
  static $pb.PbList<LoginUserReq> createRepeated() => $pb.PbList<LoginUserReq>();
  @$core.pragma('dart2js:noInline')
  static LoginUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUserReq>(create);
  static LoginUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'AccessToken', protoName: 'AccessToken')
    ..hasRequiredFields = false
  ;

  LoginUserRes._() : super();
  factory LoginUserRes({
    User? user,
    $core.String? accessToken,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    return _result;
  }
  factory LoginUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUserRes clone() => LoginUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUserRes copyWith(void Function(LoginUserRes) updates) => super.copyWith((message) => updates(message as LoginUserRes)) as LoginUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginUserRes create() => LoginUserRes._();
  LoginUserRes createEmptyInstance() => create();
  static $pb.PbList<LoginUserRes> createRepeated() => $pb.PbList<LoginUserRes>();
  @$core.pragma('dart2js:noInline')
  static LoginUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUserRes>(create);
  static LoginUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get accessToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set accessToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccessToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessToken() => clearField(2);
}

class ReadUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReadUserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  ReadUserReq._() : super();
  factory ReadUserReq({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory ReadUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadUserReq clone() => ReadUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadUserReq copyWith(void Function(ReadUserReq) updates) => super.copyWith((message) => updates(message as ReadUserReq)) as ReadUserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadUserReq create() => ReadUserReq._();
  ReadUserReq createEmptyInstance() => create();
  static $pb.PbList<ReadUserReq> createRepeated() => $pb.PbList<ReadUserReq>();
  @$core.pragma('dart2js:noInline')
  static ReadUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadUserReq>(create);
  static ReadUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ReadUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReadUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  ReadUserRes._() : super();
  factory ReadUserRes({
    User? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory ReadUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadUserRes clone() => ReadUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadUserRes copyWith(void Function(ReadUserRes) updates) => super.copyWith((message) => updates(message as ReadUserRes)) as ReadUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadUserRes create() => ReadUserRes._();
  ReadUserRes createEmptyInstance() => create();
  static $pb.PbList<ReadUserRes> createRepeated() => $pb.PbList<ReadUserRes>();
  @$core.pragma('dart2js:noInline')
  static ReadUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadUserRes>(create);
  static ReadUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class UpdateUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  UpdateUserReq._() : super();
  factory UpdateUserReq({
    User? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory UpdateUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserReq clone() => UpdateUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserReq copyWith(void Function(UpdateUserReq) updates) => super.copyWith((message) => updates(message as UpdateUserReq)) as UpdateUserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserReq create() => UpdateUserReq._();
  UpdateUserReq createEmptyInstance() => create();
  static $pb.PbList<UpdateUserReq> createRepeated() => $pb.PbList<UpdateUserReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserReq>(create);
  static UpdateUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class UpdateUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  UpdateUserRes._() : super();
  factory UpdateUserRes({
    User? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory UpdateUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserRes clone() => UpdateUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserRes copyWith(void Function(UpdateUserRes) updates) => super.copyWith((message) => updates(message as UpdateUserRes)) as UpdateUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserRes create() => UpdateUserRes._();
  UpdateUserRes createEmptyInstance() => create();
  static $pb.PbList<UpdateUserRes> createRepeated() => $pb.PbList<UpdateUserRes>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserRes>(create);
  static UpdateUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class DeleteUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteUserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DeleteUserReq._() : super();
  factory DeleteUserReq({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DeleteUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUserReq clone() => DeleteUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUserReq copyWith(void Function(DeleteUserReq) updates) => super.copyWith((message) => updates(message as DeleteUserReq)) as DeleteUserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteUserReq create() => DeleteUserReq._();
  DeleteUserReq createEmptyInstance() => create();
  static $pb.PbList<DeleteUserReq> createRepeated() => $pb.PbList<DeleteUserReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUserReq>(create);
  static DeleteUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  DeleteUserRes._() : super();
  factory DeleteUserRes({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory DeleteUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUserRes clone() => DeleteUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUserRes copyWith(void Function(DeleteUserRes) updates) => super.copyWith((message) => updates(message as DeleteUserRes)) as DeleteUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteUserRes create() => DeleteUserRes._();
  DeleteUserRes createEmptyInstance() => create();
  static $pb.PbList<DeleteUserRes> createRepeated() => $pb.PbList<DeleteUserRes>();
  @$core.pragma('dart2js:noInline')
  static DeleteUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUserRes>(create);
  static DeleteUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ListUsersReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListUsersReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListUsersReq._() : super();
  factory ListUsersReq() => create();
  factory ListUsersReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListUsersReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListUsersReq clone() => ListUsersReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListUsersReq copyWith(void Function(ListUsersReq) updates) => super.copyWith((message) => updates(message as ListUsersReq)) as ListUsersReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListUsersReq create() => ListUsersReq._();
  ListUsersReq createEmptyInstance() => create();
  static $pb.PbList<ListUsersReq> createRepeated() => $pb.PbList<ListUsersReq>();
  @$core.pragma('dart2js:noInline')
  static ListUsersReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUsersReq>(create);
  static ListUsersReq? _defaultInstance;
}

class ListUsersRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListUsersRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  ListUsersRes._() : super();
  factory ListUsersRes({
    User? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory ListUsersRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListUsersRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListUsersRes clone() => ListUsersRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListUsersRes copyWith(void Function(ListUsersRes) updates) => super.copyWith((message) => updates(message as ListUsersRes)) as ListUsersRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListUsersRes create() => ListUsersRes._();
  ListUsersRes createEmptyInstance() => create();
  static $pb.PbList<ListUsersRes> createRepeated() => $pb.PbList<ListUsersRes>();
  @$core.pragma('dart2js:noInline')
  static ListUsersRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUsersRes>(create);
  static ListUsersRes? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class UpdateFriendUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateFriendUserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  UpdateFriendUserReq._() : super();
  factory UpdateFriendUserReq({
    $core.Iterable<$core.String>? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id.addAll(id);
    }
    return _result;
  }
  factory UpdateFriendUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateFriendUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateFriendUserReq clone() => UpdateFriendUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateFriendUserReq copyWith(void Function(UpdateFriendUserReq) updates) => super.copyWith((message) => updates(message as UpdateFriendUserReq)) as UpdateFriendUserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateFriendUserReq create() => UpdateFriendUserReq._();
  UpdateFriendUserReq createEmptyInstance() => create();
  static $pb.PbList<UpdateFriendUserReq> createRepeated() => $pb.PbList<UpdateFriendUserReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateFriendUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateFriendUserReq>(create);
  static UpdateFriendUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get id => $_getList(0);
}

class UpdateFriendUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateFriendUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UpdateFriendUserRes._() : super();
  factory UpdateFriendUserRes({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UpdateFriendUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateFriendUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateFriendUserRes clone() => UpdateFriendUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateFriendUserRes copyWith(void Function(UpdateFriendUserRes) updates) => super.copyWith((message) => updates(message as UpdateFriendUserRes)) as UpdateFriendUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateFriendUserRes create() => UpdateFriendUserRes._();
  UpdateFriendUserRes createEmptyInstance() => create();
  static $pb.PbList<UpdateFriendUserRes> createRepeated() => $pb.PbList<UpdateFriendUserRes>();
  @$core.pragma('dart2js:noInline')
  static UpdateFriendUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateFriendUserRes>(create);
  static UpdateFriendUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ListFriendsUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListFriendsUserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'AccessToken', protoName: 'AccessToken')
    ..hasRequiredFields = false
  ;

  ListFriendsUserReq._() : super();
  factory ListFriendsUserReq({
    $core.String? accessToken,
  }) {
    final _result = create();
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    return _result;
  }
  factory ListFriendsUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListFriendsUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListFriendsUserReq clone() => ListFriendsUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListFriendsUserReq copyWith(void Function(ListFriendsUserReq) updates) => super.copyWith((message) => updates(message as ListFriendsUserReq)) as ListFriendsUserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListFriendsUserReq create() => ListFriendsUserReq._();
  ListFriendsUserReq createEmptyInstance() => create();
  static $pb.PbList<ListFriendsUserReq> createRepeated() => $pb.PbList<ListFriendsUserReq>();
  @$core.pragma('dart2js:noInline')
  static ListFriendsUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListFriendsUserReq>(create);
  static ListFriendsUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);
}

class ListFriendsUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListFriendsUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  ListFriendsUserRes._() : super();
  factory ListFriendsUserRes({
    User? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory ListFriendsUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListFriendsUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListFriendsUserRes clone() => ListFriendsUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListFriendsUserRes copyWith(void Function(ListFriendsUserRes) updates) => super.copyWith((message) => updates(message as ListFriendsUserRes)) as ListFriendsUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListFriendsUserRes create() => ListFriendsUserRes._();
  ListFriendsUserRes createEmptyInstance() => create();
  static $pb.PbList<ListFriendsUserRes> createRepeated() => $pb.PbList<ListFriendsUserRes>();
  @$core.pragma('dart2js:noInline')
  static ListFriendsUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListFriendsUserRes>(create);
  static ListFriendsUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class ListXFriendsUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListXFriendsUserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number')
    ..hasRequiredFields = false
  ;

  ListXFriendsUserReq._() : super();
  factory ListXFriendsUserReq({
    $core.String? number,
  }) {
    final _result = create();
    if (number != null) {
      _result.number = number;
    }
    return _result;
  }
  factory ListXFriendsUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListXFriendsUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListXFriendsUserReq clone() => ListXFriendsUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListXFriendsUserReq copyWith(void Function(ListXFriendsUserReq) updates) => super.copyWith((message) => updates(message as ListXFriendsUserReq)) as ListXFriendsUserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListXFriendsUserReq create() => ListXFriendsUserReq._();
  ListXFriendsUserReq createEmptyInstance() => create();
  static $pb.PbList<ListXFriendsUserReq> createRepeated() => $pb.PbList<ListXFriendsUserReq>();
  @$core.pragma('dart2js:noInline')
  static ListXFriendsUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListXFriendsUserReq>(create);
  static ListXFriendsUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get number => $_getSZ(0);
  @$pb.TagNumber(1)
  set number($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);
}

class ListXFriendsUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListXFriendsUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..pc<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friends', $pb.PbFieldType.PM, subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  ListXFriendsUserRes._() : super();
  factory ListXFriendsUserRes({
    $core.Iterable<User>? friends,
  }) {
    final _result = create();
    if (friends != null) {
      _result.friends.addAll(friends);
    }
    return _result;
  }
  factory ListXFriendsUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListXFriendsUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListXFriendsUserRes clone() => ListXFriendsUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListXFriendsUserRes copyWith(void Function(ListXFriendsUserRes) updates) => super.copyWith((message) => updates(message as ListXFriendsUserRes)) as ListXFriendsUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListXFriendsUserRes create() => ListXFriendsUserRes._();
  ListXFriendsUserRes createEmptyInstance() => create();
  static $pb.PbList<ListXFriendsUserRes> createRepeated() => $pb.PbList<ListXFriendsUserRes>();
  @$core.pragma('dart2js:noInline')
  static ListXFriendsUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListXFriendsUserRes>(create);
  static ListXFriendsUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<User> get friends => $_getList(0);
}

class UpdateWalletUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateWalletUserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<Wallet>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wallet', subBuilder: Wallet.create)
    ..hasRequiredFields = false
  ;

  UpdateWalletUserReq._() : super();
  factory UpdateWalletUserReq({
    Wallet? wallet,
  }) {
    final _result = create();
    if (wallet != null) {
      _result.wallet = wallet;
    }
    return _result;
  }
  factory UpdateWalletUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateWalletUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateWalletUserReq clone() => UpdateWalletUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateWalletUserReq copyWith(void Function(UpdateWalletUserReq) updates) => super.copyWith((message) => updates(message as UpdateWalletUserReq)) as UpdateWalletUserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateWalletUserReq create() => UpdateWalletUserReq._();
  UpdateWalletUserReq createEmptyInstance() => create();
  static $pb.PbList<UpdateWalletUserReq> createRepeated() => $pb.PbList<UpdateWalletUserReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateWalletUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateWalletUserReq>(create);
  static UpdateWalletUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  Wallet get wallet => $_getN(0);
  @$pb.TagNumber(1)
  set wallet(Wallet v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasWallet() => $_has(0);
  @$pb.TagNumber(1)
  void clearWallet() => clearField(1);
  @$pb.TagNumber(1)
  Wallet ensureWallet() => $_ensure(0);
}

class UpdateWalletUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateWalletUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UpdateWalletUserRes._() : super();
  factory UpdateWalletUserRes({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UpdateWalletUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateWalletUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateWalletUserRes clone() => UpdateWalletUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateWalletUserRes copyWith(void Function(UpdateWalletUserRes) updates) => super.copyWith((message) => updates(message as UpdateWalletUserRes)) as UpdateWalletUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateWalletUserRes create() => UpdateWalletUserRes._();
  UpdateWalletUserRes createEmptyInstance() => create();
  static $pb.PbList<UpdateWalletUserRes> createRepeated() => $pb.PbList<UpdateWalletUserRes>();
  @$core.pragma('dart2js:noInline')
  static UpdateWalletUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateWalletUserRes>(create);
  static UpdateWalletUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ListWalletUserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListWalletUserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'AccessToken', protoName: 'AccessToken')
    ..hasRequiredFields = false
  ;

  ListWalletUserReq._() : super();
  factory ListWalletUserReq({
    $core.String? accessToken,
  }) {
    final _result = create();
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    return _result;
  }
  factory ListWalletUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListWalletUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListWalletUserReq clone() => ListWalletUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListWalletUserReq copyWith(void Function(ListWalletUserReq) updates) => super.copyWith((message) => updates(message as ListWalletUserReq)) as ListWalletUserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListWalletUserReq create() => ListWalletUserReq._();
  ListWalletUserReq createEmptyInstance() => create();
  static $pb.PbList<ListWalletUserReq> createRepeated() => $pb.PbList<ListWalletUserReq>();
  @$core.pragma('dart2js:noInline')
  static ListWalletUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListWalletUserReq>(create);
  static ListWalletUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);
}

class ListWalletUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListWalletUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  ListWalletUserRes._() : super();
  factory ListWalletUserRes({
    User? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory ListWalletUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListWalletUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListWalletUserRes clone() => ListWalletUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListWalletUserRes copyWith(void Function(ListWalletUserRes) updates) => super.copyWith((message) => updates(message as ListWalletUserRes)) as ListWalletUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListWalletUserRes create() => ListWalletUserRes._();
  ListWalletUserRes createEmptyInstance() => create();
  static $pb.PbList<ListWalletUserRes> createRepeated() => $pb.PbList<ListWalletUserRes>();
  @$core.pragma('dart2js:noInline')
  static ListWalletUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListWalletUserRes>(create);
  static ListWalletUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class Event extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Event', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authorId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..hasRequiredFields = false
  ;

  Event._() : super();
  factory Event({
    $core.String? id,
    $core.String? authorId,
    $core.String? title,
    $core.String? content,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (authorId != null) {
      _result.authorId = authorId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory Event.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event clone() => Event()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event copyWith(void Function(Event) updates) => super.copyWith((message) => updates(message as Event)) as Event; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();
  Event createEmptyInstance() => create();
  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();
  @$core.pragma('dart2js:noInline')
  static Event getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get authorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set authorId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthorId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);
}

class CreateEventReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateEventReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<Event>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: Event.create)
    ..hasRequiredFields = false
  ;

  CreateEventReq._() : super();
  factory CreateEventReq({
    Event? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory CreateEventReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateEventReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateEventReq clone() => CreateEventReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateEventReq copyWith(void Function(CreateEventReq) updates) => super.copyWith((message) => updates(message as CreateEventReq)) as CreateEventReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateEventReq create() => CreateEventReq._();
  CreateEventReq createEmptyInstance() => create();
  static $pb.PbList<CreateEventReq> createRepeated() => $pb.PbList<CreateEventReq>();
  @$core.pragma('dart2js:noInline')
  static CreateEventReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateEventReq>(create);
  static CreateEventReq? _defaultInstance;

  @$pb.TagNumber(1)
  Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event(Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  Event ensureEvent() => $_ensure(0);
}

class CreateEventRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateEventRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<Event>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: Event.create)
    ..hasRequiredFields = false
  ;

  CreateEventRes._() : super();
  factory CreateEventRes({
    Event? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory CreateEventRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateEventRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateEventRes clone() => CreateEventRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateEventRes copyWith(void Function(CreateEventRes) updates) => super.copyWith((message) => updates(message as CreateEventRes)) as CreateEventRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateEventRes create() => CreateEventRes._();
  CreateEventRes createEmptyInstance() => create();
  static $pb.PbList<CreateEventRes> createRepeated() => $pb.PbList<CreateEventRes>();
  @$core.pragma('dart2js:noInline')
  static CreateEventRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateEventRes>(create);
  static CreateEventRes? _defaultInstance;

  @$pb.TagNumber(1)
  Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event(Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  Event ensureEvent() => $_ensure(0);
}

class ReadEventReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReadEventReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  ReadEventReq._() : super();
  factory ReadEventReq({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory ReadEventReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadEventReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadEventReq clone() => ReadEventReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadEventReq copyWith(void Function(ReadEventReq) updates) => super.copyWith((message) => updates(message as ReadEventReq)) as ReadEventReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadEventReq create() => ReadEventReq._();
  ReadEventReq createEmptyInstance() => create();
  static $pb.PbList<ReadEventReq> createRepeated() => $pb.PbList<ReadEventReq>();
  @$core.pragma('dart2js:noInline')
  static ReadEventReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadEventReq>(create);
  static ReadEventReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ReadEventRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReadEventRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<Event>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: Event.create)
    ..hasRequiredFields = false
  ;

  ReadEventRes._() : super();
  factory ReadEventRes({
    Event? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory ReadEventRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadEventRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadEventRes clone() => ReadEventRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadEventRes copyWith(void Function(ReadEventRes) updates) => super.copyWith((message) => updates(message as ReadEventRes)) as ReadEventRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadEventRes create() => ReadEventRes._();
  ReadEventRes createEmptyInstance() => create();
  static $pb.PbList<ReadEventRes> createRepeated() => $pb.PbList<ReadEventRes>();
  @$core.pragma('dart2js:noInline')
  static ReadEventRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadEventRes>(create);
  static ReadEventRes? _defaultInstance;

  @$pb.TagNumber(1)
  Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event(Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  Event ensureEvent() => $_ensure(0);
}

class UpdateEventReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateEventReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<Event>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: Event.create)
    ..hasRequiredFields = false
  ;

  UpdateEventReq._() : super();
  factory UpdateEventReq({
    Event? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory UpdateEventReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEventReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEventReq clone() => UpdateEventReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEventReq copyWith(void Function(UpdateEventReq) updates) => super.copyWith((message) => updates(message as UpdateEventReq)) as UpdateEventReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateEventReq create() => UpdateEventReq._();
  UpdateEventReq createEmptyInstance() => create();
  static $pb.PbList<UpdateEventReq> createRepeated() => $pb.PbList<UpdateEventReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateEventReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEventReq>(create);
  static UpdateEventReq? _defaultInstance;

  @$pb.TagNumber(1)
  Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event(Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  Event ensureEvent() => $_ensure(0);
}

class UpdateEventRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateEventRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<Event>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: Event.create)
    ..hasRequiredFields = false
  ;

  UpdateEventRes._() : super();
  factory UpdateEventRes({
    Event? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory UpdateEventRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEventRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEventRes clone() => UpdateEventRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEventRes copyWith(void Function(UpdateEventRes) updates) => super.copyWith((message) => updates(message as UpdateEventRes)) as UpdateEventRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateEventRes create() => UpdateEventRes._();
  UpdateEventRes createEmptyInstance() => create();
  static $pb.PbList<UpdateEventRes> createRepeated() => $pb.PbList<UpdateEventRes>();
  @$core.pragma('dart2js:noInline')
  static UpdateEventRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEventRes>(create);
  static UpdateEventRes? _defaultInstance;

  @$pb.TagNumber(1)
  Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event(Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  Event ensureEvent() => $_ensure(0);
}

class DeleteEventReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteEventReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DeleteEventReq._() : super();
  factory DeleteEventReq({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DeleteEventReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteEventReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteEventReq clone() => DeleteEventReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteEventReq copyWith(void Function(DeleteEventReq) updates) => super.copyWith((message) => updates(message as DeleteEventReq)) as DeleteEventReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteEventReq create() => DeleteEventReq._();
  DeleteEventReq createEmptyInstance() => create();
  static $pb.PbList<DeleteEventReq> createRepeated() => $pb.PbList<DeleteEventReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteEventReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteEventReq>(create);
  static DeleteEventReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteEventRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteEventRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  DeleteEventRes._() : super();
  factory DeleteEventRes({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory DeleteEventRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteEventRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteEventRes clone() => DeleteEventRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteEventRes copyWith(void Function(DeleteEventRes) updates) => super.copyWith((message) => updates(message as DeleteEventRes)) as DeleteEventRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteEventRes create() => DeleteEventRes._();
  DeleteEventRes createEmptyInstance() => create();
  static $pb.PbList<DeleteEventRes> createRepeated() => $pb.PbList<DeleteEventRes>();
  @$core.pragma('dart2js:noInline')
  static DeleteEventRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteEventRes>(create);
  static DeleteEventRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ListEventsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListEventsReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListEventsReq._() : super();
  factory ListEventsReq() => create();
  factory ListEventsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEventsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEventsReq clone() => ListEventsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEventsReq copyWith(void Function(ListEventsReq) updates) => super.copyWith((message) => updates(message as ListEventsReq)) as ListEventsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListEventsReq create() => ListEventsReq._();
  ListEventsReq createEmptyInstance() => create();
  static $pb.PbList<ListEventsReq> createRepeated() => $pb.PbList<ListEventsReq>();
  @$core.pragma('dart2js:noInline')
  static ListEventsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEventsReq>(create);
  static ListEventsReq? _defaultInstance;
}

class ListEventsRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListEventsRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOM<Event>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'event', subBuilder: Event.create)
    ..hasRequiredFields = false
  ;

  ListEventsRes._() : super();
  factory ListEventsRes({
    Event? event,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory ListEventsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEventsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEventsRes clone() => ListEventsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEventsRes copyWith(void Function(ListEventsRes) updates) => super.copyWith((message) => updates(message as ListEventsRes)) as ListEventsRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListEventsRes create() => ListEventsRes._();
  ListEventsRes createEmptyInstance() => create();
  static $pb.PbList<ListEventsRes> createRepeated() => $pb.PbList<ListEventsRes>();
  @$core.pragma('dart2js:noInline')
  static ListEventsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEventsRes>(create);
  static ListEventsRes? _defaultInstance;

  @$pb.TagNumber(1)
  Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event(Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  Event ensureEvent() => $_ensure(0);
}

class Chunk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Chunk', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Content', $pb.PbFieldType.OY, protoName: 'Content')
    ..hasRequiredFields = false
  ;

  Chunk._() : super();
  factory Chunk({
    $core.List<$core.int>? content,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory Chunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Chunk clone() => Chunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Chunk copyWith(void Function(Chunk) updates) => super.copyWith((message) => updates(message as Chunk)) as Chunk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Chunk create() => Chunk._();
  Chunk createEmptyInstance() => create();
  static $pb.PbList<Chunk> createRepeated() => $pb.PbList<Chunk>();
  @$core.pragma('dart2js:noInline')
  static Chunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chunk>(create);
  static Chunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get content => $_getN(0);
  @$pb.TagNumber(1)
  set content($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
}

class DownloadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DownloadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileName', protoName: 'fileName')
    ..hasRequiredFields = false
  ;

  DownloadReq._() : super();
  factory DownloadReq({
    $core.String? fileName,
  }) {
    final _result = create();
    if (fileName != null) {
      _result.fileName = fileName;
    }
    return _result;
  }
  factory DownloadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadReq clone() => DownloadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadReq copyWith(void Function(DownloadReq) updates) => super.copyWith((message) => updates(message as DownloadReq)) as DownloadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DownloadReq create() => DownloadReq._();
  DownloadReq createEmptyInstance() => create();
  static $pb.PbList<DownloadReq> createRepeated() => $pb.PbList<DownloadReq>();
  @$core.pragma('dart2js:noInline')
  static DownloadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadReq>(create);
  static DownloadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileName() => clearField(1);
}


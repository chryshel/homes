// Mocks generated by Mockito 5.4.4 from annotations
// in homzes_app/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:typed_data' as _i11;

import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart'
    as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:firebase_core/firebase_core.dart' as _i4;
import 'package:homzes_app/core/error/faliure.dart' as _i8;
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart'
    as _i9;
import 'package:homzes_app/features/get_rentals/domain/repositories/rental_repository.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDocumentReference_1<T1 extends Object?> extends _i1.SmartFake
    implements _i3.DocumentReference<T1> {
  _FakeDocumentReference_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSnapshotMetadata_2 extends _i1.SmartFake
    implements _i3.SnapshotMetadata {
  _FakeSnapshotMetadata_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseApp_3 extends _i1.SmartFake implements _i4.FirebaseApp {
  _FakeFirebaseApp_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSettings_4 extends _i1.SmartFake implements _i5.Settings {
  _FakeSettings_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCollectionReference_5<T extends Object?> extends _i1.SmartFake
    implements _i3.CollectionReference<T> {
  _FakeCollectionReference_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWriteBatch_6 extends _i1.SmartFake implements _i3.WriteBatch {
  _FakeWriteBatch_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoadBundleTask_7 extends _i1.SmartFake
    implements _i3.LoadBundleTask {
  _FakeLoadBundleTask_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuerySnapshot_8<T1 extends Object?> extends _i1.SmartFake
    implements _i3.QuerySnapshot<T1> {
  _FakeQuerySnapshot_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuery_9<T extends Object?> extends _i1.SmartFake
    implements _i3.Query<T> {
  _FakeQuery_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFuture_10<T1> extends _i1.SmartFake implements _i6.Future<T1> {
  _FakeFuture_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RentalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRentalRepository extends _i1.Mock implements _i7.RentalRepository {
  MockRentalRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i8.Failure, List<_i9.RentalsEntity>>> getRentals() =>
      (super.noSuchMethod(
        Invocation.method(
          #getRentals,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i8.Failure, List<_i9.RentalsEntity>>>.value(
                _FakeEither_0<_i8.Failure, List<_i9.RentalsEntity>>(
          this,
          Invocation.method(
            #getRentals,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i8.Failure, List<_i9.RentalsEntity>>>);
}

/// A class which mocks [DocumentSnapshot].
///
/// See the documentation for Mockito's code generation for more information.
class MockDocumentSnapshot<T extends Object?> extends _i1.Mock
    implements _i3.DocumentSnapshot<T> {
  MockDocumentSnapshot() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.getter(#id),
        ),
      ) as String);

  @override
  _i3.DocumentReference<T> get reference => (super.noSuchMethod(
        Invocation.getter(#reference),
        returnValue: _FakeDocumentReference_1<T>(
          this,
          Invocation.getter(#reference),
        ),
      ) as _i3.DocumentReference<T>);

  @override
  _i3.SnapshotMetadata get metadata => (super.noSuchMethod(
        Invocation.getter(#metadata),
        returnValue: _FakeSnapshotMetadata_2(
          this,
          Invocation.getter(#metadata),
        ),
      ) as _i3.SnapshotMetadata);

  @override
  bool get exists => (super.noSuchMethod(
        Invocation.getter(#exists),
        returnValue: false,
      ) as bool);

  @override
  dynamic get(Object? field) => super.noSuchMethod(Invocation.method(
        #get,
        [field],
      ));

  @override
  dynamic operator [](Object? field) => super.noSuchMethod(Invocation.method(
        #[],
        [field],
      ));
}

/// A class which mocks [FirebaseFirestore].
///
/// See the documentation for Mockito's code generation for more information.
class MockFireStore extends _i1.Mock implements _i3.FirebaseFirestore {
  MockFireStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FirebaseApp get app => (super.noSuchMethod(
        Invocation.getter(#app),
        returnValue: _FakeFirebaseApp_3(
          this,
          Invocation.getter(#app),
        ),
      ) as _i4.FirebaseApp);

  @override
  set app(_i4.FirebaseApp? _app) => super.noSuchMethod(
        Invocation.setter(
          #app,
          _app,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get databaseURL => (super.noSuchMethod(
        Invocation.getter(#databaseURL),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.getter(#databaseURL),
        ),
      ) as String);

  @override
  set databaseURL(String? _databaseURL) => super.noSuchMethod(
        Invocation.setter(
          #databaseURL,
          _databaseURL,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get databaseId => (super.noSuchMethod(
        Invocation.getter(#databaseId),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.getter(#databaseId),
        ),
      ) as String);

  @override
  set databaseId(String? _databaseId) => super.noSuchMethod(
        Invocation.setter(
          #databaseId,
          _databaseId,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set settings(_i5.Settings? settings) => super.noSuchMethod(
        Invocation.setter(
          #settings,
          settings,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Settings get settings => (super.noSuchMethod(
        Invocation.getter(#settings),
        returnValue: _FakeSettings_4(
          this,
          Invocation.getter(#settings),
        ),
      ) as _i5.Settings);

  @override
  Map<dynamic, dynamic> get pluginConstants => (super.noSuchMethod(
        Invocation.getter(#pluginConstants),
        returnValue: <dynamic, dynamic>{},
      ) as Map<dynamic, dynamic>);

  @override
  _i3.CollectionReference<Map<String, dynamic>> collection(
          String? collectionPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #collection,
          [collectionPath],
        ),
        returnValue: _FakeCollectionReference_5<Map<String, dynamic>>(
          this,
          Invocation.method(
            #collection,
            [collectionPath],
          ),
        ),
      ) as _i3.CollectionReference<Map<String, dynamic>>);

  @override
  _i3.WriteBatch batch() => (super.noSuchMethod(
        Invocation.method(
          #batch,
          [],
        ),
        returnValue: _FakeWriteBatch_6(
          this,
          Invocation.method(
            #batch,
            [],
          ),
        ),
      ) as _i3.WriteBatch);

  @override
  _i6.Future<void> clearPersistence() => (super.noSuchMethod(
        Invocation.method(
          #clearPersistence,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> enablePersistence(
          [_i5.PersistenceSettings? persistenceSettings]) =>
      (super.noSuchMethod(
        Invocation.method(
          #enablePersistence,
          [persistenceSettings],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i3.LoadBundleTask loadBundle(_i11.Uint8List? bundle) => (super.noSuchMethod(
        Invocation.method(
          #loadBundle,
          [bundle],
        ),
        returnValue: _FakeLoadBundleTask_7(
          this,
          Invocation.method(
            #loadBundle,
            [bundle],
          ),
        ),
      ) as _i3.LoadBundleTask);

  @override
  void useFirestoreEmulator(
    String? host,
    int? port, {
    bool? sslEnabled = false,
    bool? automaticHostMapping = true,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #useFirestoreEmulator,
          [
            host,
            port,
          ],
          {
            #sslEnabled: sslEnabled,
            #automaticHostMapping: automaticHostMapping,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<_i3.QuerySnapshot<T>> namedQueryWithConverterGet<T>(
    String? name, {
    _i5.GetOptions? options = const _i5.GetOptions(),
    required _i3.FromFirestore<T>? fromFirestore,
    required _i3.ToFirestore<T>? toFirestore,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #namedQueryWithConverterGet,
          [name],
          {
            #options: options,
            #fromFirestore: fromFirestore,
            #toFirestore: toFirestore,
          },
        ),
        returnValue:
            _i6.Future<_i3.QuerySnapshot<T>>.value(_FakeQuerySnapshot_8<T>(
          this,
          Invocation.method(
            #namedQueryWithConverterGet,
            [name],
            {
              #options: options,
              #fromFirestore: fromFirestore,
              #toFirestore: toFirestore,
            },
          ),
        )),
      ) as _i6.Future<_i3.QuerySnapshot<T>>);

  @override
  _i6.Future<_i3.QuerySnapshot<Map<String, dynamic>>> namedQueryGet(
    String? name, {
    _i5.GetOptions? options = const _i5.GetOptions(),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #namedQueryGet,
          [name],
          {#options: options},
        ),
        returnValue: _i6.Future<_i3.QuerySnapshot<Map<String, dynamic>>>.value(
            _FakeQuerySnapshot_8<Map<String, dynamic>>(
          this,
          Invocation.method(
            #namedQueryGet,
            [name],
            {#options: options},
          ),
        )),
      ) as _i6.Future<_i3.QuerySnapshot<Map<String, dynamic>>>);

  @override
  _i3.Query<Map<String, dynamic>> collectionGroup(String? collectionPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #collectionGroup,
          [collectionPath],
        ),
        returnValue: _FakeQuery_9<Map<String, dynamic>>(
          this,
          Invocation.method(
            #collectionGroup,
            [collectionPath],
          ),
        ),
      ) as _i3.Query<Map<String, dynamic>>);

  @override
  _i6.Future<void> disableNetwork() => (super.noSuchMethod(
        Invocation.method(
          #disableNetwork,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i3.DocumentReference<Map<String, dynamic>> doc(String? documentPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #doc,
          [documentPath],
        ),
        returnValue: _FakeDocumentReference_1<Map<String, dynamic>>(
          this,
          Invocation.method(
            #doc,
            [documentPath],
          ),
        ),
      ) as _i3.DocumentReference<Map<String, dynamic>>);

  @override
  _i6.Future<void> enableNetwork() => (super.noSuchMethod(
        Invocation.method(
          #enableNetwork,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Stream<void> snapshotsInSync() => (super.noSuchMethod(
        Invocation.method(
          #snapshotsInSync,
          [],
        ),
        returnValue: _i6.Stream<void>.empty(),
      ) as _i6.Stream<void>);

  @override
  _i6.Future<T> runTransaction<T>(
    _i3.TransactionHandler<T>? transactionHandler, {
    Duration? timeout = const Duration(seconds: 30),
    int? maxAttempts = 5,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #runTransaction,
          [transactionHandler],
          {
            #timeout: timeout,
            #maxAttempts: maxAttempts,
          },
        ),
        returnValue: _i10.ifNotNull(
              _i10.dummyValueOrNull<T>(
                this,
                Invocation.method(
                  #runTransaction,
                  [transactionHandler],
                  {
                    #timeout: timeout,
                    #maxAttempts: maxAttempts,
                  },
                ),
              ),
              (T v) => _i6.Future<T>.value(v),
            ) ??
            _FakeFuture_10<T>(
              this,
              Invocation.method(
                #runTransaction,
                [transactionHandler],
                {
                  #timeout: timeout,
                  #maxAttempts: maxAttempts,
                },
              ),
            ),
      ) as _i6.Future<T>);

  @override
  _i6.Future<void> terminate() => (super.noSuchMethod(
        Invocation.method(
          #terminate,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> waitForPendingWrites() => (super.noSuchMethod(
        Invocation.method(
          #waitForPendingWrites,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> setIndexConfiguration({
    required List<_i5.Index>? indexes,
    List<_i5.FieldOverrides>? fieldOverrides,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setIndexConfiguration,
          [],
          {
            #indexes: indexes,
            #fieldOverrides: fieldOverrides,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> setIndexConfigurationFromJSON(String? json) =>
      (super.noSuchMethod(
        Invocation.method(
          #setIndexConfigurationFromJSON,
          [json],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

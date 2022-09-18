// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'expense.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ExpenseCollectionReference
    implements
        ExpenseQuery,
        FirestoreCollectionReference<Expense, ExpenseQuerySnapshot> {
  factory ExpenseCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$ExpenseCollectionReference;

  static Expense fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$ExpenseFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Expense value,
    SetOptions? options,
  ) {
    return _$ExpenseToJson(value);
  }

  @override
  CollectionReference<Expense> get reference;

  @override
  ExpenseDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ExpenseDocumentReference> add(Expense value);
}

class _$ExpenseCollectionReference extends _$ExpenseQuery
    implements ExpenseCollectionReference {
  factory _$ExpenseCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$ExpenseCollectionReference._(
      firestore.collection('expenses').withConverter(
            fromFirestore: ExpenseCollectionReference.fromFirestore,
            toFirestore: ExpenseCollectionReference.toFirestore,
          ),
    );
  }

  _$ExpenseCollectionReference._(
    CollectionReference<Expense> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Expense> get reference =>
      super.reference as CollectionReference<Expense>;

  @override
  ExpenseDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ExpenseDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ExpenseDocumentReference> add(Expense value) {
    return reference.add(value).then((ref) => ExpenseDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExpenseCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ExpenseDocumentReference
    extends FirestoreDocumentReference<Expense, ExpenseDocumentSnapshot> {
  factory ExpenseDocumentReference(DocumentReference<Expense> reference) =
      _$ExpenseDocumentReference;

  DocumentReference<Expense> get reference;

  /// A reference to the [ExpenseCollectionReference] containing this document.
  ExpenseCollectionReference get parent {
    return _$ExpenseCollectionReference(reference.firestore);
  }

  @override
  Stream<ExpenseDocumentSnapshot> snapshots();

  @override
  Future<ExpenseDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String userId,
    String name,
    double price,
    DateTime? createdAt,
  });

  Future<void> set(Expense value);
}

class _$ExpenseDocumentReference
    extends FirestoreDocumentReference<Expense, ExpenseDocumentSnapshot>
    implements ExpenseDocumentReference {
  _$ExpenseDocumentReference(this.reference);

  @override
  final DocumentReference<Expense> reference;

  /// A reference to the [ExpenseCollectionReference] containing this document.
  ExpenseCollectionReference get parent {
    return _$ExpenseCollectionReference(reference.firestore);
  }

  @override
  Stream<ExpenseDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ExpenseDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ExpenseDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ExpenseDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? userId = _sentinel,
    Object? name = _sentinel,
    Object? price = _sentinel,
    Object? createdAt = _sentinel,
  }) async {
    final json = {
      if (userId != _sentinel) "userId": userId as String,
      if (name != _sentinel) "name": name as String,
      if (price != _sentinel) "price": price as double,
      if (createdAt != _sentinel) "createdAt": createdAt as DateTime?,
    };

    return reference.update(json);
  }

  Future<void> set(Expense value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ExpenseDocumentSnapshot extends FirestoreDocumentSnapshot<Expense> {
  ExpenseDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Expense> snapshot;

  @override
  ExpenseDocumentReference get reference {
    return ExpenseDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Expense? data;
}

abstract class ExpenseQuery
    implements QueryReference<Expense, ExpenseQuerySnapshot> {
  @override
  ExpenseQuery limit(int limit);

  @override
  ExpenseQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  ExpenseQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  ExpenseQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  ExpenseQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ExpenseQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ExpenseQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ExpenseQuery wherePrice({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  ExpenseQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });

  ExpenseQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByUserId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByPrice({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });
}

class _$ExpenseQuery extends QueryReference<Expense, ExpenseQuerySnapshot>
    implements ExpenseQuery {
  _$ExpenseQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Expense> reference;

  ExpenseQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Expense> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ExpenseQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ExpenseDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ExpenseDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ExpenseQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ExpenseQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ExpenseQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ExpenseQuery limit(int limit) {
    return _$ExpenseQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ExpenseQuery limitToLast(int limit) {
    return _$ExpenseQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ExpenseQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ExpenseQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  ExpenseQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ExpenseQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ExpenseQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ExpenseQuery(
      reference.where(
        _$ExpenseFieldMap["userId"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ExpenseQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ExpenseQuery(
      reference.where(
        _$ExpenseFieldMap["name"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ExpenseQuery wherePrice({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$ExpenseQuery(
      reference.where(
        _$ExpenseFieldMap["price"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ExpenseQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$ExpenseQuery(
      reference.where(
        _$ExpenseFieldMap["createdAt"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ExpenseQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$ExpenseFieldMap["userId"]!, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$ExpenseFieldMap["name"]!, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$ExpenseFieldMap["price"]!, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$ExpenseFieldMap["createdAt"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ExpenseQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExpenseQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ExpenseQuerySnapshot
    extends FirestoreQuerySnapshot<Expense, ExpenseQueryDocumentSnapshot> {
  ExpenseQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Expense> snapshot;

  @override
  final List<ExpenseQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ExpenseDocumentSnapshot>> docChanges;
}

class ExpenseQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Expense>
    implements ExpenseDocumentSnapshot {
  ExpenseQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Expense> snapshot;

  @override
  ExpenseDocumentReference get reference {
    return ExpenseDocumentReference(snapshot.reference);
  }

  @override
  final Expense data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
      userId: json['user_id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

const _$ExpenseFieldMap = <String, String>{
  'userId': 'user_id',
  'name': 'name',
  'price': 'price',
  'createdAt': 'created_at',
};

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'price': instance.price,
      'created_at': instance.createdAt?.toIso8601String(),
    };

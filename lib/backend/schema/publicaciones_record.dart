import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PublicacionesRecord extends FirestoreRecord {
  PublicacionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  void _initializeFields() {
    _fecha = snapshotData['fecha'] as DateTime?;
    _comentario = snapshotData['comentario'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('publicaciones');

  static Stream<PublicacionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PublicacionesRecord.fromSnapshot(s));

  static Future<PublicacionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PublicacionesRecord.fromSnapshot(s));

  static PublicacionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PublicacionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PublicacionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PublicacionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PublicacionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PublicacionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPublicacionesRecordData({
  DateTime? fecha,
  String? comentario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha': fecha,
      'comentario': comentario,
    }.withoutNulls,
  );

  return firestoreData;
}

class PublicacionesRecordDocumentEquality
    implements Equality<PublicacionesRecord> {
  const PublicacionesRecordDocumentEquality();

  @override
  bool equals(PublicacionesRecord? e1, PublicacionesRecord? e2) {
    return e1?.fecha == e2?.fecha && e1?.comentario == e2?.comentario;
  }

  @override
  int hash(PublicacionesRecord? e) =>
      const ListEquality().hash([e?.fecha, e?.comentario]);

  @override
  bool isValidKey(Object? o) => o is PublicacionesRecord;
}

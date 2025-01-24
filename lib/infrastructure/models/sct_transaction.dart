import 'package:cloud_firestore/cloud_firestore.dart';

class SctTransaction {
  final int sctId;
  final String sctOrigin;
  final String sctDestination;
  final double sctAmount;
  final DateTime sctDueDate;
  final DateTime sctCreatedAt;
  final String sctType;
  final String sctStatus;

  SctTransaction(
      {required this.sctId,
      required this.sctAmount,
      required this.sctCreatedAt,
      required this.sctDestination,
      required this.sctDueDate,
      required this.sctOrigin,
      required this.sctStatus,
      required this.sctType});

  factory SctTransaction.fromJson(Map<String, dynamic> json) {
    print('fromJson');
    return SctTransaction(
        sctId: json['sct_id'],
        sctAmount: (json['sct_amount'] as int).toDouble(),
        sctCreatedAt:(json['sct_created_at'] as Timestamp).toDate(),
        sctDestination: json['sct_destination'],
        sctOrigin: json['sct_origin'],
        sctDueDate: (json['sct_due_date'] as Timestamp).toDate(),
        sctStatus: json['sct_status'],
        sctType: json['sct_type']);
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'description': description,
  //     'amount': amount,
  //     'date': date.toIso8601String(),
  //   };
  // }
}

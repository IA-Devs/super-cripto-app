class SctTransaction {
  final String sctId;
  final String sctOrigin;
  final String sctDestination;
  final double sctAmount;
  final DateTime? sctDueDate;
  final DateTime sctCreatedAt;
  final String sctType;
  final String sctStatus;
  final String sctAccId;

  SctTransaction(
      {required this.sctId,
      required this.sctAmount,
      required this.sctCreatedAt,
      required this.sctDestination,
      this.sctDueDate,
      required this.sctOrigin,
      required this.sctStatus,
      required this.sctType,
      required this.sctAccId});

  factory SctTransaction.fromJson(Map<String, dynamic> json) {
    return SctTransaction(
      sctId: json['sct_id'],
      sctAmount: (json['sct_amount'] as int).toDouble(),
      sctDestination: json['sct_destination'],
      sctOrigin: json['sct_origin'],
      sctStatus: json['sct_status'],
      sctType: json['sct_type'],
      sctAccId: json['sct_acc_id'],
      sctDueDate: json['sct_due_date'] != null
          ? DateTime.parse(json['sct_due_date'])
          : null,
      sctCreatedAt: DateTime.parse(json['sct_created_at']),
    );
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

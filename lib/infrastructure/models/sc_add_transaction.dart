class ScAddTransaction {
  final String sctOrigin;
  final String sctDestination;
  final double sctAmount;
  final String sctType;
  final String sctAccId;

  ScAddTransaction(
      {required this.sctOrigin,
      required this.sctDestination,
      required this.sctAmount,
      required this.sctType,
      required this.sctAccId});

  Map<String, dynamic> toJson() => {
        'sc_acc_id': sctAccId,
        'sc_origin': sctOrigin,
        'sc_destination': sctDestination,
        'sc_amount': sctAmount,
        'sc_type': sctType,
      };
}

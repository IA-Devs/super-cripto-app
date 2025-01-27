class ScAccount {
  final double scAccAvailableBalance;
  final String scAccFirstName;
  final String scAccLastName;
  final String scAccId;
  final String scAccUserId;

  ScAccount(
      {required this.scAccAvailableBalance,
      required this.scAccFirstName,
      required this.scAccLastName,
      required this.scAccId,
      required this.scAccUserId});

  factory ScAccount.fromJson(Map<String, dynamic> json) {
    return ScAccount(
        scAccAvailableBalance: json['sc_acc_available_balance'].toDouble(),
        scAccFirstName: json['sc_acc_firstname'],
        scAccLastName: json['sc_acc_lastname'],
        scAccId: json['sc_acc_id'],
        scAccUserId: json['sc_acc_user_id']);
  }
}

// sc_acc_available_balance
// 4598
// (número)


// sc_acc_firstname
// "Daniel"
// (cadena)


// sc_acc_id
// "1"
// (cadena)


// sc_acc_lastname
// "Arza"
// (cadena)


// sc_acc_user_id
// "1234"
// (cadena)
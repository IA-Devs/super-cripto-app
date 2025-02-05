class ScAccount {
  final double scAccAvailableBalance;
  final String scAccFirstName;
  final String scAccLastName;
  final String scAccId;
  final String scAccUserId;
  final String scAccCvu;
  final String scAccAlias;
  final String scAccBankName;

  ScAccount(
      {required this.scAccAvailableBalance,
      required this.scAccFirstName,
      required this.scAccLastName,
      required this.scAccId,
      required this.scAccUserId,
      required this.scAccAlias,
      required this.scAccCvu,
      required this.scAccBankName});

  factory ScAccount.fromJson(Map<String, dynamic> json) {
    return ScAccount(
        scAccAvailableBalance: json['sc_acc_available_balance'].toDouble(),
        scAccFirstName: json['sc_acc_firstname'],
        scAccLastName: json['sc_acc_lastname'],
        scAccId: json['sc_acc_id'],
        scAccUserId: json['sc_acc_user_id'],
        scAccAlias: json['sc_acc_alias'],
        scAccCvu: json['sc_acc_cvu'],
        scAccBankName: json['sc_acc_bankname']
        );
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
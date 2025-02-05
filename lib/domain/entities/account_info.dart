class AccountInfo {
  final String id;
  final String firstname;
  final String lastname;
  final String userId;
  final double balance;
  final String accountNumber;
  final String accountAlias;
  final String bankName;

  AccountInfo({
    required this.balance,
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.userId,
    required this.accountNumber,
    required this.accountAlias,
    required this.bankName,
  })  : assert(accountAlias.isNotEmpty, 'The account should have alias'),
        assert(accountNumber.isNotEmpty, 'The account should have number');
}

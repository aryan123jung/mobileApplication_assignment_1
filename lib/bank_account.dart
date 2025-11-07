abstract class BankAccount{
  final double accountNumber;
  final String fname;
  final String lname;
  double _balance; // private because we’ll control it with getters/setters

  BankAccount(this.accountNumber,this.fname,this.lname,this._balance);

  String getAccHolderName(){
    return '$fname $lname';
  }

  double get balance => _balance;
  set balance(double newBalance){
    if(newBalance >= 0){
      _balance = newBalance;
    }else{
      throw Exception("Balance cannot be negative");
    }
  }

   void deposit(double amount);
   void withdraw(double amount);

} 

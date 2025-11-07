import 'package:meta/meta.dart'; // for @protected

abstract class BankAccount{
  final double accountNumber;
  final String fname;
  final String lname;
  double _balance; 

  BankAccount(this.accountNumber,this.fname,this.lname,this._balance);

  String getAccHolderName(){
    return '$fname $lname';
  }

  // double get balance => _balance;
  // set balance(double newBalance){
  //   if(newBalance >= 0){
  //     _balance = newBalance;
  //   }else{
  //     throw Exception("Balance cannot be negative");
  //   }
  // }

  double get balance => _balance;


  @protected
  void setBalance(double value) => _balance = value;


   void deposit(double amount);
   void withdraw(double amount);

} 


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

class StudentAccount extends BankAccount{
  StudentAccount({
        required double  accountNumber,
    required String fname,
    required String lname,
    double initialBalance = 0,
  }):super(accountNumber,fname,lname,initialBalance);


  @override
  void deposit(double amount) {
    if(amount<=0){
      print("Amount must be positive");
      return;
    }

    if(balance + amount > 5000){
      print("Cannot exceed the maximum balance.");
      return;
    }
    setBalance(balance + amount);
    print("Deposited: \$$amount. New balance: \$$balance");

  }

  @override
  void withdraw(double amount) {
    if(amount <= 0){
      print("Amount must be positive");
      return;
    }

    if(balance - amount < 0){
      print("Insufficient funds");
      return;
    }
    if(amount > 0){
      setBalance(balance - amount);
      print("Withdrew: \$$amount. New balance: \$$balance");
    }
  }
}


void main (){
  StudentAccount myAccount4 = StudentAccount(
    accountNumber: 67352, 
    fname: "Hanagry", 
    lname: "Oliver",
    initialBalance: 100
    );

    print("Account holder: ${myAccount4.getAccHolderName()}");
    print("Initial balance: ${myAccount4.balance}");

    myAccount4.deposit(4000);
    myAccount4.deposit(900);
    myAccount4.deposit(100);

    myAccount4.withdraw(5000);
    myAccount4.withdraw(100);
}

import 'package:first_asssignment_bank/bank_account.dart';

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


// void main (){
//   StudentAccount myAccount4 = StudentAccount(
//     accountNumber: 67352, 
//     fname: "Hanagry", 
//     lname: "Oliver",
//     initialBalance: 100
//     );

//     print("Account holder: ${myAccount4.getAccHolderName()}");
//     print("Initial balance: ${myAccount4.balance}");

//     myAccount4.deposit(4000);
//     myAccount4.deposit(900);
//     myAccount4.deposit(100);

//     myAccount4.withdraw(5000);
//     myAccount4.withdraw(100);
// }

import 'package:first_asssignment_bank/bank_account.dart';

class PremiumAccount extends BankAccount{

  PremiumAccount({
    required double accountNumber,
    required String fname,
    required String lname,
    double initialBalance = 0,
  }):super(accountNumber, fname, lname, initialBalance);



  @override
  void deposit(double amount) {
    if(amount>0){
      setBalance(balance + amount);
      print("Deposited Balance: \$$amount. New Balance \$$balance");
    }else{
      print("Deposit must be positive.");
    }
  }

  @override
  void withdraw(double amount) {
    double minBalance = 10000;

    if(amount <= 0){
      print("Amount must be positive.");
      return;
    }

    if(amount > 0 && (balance - amount) >= minBalance){
      setBalance(balance - amount);
      print("Withdrew: \$$amount. Remaining balance: \$$balance");
    }else{
      print("Invalid withdraw amount or insufficient balance");
    }
  }
   double calculateInterest(){
      return balance * 0.05;
    }
}


void main(){
  PremiumAccount myAccount3 = PremiumAccount(
    accountNumber: 1865, 
    fname: "Shyam", 
    lname: "Bahadur",
    initialBalance: 10000
    );
    print("Account holder: ${myAccount3.getAccHolderName()}");
    print("Initial balance: \$${myAccount3.balance}");

    myAccount3.deposit(1200);

    myAccount3.withdraw(1200);
    myAccount3.withdraw(100);

    print("Interest : \$${myAccount3.calculateInterest()}");
}
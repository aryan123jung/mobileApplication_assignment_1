
import 'package:first_asssignment_bank/bank_account.dart';

class CheckingAccount extends BankAccount {
  CheckingAccount({
    required double accountNumber,
    required String fname,
    required String lname,
    double initialBalance = 0,
  }) : super(accountNumber, fname, lname, initialBalance);


  @override
  void deposit(double amount) {
    if(amount>0){
      setBalance(balance + amount);
      print("Deposited $amount. New Balance: $balance");
    }else{
      print("Deposit must be positive.");
    }
  }
  
  // @override
  // set balance(double newBalance){
  //   _balance = newBalance;
  // }

  @override
  void withdraw(double amount) {

    if(amount <= 0){
      print("Withdrawl amount must be positive.");
      return;
    }
    
    double oldBalance = balance;
    setBalance(balance - amount);

    if(oldBalance >= 0 && balance <0){
      setBalance(balance - 35);
      print("Overdraft! A \$35 fee has been applied.");
    }

    print("Withdrew \$${amount.toStringAsFixed(2)}. New Balance \$${balance.toStringAsFixed(2)}");
  }
}

void main(){
  CheckingAccount myAccount2 = CheckingAccount(
    accountNumber: 23455, 
    fname: "Hari", 
    lname: "Doe",
    initialBalance: 100
    );

    print("Account holder: ${myAccount2.getAccHolderName()}");
    print("Initial balance: ${myAccount2.balance}");

    myAccount2.deposit(100);

    myAccount2.withdraw(100);
    myAccount2.withdraw(50);
    myAccount2.withdraw(40);
    myAccount2.withdraw(50);
    myAccount2.withdraw(10);

    myAccount2.deposit(100);
    myAccount2.withdraw(10);
    myAccount2.withdraw(5);
    myAccount2.withdraw(5);
}


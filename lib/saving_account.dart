

import 'package:first_asssignment_bank/bank_account.dart';

class SavingAccount extends BankAccount{
  int _withdrawalsThisMonth = 0;

  SavingAccount({
    required double  accountNumber,
    required String fname,
    required String lname,
    double initialBalance = 0,
  }):super(accountNumber,fname,lname,initialBalance);


  @override
  void deposit(double amount){
    if(amount>0){
      balance += amount;
      print("Deposited $amount. New balance: $balance");
    }else{
      print("Deposit amount must be positive");
    }
  }
  
  @override
  void withdraw(double amount) {
    final double minBalance = 500;
   
   if(_withdrawalsThisMonth >= 3){
      print("Withdraw limit reached for this month");
      return;
    }

    if(amount>0 && (balance-amount) >= minBalance ){
      balance -= amount;
      _withdrawalsThisMonth ++;
      print("Withdrew $amount. Remaining balance: $balance");
    } else{
      print("Invalid withdraw amount or insufficient balance");
    }
  } 

  double calculateInterest(){
      return balance * 0.02;
  }
}


  
void main (){
  SavingAccount myAccount = SavingAccount(
    accountNumber: 123456, 
    fname: "Ram", 
    lname: "Doe",
    initialBalance: 1000,
    );

    print("Account holder: ${myAccount.getAccHolderName()}");
    print("Initial Balance: ${myAccount.balance}");

    myAccount.deposit(500);

    myAccount.withdraw(300);
    myAccount.withdraw(200);
    myAccount.withdraw(300);
    myAccount.withdraw(100);

    print("Interest : ${myAccount.calculateInterest()}");
}

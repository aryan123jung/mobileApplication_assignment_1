import 'package:first_asssignment_bank/bank_account.dart';
import 'saving_account.dart';
import 'checking_account.dart';
import 'premium_account.dart';
import 'student_account.dart';

class Bank {
  final List<BankAccount> _accounts = [];


  void addAccount(BankAccount account){
  _accounts.add(account);
  print("Account added for ${account.getAccHolderName()} with balance \$${account.balance}");
 }



 BankAccount? findAccount(double accountNumber){
  for(var acc in _accounts){
    if(acc.accountNumber == accountNumber){
      return acc;
    }
  }
  print("Account not found!");
  return null;
 }


  void transfer(double fromAccNumber, double toAccNumber, double amount){
    var fromAcc = findAccount(fromAccNumber);
    var toAcc = findAccount(toAccNumber);

    if(fromAcc == null || toAcc == null){
      print("Transfer failed: One or Both Accounts not Found.");
      return;
    }

    try{
      fromAcc.withdraw(amount);
      toAcc.deposit(amount);
      print("Transfered \$$amount from ${fromAcc.getAccHolderName()} to \$${toAcc.getAccHolderName()}");
    }catch(e) {
      print("Transfer Failed: $e");
    }
  }


  void generateReport(){
    print("===Bank Account Report==");
    for(var acc in _accounts){
      print("Account Number: ${acc.accountNumber}, Holder: ${acc.getAccHolderName()}, Balance: \$${acc.balance}");
    }
    print("================================================");
  }


}







void main() {
  Bank myBank = Bank();

  var savings = SavingAccount(accountNumber: 101, fname: 'Ram', lname: 'Doe', initialBalance: 1000);
  var checking = CheckingAccount(accountNumber: 102, fname: 'Hari', lname: 'Doe', initialBalance: 500);
  var premium = PremiumAccount(accountNumber: 103, fname: 'Shyam', lname: 'Bahadur', initialBalance: 15000);
  var student = StudentAccount(accountNumber: 104, fname: 'Sita', lname: 'Karki', initialBalance: 1000);

  print("--------------------------------------------------");

  myBank.addAccount(savings);
  myBank.addAccount(checking);
  myBank.addAccount(premium);
  myBank.addAccount(student);

  print("--------------------------------------------------");



  savings.deposit(200);
  checking.withdraw(100);
  student.deposit(4000); // Should show max balance warning if over 5000
  premium.withdraw(2000);


  print("--------------------------------------------------");


  myBank.transfer(101, 102, 150); 

  print("--------------------------------------------------");


  myBank.generateReport();
}

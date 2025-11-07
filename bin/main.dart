import 'package:first_asssignment_bank/bank.dart';
import 'package:first_asssignment_bank/checking_account.dart';
import 'package:first_asssignment_bank/premium_account.dart';
import 'package:first_asssignment_bank/saving_account.dart';
import 'package:first_asssignment_bank/student_account.dart';

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





  print("\n--- Performing Transactions ---");
  savings.deposit(200);               
  checking.withdraw(100);           
  student.deposit(4000);              
  premium.withdraw(2000);             




  print("--------------------------------------------------");




  print("\n--- Transfer Money ---");
  myBank.transfer(101, 102, 200);    
  myBank.transfer(101, 105, 200);    




  print("--------------------------------------------------");



  print("\n--- Bank Report ---");
  myBank.generateReport();


  print("--------------------------------------------------");


  print("\n--- Interest Calculation ---");
  print("Savings Account Interest: \$${savings.calculateInterest()}");
  print("Premium Account Interest: \$${premium.calculateInterest()}");


   print("\nSavings Account Transactions:");
  for (var th in savings.transactions) {
    print("- $th");
  }
}

abstract class BankAccount{
  final double accountNumber;
  final String fname;
  final String lname;
  double _balance; 

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
      balance +=amount;
      print("Deposited $amount. New Balance: $balance");
    }else{
      print("Deposit must be positive.");
    }
  }
  
  @override
  set balance(double newBalance){
    _balance = newBalance;
  }

  @override
  void withdraw(double amount) {

    if(amount <= 0){
      print("Withdrawl amount must be positive.");
      return;
    }
    
    double oldBalance = balance;
    balance -= amount;

    if(oldBalance >= 0 && balance <0){
      balance -= 35;
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


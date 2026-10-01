class Account {
  double balance;

  Account(this.balance);
}

mixin InterestCalculator on Account {
  double calculateInterest() {
    return balance * 0.05;
  }
}

class SavingsAccount extends Account with InterestCalculator {
  SavingsAccount(super.balance);
}

void main() {
  SavingsAccount account = SavingsAccount(90000);

  print("Account balance: ${account.balance}");
  print("Interest at 5%: ${account.calculateInterest()}");
}

import 'dart:io';

void main(){
  print("Adj meg egy számot: ");
  int? num = int.parse(stdin.readLineSync()!);

  if(num == 0)
  {
    print("Nulla bevitel");
  }
  else{
    double osszeg = 100/num; 
    print(osszeg.toStringAsFixed(2));
  }
}
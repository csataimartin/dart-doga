import 'dart:io';
void main(){


print("A háromszög a oldala: "); 
  int? a = int.parse(stdin.readLineSync()!);
  
  print("A háromszög 'b' oldala"); 
  int? b = int.parse(stdin.readLineSync()!);

  print("A háromszög 'c' oldala"); 
  int? c = int.parse(stdin.readLineSync()!);

  if ((a+b>c) && (a+c>b) && (c+b>a))
  {
    print("A megadott számokkal alkotható háromszög.");
  }
  else{
    print("A megadott számokkal NEM alkotható háromszög.");
  }

}
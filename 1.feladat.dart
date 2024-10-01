import 'dart:io';

void main(){
  
  print("Négyszög éleinek az 'a' oldala"); 
  int? a = int.parse(stdin.readLineSync()!);
  
  print("Négyszög éleinek az 'b' oldala"); 
  int? b = int.parse(stdin.readLineSync()!);


 
var kerulet;
var terulet;
  if(a>b)
  {
    print("A legnagyobb szám: $a");
  }

  if(b>a)
  {
    print("A legnagyobb szám: $b");
  }

  //kisebb
  if(a<b )
  {
    print("A legkisebb szám: $a");
  }

  if(b<a)
  {
    print("A legkisebb szám: $b");
  }

  if(a == b)
  {
    print("Négyzet.");
    kerulet = a*4;
    terulet = a*b;

    print("A négyzet területe: $terulet");
    print("A négyzet kerülete: $kerulet");
  }
  else if(a != b)
  {

    print("Téglalap.");
    kerulet = 2*(a+b);
    terulet = a*b;

    print("A téglalap területe: $terulet");
    print("A téglalap kerülete: $kerulet");
  }
  

  
}
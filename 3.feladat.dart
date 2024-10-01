import 'dart:io';

void main(){
bool igaz = false;
do{
  print("Adj meg egy háromjegyű számot:  "); 
  int? num= int.parse(stdin.readLineSync()!);
  if(num>=100)
  {
    igaz = true;
  }
}while(igaz != true);

}
import 'dart:io';
//1. feladat:

void createFile(String fileName){
  try {
    File file =File(fileName);
    file.createSync();
    print("A file ($fileName) létrehozása sikeres volt.");

  }
  catch(e){
    print("Hiba történt a file létrehozásakor: $e");
  }
}


//2. feladat

void deleteFile(String fileName){
  try {
    File file = File(fileName);
    if(file.existsSync()){
      file.deleteSync();
      print("A  file ($fileName) sikeresen törölve.");
    }
    else{
      print("A file ($fileName) nem létezik.");
    }
  }
  catch(e){
    print("Hiba a file törlésénél: $e");
  }
}


//3. feladat

void printEmployees(){
  try {
    File file = File('./doga(file)/employees.txt');
    if(file.existsSync()){
      List<String> lines = file.readAsLinesSync();
      List<String> woman = [];
      List<String> men = [];


      for (var i in lines){
        if(i.toLowerCase().contains('female'))
        {
          woman.add(i);
        }
        else if(i.toLowerCase().contains('male')){
          men.add(i);
        }
      }
      print("Nők: ");
      for (var i in woman){
        print(i);
      }
            print("Férfiak: ");
      for (var i in men){
        print(i);
      }
    }
    else{
      print("Az employees.txt  file nem található.");
    }
   }
   catch(e)
   {
    print("Hiba történt az employees.txt file olvasásakor: $e");

   }
}
//4. feladat
void updateAndPrintNumbers(String fileName, List<int> newNumbers){
  
  try{
  File file = File(fileName);
  List<int> numbers = [];

  if(file.existsSync()){
    List<String> lines = file.readAsLinesSync();
    for(var i in lines)
    {
      numbers.addAll(i.split(',').map(int.parse));
    }
  }
  numbers.addAll(newNumbers);

  //sortolás
  numbers.sort();

  //kiiras soronként
  print("Rendezett számok: ");
  for(var i in numbers){
    print(i);
  }
}
catch(e){
  print("Hiba történt a $fileName rendezése során: $e" );
}}


void main(){

  //1. feladat
  createFile('players.txt');
  createFile('cars.txt');

  //2. feladat
  deleteFile('players.txt');


  //3. feladat
  printEmployees();

  //4. feladat
  
  List<int> newNumbers = [8, 0, 5, 1, 3, 2, 11, 19,  1];
  updateAndPrintNumbers('numbers.txt',newNumbers);
}
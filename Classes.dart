void main(){
   //print("the size of structure is ${Test().num} cm");
   //var whats = Test().what();
   //print(whats);
  var cockie = Test("Ralf Jone", 20);
  var cockies = testing(["Hello World!"],"Vegtables", 20);
  // print(cockie.format());
  // print(cockies.format());
  print(cockie);
  print(cockies);
  

  // cockie.name = "Hello ${cockie.num}";
  // print(cockie.name);
}
class Test {

  String name ;
  int num ;

  Test(this.name, this.num){
    //none();
   // what();
  }
  
  String format(){
    return "$name --> $num";
  }
  @override
  String toString() {
    return format();
  }

  // void none(){
  //   print("Hello World");
  // }
  
  // String what(){
  //   return 'none';
  // }


} 
class testing extends Test{
  List<String> Toppings;

  testing(this.Toppings, super.name, super.num);

   @override
   String format() {
         var formattedtop = 'contains:';

         for(final t in Toppings){
          formattedtop = '$formattedtop $t';

         }
         return '$name -> $num \n$formattedtop';
   }

}





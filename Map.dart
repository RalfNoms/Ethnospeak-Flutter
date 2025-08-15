void main(){
   Map <dynamic, String> name = {
      1: "Ralf",
      "jone": "Done"
   };
   //name[0] = "Ralf";
   print(name[1]);
   print(name.containsKey("jone"));
   print(name.keys);
   print(name.remove("Done"));
   print(name.values);
}

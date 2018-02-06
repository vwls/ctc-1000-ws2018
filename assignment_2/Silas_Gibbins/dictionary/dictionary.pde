/***************************************
*********Silas Gibbins. CTC***********
*******WS 2018. Assignment-2.*********
*******Follows from Harvard.pde,********
*********and Generative.pde.**********
*******It takes a latin dictionary********
********file in a weird format**********
***********and cleans it up so************
**********I can use it for the************
**********logo generation.************
***************************************/

String[] lines = loadStrings("dict.txt"); //reads the .txt and outputs every line of the text document as a string in the array

int count = 0;

//String[] listWords = new String[5];
ArrayList<String> listWords = new ArrayList<String>();



/******************************************************************************************************************************************************
 *Only line that needs to be altered; choose the length of Latin word you need. The rest reads the text file and chooses a random word of that length.*
 ******************************************************************************************************************************************************/
int wrdlength = 15;

String Long = ""; // this variable will be used later to concatenate every line of the text document into one long string rather than an array of lines
     

for (int i = 0; i < lines.length; i++) {
  Long = Long + lines[i] + " ";
}

String extract = Long.replaceAll("[^a-z ]+", "");


String[] q = splitTokens(extract, " ,"); //word by word

//println(q.length);
for (int i = 0; i < q.length; i++) {
  String j = q[i];
  if(j.length() == wrdlength){
  //println(q[i]);
  listWords.add(j);
  count++;
 }
}
println(listWords.get(int(random(count))));
//printArray(q);
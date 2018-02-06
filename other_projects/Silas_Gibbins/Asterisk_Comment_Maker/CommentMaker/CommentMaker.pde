String[] box;
int row;
StringList temp = new StringList();
int rowLength = 54;
;

void setup() {
  String comment = "This is the title of my project, doesn't it seem like a great project.";
  String[] box = split(comment, ' ');
  //printArray(box);
  print("/");
  for (int i = 0; i < rowLength + 2; i++) {
    print("*");
  }
  println();
  for (int boxCount = 0; boxCount < box.length; boxCount++) {
    row += box[boxCount].length();
    //print(box[boxCount], " ");
    temp.append(box[boxCount]);
    if (row > rowLength/3) {
      //print(row);
      for (int asterisk = 0; asterisk < (rowLength - row) / 2 + row%2; asterisk++) {
        print("*");
      }
      print(temp.values());
      temp.clear();

      for (int asterisk = 0; asterisk < (rowLength - row) / 2; asterisk++) {
        print("*");
      }
      println();
      row = 0;
    }
    //println(row);
  }
  for (int i = 0; i < rowLength + 2; i++) {
    print("*");
  }
  print("/");
}
String[] box;
int row;
StringList temp = new StringList();
int rowLength;


boolean Title = true;
boolean Header = false;
boolean Body = false;

void setup() {
  String comment = "Silas Gibbins. CTC WS 2018. Assignment-3. Follows from Keyboard.pde, KeyboardDynamic(1).pde, and KeyboardDynamic3D(Boxes).pde. Experimental reference help to get to KeyboardDynamicLayout, figuring out P3D better. Press the keys '+' and '-' to see functionality.";
  //String comment = "This is a HEADER within my project, it would talk about the chunks of code. and about the section to follow";
  //String comment = "Only line that needs to be altered; choose the length of Latin word you need. The rest reads the text file and chooses a random word of that length.";

  String[] box = split(comment, ' ');
  //printArray(box);
  if (Title == true) {
    Title(box);
  } else if (Header == true) {
    Header(box);
  } else if (Body == true) {
    Body(box);
  }
}

void Title(String[] box) {
  rowLength = 39;
  print("/");
  for (int i = 0; i < rowLength; i++) {
    print("*");
  }
  println();
  for (int boxCount = 0; boxCount < box.length; boxCount++) {
    row += box[boxCount].length();
    //print(box[boxCount], " ");
    temp.append(box[boxCount]);
    if (row > rowLength/3) {
      //print(row);
      if ((rowLength - row + temp.size())%2 == 0) {
        for (int asterisk = 0; asterisk < ((rowLength - row) / 2); asterisk++) {
          print("*");
        }
      } else {
        //print("odd");
        for (int asterisk = 0; asterisk < ((rowLength - row) / 2) - 1; asterisk++) {
          print("*");
        }
      }
      print(temp.values());
      temp.clear();

      for (int asterisk = 0; asterisk < (rowLength - row) / 2; asterisk++) {
        print("*");
        //print(asterisk);
      }
      //print(row + row%4);
      println();
      row = 0;
    }
    //println(row);
  }
  if (temp.size() > 0 && (rowLength - row + temp.size())%2 == 0) {
    for (int asterisk = 0; asterisk < (rowLength - row) / 3 + 3; asterisk++) {
      print("*");
      //print(asterisk);
    }
    print(temp.values());
    for (int asterisk = 0; asterisk < (rowLength - row) / 2 + 4; asterisk++) {
      print("*");
      //print(asterisk);
    }
    println();
  } else if (temp.size() > 0) {
    for (int asterisk = 0; asterisk < (rowLength - row) / 2; asterisk++) {
      print("*");
    }
    print(temp.values());
    for (int asterisk = 0; asterisk < (rowLength - row) / 2 + 1; asterisk++) {
      print("*");
      //print(asterisk);
    }
    println();
  }

  for (int i = 0; i < rowLength; i++) {
    print("*");
  }
  print("/");
}


void Header(String[] box) {
  rowLength = 80;
  print("/");
  for (int i = 0; i < rowLength; i++) {
    print("*");
  }
  println();
  for (int boxCount = 0; boxCount < box.length; boxCount++) {
    row += box[boxCount].length();
    //print(box[boxCount], " ");
    temp.append(box[boxCount]);
    if (row > rowLength/ 2) {
      //print(row);
      if ((rowLength - row + temp.size())%2 == 0) {
        for (int asterisk = 0; asterisk < ((rowLength - row) / 4) +3; asterisk++) {
          print("*");
        }
      } else {
        //print("odd");
        for (int asterisk = 0; asterisk < ((rowLength - row) / 4) + 4; asterisk++) {
          print("*");
        }
      }
      print(temp.values());
      temp.clear();

      for (int asterisk = 0; asterisk < (rowLength - row) / 3; asterisk++) {
        print("*");
        //print(asterisk);
      }
      //print(row + row%4);
      println();
      row = 0;
    }
    //println(row);
  }
  if (temp.size() > 0 && (rowLength - row + temp.size())%2 == 0) {
    for (int asterisk = 0; asterisk < (rowLength - row) / 3 + 3; asterisk++) {
      print("*");
      //print(asterisk);
    }
    print(temp.values());
    for (int asterisk = 0; asterisk < (rowLength - row) / 2 + 1; asterisk++) {
      print("*");
      //print(asterisk);
    }
    println();
  } else if (temp.size() > 0) {
    for (int asterisk = 0; asterisk < (rowLength - row) / 2 + 2; asterisk++) {
      print("*");
    }
    print(temp.values());
    for (int asterisk = 0; asterisk < (rowLength - row) / 2 + 1; asterisk++) {
      print("*");
      //print(asterisk);
    }
    println();
  }

  for (int i = 0; i < rowLength; i++) {
    print("*");
  }
  print("/");
}



void Body(String[] box) {
  for (int boxCount = 0; boxCount < box.length; boxCount++) {
    row += box[boxCount].length();
    temp.append(box[boxCount]);
  }
  print("/");
  for (int i = 0; i < row + box.length + 1; i++) {
    print("*");
  }
  println();
  print(" *");
  print(temp.values());
  print("*");
  println();
  print(" ");
  for (int i = 0; i < row + box.length + 1; i++) {
    print("*");
  }
  print("/");
}
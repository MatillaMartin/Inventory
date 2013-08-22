import de.bezier.data.sql.*;
import controlP5.*;

Database db;
UIControl uic;
System system;

void setup()
{
  size(1000,600);
  //generate User Interface Control
  uic = new UIControl(this);
  //generate Database
  db = new Database(this, "aessProd.txt", "|", 6, 0); //0 -> local file, 1 -> local database (mysql)
}

void draw()
{
  background(200);
}

void keyPressed() {
  //pass the event to the UIControl
  uic.keyPressed();
}
void controlEvent(ControlEvent theEvent) {
  //pass the event to UIControl
  uic.controlEvent(theEvent);
}

class ButtonMatrix{ //generates a Matrix of Buttons, given by an array of Strings
  
  private ControlP5 cp5;
  private String name;
  private int cols, x0, y0, colMargin, rowMargin, buttonWidth, buttonHeight;
  private ArrayList<Button> buttons;
  private int value;
  private int lastId;
  
  public ButtonMatrix(ControlP5 cp5, String name, int value, int cols, int x0, int y0, int colMargin, int rowMargin, int buttonWidth, int buttonHeight)
  {
    this.cp5 = cp5; this.name = name; this.value = value; this.cols = cols; this.x0 = x0; this.y0 = y0; this.colMargin = colMargin; this.rowMargin = rowMargin; this.buttonWidth = buttonWidth; this.buttonHeight = buttonHeight;
    buttons = new ArrayList<Button>();
    lastId = 0;
  }
  
  public void addButton(String name)
  {
    Button b = new Button(cp5, name);
    b.setValue(float(value));
    b.setId(lastId);
    lastId++;
    b.setWidth(buttonWidth);
    b.setHeight(buttonHeight);
    b.setPosition(x0 + colMargin + (colMargin+buttonWidth)*(buttons.size()%cols), y0 + rowMargin + int(buttons.size()/cols)*(buttonHeight+rowMargin));
    buttons.add(b);
    println(buttons.size());
  }
  public void addButtonList(ArrayList stringList)
  {
    this.clear();
    for(int i = 0; i < stringList.size(); i++)
    {
      addButton(stringList.get(i).toString());
    }
  }
  public void clear()
  {
    for(int i = 0; i < buttons.size(); i++)
    {
      deleteButton();
    }
    lastId = 0;
  }
  public void deleteButton()
  {
    cp5.remove(buttons.remove(buttons.size()-1).getName());
    lastId--;
  }
}

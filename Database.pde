public class Database  //encapsulates a database (file or mysql) to ease the use.
{
  //***PARAMETERS***//
  private int option; //file = 0, mysql = 1
  private int loadSplit;
  private ArrayList<Product>p;
  private String filename;
  private String splitter;
  //MYSQL
  private MySQL mysql;
  private String user     = "root";
  private String pass     = "root";
  private String database = "productdb";
  private String table = "db";
  //LOCAL VARIABLES
  ArrayList <Product> lastSearch = null;
  
  public Database()
  {
    p = new ArrayList<Product>();
    option = 0;
  }
  public Database(PApplet app, String filename, String splitter, int loadSplit, int option)
  {
    this();
    this.filename = "data/" + filename;  
    this.splitter = splitter;
    this.loadSplit = loadSplit;
    this.option = option;
    if(option == 1) {mysql = new MySQL( app, "localhost", database, user, pass );}
    loadDatabase();
  }
  private void loadDatabase()
  {
    switch(option)
    {
      case 0 :  //local
        try{
          String lines[] = loadStrings(filename);
          if (lines != null)
          {
            for (int i = 0; i < lines.length; i++)
            {
              String line[] = split(lines[i], splitter);
              println(line);
              if (line.length == loadSplit)  this.add(new Product(line[0], line[1], line[2], line[3], line[4], line[5]));
            }
          }
        }catch(NullPointerException e){println("File not found");}
        break;
        
      case 1 :  //mysql
        if(mysql.connect())
        {
          mysql.query("SELECT * FROM " + table);
          while(mysql.next())
          {
            this.add(new Product(mysql.getString("name"),mysql.getString("info"), mysql.getString("url"), mysql.getInt("quantity"), mysql.getInt("price"), mysql.getString("image")));
          }
        }
        else{println("could not connect");}
        break;
    }
  }
  private void saveDatabase()
  {
    switch(option)
    {
      case 0 :  //local
        String[] stringsToSave = new String[p.size()];
        for(int i = 0; i < p.size(); i++)
        {
          stringsToSave[i] = p.get(i).getSplitForm(splitter);
        }
        saveStrings(filename,stringsToSave);
        break;
      
      case 1 :  //mysql
        if(mysql.connect())
        {
          for(Product product : p)
          {
            mysql.execute("REPLACE INTO " + table + " (`name`, `info`, `url`, `quantity`, `price`, `image`) VALUES ('" + product.getName() + "', '" + product.getInfo() + "', '" + product.getUrl() + "', '" + product.getQuantity() + "', '" + product.getPrice() + "', '" + product.getImageUrl() + "')");
          }
        }
        else{println("could not connect");}
        break;
    }
  }
  public Database add(Product product)
  {
    p.add(product);
    println(product);
    saveDatabase();
    return this;
  }
  public Product get(String name)
  {
    for(Product product : lastSearch)
    {
      if(product.getName().equals(name))
      {
        return product;
      }
    }
    return null;
  }
  public Product get(int index)
  {
    if(lastSearch.size() > index)
    {
      return lastSearch.get(index);
    }
    return null;
  }
  public Database delete(String name)
  {
    p.remove(name);
    saveDatabase();
    return this;
  }
  public ArrayList find(String tip)//TBC
  {
    String[] tips = split(tip, " ");
    ArrayList ret = new ArrayList<Product>();
    for (Product product : p)
    {
      String[] ks = split(product.getName(), " ");
      for(String kpart : ks)
      {
        for(String tippart : tips)
        {
          if(stringsMatch(kpart,tippart))
          {
            if(!ret.contains(product)){  ret.add(product);}
          }
        }
      }
    }
    return ret;
  }
  
  private boolean stringsMatch(String a, String b)
  {
    String as = a.toLowerCase();  String bs = b.toLowerCase();  if(as != "" && bs != "" && as.contains(bs)) return true; else return false;
  }
  @Override
  public String toString()
  {
    String s = "";
    try{
      String[] lines = loadStrings(filename);
      for (int i = 0; i < lines.length; i++)
      {
        String[] line = split(lines[i], splitter);
        s += ""+ join(line, " | ") + "\n";
      }
    }catch(NullPointerException e){println("File not found");}
    return s;
  }
}


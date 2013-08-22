class System implements InventorySkeleton
{
  void System()
  {
  }
  void onSearch(String s)
  {
    uic.setCreateProductVisible(false);
    ArrayList<Product> results = db.find(s);
    uic.showSearchResults(results); //find on database and send results to UIControl
    if(!checkPresent(results, s))
    {
      uic.setCreateProductVisible(true);
    }
  }
  private boolean checkPresent(ArrayList<Product> al, String s)
  {
    for(Product p : al)
    {
      if(p.getName().toLowerCase().equals(s.toLowerCase()))
      {
        return true;
      }
    }
    return false;
  }
  void onResultSelect(int index)
  {
    uic.showProduct(db.get(index));
    uic.setCreateProductVisible(false);
  }
  void onCreate(String name)
  {
    println(name);
    Product product = new Product(name, "", "", 0, 0, "");
    uic.showProduct(product);
    db.add(product);
    uic.toggleModify();
  }
  void onModify(Product p)
  {
    db.delete(p);
    db.add(p);
    uic.toggleModify();
  }
  void onDelete(Product p)
  {
    db.delete(p);
  }
}


interface InventorySkeleton
{
  void onSearch(String s);
  void onResultSelect(int index);
  void onCreate(String s);
  void onModify(Product p);
  void onDelete(Product p);
}

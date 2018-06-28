public class BookCategoryWrapper {
    
    public Boolean bchecked{ get; set; }
    public Bookinformation__c bookcat { get; set;}
    
    public BookCategoryWrapper (){
        bookcat = new Bookinformation__c();
        bchecked = false;
    }
    
    public BookCategoryWrapper (Bookinformation__c c){
        bookcat = c;
        bchecked = false;
    }
    
    
    
}
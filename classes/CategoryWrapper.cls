public class CategoryWrapper {
    
    public Boolean checked{ get; set; }
    public ReadingLists__c cat { get; set;}
    
    public CategoryWrapper(){
        cat = new ReadingLists__c ();
        checked = false;
    }
    
    public CategoryWrapper(ReadingLists__c  c){
        cat = c;
        checked = false;
    }
    
    
    
}
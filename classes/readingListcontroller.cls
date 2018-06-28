public class readingListcontroller  {

    public List<Bookinformation__c > selectedbooks{get;set;}
    public List<ReadingLists__c > selectedreadingbooks{get;set;}

    
    
    
    // instantiate the StandardSetController from a query locator
    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id,favourite__c,Bookinformation__c , Name,
                                                                                    Bookinformation__r.description__c,Bookinformation__r.isbn__c
                                                                                    FROM ReadingLists__c   Order By Name limit 100]));
                // sets the number of records in each page set
                con.setPageSize(10);
            }
            return con;
        }
        set;
    }
    
    // returns a list of wrapper objects for the sObjects in the current page set
    public List<categoryWrapper> getCategories() {
        categories = new List<categoryWrapper>();
        for (ReadingLists__c category : (List<ReadingLists__c >)con.getRecords())
            categories.add(new CategoryWrapper(category));
        
        return categories;
    }
    List<categoryWrapper> categories {get;set;}
    list<ReadingLists__c > lrl = new list<ReadingLists__c >();
    List<Bookinformation__c > ulbc=new List<Bookinformation__c >();
    
    // displays the selected items
    public PageReference process() {
        system.debug(categories);
        for (CategoryWrapper cw : categories) {
            if (cw.checked){
                
                ReadingLists__c rl = new ReadingLists__c ();
                rl.id=cw.cat.id;
                lrl.add(rl);
                
                Bookinformation__c ubc = new Bookinformation__c ();
                ubc.id=cw.cat.Bookinformation__c;
                ubc.ReadingCheck__c = false;
                ulbc.add(ubc);
            }    
        }
        delete lrl;
        update ulbc;
        return null;
    }
    
    // indicates whether there are more records after the current page set.
    public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }
    
    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }
    
    // returns the page number of the current page set
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }
    
    // returns the first page of records
    public void first() {
        con.first();
    }
    
    // returns the last page of records
    public void last() {
        con.last();
    }
    
    // returns the previous page of records
    public void previous() {
        con.previous();
    }
    
    // returns the next page of records
    public void next() {
        con.next();
    }
    
    // returns the PageReference of the original page, if known, or the home page.
    public void cancel() {
        con.cancel();
    } 
    
    // instantiate the StandardSetController from a query locator
    public ApexPages.StandardSetController con1 {
        get {
            if(con1 == null) {
                con1 = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, Name,ReadingCheck__c ,Authors__c,Description__c,ISBN__c
                                                                                     FROM Bookinformation__c where ReadingCheck__c =false ]));
                // sets the number of records in each page set
                con1.setPageSize(5);
            }
            system.debug(con1);
            return con1;
        }
        set;
    } 
    
    // returns a list of wrapper objects for the sObjects in the current page set
    public List<BookCategoryWrapper> getcategories1() {
        categories1 = new List<BookCategoryWrapper>();
        for (Bookinformation__c category1 : (List<Bookinformation__c >)con1.getRecords())
            categories1.add(new BookCategoryWrapper(category1));
        
        return categories1;
    }
    List<BookCategoryWrapper> categories1 {get;set;}
    List<Bookinformation__c > lbc=new List<Bookinformation__c >();
    // displays the selected items
    list<ReadingLists__c > lrlo = new list<ReadingLists__c >();
    
    public void bookprocess() {
        for (BookCategoryWrapper cw1 : categories1) {
            if (cw1.bchecked){ 
                system.debug('--'+cw1 );
                Bookinformation__c bc = new Bookinformation__c ();
                bc.id= cw1.bookcat .id;
                bc.ReadingCheck__c = true;
                lbc.add(bc);
                ReadingLists__c rlo = new ReadingLists__c ();
                rlo.favourite__C= true;
                rlo.name=cw1.bookcat.name;
                rlo.Bookinformation__c =cw1.bookcat .id;
                rlo.user__c =UserInfo.getUserId();
                lrlo.add(rlo);
            }
        }
       
        insert lrlo;
        update lbc;
    }
    
    // indicates whether there are more records after the current page set.
    public Boolean hasNext1 {
        get {
            return con1.getHasNext();
        }
        set;
    }
    
    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious1 {
        get {
            return con1.getHasPrevious();
        }
        set;
    }
    
    // returns the page number of the current page set
    public Integer pageNumber1 {
        get {
            return con1.getPageNumber();
        }
        set;
    }
    
    // returns the first page of records
    public void first1() {
        con1.first();
    }
    
    // returns the last page of records
    public void last1() {
        con1.last();
    }
    
    // returns the previous page of records
    public void previous1() {
        con1.previous();
    }
    
    // returns the next page of records
    public void next1() {
        con1.next();
    }
    
    // returns the PageReference of the original page, if known, or the home page.
    public void cancel1() {
        con1.cancel();
    }  
    
}
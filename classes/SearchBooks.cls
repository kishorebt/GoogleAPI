public class SearchBooks {
    public GoogleBooksResponse results { get; set; }
    public GoogleBooksResponse result { get; set; }     
    public String selectpicklist { get; set; }
    public boolean show{ get; set; }
    
    public PageReference selectpicklist() {
        system.debug('--'+selectpicklist );
        this.selectpicklist =s;
         
        show = false;
        return null;
    }
    public String searchtext { get; set; }
    String s = 'None';
    public String getselecttype() {
        return this.selectpicklist;
    }
    public void setselecttype(String s) {
        this.selectpicklist  = s;
    }
    
    public void callsearch() {
        show = true;
        system.debug('=-=-'+searchtext);
        if ( selectpicklist=='None' ||  searchtext==null||  searchtext==''){
            show = false;
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error, 'Please select Category and Enter the Search text' ));
        }
        else{
            string searchstring = searchtext.trim();
            searchstring = searchstring.replace(' ','+');
            String s;
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setHeader('Content-Type','application/json');
            req.setHeader('Accept','application/json');
            if(selectpicklist == 'Title')
                req.setEndpoint('https://www.googleapis.com/books/v1/volumes?q=intitle:'+searchstring);

            if(selectpicklist == 'ISBN' )
                req.setEndpoint('https://www.googleapis.com/books/v1/volumes?q=isbn:'+searchstring);
            
            if(selectpicklist == 'Author')
                req.setEndpoint('https://www.googleapis.com/books/v1/volumes?q=inauthor:'+searchstring);
 
            Http http = new Http();
            HTTPResponse res = null;
            res = http.send(req);
            s = res.getBody();
            result = (GoogleBooksResponse)  System.JSON.deserialize(s , GoogleBooksResponse.class);
            this.result = result;
            this.results = result;
        }  
    }
    
    public class savewrapper{
        public string Title{ get; set; }
        public string description { get; set; }
        public string ibsn{ get; set; }
        public string rating{ get; set; }
        public string author{ get; set; }
    }
    public void Savesearch() {
        
        list<Bookinformation__c> lswrap = new list<Bookinformation__c>();
        for(GoogleBooksResponse.items obj: result.items){
            Bookinformation__c swrap = new Bookinformation__c();
            if(obj.volumeInfo.title.length()>75)
                swrap.name=obj.volumeInfo.title.substring(0,75);
            else
                swrap.name=obj.volumeInfo.title;
            swrap.Authors__c=string.valueof(obj.volumeInfo.authors) ;
            swrap.Description__c=obj.volumeInfo.title;
            swrap.rating__c= string.valueof(obj.volumeInfo.ratingsCount);
            
            if( obj.volumeInfo.industryIdentifiers!= null)
                swrap.ISBN__c =  obj.volumeInfo.industryIdentifiers[0].identifier ;
            else 
                swrap.ISBN__c = '';
            
            if( obj.volumeInfo.imageLinks!= null)
                swrap.ThumbnailUrl__c =  obj.volumeInfo.imageLinks.thumbnail  ;
            else 
                swrap.ThumbnailUrl__c = '';
            lswrap.add(swrap);
            
        }   
        insert lswrap;
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Confirm, 'Search Results Saved' ));

    }
    
}
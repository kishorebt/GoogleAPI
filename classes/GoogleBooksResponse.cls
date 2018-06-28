public class GoogleBooksResponse{
    public  String kind {get;set;} 
    public  Integer totalItems {get;set;} 
    public  List<items> items{get;set;} 
    
    public class Items {
        public String kind {get;set;} 
        public String id {get;set;} 
        public String etag {get;set;} 
        public String selfLink {get;set;} 
        public cls_volumeInfo volumeInfo {get;set;} 
    }
    
    public class cls_volumeInfo {
        public List<cls_industryIdentifiers> industryIdentifiers {get;set;}
        public String title {get;set;}	//Harry Potter - A Journey Through A History of Magic
        public list<string>  authors{get;set;}
        public String description{get;set;}	//The official companion book to the British Library exhibition and the ultimate gift for Harry Potter fans! As the British Library unveils a very special new exhibition in the UK, Harry Potter: A History of Magic, readers everywhere are invited on an enchanting journey through the Hogwarts curriculum, from Care of Magical Creatures and Herbology to Defense Against the Dark Arts, Astronomy, and more in this eBook uncovering thousands of years of magical history. Prepare to be amazed by artifacts released from the archives of the British Library, unseen sketches and manuscript pages from J.K. Rowling, and incredible illustrations from artist Jim Kay. Discover the truth behind the origins of the Philosopher’s Stone, monstrous dragons, and troublesome trolls{get;set;} examine real-life wands and find out what actually makes a mandrake scream{get;set;} pore over remarkable pages from da Vinci’s notebook{get;set;} and discover the oldest atlas of the night sky. Carefully curated by the British Library and full of extraordinary treasures from all over the world, this is an unforgettable journey exploring the history of the magic at the heart of the Harry Potter stories.
        public Double averageRating{get;set;}	//3.5
        public Integer ratingsCount{get;set;}	//2
        public cls_imageLinks imageLinks{get;set;}
        public String language{get;set;}	//en 
        
    } 
    public  class cls_authors {
        public list<String> authorname {get;set;}	//B
    }
    
    public  class cls_industryIdentifiers {
        public String type {get;set;}	//ISBN_13
        public String identifier{get;set;}	//9781781109502
    }
    
    public  class cls_imageLinks {
        public String smallThumbnail{get;set;}	//http://books.google.com/books/content?id=ilc0DwAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api
        public String thumbnail{get;set;}	//http://books.google.com/books/content?id=ilc0DwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api
    }
}
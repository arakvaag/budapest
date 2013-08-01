package budapest

class Artist {
	
	String navn
	String spotifyURI
	
	static hasMany = [albumer:Album]
	
    static constraints = {
		spotifyURI unique:true,  nullable: true 
    }
}

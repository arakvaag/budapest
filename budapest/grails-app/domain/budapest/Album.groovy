package budapest

class Album {

	String navn
	String spotifyURI
	Integer aar
	boolean tilgjengeligINorge
	Artist artist
	
	static hasMany = [sporene:Spor]
	
    static constraints = {
    	aar nullable:true
	}
}

package budapest

class Artist {

	String navn
	String spotifyURI

	static hasMany = [album:Album]

    static constraints = {
		spotifyURI unique:true,  nullable: true 
    }
	
	@Override
	public String toString() {
		navn
	}

}

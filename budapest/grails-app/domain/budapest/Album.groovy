package budapest

class Album {

	String navn
	String spotifyURI
	Integer aar
	Artist artist
	
    static constraints = {
    	aar nullable:true
	}
	
	@Override
	public String toString() {
		navn
	}

}

package budapest

class Album {

	String navn
	String spotifyURI
	Integer aar
	Artist artist
	String urlCoverArt
	
    static constraints = {
    	aar nullable:true
		spotifyURI unique:true,  nullable: true
		urlCoverArt nullable:true
	}
	
	@Override
	public String toString() {
		navn
	}

}

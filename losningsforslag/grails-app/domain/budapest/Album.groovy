package budapest


class Album {

	String navn
	Integer aar
	Artist artist
	String spotifyURI
	
	static constraints = {
		aar nullable:true
		spotifyURI unique:true,  nullable: true
	}
	
	@Override
	public String toString() {
		navn
	}

}

package budapest


class Album {

	String navn
	Integer aar
	Artist artist
	
	static constraints = {
		aar nullable:true
	}
	
}

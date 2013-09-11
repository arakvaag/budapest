package budapest

class Artist {

	String navn
	
	static hasMany = [album:Album]
	
    static constraints = {
    }
}

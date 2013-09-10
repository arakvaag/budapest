import budapest.Album
import budapest.Artist

class BootStrap {

    def init = { servletContext ->
		Artist artist = new Artist(navn: "Adele").save();
    	Album album = new Album(navn: "21", artist: artist, aar: 2011).save()
	}
    def destroy = {
    }
}

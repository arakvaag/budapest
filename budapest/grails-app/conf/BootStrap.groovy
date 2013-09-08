import budapest.Album
import budapest.Artist;

class BootStrap {

    def init = { servletContext ->
		Artist artist = new Artist(navn: "Adele", spotifyURI: "spotify:artist:4dpARuHxo51G3z768sgnrY").save();
    	Album album = new Album(navn: "21", artist: artist, aar: 2011, spotifyURI: "spotify:album:7n3QJc7TBOxXtlYh4Ssll8").save()
	}
    def destroy = {
    }
}

import budapest.Album
import budapest.Artist;
import budapest.Spor;

class BootStrap {

    def init = { servletContext ->
		Artist artist = new Artist(navn: "Adele", sporifyURI: "spotify:artist:4dpARuHxo51G3z768sgnrY").save();
		Set<Spor> sporene = new HashSet<Spor>()
		sporene.add(new Spor(navn: "Spor 1", nummer: 1).save())
		sporene.add(new Spor(navn: "Spor 2", nummer: 2).save())
		sporene.add(new Spor(navn: "Spor 3", nummer: 3).save())
		sporene.add(new Spor(navn: "Spor 4", nummer: 4).save())
		sporene.add(new Spor(navn: "Spor 5", nummer: 5).save())
		sporene.add(new Spor(navn: "Spor 6", nummer: 6).save())
    	Album album = new Album(navn: "21", artist: artist, aar: 2011, tilgjengeligINorge: true, 
			spotifyURI: "spotify:album:7n3QJc7TBOxXtlYh4Ssll8", sporene: sporene).save()
	}
    def destroy = {
    }
}

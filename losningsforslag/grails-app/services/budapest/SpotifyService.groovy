package budapest

import java.util.List;

import org.rakvag.spotifyapi.SpotifyAPI;
import org.rakvag.spotifyapi.entity.SpotifyAlbum;

class SpotifyService {
	
	SpotifyAPI spotifyAPI
	
	List<Album> sokEtterAlbum(String artistNavn, String albumNavn) {
		def spotifyAlbum = spotifyAPI.soekEtterAlbum(artistNavn, albumNavn, 1)
		List<Album> albumer = []	
		spotifyAlbum.each { sa ->
			Album nyttAlbum = new Album(navn: sa.getName(), aar: sa.getReleased(), artist: new Artist(navn: sa.getArtists().iterator().next().getName()))  
			albumer.add(nyttAlbum)
		}
		albumer
	}
	
}

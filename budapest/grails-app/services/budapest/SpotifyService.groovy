package budapest

import org.rakvag.spotifyapi.SpotifyAPI
import org.rakvag.spotifyapi.entity.SpotifyAlbum
import org.rakvag.spotifyapi.entity.SpotifyArtist;

class SpotifyService {

	def spotifyAPI 
	
    List<Album> sokEtterAlbum(String artistNavn, String albumNavn) {
		def spotifyAlbum = spotifyAPI.soekEtterAlbum(artistNavn, albumNavn, 1)
		List<Album> albumer = []
		
		spotifyAlbum.each { sa ->
			if(!Album.findBySpotifyURI(sa.getHref())){
				def nyttAlbum = mappAlbum(sa)
				nyttAlbum.artist = mappArtist(sa.artists[0])
				albumer.add(nyttAlbum)
			}
		}	
		albumer
    }

	private Album mappAlbum(SpotifyAlbum sa) {
		def nyttAlbum = new Album()
		nyttAlbum.navn = sa.getName()
		nyttAlbum.spotifyURI = sa.getHref()
		nyttAlbum.aar = sa.getReleased()
		nyttAlbum.tilgjengeligINorge = sa.erTilgjengeligINorge()
		
		nyttAlbum.artist = mappArtist(sa.getArtists()[0])
		return nyttAlbum
	}
	
	private Artist mappArtist(SpotifyArtist spotifyArtist){
		def nyArtist = Artist.findBySpotifyURI(spotifyArtist.getHref())
		if(!nyArtist){
			nyArtist = new Artist()
			nyArtist.navn = spotifyArtist.getName()
			nyArtist.spotifyURI = spotifyArtist.getHref()
		}
		return nyArtist
	}
}

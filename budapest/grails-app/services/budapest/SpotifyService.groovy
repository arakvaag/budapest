package budapest

import org.rakvag.spotifyapi.SpotifyAPI
import org.rakvag.spotifyapi.entity.SpotifyAlbum
import org.rakvag.spotifyapi.entity.SpotifyArtist;

class SpotifyService {

	SpotifyAPI spotifyAPI 
	
    List<Album> sokEtterAlbum(String artistNavn, String albumNavn) {
		def spotifyAlbum = spotifyAPI.soekEtterAlbum(artistNavn, albumNavn, 1)
		List<Album> albumer = []
		
		spotifyAlbum.each { sa ->
			if(sa.erTilgjengeligINorge() && !Album.findBySpotifyURI(sa.getHref())){
				def nyttAlbum = mappAlbum(sa)
				albumer.add(nyttAlbum)
			}
		}	
		albumer
    }
	
	Album hentAlbum(String spotifyURI) {	
		Collection<SpotifyAlbum> albumColl = spotifyAPI.hentAlbumPaaSpotifyURIer([spotifyURI], 3)
		def spotAlbum = albumColl.iterator().next()
		def album = mappAlbum(spotAlbum);
		return album
	}

	String hentUrlCoverArt(Album album) {
		spotifyAPI.hentBildelink(album.spotifyURI)
	}
	
	private Album mappAlbum(SpotifyAlbum sa) {
		def nyttAlbum = Album.findBySpotifyURI(sa.getHref())
		if (nyttAlbum)
			return nyttAlbum 
		
		nyttAlbum = new Album()
		nyttAlbum.navn = sa.getName()
		nyttAlbum.spotifyURI = sa.getHref()
		nyttAlbum.aar = sa.getReleased()
		
		nyttAlbum.artist = mappArtist(sa)
		
		return nyttAlbum
	}
	
	private Artist mappArtist(SpotifyAlbum spotifyAlbum) {
		def artistURI = spotifyAlbum.getArtistid()
		artistURI = artistURI ?: spotifyAlbum.getArtists()?.iterator()?.next()?.getHref()
		
		def nyArtist = Artist.findBySpotifyURI(artistURI);
		if (nyArtist)
			return nyArtist;		
		
		def artistNavn = spotifyAlbum.getArtist();
		artistNavn = artistNavn ?: spotifyAlbum.getArtists()?.iterator()?.next()?.getName()
		return new Artist(navn: artistNavn, spotifyURI: artistURI) 
	}

}

package budapest

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(SpotifyService)
@Mock([Album, Artist])
class SpotifyServiceTests {

	def spotifyService
	
	@Test
    void testSokEtterAlbumSomGirResultat() {
		List<Album> albumer =  spotifyService.sokEtterAlbum("Adele", "21")
		assert albumer != null
		assert albumer.size() > 0
		albumer.each { album ->
			assert album.navn.length() > 0
			assert album.artist != null
		}
    }
	
	@Test
	void testSokEtterAlbumSomIkkeFinnes(){
		List<Album> albumer =  spotifyService.sokEtterAlbum("Tullball", "Tjohei")
		assert albumer != null
		assert albumer.empty
	}
}

package budapest



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Artist)
class ArtistTests {

    void testLagreArtist() {

		assert Artist.count == 0 
		
		def nyArtist = new Artist()
		nyArtist.navn = "Vikingarna"
		nyArtist.spotifyURI = "lkdsjf"
		
		nyArtist.save(failOnError:true)
				
		def hentetArtist = Artist.get(nyArtist.id)
		assert hentetArtist != null
    }
}

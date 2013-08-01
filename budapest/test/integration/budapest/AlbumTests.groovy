package budapest



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Album)
class AlbumTests {

    void testLagreAlbum() {
		assert Album.count == 0
		
		def nyttAlbum = new Album(aar: 1980, navn: "Rockabilly", spotifyURI: "Baby", artist: new Artist(navn: "Vikingarna", spotifyURI: "asd") )
		nyttAlbum.save(failOnError:true)
		
		def hentetAlbum = Album.get(nyttAlbum.id)
		assert hentetAlbum.navn == nyttAlbum.navn
    }
}

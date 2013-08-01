import org.rakvag.spotifyapi.HTTPBufferedReader
import org.rakvag.spotifyapi.SpotifyAPIImpl;

beans = {
	spotifyAPI(SpotifyAPIImpl){
		httpReader = new HTTPBufferedReader()
	}
}

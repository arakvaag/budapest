import org.rakvag.spotifyapi.HTTPBufferedReader
import org.rakvag.spotifyapi.SpotifyAPIImpl

// Place your Spring DSL code here
beans = {
	spotifyAPI(SpotifyAPIImpl){
		httpReader = new HTTPBufferedReader()
	}
}

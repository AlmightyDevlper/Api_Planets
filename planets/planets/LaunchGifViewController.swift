import UIKit
import WebKit

class LaunchGifViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var launchGif: WKWebView!
    var planet = NasaApi(planet: <#String#>, description: <#String#>, url: "")
    var nasaURL = URL(string: "https://api.nasa.gov/planetary/apod?api_key=067pxmSK8HEV7H3Oxot8uOiSxXR0B0okgQXaGSFR")!
    var url_api: URLRequest!
    
    override func loadView() {
        let webConfig = WKWebViewConfiguration()
        launchGif! = WKWebView(frame: .zero, configuration: webConfig)
        launchGif.uiDelegate = self
        view = launchGif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Call the requested url
        showGif()
        
    }
    
    func showGif() {
        let myURL = "<iframe  src=\"https://giphy.com/embed/xiN0BXMETVsx0AxTXt\"  style=\" height:100vh;width:100vw;background-color: black !important;\" frameBorder=\"0\" class=\"giphy-embed\" allowFullScreen></iframe>"
        self.launchGif.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
        self.launchGif.scrollView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
        launchGif.isOpaque = false
        launchGif.loadHTMLString(myURL, baseURL: nil)
    
        //After 6 seconds we go to the overviewpage
        //we gonne make also an api call
    }
    
    func searchForPlanet(searchObj: String) {
        
        
        self.url_api.httpMethod = "GET"
        self.url_api.url = self.nasaURL
        
        self.url_api.mainDocumentURL = URL(string: "GET/search?q={"+searchObj+"}")
        
    }


}

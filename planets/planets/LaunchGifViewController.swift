import UIKit
import WebKit

class LaunchGifViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var launchGif: WKWebView!
    var url_api: URLRequest!
    var timer: Timer!
    var webConfig = WKWebViewConfiguration()
    
    override func loadView() {
        self.launchGif = WKWebView(frame: .zero, configuration: self.webConfig)
        launchGif.uiDelegate = self
        view = launchGif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showGif()
    }
    
    func showGif() {
        let myURL = "<iframe  src=\"https://giphy.com/embed/xiN0BXMETVsx0AxTXt\"  style=\" height:100vh;width:100vw;background-color: black !important;\" frameBorder=\"0\" class=\"giphy-embed\" allowFullScreen></iframe>"
        self.launchGif.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
        self.launchGif.scrollView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
        launchGif.isOpaque = false
        launchGif.loadHTMLString(myURL, baseURL: nil)
    
        //After 6 seconds we go to the overviewpage
        Timer.scheduledTimer(withTimeInterval: 6.0, repeats: false) {_ in
            self.searchForPlanet(searchObj: "mars")
        }
        //we gonne make also an api call
    }
    
    func searchForPlanet(searchObj: String) {
        
        let urlNasa = (URL(string: "https://images-api.nasa.gov/search?q={mars}") ?? URL(string: "https://images-api.nasa.gov/search?q={mars}"))!
        let sess = URLSession.shared
        let req = URLRequest(url: urlNasa)
        
        let task = sess.dataTask(with: req, completionHandler: {data, response, error in
            guard error == nil else {
                print("fuck")
                return
            }
            guard data == nil else {
                print(data!)
                return
            }
        })
        task.resume()
        
    }


}

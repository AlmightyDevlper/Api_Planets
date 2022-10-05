import UIKit
import WebKit

class LaunchGifViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var launchGif: WKWebView!
    var url_api: URLRequest!
    var timer: Timer!
    var webConfig = WKWebViewConfiguration()
    var nasaDataArray:[String] = []
    
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
        let stringURL: String = "https://images-api.nasa.gov/search?q=\(searchObj)"
        let url = URL(string: stringURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        
        guard url == url else {
            print("fuck url")
            return
        }
        
        let sess = URLSession.shared
        
        let req = URLRequest(url: url)
        guard req == req else {
            print("fuck req")
            return
        }
        
        let task = sess.dataTask(with: req as URLRequest) {(data, response, error) in
            if error == nil && data != nil {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any] {
                        print(json)
                    }
                } catch {
                    print("JSONSerialization error:", error)
                }
            }
        }
        task.resume()
    }


}

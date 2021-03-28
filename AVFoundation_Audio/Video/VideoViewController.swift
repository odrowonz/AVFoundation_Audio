//
//  VideoViewController.swift
//  AVFoundation_Audio
//
//  Created by Andrey Antipov on 28.03.2021.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {
    
    @IBOutlet var playerView: UIView!
    @IBOutlet var playList: UITableView!
    
    lazy var player: WKWebView = {
        var config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        return WKWebView(frame: self.playerView.bounds, configuration: config)
    }()
    
    var recordNum: Int = 0 {
        didSet {
            playList.selectRow(at: IndexPath(row: recordNum, section: 0), animated: true, scrollPosition: .top)
            
            DispatchQueue.main.async {
                [weak self] in
                guard let self = self,
                      let videoURL = URL(string:  "https://www.youtube.com/embed/\(videoPlayList[self.recordNum].fileName)?&playsinline=1&fullscreen=yes")
                else { return }
                
                let request = URLRequest(url: videoURL)
                self.player.load(request)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playList.dataSource = self
        playList.delegate = self
        playList.allowsSelection = true
        
        self.playerView.addSubview(self.player)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recordNum = 0
    }
}

extension VideoViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoPlayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellYouTubeUrlId", for: indexPath) as? UITableViewCell {
            cell.selectionStyle = UITableViewCell.SelectionStyle.blue
            cell.textLabel?.numberOfLines = 2
            cell.textLabel?.text = "\(videoPlayList[indexPath.row].songName) -  \(videoPlayList[indexPath.row].executor)"
            return cell
        } else { return UITableViewCell() }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recordNum = indexPath.row
    }
}

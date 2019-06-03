//
//  ViewController.swift
//  AssetDownload
//
//  Created by Emiaostein on 2019/6/2.
//  Copyright © 2019 xueersi. All rights reserved.
//

///     │
///     ▼
/// ┌────────┬────────┬────────┬────────┐       ┌────────┬────────┬────────┬────────┐
/// │████████│████████│████████│        │       │        │        │        │        │
/// │███0████│███1████│███2████│   3    │ ......│   16   │   17   │   18   │   19   │
/// │████████│████████│████████│        │       │        │        │        │        │
/// └────────┴────────┴────────┴────────┘       └────────┴────────┴────────┴────────┘
///
///              │
///              ▼
/// ┌────────┬────────┬────────┬────────┐       ┌────────┬────────┬────────┬────────┐
/// │████████│████████│████████│        │       │        │        │        │        │
/// │███0████│███1████│███2████│   3    │ ......│   16   │   17   │   18   │   19   │
/// │████████│████████│████████│        │       │        │        │        │        │
/// └────────┴────────┴────────┴────────┘       └────────┴────────┴────────┴────────┘
///
///                       │
///                       ▼
/// ┌────────┬────────┬────────┬────────┐       ┌────────┬────────┬────────┬────────┐
/// │        │████████│████████│████████│       │        │        │        │        │
/// │   0    │███1████│███2████│███3████│ ......│   16   │   17   │   18   │   19   │
/// │        │████████│████████│████████│       │        │        │        │        │
/// └────────┴────────┴────────┴────────┘       └────────┴────────┴────────┴────────┘
///
///
///
///
///                                                                            │
///                                                                            ▼
/// ┌────────┬────────┬────────┬────────┐       ┌────────┬────────┬────────┬────────┐
/// │        │        │        │        │       │        │████████│████████│████████│
/// │   0    │   1    │   2    │   3    │ ......│   16   │███17███│███18███│███19███│
/// │        │        │        │        │       │        │████████│████████│████████│
/// └────────┴────────┴────────┴────────┘       └────────┴────────┴────────┴────────┘
///
///                                                                   │
///                                                                   ▼
/// ┌────────┬────────┬────────┬────────┐       ┌────────┬────────┬────────┬────────┐
/// │        │        │        │        │       │        │████████│████████│████████│
/// │   0    │   1    │   2    │   3    │ ......│   16   │███17███│███18███│███19███│
/// │        │        │        │        │       │        │████████│████████│████████│
/// └────────┴────────┴────────┴────────┘       └────────┴────────┴────────┴────────┘
///
///                                                          │
///                                                          ▼
/// ┌────────┬────────┬────────┬────────┐       ┌────────┬────────┬────────┬────────┐
/// │        │        │        │        │       │████████│████████│████████│        │
/// │   0    │   1    │   2    │   3    │ ......│███16███│███17███│███18███│   19   │
/// │        │        │        │        │       │████████│████████│████████│        │
/// └────────┴────────┴────────┴────────┘       └────────┴────────┴────────┴────────┘

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let urls = [
        "https://video.youcat.cn/26c7e0a8511811e9ba7328cfe920ed2d.mp4",
        "https://video.youcat.cn/9e913bf450c811e99b8a28cfe920ed2d.mp4",
        "https://video.youcat.cn/0637b3d068d611e9a956320019159d40.mp4",
        "https://video.youcat.cn/c5f8a3da68d311e9a956320019159d40.mp4",
        "https://video.youcat.cn/28214e3068d011e9a956320019159d40.mp4",
        "https://video.youcat.cn/7a123608697711e9972c320019159d40.mp4",
        "https://video.youcat.cn/98f5538650bd11e9b9dd28cfe920ed2d.mp4",
        "https://video.youcat.cn/13abb47a697711e9972c320019159d40.mp4",
        "https://video.youcat.cn/99614efe3a4211e98c1528cfe920ed2d.mp4",
        "https://video.youcat.cn/0356e86a697711e9972c320019159d40.mp4",
        "https://video.youcat.cn/670b354a68d311e9a956320019159d40.mp4",
        "https://video.youcat.cn/8eb460c650c511e987ee28cfe920ed2d.mp4",
        "https://video.youcat.cn/028416da671811e9a1b0320019159d40.mp4",
        "https://video.youcat.cn/9dfff9ac697611e9972c320019159d40.mp4",
        "https://video.youcat.cn/62b75dc0697811e9972c320019159d40.mp4",
        "https://video.youcat.cn/d5438042761d11e9812e320019159d40.mp4",
        "https://video.youcat.cn/f59edbda68cf11e9a956320019159d40.mp4",
        "https://video.youcat.cn/8ceb09f4697611e9972c320019159d40.mp4",
        "https://video.youcat.cn/edc16ce6697611e9972c320019159d40.mp4",
        "https://video.youcat.cn/aa71d454761d11e9812e320019159d40.mp4"
    ]
    
    var players: [AVPlayer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.rowHeight = 812
        tableView.estimatedRowHeight = 812
        tableView.isPagingEnabled = true
        for i in 0..<5 {
            players.append(AVPlayer(playerItem: AVPlayerItem(asset: AVAsset(url: URL(string: urls[i])!))))
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let top = min(indexPath.row, 2)
        let bottom = min((urls.count - 1) - indexPath.row, 2)
        
        let start = indexPath.row - top
        let end = indexPath.row + bottom
        let subUrls = urls[start...end]
        
        let playerUrls = players.map{($0.currentItem!.asset as! AVURLAsset).url.absoluteString}
        let idlePlayers = players.filter{!subUrls.contains(($0.currentItem!.asset as! AVURLAsset).url.absoluteString)}
        let newUrls = subUrls.filter{!playerUrls.contains($0)}
        for (i, url) in newUrls.enumerated() {
            idlePlayers[i].replaceCurrentItem(with: AVPlayerItem(asset: AVAsset(url: URL(string: url)!)))
        }
        
        print("will display \(indexPath.row)")
        
        let url = urls[indexPath.row]
        let player = players.first{($0.currentItem!.asset as! AVURLAsset).url.absoluteString == url}

        print("start =", start, "end=", end)
        
        if let l = cell.contentView.layer.sublayers?.first(where: { (layer) -> Bool in
            return layer.isKind(of: AVPlayerLayer.self)
        }) as? AVPlayerLayer {
            DispatchQueue.main.async {
                l.player = player
                l.player?.seek(to: CMTime.zero)
                l.player?.play()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let l = cell.contentView.layer.sublayers?.first(where: { (layer) -> Bool in
            return layer.isKind(of: AVPlayerLayer.self)
        }) as? AVPlayerLayer {
            DispatchQueue.main.async {
                l.player?.pause()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        if let _ = cell.contentView.layer.sublayers?.first(where: { (layer) -> Bool in
            return layer.isKind(of: AVPlayerLayer.self)
        }) as? AVPlayerLayer {
        } else {
            let layer = AVPlayerLayer(player: nil)
            layer.videoGravity = .resizeAspectFill
            layer.frame = CGRect(x: 0, y: 0, width: cell.contentView.bounds.width, height: cell.contentView.bounds.height)
            cell.contentView.layer.addSublayer(layer)
        }
        
        return cell
    }
}


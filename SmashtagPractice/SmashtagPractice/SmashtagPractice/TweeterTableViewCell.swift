//
//  TweeterTableViewCell.swift
//  SmashtagPractice
//
//  Created by Silvia on 2016-09-28.
//  Copyright © 2016 PearTree. All rights reserved.
//

import UIKit
import Twitter

class TweeterTableViewCell: UITableViewCell {

    @IBOutlet weak var tweeterText: UILabel!
    @IBOutlet weak var tweeterContent: UILabel!
    @IBOutlet weak var tweetCreatedDateLabel: UILabel!
    
    @IBOutlet weak var tweetUserImageView: UIImageView!
    var tweet : Twitter.Tweet? {
        didSet{
            updateCellContent()
        }
    }
    func updateCellContent() {
        tweeterText?.text = nil
        tweeterContent?.text = nil
        tweetCreatedDateLabel?.text = nil
        tweetUserImageView?.image = nil
        
        if let tweet = self.tweet {
            tweeterText?.text = tweet.user.name
            tweeterContent?.text = tweet.text
            
            //Populate image
            if let profileImageURL = tweet.user.profileImageURL {
                if let imageData = NSData(contentsOfURL: profileImageURL){
                    tweetUserImageView?.image = UIImage(data: imageData)
                }
            }
            
            //Populate date
            //Get a formatter object
            let formatter = NSDateFormatter()
            
            //Choose date style according to time created
            let moreThan24Hours = NSTimeInterval(24*60*60)
            if NSDate().timeIntervalSinceDate(tweet.created) > moreThan24Hours {
                formatter.dateStyle = NSDateFormatterStyle.ShortStyle
            }else{
                formatter.timeStyle = NSDateFormatterStyle.ShortStyle
            }
            
            //Set the date on the label with the right format
             tweetCreatedDateLabel?.text = formatter.stringFromDate(tweet.created)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

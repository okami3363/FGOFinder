//
//  ADCell.swift
//  FGOFinder
//
//  Created by david on 2018/7/3.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ADCell: UITableViewCell, GADVideoControllerDelegate {
    
    let adUnitID = "ca-app-pub-3940256099942544/3986624511"
    
    var nativeAdView: FFUnifiedNativeAdView!
    var adLoader: GADAdLoader!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        nativeAdView = FFUnifiedNativeAdView(frame: CGRect (x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        addSubview(nativeAdView)
        
        adLoader = GADAdLoader(adUnitID: adUnitID, rootViewController: nil,
                               adTypes: [ .unifiedNative ], options: nil)
        adLoader.delegate = self as? GADAdLoaderDelegate
        adLoader.load(GADRequest())
    }
    
    //MARK: - GADVideoControllerDelegate
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADUnifiedNativeAd) {
//        refreshAdButton.isEnabled = true
        
//        nativeAdView = FFUnifiedNativeAdView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        nativeAdView.nativeAd = nativeAd
        
        // Set ourselves as the native ad delegate to be notified of native ad events.
        nativeAd.delegate = self as? GADUnifiedNativeAdDelegate
        
        
        let firstImage: GADNativeAdImage? = nativeAd.images?.first
        (nativeAdView.imageView as? UIImageView)?.image = firstImage?.image
//
//        // Deactivate the height constraint that was set when the previous video ad loaded.
////        heightConstraint?.isActive = false
//
//        // Populate the native ad view with the native ad assets.
//        // Some assets are guaranteed to be present in every native ad.
//        (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
//        (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
//        (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
//        // Some native ads will include a video asset, while others do not. Apps can use the
//        // GADVideoController's hasVideoContent property to determine if one is present, and adjust their
//        // UI accordingly.
//        // The UI for this controller constrains the image view's height to match the media view's
//        // height, so by changing the one here, the height of both views are being adjusted.
//        if let controller = nativeAd.videoController, controller.hasVideoContent() {
//            // The video controller has content. Show the media view.
//            if let mediaView = nativeAdView.mediaView {
//                mediaView.isHidden = false
//                nativeAdView.imageView?.isHidden = true
//                // This app uses a fixed width for the GADMediaView and changes its height to match the aspect
//                // ratio of the video it displays.
//                if controller.aspectRatio() > 0 {
//                    heightConstraint = NSLayoutConstraint(item: mediaView,
//                                                          attribute: .height,
//                                                          relatedBy: .equal,
//                                                          toItem: mediaView,
//                                                          attribute: .width,
//                                                          multiplier: CGFloat(1 / controller.aspectRatio()),
//                                                          constant: 0)
//                    heightConstraint?.isActive = true
//                }
//            }
//            // By acting as the delegate to the GADVideoController, this ViewController receives messages
//            // about events in the video lifecycle.
//            controller.delegate = self
//            videoStatusLabel.text = "Ad contains a video asset."
//        }
//        else {
//            // If the ad doesn't contain a video asset, the first image asset is shown in the
//            // image view. The existing lower priority height constraint is used.
//            nativeAdView.mediaView?.isHidden = true
//            nativeAdView.imageView?.isHidden = false
//            let firstImage: GADNativeAdImage? = nativeAd.images?.first
//            (nativeAdView.imageView as? UIImageView)?.image = firstImage?.image
//            videoStatusLabel.text = "Ad does not contain a video."
//        }
//        // These assets are not guaranteed to be present, and should be checked first.
//        (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
//        if let _ = nativeAd.icon {
//            nativeAdView.iconView?.isHidden = false
//        } else {
//            nativeAdView.iconView?.isHidden = true
//        }
//        (nativeAdView?.starRatingView as? UIImageView)?.image = imageOfStars(from:nativeAd.starRating)
//        if let _ = nativeAd.starRating {
//            nativeAdView.starRatingView?.isHidden = false
//        }
//        else {
//            nativeAdView.starRatingView?.isHidden = true
//        }
//        (nativeAdView?.storeView as? UILabel)?.text = nativeAd.store
//        if let _ = nativeAd.store {
//            nativeAdView.storeView?.isHidden = false
//        }
//        else {
//            nativeAdView.storeView?.isHidden = true
//        }
//        (nativeAdView?.priceView as? UILabel)?.text = nativeAd.price
//        if let _ = nativeAd.price {
//            nativeAdView.priceView?.isHidden = false
//        }
//        else {
//            nativeAdView.priceView?.isHidden = true
//        }
//        (nativeAdView?.advertiserView as? UILabel)?.text = nativeAd.advertiser
//        if let _ = nativeAd.advertiser {
//            nativeAdView.advertiserView?.isHidden = false
//        }
//        else {
//            nativeAdView.advertiserView?.isHidden = true
//        }
//        // In order for the SDK to process touch events properly, user interaction should be disabled.
//        nativeAdView.callToActionView?.isUserInteractionEnabled = false
    }
    
    
}


class FFUnifiedNativeAdView: GADUnifiedNativeAdView {
    
    var ffNativeAd: GADUnifiedNativeAd!
    var ffHeadlineView: UIView!
    var ffCallToActionView: UIView!
    var ffIconView: UIView!
    var ffBodyView: UIView!
    var ffStoreView: UIView!
    var ffPriceView: UIView!
    var ffImageView: UIView!
    var ffStarRatingView: UIView!
    var ffAdvertiserView: UIView!
    var ffMediaView: UIView!
    var ffAdChoicesView: GADAdChoicesView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        ffImageView = UIImageView(frame: CGRect (x: 0, y: 0, width: frame.size.width, height: frame.size.height));
        imageView = ffImageView;
        addSubview(ffImageView)
    }
}

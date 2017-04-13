//
//  ShareViewController.swift
//  ChromeExtensionShareExtension
//
//  Created by ShinokiRyosei on 2017/04/13.
//  Copyright © 2017年 ShinokiRyosei. All rights reserved.
//

import UIKit
import Social

class ShareViewController: UIViewController {

    override func viewDidLoad() {

        guard
            let extensionItem = self.extensionContext?.inputItems.first as? NSExtensionItem,
            let itemProvider = extensionItem.attachments?.first as? NSItemProvider,
            let title = extensionItem.attributedContentText?.string
            else {

                return
        }

        itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil) { item, error in

            if let error = error {

                print(error)
            } else {

                guard let url = item as? URL else { return }
                print(url.absoluteString)
                print(title)
            }
        }
        extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
}

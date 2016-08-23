//
//  IAPHelper.swift
//  inappragedemo
//
//  Created by Ray Fix on 5/1/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import StoreKit

/// Notification that is generated when a product is purchased.
public let IAPHelperProductPurchasedNotification = "IAPHelperProductPurchasedNotification"

/// Product identifiers are unique strings registered on the app store.
public typealias ProductIdentifier = String

/// Completion handler called when products are fetched.
public typealias RequestProductsCompletionHandler = (_ success: Bool, _ products: [SKProduct]) -> ()


/// A Helper class for In-App-Purchases, it can fetch products, tell you if a product has been purchased,
/// purchase products, and restore purchases.  Uses NSUserDefaults to cache if a product has been purchased.
public class IAPHelper : NSObject  {
  
  /// MARK: - User facing API
  
  /// Initialize the helper.  Pass in the set of ProductIdentifiers supported by the app.
  public init(productIdentifiers: Set<ProductIdentifier>) {
	self.productIdentifiers = productIdentifiers
	super.init()
	SKPaymentQueue.default().add(self)
  }

	let productIdentifiers: Set<ProductIdentifier>
	var purchasedProductIdentifiers = Set<ProductIdentifier>()

	var productsRequest: SKProductsRequest?
	var completionHandler0: RequestProductsCompletionHandler?
  
  /// Gets the list of SKProducts from the Apple server calls the handler with the list of products.
  public func requestProductsWithCompletionHandler(_ handler: RequestProductsCompletionHandler) {
	completionHandler0 = handler
	productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
	productsRequest?.delegate = self
	productsRequest?.start()
//    handler(success: false, products: [])
  }

  /// Initiates purchase of a product.
  public func purchaseProduct(_ product: SKProduct) {
	print("Buying \(product.productIdentifier)")
	let payment = SKPayment(product: product)
	SKPaymentQueue.default().add(payment)
  }
  
  /// Given the product identifier, returns true if that product has been purchased.
  public func isProductPurchased(_ productIdentifier: ProductIdentifier) -> Bool {
    return false
  }
  
  /// If the state of whether purchases have been made is lost  (e.g. the
  /// user deletes and reinstalls the app) this will recover the purchases.
  public func restoreCompletedTransactions() {
  }

	public class func canMakePayments() -> Bool {
		return SKPaymentQueue.canMakePayments()
	}
}



extension IAPHelper: SKProductsRequestDelegate {

	public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
		print("Loaded list of products")
		completionHandler0!(true, response.products)
		clearRequest()

		for p in response.products {
			print("Found product: \(p.productIdentifier) \(p.localizedTitle) \(p.price.floatValue)")
		}
	}

	public func request(_ request: SKRequest, didFailWithError error: Error) {
		print("Failed to load list of products.")
		completionHandler0!(false, [])
		print("Error: \(error)")
		clearRequest()
	}

	private func clearRequest() {
		productsRequest = nil
		completionHandler0 = nil
	}
}


extension IAPHelper: SKPaymentTransactionObserver {

	public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
		for transaction in transactions {
			switch transaction.transactionState {
			case .purchased:
				completeTransaction(transaction)
				break
			case .failed:
				failedTransaction(transaction)
				break
			case .restored:
				restoreTransaction(transaction)
				break
			case .deferred:
				break
			case .purchasing:
				break
			}
		}
	}

	private func completeTransaction(_ transaction: SKPaymentTransaction) {
		print("completeTransaction...")
		provideContentForProductIdentifier(transaction.payment.productIdentifier)
		SKPaymentQueue.default().finishTransaction(transaction)
	}

	private func restoreTransaction(_ transaction: SKPaymentTransaction) {
		let productIdentifier = transaction.original?.payment.productIdentifier
		print("restoreTransaction... \(productIdentifier)")
		provideContentForProductIdentifier(productIdentifier!)
		SKPaymentQueue.default().restoreCompletedTransactions()
		SKPaymentQueue.default().finishTransaction(transaction)
	}

	private func provideContentForProductIdentifier(_ productIdentifier: String) {
		purchasedProductIdentifiers.insert(productIdentifier)
		UserDefaults.standard.set(true, forKey: productIdentifier)
		UserDefaults.standard.synchronize()
		NotificationCenter.default.post(name: Notification.Name(rawValue: IAPHelperProductPurchasedNotification), object: productIdentifier)
	}

	private func failedTransaction(_ transaction: SKPaymentTransaction) {
        print("failedTransaction...")
        NotificationCenter.default.post(name: Notification.Name(rawValue: IAPHelperProductPurchasedNotification), object: "fail")
        
        if (transaction.error as! NSError).code != SKError.Code.paymentCancelled.rawValue {
            print("Transaction error: \(transaction.error!)")
        }
        SKPaymentQueue.default().finishTransaction(transaction)
	}
}
















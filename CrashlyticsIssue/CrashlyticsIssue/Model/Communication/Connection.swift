//
//  Connection.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/19/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation
import Alamofire

///Communication class to communicate with the API's.
class APIConnection {
    
    class func hitRequest<T:Decodable>(url requestedFor: URLRequest , completion : @escaping (_ success : Bool, _ result : T?,_ error: Error?) -> ()) -> Void {
        sendRequestGenerics(urlRequest: requestedFor) { (success, result : T?,error : Error?)  in
            guard let _result = result else {
                completion(false , nil, error)
                return
            }
            completion(true , _result,nil)
        }
    }
    
    class func hitRequestToServer<T:Decodable>(url requestedFor: URLRequest , completion : @escaping (_ success : Bool, _ result : T?) -> ()) -> Void {
        sendRequestGenerics(urlRequest: requestedFor) { (success, result : T?)  in
            guard let _result = result else {
                completion(false , nil)
                return
            }
            completion(true ,_result)
        }
    }
    
    private class func sendRequestGenerics<T : Decodable>(urlRequest : URLRequest , completion : @escaping (_ status : Bool , _ data : T? ,_ error : Error?) -> Void ) -> Void {
        request(urlRequest).response { (response) in

            guard let data = response.data else {
                print("NO DATA")
                completion(false,nil,nil)
                return
            }
            do {
                print(String.init(data: data, encoding: String.Encoding.utf8) ?? "")
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(true , result,nil)
            } catch let error {
                print(error)
                print(error.localizedDescription)
                completion(false,nil,nil)
            }
        }
    }
    
    private class func sendRequestGenerics<T : Decodable>(urlRequest : URLRequest , completion : @escaping (_ status : Bool , _ data : T?) -> Void ) -> Void {
        request(urlRequest).response { (response) in
            guard let data = response.data else {
                print("NO DATA")
                completion(false,nil)
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(true , result)
            } catch let error {
                print(error)
                print(error.localizedDescription)
                completion(false,nil)
            }
        }
    }
}


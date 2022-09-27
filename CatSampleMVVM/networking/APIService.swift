//
//  APIService.swift
//  CatSampleMVVM
//
//  Created by Prashant Lohani on 27/09/22.
//

import Foundation

struct APIService : APIServiceProtocol{
    
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void) {
    guard let url = url else {
        let error = APIError.badURL
        completion(Result.failure(error))
        return
    }
    let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
    
        if let error = error as? URLError {
            completion(Result.failure(APIError.url(error)))
        }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
            completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
        }else if let data = data {
            let decoder = JSONDecoder()
            do {
                let breeds = try decoder.decode([Breed].self, from: data)
                completion(Result.success(breeds))
                
            }catch {
                completion(Result.failure(APIError.parsing(error as? DecodingError)))
            }
        }
    }

    task.resume()
    
    }
    
    
    func fetchImages(url: URL?, completion: @escaping(Result<[Any], APIError>) -> Void) {
            guard let url = url else {
                let error = APIError.badURL
                completion(Result.failure(error))
                return
            }
            let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
                if let error = error as? URLError {
                    completion(Result.failure(APIError.url(error)))
                }
                else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
                }
                else if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        var arr = [Any]()
                        if(response != nil){
                        let serverResponse = response as! HTTPURLResponse
                        let paginationCount = serverResponse.allHeaderFields["pagination-count"]!
                                print("paginationCount=",paginationCount)
                            //Adding pagination-header to response
                            arr.append(paginationCount)
                        }
                        let breeds = try decoder.decode([BreedImage].self, from: data)
                        arr.append(breeds)
                        print("arr=",arr)
                        completion(Result.success(arr))
                        
                    }catch {
                        completion(Result.failure(APIError.parsing(error as? DecodingError)))
                    }
                    
                }
            }

            task.resume()
    }
    
}

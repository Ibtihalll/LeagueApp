//
//  Parsing.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//
import Combine
import Foundation

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, LeagueError> {
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
                .parsing(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
}

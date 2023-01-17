//
//  LeagueFetcher.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//

import Foundation
import Combine

protocol LeagueFetchable {
    
    func allLeaguesResponse(
    ) -> AnyPublisher<AllLeaguesResponse, LeagueError>
    
    func leagueListResponse(
        byType type: String
    ) -> AnyPublisher<TeamListResponse, LeagueError>
    
    func teamDetailResponse(
        byName name: String
    ) -> AnyPublisher<TeamListResponse, LeagueError>
}

class LeagueFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension LeagueFetcher {
    struct LeagueAPI {
        static let scheme = "https"
        static let host = "www.thesportsdb.com"
        static let path = "/api/v1/json/50130162"
    }
    
    func allLeaguesComponents() -> URLComponents {
        
        var components = URLComponents()
        components.scheme = LeagueAPI.scheme
        components.host = LeagueAPI.host
        components.path = LeagueAPI.path + "/all_leagues.php"
        return components
    }
    
    func leagueListComponents(byType type: String) -> URLComponents {
        
        var components = URLComponents()
        components.scheme = LeagueAPI.scheme
        components.host = LeagueAPI.host
        components.path = LeagueAPI.path + "/search_all_teams.php"
        
        components.queryItems = [
            URLQueryItem(name: "l", value: type)
        ]
        return components
    }
    
    func teamDetailComponents(byName name: String) -> URLComponents {
        
        var components = URLComponents()
        components.scheme = LeagueAPI.scheme
        components.host = LeagueAPI.host
        components.path = LeagueAPI.path + "/searchteams.php"
        
        components.queryItems = [
            URLQueryItem(name: "t", value: name)
        ]
        return components
    }
}

extension LeagueFetcher: LeagueFetchable{
    func allLeaguesResponse() -> AnyPublisher<AllLeaguesResponse, LeagueError> {
        return get(with: allLeaguesComponents())
    }
    
    func leagueListResponse(byType type: String) -> AnyPublisher<TeamListResponse, LeagueError> {
        return get(with: leagueListComponents(byType: type))
    }
    
    func teamDetailResponse(byName name: String) -> AnyPublisher<TeamListResponse, LeagueError> {
        return get(with: teamDetailComponents(byName: name))
    }
    
    private func get<T>(
        with components: URLComponents
    ) -> AnyPublisher<T, LeagueError> where T: Decodable {
        
        guard let url = components.url else {
            let error = LeagueError.network(description: "url_not_created".localized())
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        print("\(url)")
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                    .network(description: error.localizedDescription)
            }
        
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
}

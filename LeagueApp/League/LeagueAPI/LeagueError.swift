//
//  LeagueError.swift
//  LeagueApp
//
//  Created by Devinsley on 11/01/2023.
//


enum LeagueError: Error {
    case parsing(description: String)
    case network(description: String)
}

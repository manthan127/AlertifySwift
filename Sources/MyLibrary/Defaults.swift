//
//  Defaults.swift
//  chatApp
//
//  Created by mac on 21/02/23.
//

import Foundation

class Defaults {
    static public var standard = Defaults()

    private let userDefaults: UserDefaults

    public init() {
        self.userDefaults = .standard
    }

    public init(suiteName: String) {
        self.userDefaults = UserDefaults(suiteName: suiteName) ?? .standard
    }

    public init(withSuite suite: UserDefaults) {
        self.userDefaults = suite
    }

    public func set<E: Encodable>(_ object: E?, forKey key: String) {
        if object == nil {
            return removeObject(forKey: key)
        }
        do {
            let data = try JSONEncoder().encode(object)
            userDefaults.set(data, forKey: key)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func removeObject(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }

    public func object<D: Decodable>(forType: D.Type, forKey key: String)-> D? {
        var object: D? = nil
        do {
            if let data = userDefaults.data(forKey: key) {
                object = try JSONDecoder().decode(D.self, from: data)
            }
        } catch {
            fatalError(error.localizedDescription)
        }
        return object
    }

    public subscript<E: Codable>(key: String) -> E? {
        get {
            object(forType: E.self, forKey: key)
        } set {
            if newValue == nil {
                removeObject(forKey: key)
            } else {
                set(newValue, forKey: key)
            }
        }
    }
}

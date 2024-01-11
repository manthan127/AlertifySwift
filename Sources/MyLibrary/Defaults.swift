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

    public func set<E: Encodable>(_ object: E?, forKey key: String, _ onError: ((Error)->())? = nil) {
        if object == nil {
            return removeObject(forKey: key)
        }
        do {
            let data = try JSONEncoder().encode(object)
            userDefaults.set(data, forKey: key)
        } catch {
            onError?(error)
        }
    }
    
    public func removeObject(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }

    public func object<D: Decodable>(forType: D.Type, forKey key: String, _ onError: ((Error)->())? = nil)-> D? {
        guard let data = userDefaults.data(forKey: key) else {return nil}
        do {
            return try JSONDecoder().decode(D.self, from: data)
        } catch {
            onError?(error)
            return nil
        }
    }

    public subscript<E: Codable>(key: String, onError: ((Error)->())? = nil) -> E? {
        get {
            object(forType: E.self, forKey: key, onError)
        } set {
            set(newValue, forKey: key, onError)
        }
    }
}

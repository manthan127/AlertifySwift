//
//  Defaults.swift
//  chatApp
//
//  Created by mac on 21/02/23.
//

import Foundation

struct Defaults {
    static var standard = Defaults()

    private let userDefaults: UserDefaults
    init(s: String? = nil) {
        if let s = s {
            self.userDefaults = UserDefaults(suiteName: s) ?? UserDefaults.standard
        } else {
            self.userDefaults = UserDefaults.standard
        }
    }

    func set<E: Encodable>(_ object: E, forKey key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            userDefaults.set(data, forKey: key)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func removeObject(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }

    subscript<E: Codable>(key: String) -> E? {
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
    
    func object<D: Decodable>(forType: D.Type, forKey key: String)-> D? {
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
}

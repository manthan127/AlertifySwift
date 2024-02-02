//
//  Defaults.swift
//  chatApp
//
//  Created by mac on 21/02/23.
//

import Foundation

public class Defaults {
    /// Returns the shared defaults object.
    static public var standard = Defaults()

    private let userDefaults: UserDefaults

    public init() {
        self.userDefaults = .standard
    }

    /// Creates a user Defaults object initialized with the defaults for the specified database name.
    /// - Parameters:
    ///     - suiteName:The domain identifier of the search list.
    public init?(suiteName: String?) {
        if let userDefaults = UserDefaults(suiteName: suiteName) {
            self.userDefaults = userDefaults
        } else {
            return nil
        }
    }

    /// Creates a user Defaults object initialized with the given UserDefaults.
    /// - Parameters:
    ///     - suite:An object of UserDefaults to store data in.
    public init(withSuite suite: UserDefaults) {
        self.userDefaults = suite
    }

    /// Sets the value of the specified key.
    /// - Parameters:
    ///     - object:The object to store in the defaults database.
    ///     - key:The key with which to associate the value.
    ///     - onError:Completion holder called if there is some issue while encoding given object
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

    /// Removes the value of the specified default key.
    /// - Parameters:
    ///     - key:The key whose value you want to remove.
    public func removeObject(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }

    /// Returns a value of the type you specify, associated with the specified key.
    /// - Parameters:
    ///     - type:The type of the value to decode from the given key.
    ///     - key:A key in the current user‘s defaults database.
    ///     - onError:Completion holder called if there is some issue while decoding object stored at the key
    /// - Returns: A value of the specified type object associated with the specified key, or nil if the key does not exist, its value is not a data object, or object stored in key does not match the provided type
    public func object<D: Decodable>(forType type: D.Type, forKey key: String, _ onError: ((Error)->())? = nil)-> D? {
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

//
//  LogUtils.swift
//  Gesture Snap
//
//  Created by Admin on 31/10/25.
//

import Foundation

struct LogUtils {
    
    enum Level: String {
        case info = "ℹ️ INFO"
        case warning = "⚠️ WARNING"
        case error = "❌ ERROR"
        case debug = "🐞 DEBUG"
    }
    
    static func log(
        _ message: Any,
        level: Level = .info,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
#if DEBUG
        let filename = (file as NSString).lastPathComponent
        let timestamp = Self.timestamp()
        
        print("[\(level.rawValue)] \(timestamp) [\(filename):\(line)] \(function) → \(message)")
#endif
    }
    
    private static func timestamp() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter.string(from: Date())
    }
}

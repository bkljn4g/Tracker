//
//  AnalyticsService.swift
//  Tracker
//
//  Created by Ann Goncharova on 31.10.2023.
//

import Foundation
import YandexMobileMetrica

struct AnalyticsService {
    static func activate() {
        guard let configuration = YMMYandexMetricaConfiguration(apiKey: "7f7a93fc-44bc-4a98-a962-12afc2009d81") else {
            return
        }
        YMMYandexMetrica.activate(with: configuration)
        return
    }
    
    func report(event: Events, params : [AnyHashable : Any]) {
        YMMYandexMetrica.reportEvent(event.rawValue, parameters: params, onFailure: { error in
            print("REPORT ERROR: %@", error.localizedDescription)
        })
    }
}

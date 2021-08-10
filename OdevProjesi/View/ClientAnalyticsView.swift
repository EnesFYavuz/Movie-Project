//
//  ClientAnalytics.swift
//  OdevProjesi
//
//  Created by Enes Yavuz on 9.08.2021.
//

import Foundation
import FirebaseAnalytics

class ClientAnalytics {
    // log when a plant is selected from the list of plants
     func MovieDetailViewedEvent(filmTitleViewed: String,filmDirectorViewed:String,filmPlotViewed:String,filmImdbRating:String) {
        Analytics.logEvent(AnalyticsEventViewItem, parameters: [
            AnalyticsParameterItemName: filmTitleViewed as String,
            AnalyticsParameterCharacter: filmDirectorViewed as String,
            AnalyticsParameterItemVariant: filmPlotViewed as String,
            AnalyticsParameterScore: filmImdbRating as String,
            
        ])
    }
}

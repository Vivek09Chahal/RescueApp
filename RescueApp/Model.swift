//
//  Model.swift
//  RescueApp
//
//  Created by Vivek on 11/09/24.
//
import Foundation

struct EmergencyContact: Identifiable {
    var id = UUID()
    var name: String
    var phoneNumber: String
}

//
//	Recipe.swift
//
//	Create by Nacho Garcia on 3/4/2018
//	Copyright © 2018. All rights reserved.

import Foundation


class Recipe : NSObject{

	var href : String!
	var results : [Result]!
	var title : String!
	var version : Float!

	init(fromDictionary dictionary: [String:Any]){
		href = dictionary["href"] as? String
		results = [Result]()
		if let resultsArray = dictionary["results"] as? [[String:Any]]{
			for dic in resultsArray{
				let value = Result(fromDictionary: dic)
				results.append(value)
			}
		}
		title = dictionary["title"] as? String
		version = dictionary["version"] as? Float
	}
}

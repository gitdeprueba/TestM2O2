//
//	Result.swift
//
//	Create by Nacho Garcia on 3/4/2018
//	Copyright © 2018. All rights reserved.

import Foundation


class Result : NSObject{

	var href : String!
	var ingredients : String!
	var thumbnail : String!
	var title : String!


	init(fromDictionary dictionary: [String:Any]){
		href = dictionary["href"] as? String
		ingredients = dictionary["ingredients"] as? String
		thumbnail = dictionary["thumbnail"] as? String
		title = dictionary["title"] as? String
	}


}

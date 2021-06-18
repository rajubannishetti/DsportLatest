

import Foundation
struct Events : Codable {
	let type : String?
	let id : Int?
	let datetime_utc : Date?
	let venue : Venue?
	let datetime_tbd : Bool?
	let performers : [Performers]?
	let is_open : Bool?
	let links : [String]?
	let datetime_local : String?
	let time_tbd : Bool?
	let short_title : String?
	let visible_until_utc : String?
	let stats : Stats?
	let taxonomies : [Taxonomies]?
	let url : String?
	let score : Double?
	let announce_date : String?
	let created_at : String?
	let date_tbd : Bool?
	let title : String?
	let popularity : Double?
	let description : String?
	let status : String?
	let access_method : AccessMethod?
	let event_promotion : EventPromotion?
	let announcements : Announcements?
	let conditional : Bool?
	let enddatetime_utc : String?
	let themes : [String]?
	let domain_information : [String]?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case id = "id"
		case datetime_utc = "datetime_utc"
		case venue = "venue"
		case datetime_tbd = "datetime_tbd"
		case performers = "performers"
		case is_open = "is_open"
		case links = "links"
		case datetime_local = "datetime_local"
		case time_tbd = "time_tbd"
		case short_title = "short_title"
		case visible_until_utc = "visible_until_utc"
		case stats = "stats"
		case taxonomies = "taxonomies"
		case url = "url"
		case score = "score"
		case announce_date = "announce_date"
		case created_at = "created_at"
		case date_tbd = "date_tbd"
		case title = "title"
		case popularity = "popularity"
		case description = "description"
		case status = "status"
		case access_method = "access_method"
		case event_promotion = "event_promotion"
		case announcements = "announcements"
		case conditional = "conditional"
		case enddatetime_utc = "enddatetime_utc"
		case themes = "themes"
		case domain_information = "domain_information"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		datetime_utc = try values.decodeIfPresent(Date.self, forKey: .datetime_utc)
		venue = try values.decodeIfPresent(Venue.self, forKey: .venue)
		datetime_tbd = try values.decodeIfPresent(Bool.self, forKey: .datetime_tbd)
		performers = try values.decodeIfPresent([Performers].self, forKey: .performers)
		is_open = try values.decodeIfPresent(Bool.self, forKey: .is_open)
		links = try values.decodeIfPresent([String].self, forKey: .links)
		datetime_local = try values.decodeIfPresent(String.self, forKey: .datetime_local)
		time_tbd = try values.decodeIfPresent(Bool.self, forKey: .time_tbd)
		short_title = try values.decodeIfPresent(String.self, forKey: .short_title)
		visible_until_utc = try values.decodeIfPresent(String.self, forKey: .visible_until_utc)
		stats = try values.decodeIfPresent(Stats.self, forKey: .stats)
		taxonomies = try values.decodeIfPresent([Taxonomies].self, forKey: .taxonomies)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		score = try values.decodeIfPresent(Double.self, forKey: .score)
		announce_date = try values.decodeIfPresent(String.self, forKey: .announce_date)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		date_tbd = try values.decodeIfPresent(Bool.self, forKey: .date_tbd)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		access_method = try values.decodeIfPresent(AccessMethod.self, forKey: .access_method)
		event_promotion = try values.decodeIfPresent(EventPromotion.self, forKey: .event_promotion)
		announcements = try values.decodeIfPresent(Announcements.self, forKey: .announcements)
		conditional = try values.decodeIfPresent(Bool.self, forKey: .conditional)
		enddatetime_utc = try values.decodeIfPresent(String.self, forKey: .enddatetime_utc)
		themes = try values.decodeIfPresent([String].self, forKey: .themes)
		domain_information = try values.decodeIfPresent([String].self, forKey: .domain_information)
	}

}

struct AccessMethod : Codable {
    
    let method : String?
    let created_at : String?
    let employee_only: Bool?
    
    enum CodingKeys: String, CodingKey {
        case method = "method"
        case created_at = "created_at"
        case employee_only = "employee_only"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        method = try values.decodeIfPresent(String.self, forKey: .method)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        employee_only = try values.decodeIfPresent(Bool.self, forKey: .employee_only)
    }
}


struct  EventPromotion: Codable {
    let headline : String?
    let additional_info : String?
    let images: EPImages?
    
    enum CodingKeys: String, CodingKey {
        case headline = "headline"
        case additional_info = "additional_info"
        case images = "images"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        headline = try values.decodeIfPresent(String.self, forKey: .headline)
        additional_info = try values.decodeIfPresent(String.self, forKey: .additional_info)
        images = try values.decodeIfPresent(EPImages.self, forKey: .images)
    }
}

struct EPImages: Codable {
    let icon : String?
    let png2x : String?
    let png3x : String?
    
    enum CodingKeys: String, CodingKey {
        case icon = "icon"
        case png2x = "png@2x"
        case png3x = "png@3x"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        png2x = try values.decodeIfPresent(String.self, forKey: .png2x)
        png3x = try values.decodeIfPresent(String.self, forKey: .png3x)
        
    }
}

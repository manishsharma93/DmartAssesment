
import Foundation

struct ResponseData : Codable {
	let id : String?
	let title : String?
	let type : String?
	let bucket_data : [Bucket_data]?
    
	enum CodingKeys: String, CodingKey {

		case id = "id"
		case title = "title"
		case type = "type"
		case bucket_data = "bucket_data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		bucket_data = try values.decodeIfPresent([Bucket_data].self, forKey: .bucket_data)
	}

}

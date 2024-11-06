//
//  BreweriesList.swift
//  BreweriesList
//
//  Created by Lavanya K on 05/11/2024.
//

struct BreweriesList : Codable {
    let id : String?
    let name : String?
    let brewery_type : String?
    let address_1 : String?
    let address_2 : String?
    let address_3 : String?
    let city : String?
    let state_province : String?
    let postal_code : String?
    let country : String?
    let longitude : String?
    let latitude : String?
    let phone : String?
    let website_url : String?
    let state : String?
    let street : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case brewery_type = "brewery_type"
        case address_1 = "address_1"
        case address_2 = "address_2"
        case address_3 = "address_3"
        case city = "city"
        case state_province = "state_province"
        case postal_code = "postal_code"
        case country = "country"
        case longitude = "longitude"
        case latitude = "latitude"
        case phone = "phone"
        case website_url = "website_url"
        case state = "state"
        case street = "street"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        brewery_type = try values.decodeIfPresent(String.self, forKey: .brewery_type)
        address_1 = try values.decodeIfPresent(String.self, forKey: .address_1)
        address_2 = try values.decodeIfPresent(String.self, forKey: .address_2)
        address_3 = try values.decodeIfPresent(String.self, forKey: .address_3)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state_province = try values.decodeIfPresent(String.self, forKey: .state_province)
        postal_code = try values.decodeIfPresent(String.self, forKey: .postal_code)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        website_url = try values.decodeIfPresent(String.self, forKey: .website_url)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        street = try values.decodeIfPresent(String.self, forKey: .street)
    }

}


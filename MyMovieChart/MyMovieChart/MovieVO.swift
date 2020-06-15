//
//  MovieVO.swift
//  MyMovieChart
//
//  Created by 김광준 on 2020/06/14.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import Foundation

//class MovieVO {
//    var thumbnail: String? // 영화 섬네일 주소
//    var title: String? // 영화 제목
//    var description: String? // 영화 설명
//    var detail: String? // 상세 정보
//    var opendate: String? // 개봉일
//    var rating: Double? // 평점
//}

struct MovieVO {
    var thumbnail: String? // 영화 섬네일 주소
    var title: String? // 영화 제목
    var description: String? // 영화 설명
    var detail: String? // 상세 정보
    var opendate: String? // 개봉일
    var rating: Double? // 평점
    var convertRating: String {
        guard let rating = rating else {
            return "Error : Can't convert double type of rating value to string type."
        }
        return "\(rating)"
    }
    var convertThumbnail: String {
        guard let thumbnail = thumbnail else {
            return "Error: Can't get Thumbnail Image."
        }
        return "\(thumbnail)"
    }
}



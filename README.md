<div align="center">
  <h1>DirtR</h1>
  <img width="500" alt="DirtR" src="https://media1.giphy.com/media/uBnr1pyJNN1ZhBoBKY/giphy-downsized.gif?cid=6104955es8fi8f3myha66tnb30y0wq726qni86cj41oz9b88&rid=giphy-downsized.gif&ct=g">
</div

## Table of Contents
- [Project Overview](#project-overview)
- [Built With](#built-with)
- [Setup](#setup)

## Project Overview
DirtR is an application where you can find all off roading trails in Colorado

## Built With
- Rails 5.2.8
- Ruby 2.7.4


## Setup

1. Clone the repository
2. cd into the root directory
3. Install gem packages: `bundle install`
4. Setup the database: `rails db:{drop,create,migrate,seed}`

## APIs

<details close>
<summary> Get All Counties </summary>
<br>

Request: <br>
```
GET /api/v1/counties
```

JSON Response Example:
```json
{
    "data": [
        {
            "id": "1",
            "type": "counties",
            "attributes": {
                "name": "Ouray County"
            }
        },
        {
            "id": "2",
            "type": "counties",
            "attributes": {
                "name": "Chaffee County"
            }
        },
        {
            "id": "3",
            "type": "counties",
            "attributes": {
                "name": "Teller County"
            }
        }
    ]
}
```
</details>

<details close>
<summary> Get County </summary>
<br>

Request: <br>
```
GET /api/v1/county?name="#{county}"
```

JSON Response Example:
```json
{
    "data": {
        "id": "27",
        "type": "county",
        "attributes": {
            "name": "Boulder County",
            "trails": [
                {
                    "id": 163,
                    "name": "Jenny Creek Trail ",
                    "latitude": "39.929561",
                    "longitude": "-105.624647",
                    "difficulty": "black",
                    "distance": "2.2",
                    "description": "Jenny Creek Trail is a lesser-used trail that goes from Yankee Doodle Lake Eldora Ski area. In it motorized 2 track and in summer is an out-and-back from Rollins pass road or Jenny Creek Road with no summer access through Eldora.",
                    "created_at": "2023-02-02T19:40:23.000Z",
                    "updated_at": "2023-02-02T19:40:23.000Z",
                    "start_elevation": "10,732 ft",
                    "avg_duration": "0:25:11",
                    "map_image": "https://ep1.pinkbike.org/trailstaticmap/563000/563447_3_500x200.png",
                    "thumbnail_image": "https://adventr.co/wp-content/uploads/2015/01/DSC03243.jpg",
                    "county_id": 27
                },
                {
                    "id": 164,
                    "name": "Jenny Creek Road ",
                    "latitude": "39.928003",
                    "longitude": "-105.592149",
                    "difficulty": "black",
                    "distance": "2.6",
                    "description": "Motorized road connecting Eldora to Moffat Road.",
                    "created_at": "2023-02-02T19:41:32.000Z",
                    "updated_at": "2023-02-02T19:41:32.000Z",
                    "start_elevation": "9,353 ft",
                    "avg_duration": "0:18:13",
                    "map_image": "https://ep1.pinkbike.org/trailstaticmap/563000/563444_2_500x200.png",
                    "thumbnail_image": "https://adventr.co/wp-content/uploads/2015/01/DSC03243.jpg",
                    "county_id": 27
                }
            ]
        }
    }
}
```
</details>

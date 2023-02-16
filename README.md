<div align="center">
  <h1>DirtR</h1>
  <img width="500" alt="DirtR" src="https://media1.giphy.com/media/uBnr1pyJNN1ZhBoBKY/giphy-downsized.gif?cid=6104955es8fi8f3myha66tnb30y0wq726qni86cj41oz9b88&rid=giphy-downsized.gif&ct=g">
</div

## Table of Contents
- [Project Overview](#project-overview)
- [DB Schema](#db-schema)
- [Built With](#built-with)
- [Setup](#setup)

## Project Overview
Dirtr is an application which simulates users, allows you to take control of a user account, and utilize an app to find/favorite offroading trails in Colorado. 

## DB Schema
<img width="450" alt="Screen Shot 2023-02-06 at 11 36 27 AM" src="https://user-images.githubusercontent.com/106944291/219200038-43fdeefb-340d-4a2b-ad1f-3ead851a3352.png">


## Built With
- Rails 5.2.8
- Ruby 2.7.4
- Docker 20.10.22
- CircleCI 2.1
- Heroku 7.68.0


## Setup

1. Clone the repository
2. cd into the root directory
3. Install gem packages: `bundle install`
4. Setup the database: `rails db:{drop,create,migrate,seed}`
5. Perform rake task to seed data: `rails csv_load:all`
6. Launch server: `rails s` or `docker-compose up --build`

## API Endpoints

<details close>
<summary> Get Users </summary>
<br>

Request: <br>
```
GET /api/v1/user?id=3
```

JSON Response Example:
```json
{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "name": "Shawn Lee",
            "trails": []
        }
    }
}
```
</details>

<details close>
<summary> Post User Trails </summary>
<br>

Request: <br>
```
POST /api/v1/user-trails
```

JSON Payload Example:
```json
{
    "trail_id": 4,
    "user_id": 3,
    "name": "Tomichi Pass",
    "latitude": "38.61367",
    "longitude": "-106.39009",
    "difficulty": "blue",
    "distance": "2",
    "description": "Tomichi Pass is a 2 mile less popular blue doubletrack trail located near Buena Vista Colorado. This atv/orv/ohv primary trail can be used both directions and has a hard overall physical rating with a 838 ft blue climb. On average it takes 51 minutes to complete this trail.",
    "created_at": "2023-02-02T16:37:32.000Z",
    "updated_at": "2023-02-02T16:37:32.000Z",
    "start_elevation": "11,128 ft",
    "avg_duration": "0:51:12",
    "map_image": "https://ep1.pinkbike.org/trailstaticmap/249000/249749_0_500x200.png",
    "thumbnail_image": "https://www.4x4explore.com/rds/t_rds/tomichi_ps_c.jpg",
    "county_id": 2
}
```
JSON Response Example:
```json
{
    "success": "Trail Added Successfully"
}

{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "name": "Shawn Lee",
            "trails": [
                {
                    "id": 4,
                    "name": "Tomichi Pass",
                    "latitude": "38.61367",
                    "longitude": "-106.39009",
                    "difficulty": "blue",
                    "distance": "2",
                    "description": "Tomichi Pass is a 2 mile less popular blue doubletrack trail located near Buena Vista Colorado. This atv/orv/ohv primary trail can be used both directions and has a hard overall physical rating with a 838 ft blue climb. On average it takes 51 minutes to complete this trail.",
                    "created_at": "2023-02-02T16:37:32.000Z",
                    "updated_at": "2023-02-02T16:37:32.000Z",
                    "start_elevation": "11,128 ft",
                    "avg_duration": "0:51:12",
                    "map_image": "https://ep1.pinkbike.org/trailstaticmap/249000/249749_0_500x200.png",
                    "thumbnail_image": "https://www.4x4explore.com/rds/t_rds/tomichi_ps_c.jpg",
                    "county_id": 2
                }
            ]
        }
    }
}
```
</details>

<details close>
<summary> Get All Trails </summary>
<br>

Request: <br>
```
GET /api/v1/trails
```

JSON Response Example:
```json
{
    "data": [
        {
            "id": "1",
            "type": "trails",
            "attributes": {
                "id": 1,
                "name": "Cowboy Lake",
                "latitude": "38.22771",
                "longitude": "-107.54796",
                "difficulty": "green",
                "distance": "1.5",
                "description": "Cowboy Lake is a 1 mile less popular green doubletrack trail located near Ridgway Colorado. This atv/orv/ohv primary trail can be used both directions.",
                "created_at": "2023-02-02T16:34:05.000Z",
                "updated_at": "2023-02-02T16:34:05.000Z",
                "start_elevation": "9,184 ft",
                "avg_duration": null,
                "map_image": "https://ep1.pinkbike.org/trailstaticmap/421000/421278_0_500x200.png",
                "thumbnail_image": "https://4.bp.blogspot.com/-Duyiyyb7WWU/U_JKdTEN5yI/AAAAAAAAZ64/dipM0wxc3L8/s1600/Cowboy%2BLake%2B132.JPG",
                "county_id": 1
            }
        },
        {
            "id": "2",
            "type": "trails",
            "attributes": {
                "id": 2,
                "name": "Lou Creek",
                "latitude": "38.22771",
                "longitude": "-107.54796",
                "difficulty": "blue",
                "distance": "2.7",
                "description": "Lou Creek is a 3 mile less popular blue doubletrack trail located near Ridgway Colorado. This atv/orv/ohv primary trail can be used both directions. On average it takes 57 minutes to complete this trail.",
                "created_at": "2023-02-02T16:35:14.000Z",
                "updated_at": "2023-02-02T16:35:14.000Z",
                "start_elevation": "9,214 ft",
                "avg_duration": "0:57:30",
                "map_image": "https://ep1.pinkbike.org/trailstaticmap/421000/421237_0_500x200.png",
                "thumbnail_image": "https://1.bp.blogspot.com/-20tDnLc9Fwg/U_N2uPV9w6I/AAAAAAAAZ9s/nW4wVtOB_Tc/s1600/West%2BFork%2B004.JPG",
                "county_id": 1
            }
        },
        {
            "id": "3",
            "type": "trails",
            "attributes": {
                "id": 3,
                "name": "Stealey Mountain North",
                "latitude": "38.14721",
                "longitude": "-107.59245",
                "difficulty": "blue",
                "distance": "3.6",
                "description": "Stealey Mountain North is a 2 mile less popular blue singletrack trail located near Ridgway Colorado. This hike primary trail can be used both directions",
                "created_at": "2023-02-02T16:36:23.000Z",
                "updated_at": "2023-02-02T16:36:23.000Z",
                "start_elevation": "9,742 ft",
                "avg_duration": null,
                "map_image": "https://ep1.pinkbike.org/trailstaticmap/421000/421103_0_500x200.png",
                "thumbnail_image": "https://i.ytimg.com/vi/IgvX5v4YzpE/maxresdefault.jpg",
                "county_id": 1
            }
        }
    ]
}
```
</details>

<details close>
<summary> Get Trail </summary>
<br>

Request: <br>
```
GET /api/v1/trail?id=2
```

JSON Response Example:
```json
{
    "data": {
        "id": "2",
        "type": "trail",
        "attributes": {
            "id": 2,
            "name": "Lou Creek",
            "latitude": "38.22771",
            "longitude": "-107.54796",
            "difficulty": "blue",
            "distance": "2.7",
            "description": "Lou Creek is a 3 mile less popular blue doubletrack trail located near Ridgway Colorado. This atv/orv/ohv primary trail can be used both directions. On average it takes 57 minutes to complete this trail.",
            "created_at": "2023-02-02T16:35:14.000Z",
            "updated_at": "2023-02-02T16:35:14.000Z",
            "start_elevation": "9,214 ft",
            "avg_duration": "0:57:30",
            "map_image": "https://ep1.pinkbike.org/trailstaticmap/421000/421237_0_500x200.png",
            "thumbnail_image": "https://1.bp.blogspot.com/-20tDnLc9Fwg/U_N2uPV9w6I/AAAAAAAAZ9s/nW4wVtOB_Tc/s1600/West%2BFork%2B004.JPG",
            "county_id": 1
        }
    }
}
```
</details>

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

<details close>
<summary> Delete User Trail </summary>
<br>

Request: <br>
```
DELETE /api/v1/user-trails
```

JSON Payload Example:
```json
{
    "user_id": 3,
    "trail_id": 4
}
```

JSON Response Example:
```json
{
    "success": "Trail Removed From Favorites"
}
```
</details>

## Contact

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/89422302?v=4" width='150'></td>
    <td><img src="https://avatars.githubusercontent.com/u/104859844?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/108506841?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/106944291?s=150&v=4"></td>
  </tr>
  <tr>
    <td>Alex Mora</td>
    <td>Eli Fuchsman</td>
    <td>Kenz Leng</td>
    <td>Shawn Lee</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/AlexMR-93">GitHub</a><br>
      <a href="https://www.linkedin.com/in/alex-m-b25902240/">LinkedIn</a>
    </td>
    <td>
       <a href="https://github.com/efuchsman">GitHub</a><br>
       <a href="https://www.linkedin.com/in/elifuchsman/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/kenzjoy">GitHub</a><br>
      <a href="https://www.linkedin.com/in/kenzjoydev/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Shawnl93">GitHub</a><br>
      <a href="https://www.linkedin.com/in/shawn-lee-3382aa8b/">LinkedIn</a>
    </td>
  </tr>
</table>

<p align="right">(<a href="#top">back to top</a>)</p>


## Acknowledgments

Turing School of Software Design: [https://turing.edu/](https://turing.edu/)
<br>
Trailforks: [https://www.trailforks.com/](https://www.trailforks.com/)

<p align="right">(<a href="#top">back to top</a>)</p>

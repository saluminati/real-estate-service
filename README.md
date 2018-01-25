## Real Estate Micro Service

This is a rails Real Estate Micro Service which exposes RESTFUL API and lets the user  to **CREATE**, **READ**, **UPDATE** and **DELETE** his/her properties. It also consumes the **[Auth Service Micro Service](https://github.com/saluminati/auth-service)**

This microservice has a **Connection Helper** (connection_helper.rb) which is handling the communication with Auth Microservice and it is used in application controller.


### Installation
after downloading the repository do the following steps:
```
change the database credentials in config/database.yml
```
```
$ bundle install
```
```
$ db:setup
```
***Important***
Please change the Auth Service End Point  Base URL to where you have deployed that microservice
```
application.rb
config.AUTH_API_BASE_URL = 'http://localhost:4000/v1/'
```


### Running the instance
```
$ rails server -p 4000
```
### Testing end points
***Important note***

You need to obtain the JWT token from the Auth Microservice before you consume any functionality of this API.

Please refer to the README from [Auth Microservice](https://github.com/saluminati/auth-service)

```
This API will return HTTP status 401 on providing invalid token
```



### GET Properties
```
URL:
GET http://localhost:3000/v1/properties

Request Header:
content-type: application/json
authorization: Bearer **********TOKEN**********
```
#### Response
```
[
    {
        "id": 1,
        "title": "Some title",
        "description": "some description",
        "street_address": "some street address",
        "state": "VIC",
        "post_code": "3073",
        "created_at": "2018-01-25T00:58:08.000Z",
        "updated_at": "2018-01-25T04:07:06.000Z",
        "user_id": 1
    },
    {
        "id": 2,
        "title": "Some title",
        "description": "some description",
        "street_address": "some street address",
        "state": "VIC",
        "post_code": "3073",
        "created_at": "2018-01-25T00:58:08.000Z",
        "updated_at": "2018-01-25T04:07:06.000Z",
        "user_id": 1
    }

]
```



### GET v1/properties

**returns JSON list of properties of a user**
```
URL:
GET http://localhost:3000/v1/properties/:id

Request Header:
content-type: application/json
authorization: Bearer **********TOKEN**********

```

#### Response
```
{
        "id": 1,
        "title": "Some title",
        "description": "some description",
        "street_address": "some street address",
        "state": "VIC",
        "post_code": "3073",
        "created_at": "2018-01-25T00:58:08.000Z",
        "updated_at": "2018-01-25T04:07:06.000Z",
        "user_id": 1
}
```

```
returns HTTP status 404 on providing invalid token
```

### POST v1/properties
**Let the user create a property**
```
URL:
POST http://localhost:3000/v1/properties/

Request Header:
content-type: application/json
authorization: Bearer **********TOKEN**********

Request body:
{
	"v1_property":
	{
		"title": "some random building"
	    "description": "some random description"
	    "street_address": "123 street xyz road"
	    "post_code": "3073'
	    "state": "Victoria"
	}
}

```

#### Response
```
On Sucess:
HTTP OK status 200

On Failure:
HTTP Unprocessable status 422 with a json object of any validations issues

Example
{
    "description": [
        "is too short (minimum is 20 characters)",
        "can't be blank"
    ],
    "street_address": [
        "is too short (minimum is 10 characters)",
        "can't be blank"
    ],
    "state": [
        "is too short (minimum is 3 characters)",
        "can't be blank"
    ],
    "post_code": [
        "is the wrong length (should be 4 characters)",
        "can't be blank"
    ]
}
```

### PUT v1/properties/:id
**Let the user update an existing property**
```
URL:
POST http://localhost:3000/v1/properties/:id

Request Header:
content-type: application/json
authorization: Bearer **********TOKEN**********

Request body:
{
	"v1_property":
	{
		"title": "some random building"
	    "description": "some random description"
	    "street_address": "123 street xyz road"
	    "post_code": "3073'
	    "state": "Victoria"
	}
}

```

#### Response
```
On Sucess:
HTTP OK status 200

On Failure:
HTTP Unprocessable status 422 with a json object of any validations issues

Example
{
    "description": [
        "is too short (minimum is 20 characters)",
        "can't be blank"
    ],
    "street_address": [
        "is too short (minimum is 10 characters)",
        "can't be blank"
    ],
    "state": [
        "is too short (minimum is 3 characters)",
        "can't be blank"
    ],
    "post_code": [
        "is the wrong length (should be 4 characters)",
        "can't be blank"
    ]
}
```


### DELETE v1/properties
**Let the user update an existing property**
```
URL:
DELETE http://localhost:3000/v1/properties/:id

Request Header:
content-type: application/json
authorization: Bearer **********TOKEN**********
```

#### Response
```
On Sucess:
HTTP OK status 204

On Failure:
HTTP Unprocessable status 422 with a json object of any validations issues
```



### TODOs

 1. Integration of [Pundit](https://github.com/varvet/pundit) for better Autherization



Heroku: http://appdevworkdone.herokuapp.com/api/posts/

Get all posts

GET  /api/posts/

{
	“success”: True,
	“data” : [
    <POST>,
   <POST>,
...
]
}


Get all users

GET  /api/users/

{
	“success”: True,
	“data” : [
    <USER>,
   <USER>,
...
]
}

Get User

GET /api/users/<int:user_id>/

{
    "success": true,
    "data": [
        {
            "id": <USER_ID>,
            "name": <USER INPUT>,
            "phone_number":  <USER INPUT>,
            "posts": [<POST>, <POST>, ...],
            "bio": <USER INPUT> or null 
        }
    ]
}

Get all posts with the given keyword

GET /api/posts/keyword/<string:keyword>/

{
	“success”: True,
	“data” : {
“id”: 1,
“word”: <KEYWORD>, 
“posts”:  [
    <POST>,
   <POST>,
...
]
}
}
Get post 

GET /api/posts/<int:post_id>/
{
    "success": true,
    "data": [
        {
            "id": <POST_ID>,
            "user_id": 1,
            "time": <USER INPUT>,
	“title”: <USER INPUT>,
	“price”: <USER INPUT>,
	“name”: <USER INPUT>,
            "info": <USER INPUT>,
            "number": <USER INPUT>,
            "likes": <NUM_OF_LIKES>,
            "request": <Boolean USER INPUT>,
            "keywords": [
                {
                    "id": 5,
                    "word": "clean"
                },
                {
                    "id": 22,
                    "word": "laundry"
                }
            ]
        }
    ]

}

Create Post

		    # The user_id is the person making the post
POST /api/posts/<int:user_id>/     	
Request
{
    "time": <USER INPUT>,     		# The time the post was made
   “name”: <USER INPUT>,
    "info": <USER INPUT>,	
    “title”: <USER INPUT>,
     “price”: <USER INPUT>,	
    "phone_number": <USER INPUT>,		# Phone Number
    “request”: <Boolean USER INPUT>,	# True if the post is a request for help, false if not
    “keywords”: [<TEXT> , <TEXT>, ...] 
}

Response
{
    "success": true,
    "data": [
        {
            "id": 1,
            "user_id": 1,
            "time": <USER INPUT>,
            "info": <USER INPUT>,
            “title”: <USER INPUT>,
            “price”: <USER INPUT>,
            “name”: <USER INPUT>,
            "phone_number": <USER INPUT>,
            "likes": 1,
            "request": <Boolean USER INPUT>,
            "keywords": [
                {
                    "id": 5,
                    "word": "clean"
                },
                {
                    "id": 22,
                    "word": "laundry"
                }
            ]
        }
    ]

}


Create User

POST /api/users/

Request 

{
    "name": <USER_INPUT>,
    "phone_number":  <USER_INPUT>,
    "bio":  <USER_INPUT (Optional)>
}
 

Response

{
    "success": true,
    "data": [
        {
            "id": 1,
            "name": <USER INPUT>,
            "phone_number":  <USER INPUT>,
            "posts": [],
            "bio": <USER INPUT> or null 
        }
    ]
}

Upvote Post

POST /api/posts/<post_id>/upvote/

{
    "success": true,
    "data": <POST> # with likes + 1
}

Downvote Post

POST /api/posts/<post_id>/downvote/

{
    "success": true,
    "data": <POST> # with likes + 1
}

Delete User 
(Deletes their posts as well)

DELETE api/users/<user_id>/

{
    "success": true,
    "data": <DELETED USER>
}

Delete Post

DELETE api/posts/<post_id>/

{
    "success": true,
    "data": <DELETED POST>
}
#URL:

* https://still-island-6789.herokuapp.com

#USER

###Register
```POST ‘/users/register’```

######Params:

* username
* email
* password

Example Success:

```
    {
      "id": 1,
      "email": "mary@poppins.com",
      "password": "cea205a2de95383297dcfe248c5a1b3038ca01c0",
      "access_token": "1c4864db5ee70e4af3d3a7702966b254",
      "created_at": "2015-07-08T19:39:46.161Z",
      "updated_at": "2015-07-08T19:39:46.161Z",
      "username": "mpoppins"
    }
```
Status Code: :created

Example Failures:

```
  {
    "errors": [
    "Email is not a valid email",
    "Username can't be blank"
    ]
  }
```
Status Code: :unprocessable_entity
###Login
```POST '/users/login'```

######Params:

* email
* password

Example Success:

```
  {
    "id": 2,
    "email": "walt@white.com",
    "password": "33e475263fead060c56753b9003467f268fdba4d",
    "access_token": "7b64bc42e115ce71ff84d1f8593a6a2b",
    "created_at": "2015-07-10T03:08:00.762Z",
    "updated_at": "2015-07-10T03:08:00.762Z",
    "username": "heisenberg"
  }
```
Status Code: :ok

Example Failure:

```
  {
    "message": "Wrong email/password"
  }
```
Status code: :unprocessable_entity

###Index
```GET '/users'```

Example Success:

```
  [
    {
      "id": 1,
      "email": "mary@poppins.com",
      "password": "cea205a2de95383297dcfe248c5a1b3038ca01c0",
      "access_token": "1c4864db5ee70e4af3d3a7702966b254",
      "created_at": "2015-07-08T19:18:05.400Z",
      "updated_at": "2015-07-08T19:18:05.400Z",
      "username": mpoppins
    },
    {
      "id": 2,
      "email": "walt@white.com",
      "password": "33e475263fead060c56753b9003467f268fdba4d",
      "access_token": "7b64bc42e115ce71ff84d1f8593a6a2b",
      "created_at": "2015-07-08T19:39:46.161Z",
      "updated_at": "2015-07-08T19:39:46.161Z",
      "username": "heisenberg"
    }
  ]
```
Status Code: :ok

###Show
```GET '/users/:user_id'```

Example Success:

```
  {
    "id": 1,
    "email": "mary@poppins.com",
    "access_token": "1c4864db5ee70e4af3d3a7702966b254"
  }
```
Status Code: :ok

###Delete
```DELETE '/users/:user_id'```

* Requires Access-Token in Headers.

Example Success:

```
  {
    "message": "User deleted"
  }
```
Status Code: :ok

Example Failure:

```
  {
    "message": "Only the author of an account may delete an account."
  }
```
Status Code: :unauthorized

#PROFILE

###Create
```POST '/profiles'```

When you register as a user you are granted an access token.  The access token will identify you as a unique user of Setup.

In creating a profile you become a profiler.  You must enter the username and email of your friend, the profilee.  You will also create a password for them which they will then change later.  

All of the parameters listed below are required for profile creation.

######Params:


* email (of your friend)
* username
* password
* birthyear
* gender
* orientation
* occupation
* location

Example Success:

```
 {
  "profiles": {
    "id": 1,
    "profiler_id": 1,
    "profilee_id": 2,
    "created_at": "2015-07-15T19:43:18.674Z",
    "updated_at": "2015-07-15T19:43:18.674Z"
  },
  "questions": [
    {
      "id": 1,
      "name": "user2",
      "email": "user2@2.com",
      "birthyear": 1999,
      "gender": "male",
      "orientation": "straight",
      "occupation": "bum",
      "location": "Atlanta",
      "created_at": "2015-07-15T19:43:18.680Z",
      "updated_at": "2015-07-15T19:43:18.680Z",
      "profile_id": 1
    }
  ],
  "videos": [],
  "images": []
}
```
Status Code: 201 Created

Example Failure:

In this API you MAY NOT create a profile for yourself.

```
	{
	  "errors": [
    "Profilee cannot be same as Profiler"
 	]
	}

```
```
{
  "errors": [
    "Questions is invalid"
  ]
}
```
Status Code: 422 Unprocessable Entity
###Show

```GET '/profiles/:id'```

This endpoint will show a given profile and all of the videos, images and questions associated with it.

Example Success:

```
{
  "profiles": {
    "id": 1,
    "profiler_id": 1,
    "profilee_id": 2,
    "created_at": "2015-07-15T19:43:18.674Z",
    "updated_at": "2015-07-15T19:43:18.674Z"
  },
  "questions": [
    {
      "id": 1,
      "name": "user2",
      "email": "user2@2.com",
      "birthyear": 1999,
      "gender": "male",
      "orientation": "straight",
      "occupation": "bum",
      "location": "Atlanta",
      "created_at": "2015-07-15T19:43:18.680Z",
      "updated_at": "2015-07-15T19:43:18.680Z",
      "profile_id": 1
    }
  ],
  "videos": [
    {
      "id": 1,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "https://catvideo.com",
      "created_at": "2015-07-15T19:51:59.688Z",
      "updated_at": "2015-07-15T19:51:59.688Z",
      "main": true,
      "caption": "Look at this cat!",
      "thumbnail_url": "https://thumbnail.com"
    },
    {
      "id": 2,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "https://dogvideo.com",
      "created_at": "2015-07-15T19:55:26.585Z",
      "updated_at": "2015-07-15T19:55:26.585Z",
      "main": true,
      "caption": "Look at this dog!",
      "thumbnail_url": "https://thumbnail.com"
    },
    {
      "id": 3,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "https://snakevideo.com",
      "created_at": "2015-07-15T19:55:42.124Z",
      "updated_at": "2015-07-15T19:55:42.124Z",
      "main": true,
      "caption": "Look at this snake!",
      "thumbnail_url": "https://thumbnail.com"
    },
    {
      "id": 4,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "https://hippovideo.com",
      "created_at": "2015-07-15T19:55:52.135Z",
      "updated_at": "2015-07-15T19:55:52.135Z",
      "main": true,
      "caption": "Look at this hippo!",
      "thumbnail_url": "https://thumbnail.com"
    }
  ]
}

```

###Index
```GET``` '/profiles'

You can fetch all profiles at this endpoint.

Example Success:

```
{
  "profiles": [
    {
      "id": 1,
      "profiler_id": 1,
      "profilee_id": 2,
      "created_at": "2015-07-15T19:43:18.674Z",
      "updated_at": "2015-07-15T19:43:18.674Z"
    },
    {
      "id": 2,
      "profiler_id": 1,
      "profilee_id": 3,
      "created_at": "2015-07-15T19:47:21.579Z",
      "updated_at": "2015-07-15T19:47:21.579Z"
    }
  ],
  "questions": [
    {
      "id": 1,
      "name": "user2",
      "email": "user2@2.com",
      "birthyear": 1999,
      "gender": "male",
      "orientation": "straight",
      "occupation": "bum",
      "location": "Atlanta",
      "created_at": "2015-07-15T19:43:18.680Z",
      "updated_at": "2015-07-15T19:43:18.680Z",
      "profile_id": 1
    },
    {
      "id": 2,
      "name": "user3",
      "email": "user3@3.com",
      "birthyear": 1999,
      "gender": "female",
      "orientation": "straight",
      "occupation": "scientist",
      "location": "Atlanta",
      "created_at": "2015-07-15T19:47:21.581Z",
      "updated_at": "2015-07-15T19:47:21.581Z",
      "profile_id": 2
    }
  ],
  "videos": [
    {
      "id": 1,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "https://catvideo.com",
      "created_at": "2015-07-15T19:51:59.688Z",
      "updated_at": "2015-07-15T19:51:59.688Z",
      "main": true,
      "caption": "Look at this cat!",
      "thumbnail_url": "https://thumbnail.com"
    },
    {
      "id": 2,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "https://dogvideo.com",
      "created_at": "2015-07-15T19:55:26.585Z",
      "updated_at": "2015-07-15T19:55:26.585Z",
      "main": true,
      "caption": "Look at this dog!",
      "thumbnail_url": "https://thumbnail.com"
    },
    {
      "id": 3,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "https://snakevideo.com",
      "created_at": "2015-07-15T19:55:42.124Z",
      "updated_at": "2015-07-15T19:55:42.124Z",
      "main": true,
      "caption": "Look at this snake!",
      "thumbnail_url": "https://thumbnail.com"
    },
    {
      "id": 4,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "https://hippovideo.com",
      "created_at": "2015-07-15T19:55:52.135Z",
      "updated_at": "2015-07-15T19:55:52.135Z",
      "main": true,
      "caption": "Look at this hippo!",
      "thumbnail_url": "https://thumbnail.com"
    }
  ],
  "images": []
}
```

###Edit
Currently their is no endpoint to change attributes on the Question model.  This may be added as a feature at a later date.

###Delete
```DELETE '/profiles/:id'```

A profile may only be deleted by its profiler.  A profilee cannot delete a profile created about her, but may delete other profiles for whom she is the profiler.

Example Success:

```
{ "message": "Profile deleted."
}
```
Status Code: :ok

Example Failure:

```
{
  "message": "Only the author of a profile may delete a profile."
}
```
Status code :422

###Video Upload
```POST '/profiles/:profile_id/videos'```

One video at a time y'all.  Make sure to include these params.  Also note that only 4 videos may be associated with any one profile.

######Params:
* video_url
* thumbnail_url
* caption
* video_type

Example Success:

```
{
  "id": 1,
  "videoable_id": 1,
  "videoable_type": "Profile",
  "video_url": "https://catvideo.com",
  "created_at": "2015-07-15T19:51:59.688Z",
  "updated_at": "2015-07-15T19:51:59.688Z",
  "caption": "Look at this cat!",
  "thumbnail_url": "https://thumbnail.com"
}
```
Status Code: 200 ok

Example Failure:

```
{
  "errors": [
    "Already have maximum number of videos"
  ]
}
```
Status Code: 422 Unprocessable Entity
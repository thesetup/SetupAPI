#API Documention for Setup

##TABLE OF CONTENTS:

1. [USER] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#user)
	*	[Register] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#register)
	*  [Login] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#login)
	*  [Index] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#index)
	*  [Show] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#show)
	*  [Delete] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md###delete)

2. [PROFILE] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#profile)
	*  [Create] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#create)
	*  [Show Profile] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#show-profile)
	*  [Show All Profiles for User] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#show-all-profiles-for-user)
	*  [Index Profiles] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#index-profiles)
	*  [Edit Profile] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#ddit-profile)
	*  [Delete Profile] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#delete-profile)

3.  [VIDEO] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#video)

	*  [Create Video] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#create-video)
	*  [Swap Video] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#swap-video)
	*  [Delete Video] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#delete-video)

4.  [AVATAR] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#avatar)

	* [Create Avatar for Profile] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#create-avatar-for-profile)
	* [Create Avatar for Yourself] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#create-avatar-for-yourself)

5. [SEARCH] (https://github.com/thesetup/YsrvAbeDbA/blob/master/README.md#search)


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
	"email": "user1@test.net",
	"username": "user1",
	"access_token": "9d2a999c7279e503470323eabc0d7ec1",
	"created_at": "2015-07-23T01:36:54.986Z",
	"updated_at": "2015-07-23T01:36:54.986Z"
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

Example Response:

If the logged in user has a profile, this is the response you can expect.

```
{
  "id": 18,
  "email": "user18@test.net",
  "access_token": "f187b4ce68f733b6db755299dba1bd57",
  "created_at": "2015-07-23T02:18:30.496Z",
  "updated_at": "2015-07-23T02:18:30.496Z",
  "username": "user18",
  "avatar_file_name": null,
  "avatar_content_type": null,
  "avatar_file_size": null,
  "avatar_updated_at": null,
  "avatar_remote_url": null,
  "made_profile": {
    "id": 16,
    "profiler_id": 13,
    "profilee_id": 18,
    "created_at": "2015-07-23T02:18:30.500Z",
    "updated_at": "2015-07-23T02:18:30.500Z"
  }
}
```
If the logged in user does not have a profile, peep this.

```
{
  "id": 1,
  "email": "user1@test.net",
  "access_token": "9d2a999c7279e503470323eabc0d7ec1",
  "created_at": "2015-07-23T01:36:54.986Z",
  "updated_at": "2015-07-23T01:36:54.986Z",
  "username": "user1",
  "avatar_file_name": null,
  "avatar_content_type": null,
  "avatar_file_size": null,
  "avatar_updated_at": null,
  "avatar_remote_url": null
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
    "email": "user1@test.net",
    "created_at": "2015-07-23T01:36:54.986Z",
    "updated_at": "2015-07-23T01:36:54.986Z",
    "username": "user1",
    "avatar_file_name": null,
    "avatar_content_type": null,
    "avatar_file_size": null,
    "avatar_updated_at": null,
    "avatar_remote_url": null
  },
  {
    "id": 2,
    "email": "user2@test.net",
    "created_at": "2015-07-23T01:40:03.218Z",
    "updated_at": "2015-07-23T01:40:03.218Z",
    "username": "user2",
    "avatar_file_name": null,
    "avatar_content_type": null,
    "avatar_file_size": null,
    "avatar_updated_at": null,
    "avatar_remote_url": null
  },
  {
    "id": 3,
    "email": "user3@test.net",
    "created_at": "2015-07-23T01:48:03.031Z",
    "updated_at": "2015-07-23T01:48:03.031Z",
    "username": "user3",
    "avatar_file_name": null,
    "avatar_content_type": null,
    "avatar_file_size": null,
    "avatar_updated_at": null,
    "avatar_remote_url": null
  },
  {
    "id": 4,
    "email": "user4@test.net",
    "created_at": "2015-07-23T01:50:58.337Z",
    "updated_at": "2015-07-23T01:50:58.337Z",
    "username": "user4",
    "avatar_file_name": null,
    "avatar_content_type": null,
    "avatar_file_size": null,
    "avatar_updated_at": null,
    "avatar_remote_url": null
  }
    ]
```
Status Code: :ok

###Show
```GET '/users/:user_id'```

Example Success:

```
{
  "id": 5,
  "email": "user5@test.net",
  "access_token": "bd23611228d9f8bf8f5fb21e8db03d02",
  "created_at": "2015-07-19T03:32:17.108Z",
  "updated_at": "2015-07-19T03:41:56.401Z",
  "username": "user5",
  "avatar_file_name": "1024px-Cassowary_head_frontal.jpg",
  "avatar_content_type": "image/jpeg",
  "avatar_file_size": 136717,
  "avatar_updated_at": "2015-07-19T03:41:55.678Z"
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

In creating a profile you become a profiler.  You must enter the username and email of your friend, the profilee.  You will also give them a password that they will change later.  

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
  "profile": {
    "id": 16,
    "profiler_id": 13,
    "profilee_id": 18,
    "created_at": "2015-07-23T02:18:30.500Z",
    "updated_at": "2015-07-23T02:18:30.500Z"
  },
  "question": {
    "id": 18,
    "name": "user18",
    "email": "user18@test.net",
    "birthyear": 1985,
    "gender": "male",
    "orientation": "straight",
    "occupation": "developer",
    "location": "Atlanta",
    "created_at": "2015-07-23T02:18:30.487Z",
    "updated_at": "2015-07-23T02:18:30.504Z",
    "profile_id": 16
  },
  "videos": [],
  "avatar_url": "/avatars/original/missing.png"
}
```
Status Code: 201 Created

Example Failure:

In this API you MAY NOT create a profile for yourself, so don't even think about it.

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
###Show Profile

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
      "caption": "Look at this hippo!",
      "thumbnail_url": "https://thumbnail.com"
    }
  ],
  "avatar_url": "http://tiysetup.s3.amazonaws.com/users/avatars/000/000/002/original/1024px-Cassowary_head_frontal.jpg?1437277315",
  "avatar_remote_url": null
}

```
###Show All Profiles for User
```GET '/users/:user_id/profiles'```

Take a gander at all of the profiles any one user has created.  In this array, each profile now includes the username and avatar_url associated with it.

Example Response:

```
[
  {
    "id": 2,
    "profiler_id": 2,
    "profilee_id": 5,
    "username": "Cakemind",
    "avatar_url": "wholovescake.png"
  },
  {
    "id": 3,
    "profiler_id": 2,
    "profilee_id": 6,
    "username": "Tendertoes",
    "avatar_url": "tendertoes.png"
  }
]
```
###Index Profiles
```GET '/profiles'```

You can fetch all profiles at this endpoint.

Example Success:

```
{
  "profiles": [
    {
      "id": 1,
      "profiler_id": 2,
      "profilee_id": 3,
      "avatar_url": "/avatars/original/missing.png"
    },
    {
      "id": 2,
      "profiler_id": 2,
      "profilee_id": 4,
      "avatar_url": "/avatars/original/missing.png"
    },
    {
      "id": 3,
      "profiler_id": 2,
      "profilee_id": 5,
      "avatar_url": "/avatars/original/missing.png"
    }
  ],
  "questions": [
    {
      "id": 1,
      "name": "user2",
      "email": "user2@test.net",
      "birthyear": 1999,
      "gender": "male",
      "orientation": "straight",
      "occupation": "skateboarder",
      "location": "Atlanta",
      "created_at": "2015-07-23T02:52:32.603Z",
      "updated_at": "2015-07-23T02:52:32.622Z",
      "profile_id": 1
    },
    {
      "id": 2,
      "name": "user3",
      "email": "user3@test.net",
      "birthyear": 1995,
      "gender": "female",
      "orientation": "straight",
      "occupation": "diva",
      "location": "Atlanta",
      "created_at": "2015-07-23T02:52:54.564Z",
      "updated_at": "2015-07-23T02:52:54.584Z",
      "profile_id": 2
    },
    {
      "id": 3,
      "name": "user5",
      "email": "user5@test.net",
      "birthyear": 1990,
      "gender": "female",
      "orientation": "straight",
      "occupation": "sunbather",
      "location": "Jamaica",
      "created_at": "2015-07-23T02:53:22.331Z",
      "updated_at": "2015-07-23T02:53:22.351Z",
      "profile_id": 3
    }
  ],
  "videos": [],
  "users": [
    {
      "id": 1,
      "email": "user1@test.net",
      "created_at": "2015-07-23T02:50:27.069Z",
      "updated_at": "2015-07-23T02:50:27.069Z",
      "username": "user1",
      "avatar_file_name": null,
      "avatar_content_type": null,
      "avatar_file_size": null,
      "avatar_updated_at": null,
      "avatar_remote_url": null
    },
    {
      "id": 2,
      "email": "user4@test.net",
      "created_at": "2015-07-23T02:52:21.756Z",
      "updated_at": "2015-07-23T02:52:21.756Z",
      "username": "user4",
      "avatar_file_name": null,
      "avatar_content_type": null,
      "avatar_file_size": null,
      "avatar_updated_at": null,
      "avatar_remote_url": null
    },
    {
      "id": 3,
      "email": "user2@test.net",
      "created_at": "2015-07-23T02:52:32.609Z",
      "updated_at": "2015-07-23T02:52:32.609Z",
      "username": "user2",
      "avatar_file_name": null,
      "avatar_content_type": null,
      "avatar_file_size": null,
      "avatar_updated_at": null,
      "avatar_remote_url": null
    },
    {
      "id": 4,
      "email": "user3@test.net",
      "created_at": "2015-07-23T02:52:54.573Z",
      "updated_at": "2015-07-23T02:52:54.573Z",
      "username": "user3",
      "avatar_file_name": null,
      "avatar_content_type": null,
      "avatar_file_size": null,
      "avatar_updated_at": null,
      "avatar_remote_url": null
    },
    {
      "id": 5,
      "email": "user5@test.net",
      "created_at": "2015-07-23T02:53:22.339Z",
      "updated_at": "2015-07-23T02:53:22.339Z",
      "username": "user5",
      "avatar_file_name": null,
      "avatar_content_type": null,
      "avatar_file_size": null,
      "avatar_updated_at": null,
      "avatar_remote_url": null
    }
  ]
}
```

###Edit Profile
Currently their is no endpoint to change attributes on the Question model.  This may be added as a feature at a later date.

###Delete Profile
```DELETE '/profiles/:id'```

A profile may only be deleted by its profiler.  A profilee cannot delete a profile created about her.  She can only delete profiles that she has created.

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

#Video

###Create Video
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
  "video_url": "catvideo.mp4",
  "created_at": "2015-07-15T19:51:59.688Z",
  "updated_at": "2015-07-15T19:51:59.688Z",
  "caption": "Look at this cat!",
  "thumbnail_url": "https://thumbnail.png",
  "video_type": "null"
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

###Swap Video
```PATCH 'profiles/:profile_id/:video_id'```

Obviously you must be the owner of a profile to swap out its' videos.

Example Response:

```
{
  "id": 1,
  "videoable_id": 1,
  "videoable_type": "Profile",
  "video_url": "dogvideo.mp4",
  "created_at": "2015-07-19T17:07:42.455Z",
  "updated_at": "2015-07-19T17:07:42.455Z",
  "caption": "Look at this dog!",
  "thumbnail_url": "dogvideo.png",
  "video_type": null
}
```

###Delete Video
```DELETE 'profiles/:profile_id/videos/:video_id'```

Ah, ah ah.  No deleting videos unless you own the profile.  You'll get a nasty error message if you try.


#Avatar
In this first version of Setup, a user can have only one avatar.  To this end, there are two types of users and therefore two types of avatars.  The first is an avatar uploaded by a profiler for her profilee.  The second is for a user who has not had a profile created for herself, but would like use the app to browse other profiles.

###Create Avatar for Profile
```PUT '/profiles/:profile_id/avatar'```

######Params:

* avatar


Example Response:

In this example we see user information for user with id: 2.  Use this endpoint every time you want to change your profilee's avatar.

```
{
  "file": {
    "id": 2,
    "email": "user2@user2.com",
    "password": "205fbe4c4805b21eeb382d2ca8a8d9c3dd0be517",
    "access_token": "bd23611228d9f8bf8f5fb21e8db03d02",
    "created_at": "2015-07-19T03:32:17.108Z",
    "updated_at": "2015-07-20T15:46:00.754Z",
    "username": "user2",
    "avatar_file_name": "1024px-Cassowary_head_frontal.jpg",
    "avatar_content_type": "image/jpeg",
    "avatar_file_size": 136717,
    "avatar_updated_at": "2015-07-20T15:46:00.195Z",
    "avatar_remote_url:: "http://bit.ly/1eeYNQf"
  },
  "avatar_url": "http://tiysetup.s3.amazonaws.com/users/avatars/000/000/002/original/1024px-Cassowary_head_frontal.jpg?1437407160"
}
```

###Create Avatar for Yourself
Again, this is only an option if no one has already created a profile for you.  In this example User 1 is creating his own avatar. Use this same endpoint everytime you want to change your avatar.

```PUT 'users/:user_id/avatar'```

######Params:

* avatar
* avatar_ remote_url

Avatar is form-data.

Avatar_ remote_url is a string.


Example Response:

```
{
  "file": {
    "id": 1,
    "email": "user1@user1.com",
    "password": "205fbe4c4805b21eeb382d2ca8a8d9c3dd0be517",
    "access_token": "ba9498f019520a1a48a27144e0bb4189",
    "created_at": "2015-07-19T03:31:27.874Z",
    "updated_at": "2015-07-19T03:45:13.294Z",
    "username": "user1",
    "avatar_file_name": "20150626-IMG_7963.jpg",
    "avatar_content_type": "image/jpeg",
    "avatar_file_size": 8641207,
    "avatar_updated_at": "2015-07-19T03:45:05.611Z"
    "avatar_remote_url:: "http://bit.ly/1eeYNQf"
  },
  "avatar_url": "http://tiysetup.s3.amazonaws.com/users/avatars/000/000/002/original/1024px-Cassowary_head_frontal.jpg?1437407160"
}
```
#Search

This first version of Setup has basic search functionality.  You can search based on age, gender, orientation, occupation and location.  You're going to want to set the URL parameter key to 'keywords'.

```GET 'questions/search?keywords=female,straight'```

__Example Response:__

```
{
  "questions": [
    {
      "id": 2,
      "name": "user3",
      "email": "user3@test.net",
      "birthyear": 1995,
      "gender": "female",
      "orientation": "straight",
      "occupation": "diva",
      "location": "Atlanta",
      "created_at": "2015-07-23T02:52:54.564Z",
      "updated_at": "2015-07-23T02:52:54.584Z",
      "profile_id": 2
    },
    {
      "id": 3,
      "name": "user5",
      "email": "user5@test.net",
      "birthyear": 1990,
      "gender": "female",
      "orientation": "straight",
      "occupation": "sunbather",
      "location": "Jamaica",
      "created_at": "2015-07-23T02:53:22.331Z",
      "updated_at": "2015-07-23T02:53:22.351Z",
      "profile_id": 3
    }
  ],
  "profiles": [
    {
      "id": 2,
      "profiler_id": 2,
      "profilee_id": 4,
      "avatar_remote_url": null,
      "avatar_url": "/avatars/original/missing.png"
    },
    {
      "id": 3,
      "profiler_id": 2,
      "profilee_id": 5,
      "avatar_remote_url": null,
      "avatar_url": "/avatars/original/missing.png"
    }
  ]
}
```

If you search for a combination of keywords that do not match against at least one profile you'll get an error.

__Example:__

```
{
  "message": "Oops! Maybe nothing matches your search. Please search again."
}

```

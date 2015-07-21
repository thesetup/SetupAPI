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

Example Response:

If the logged in user has a profile, this is the response you can expect.

```
{
  "profile": {
    "id": 5,
    "profiler_id": 3,
    "profilee_id": 9,
    "created_at": "2015-07-21T16:33:12.371Z",
    "updated_at": "2015-07-21T16:33:12.371Z"
  }
}

```
If the logged in user does not have a profile, peep this.
```
{
  "profiles": null
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
    "password": "205fbe4c4805b21eeb382d2ca8a8d9c3dd0be517",
    "access_token": "bd23611228d9f8bf8f5fb21e8db03d02",
    "created_at": "2015-07-19T03:32:17.108Z",
    "updated_at": "2015-07-19T03:41:56.401Z",
    "username": "mpoppins",
    "avatar_file_name": "1024px-Cassowary_head_frontal.jpg",
    "avatar_content_type": "image/jpeg",
    "avatar_file_size": 136717,
    "avatar_updated_at": "2015-07-19T03:41:55.678Z"
  },
  {
    "id": 2,
    "email": "walt@white.bb",
    "password": "205fbe4c4805b21eeb382d2ca8a8d9c3dd0be517",
    "access_token": "ba9498f019520a1a48a27144e0bb4189",
    "created_at": "2015-07-19T03:31:27.874Z",
    "updated_at": "2015-07-19T03:45:13.294Z",
    "username": "heisenberg",
    "avatar_file_name": "20150626-IMG_7963.jpg",
    "avatar_content_type": "image/jpeg",
    "avatar_file_size": 8641207,
    "avatar_updated_at": "2015-07-19T03:45:05.611Z"
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
  "password": "205fbe4c4805b21eeb382d2ca8a8d9c3dd0be517",
  "access_token": "bd23611228d9f8bf8f5fb21e8db03d02",
  "created_at": "2015-07-19T03:32:17.108Z",
  "updated_at": "2015-07-19T03:41:56.401Z",
  "username": "mpoppins",
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
    "id": 3,
    "profiler_id": 2,
    "profilee_id": 6,
    "created_at": "2015-07-20T14:36:33.241Z",
    "updated_at": "2015-07-20T14:36:33.241Z"
  },
  "question": {
    "id": 4,
    "name": "Cakemind",
    "email": "cakemind@email.com",
    "birthyear": 1999,
    "gender": "male",
    "orientation": "straight",
    "occupation": "student",
    "location": "here",
    "created_at": "2015-07-20T14:36:33.228Z",
    "updated_at": "2015-07-20T14:36:33.251Z",
    "profile_id": 3
  },
  "videos": [],
  "users": {
    "id": 6,
    "email": "cakemind@email.com",
    "password": "c6823d67cf36b468706cf6011fd87ee26cb82212",
    "access_token": "344d20626d8323e484295a3118e70821",
    "created_at": "2015-07-20T14:36:33.236Z",
    "updated_at": "2015-07-20T14:36:33.236Z",
    "username": "Cakemind",
    "avatar_file_name": null,
    "avatar_content_type": null,
    "avatar_file_size": null,
    "avatar_updated_at": null
  }
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
  "users": {
    "id": 2,
    "email": "user2@user2.com",
    "password": "205fbe4c4805b21eeb382d2ca8a8d9c3dd0be517",
    "access_token": "bd23611228d9f8bf8f5fb21e8db03d02",
    "created_at": "2015-07-19T03:32:17.108Z",
    "updated_at": "2015-07-19T03:41:56.401Z",
    "username": "user2",
    "avatar_file_name": "1024px-Cassowary_head_frontal.jpg",
    "avatar_content_type": "image/jpeg",
    "avatar_file_size": 136717,
    "avatar_updated_at": "2015-07-19T03:41:55.678Z"
  },
  "avatar_url": "http://tiysetup.s3.amazonaws.com/users/avatars/000/000/002/original/1024px-Cassowary_head_frontal.jpg?1437277315"
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
      "video_url": "catvideo.mp4",
      "created_at": "2015-07-15T19:51:59.688Z",
      "updated_at": "2015-07-15T19:51:59.688Z",
      "caption": "Look at this cat!",
      "thumbnail_url": "catvideo.png"
    },
    {
      "id": 2,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "dogvideo.mp4",
      "created_at": "2015-07-15T19:55:26.585Z",
      "updated_at": "2015-07-15T19:55:26.585Z",
      "caption": "Look at this dog!",
      "thumbnail_url": "dogvideo.png"
    },
    {
      "id": 3,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "snakevideo.mp4",
      "created_at": "2015-07-15T19:55:42.124Z",
      "updated_at": "2015-07-15T19:55:42.124Z",
      "caption": "Look at this snake!",
      "thumbnail_url": "snakevideo.png"
    },
    {
      "id": 4,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": "hippovideo.mp4",
      "created_at": "2015-07-15T19:55:52.135Z",
      "updated_at": "2015-07-15T19:55:52.135Z",
      "caption": "Look at this hippo!",
      "thumbnail_url": "hippovideo.png"
    }
  ],
  "users": [
      {
        "id": 1,
        "email": "mary@poppins.com",
        "password": "205fbe4c4805b21eeb382d2ca8a8d9c3dd0be517",
        "access_token": "bd23611228d9f8bf8f5fb21e8db03d02",
        "created_at": "2015-07-19T03:32:17.108Z",
        "updated_at": "2015-07-19T03:41:56.401Z",
        "username": "mpoppins",
        "avatar_file_name": "1024px-Cassowary_head_frontal.jpg",
        "avatar_content_type": "image/jpeg",
        "avatar_file_size": 136717,
        "avatar_updated_at": "2015-07-19T03:41:55.678Z"
      },
      {
        "id": 2,
        "email": "walt@white.com",
        "password": "205fbe4c4805b21eeb382d2ca8a8d9c3dd0be517",
        "access_token": "ba9498f019520a1a48a27144e0bb4189",
        "created_at": "2015-07-19T03:31:27.874Z",
        "updated_at": "2015-07-19T03:52:42.416Z",
        "username": "heisenberg",
        "avatar_file_name": "1024px-Cassowary_head_frontal.jpg",
        "avatar_content_type": "image/jpeg",
        "avatar_file_size": 136717,
        "avatar_updated_at": "2015-07-19T03:52:41.866Z"
      },
      {
        "id": 3,
        "email": "leeroy@jenkins.com",
        "password": "ebfc7910077770c8340f63cd2dca2ac1f120444f",
        "access_token": "424e388fdd162a48a935816a7bbce79e",
        "created_at": "2015-07-19T03:58:50.887Z",
        "updated_at": "2015-07-19T03:58:50.887Z",
        "username": "ohleeroy",
        "avatar_file_name": null,
        "avatar_content_type": null,
        "avatar_file_size": null,
        "avatar_updated_at": null
      }
    ]
}
```

###Edit Profile
Currently their is no endpoint to change attributes on the Question model.  This may be added as a feature at a later date.

###Delete Profile
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
    "avatar_updated_at": "2015-07-20T15:46:00.195Z"
  },
  "avatar_url": "http://tiysetup.s3.amazonaws.com/users/avatars/000/000/002/original/1024px-Cassowary_head_frontal.jpg?1437407160"
}
```

###Create Avatar for Yourself
Again, this is only an option if no one has already created a profile for you.  In this example User 1 is creating his own avatar. Use this same endpoint everytime you want to change your avatar.

```PUT 'users/:user_id/avatar'```

######Params:

* avatar
* avatar_remote_url

avatar is form-data
avatar_remote_url is a string


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
  },
  "avatar_url": "http://tiysetup.s3.amazonaws.com/users/avatars/000/000/002/original/1024px-Cassowary_head_frontal.jpg?1437407160"
}

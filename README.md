#URL:

* https://still-island-6789.herokuapp.com

#USER

###Register
```POST``` ‘/users/register’

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
```POST``` '/users/login'

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
```GET``` '/users'

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
```GET``` '/users/:user_id'

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
```DELETE``` '/users/:user_id'

* Requires Access-Token in Headers

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
```POST``` '/profiles'

In creating a profile you become a profiler.  You must enter the username and email of your friend, the profilee.  You will also create a password for them which they will then change later.

######Params:


* email (of your friend)
* username
* password

Example Success:

```
 {
  "profiles": {
    "id": 1,
    "profiler_id": 1,
    "profilee_id": 2,
    "created_at": "2015-07-14T16:01:30.025Z",
    "updated_at": "2015-07-14T16:01:30.025Z"
  },
  "questions": [
    {
      "id": 1,
      "name": "user2",
      "email": "user2@email.com",
      "birthyear": null,
      "gender": null,
      "orientation": null,
      "occupation": null,
      "location": null,
      "created_at": "2015-07-14T16:01:30.031Z",
      "updated_at": "2015-07-14T16:01:30.031Z",
      "profile_id": 1
    }
  ],
  "videos": [
    {
      "id": 1,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": null,
      "created_at": "2015-07-14T16:01:30.036Z",
      "updated_at": "2015-07-14T16:01:30.036Z"
    }
  ]
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
Status Code: 422 Unprocessable Entity
###Show

```GET``` '/profiles/:id'

This endpoint will show a given profile.

Example Success:

```
{
  "profiles": {
    "id": 3,
    "profiler_id": 1,
    "profilee_id": 5,
    "created_at": "2015-07-14T16:50:49.680Z",
    "updated_at": "2015-07-14T16:50:49.680Z"
  },
  "questions": [
    {
      "id": 3,
      "name": "user5",
      "email": "user5@email.com",
      "birthyear": null,
      "gender": null,
      "orientation": null,
      "occupation": null,
      "location": null,
      "created_at": "2015-07-14T16:50:49.682Z",
      "updated_at": "2015-07-14T16:50:49.682Z",
      "profile_id": 3
    }
  ],
  "videos": [
    {
      "id": 3,
      "videoable_id": 3,
      "videoable_type": "Profile",
      "video_url": null,
      "created_at": "2015-07-14T16:50:49.684Z",
      "updated_at": "2015-07-14T16:50:49.684Z"
    }
  ]
}
```

Example Failure:

###Index
```GET``` '/profiles'

You can fetch all profiles at this endpoint.

Example Success:

```
{
  "profiles": {
    "id": 1,
    "profiler_id": 1,
    "profilee_id": 2,
    "created_at": "2015-07-14T16:01:30.025Z",
    "updated_at": "2015-07-14T16:01:30.025Z"
  },
  "questions": [
    {
      "id": 1,
      "name": "user2",
      "email": "user2@email.com",
      "birthyear": null,
      "gender": null,
      "orientation": null,
      "occupation": null,
      "location": null,
      "created_at": "2015-07-14T16:01:30.031Z",
      "updated_at": "2015-07-14T16:01:30.031Z",
      "profile_id": 1
    }
  ],
  "videos": [
    {
      "id": 1,
      "videoable_id": 1,
      "videoable_type": "Profile",
      "video_url": null,
      "created_at": "2015-07-14T16:01:30.036Z",
      "updated_at": "2015-07-14T16:01:30.036Z"
    }
  ]
}
```
Example Failure:

###Edit

###Delete
```DELETE``` '/profiles/:id'

Only the profiler can delete a profile.  A profilee cannot delete the profile created about her, but may delete other profiles for whom she is the profiler.

Example Success:
```
{
  "message": "Profile deleted."
}
```
Example Failure:

```
{
  "message": "Only the author of a profile may delete a profile."
}
```

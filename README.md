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
      "id": 2,
      "email": "hm1@hm.com",
      "password": "cea205a2de95383297dcfe248c5a1b3038ca01c0",
      "access_token": "1c4864db5ee70e4af3d3a7702966b254",
      "created_at": "2015-07-08T19:39:46.161Z",
      "updated_at": "2015-07-08T19:39:46.161Z"
    }
```    

Example Failures:

```
  {
    "errors": [
    "Email is not a valid email",
    "Username can't be blank"
    ]
  }
```

```
  {
    "errors": [
    "Email is not a valid email",
    "Username can't be blank"
    ]
  }
```

###Login
```POST``` '/users/login'

######Params:

* email
* password

Example Success:

```
  {
    "id": 11,
    "email": "tucker@tucker.com",
    "password": "33e475263fead060c56753b9003467f268fdba4d",
    "access_token": "7b64bc42e115ce71ff84d1f8593a6a2b",
    "created_at": "2015-07-10T03:08:00.762Z",
    "updated_at": "2015-07-10T03:08:00.762Z",
    "username": "tucker"
  }
```

Example Failure:

```
  {
    "message": "Wrong email/password"
  }
```

###Index
```GET``` '/users'

Example Success:

```
  [
    {
      "id": 1,
      "email": "hm@hm.com",
      "password": "cea205a2de95383297dcfe248c5a1b3038ca01c0",
      "access_token": "e3f1d450e5a5c96b5b11de479fc2573f",
      "created_at": "2015-07-08T19:18:05.400Z",
      "updated_at": "2015-07-08T19:18:05.400Z",
      "username": null
    },
    {
      "id": 2,
      "email": "hm1@hm.com",
      "password": "cea205a2de95383297dcfe248c5a1b3038ca01c0",
      "access_token": "1c4864db5ee70e4af3d3a7702966b254",
      "created_at": "2015-07-08T19:39:46.161Z",
      "updated_at": "2015-07-08T19:39:46.161Z",
      "username": null
    },
    {
      "id": 5,
      "email": "hm111@hm.com",
      "password": "cea205a2de95383297dcfe248c5a1b3038ca01c0",
      "access_token": "9ac97531e0f45dadaa15c08d395ea7a3",
      "created_at": "2015-07-09T19:48:16.268Z",
      "updated_at": "2015-07-09T19:48:16.268Z",
      "username": "12eqwr"
    }
  ]
```

###Show
```GET``` '/users/:user_id'

Example Success:

```
  {
    "id": 1,
    "email": "hm@hm.com",
    "access_token": "e3f1d450e5a5c96b5b11de479fc2573f"
  }
```

###Delete
```DELETE``` '/users/:user_id'

* Requires Access-Token in Headers

Example Success:

```
  {
    "message": "User deleted"
  }
```

Example Failure:

```
  {
    "message": "Only the author of an account may delete an account."
  }
```

#PROFILE

###Create
```POST``` '/profiles'

In creating a profile you become a profiler.  You must enter the email address of your friend, the profilee.

######Params:


* email (of your friend)

Example Success:

```
  {
    "id": 3,
  "profiler_id": 2,
  "profilee_id": 2,
  "created_at": "2015-07-09T19:13:43.741Z",
  "updated_at": "2015-07-09T19:13:43.741Z"
}
```
Status Code: 201 Created

Example Failure:

In this API you MAY NOT create a profile for yourself.

	{
	  "errors": [
    "Profilee cannot be same as Profiler"
 	]
	}

Status Code: 422 Unprocessable Entity
###Show
```GET``` '/profiles/:id'

	This endpoint will show a given profile.

	Example Success:
	Example Failure:

###Index
```GET``` '/profiles'

You can fetch all profiles at this endpoint.

Example Success:

```
	[
  {
    "id": 1,
    "profiler_id": 1,
    "profilee_id": 1,
    "created_at": "2015-07-09T18:30:08.424Z",
    "updated_at": "2015-07-09T18:30:08.424Z"
  },
  {
    "id": 2,
    "profiler_id": 1,
    "profilee_id": 3,
    "created_at": "2015-07-09T18:51:00.809Z",
    "updated_at": "2015-07-09T18:51:00.809Z"
  },
  {
    "id": 3,
    "profiler_id": 2,
    "profilee_id": 3,
    "created_at": "2015-07-09T18:51:13.292Z",
    "updated_at": "2015-07-09T18:51:13.292Z"
  }
]
```
Example Failure:

###Edit
In this version of the app., there should be no need to change either the profiler or profilee of a profile.

###Delete
```DELETE``` '/profiles/:id'

Only the profiler can delete a profile.  A profilee cannot delete the profile created about her, but may delete other profiles for whom she is the profiler.

Example Success:
Example Failure:


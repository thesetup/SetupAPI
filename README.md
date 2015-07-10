#USER

###Register

###Login

###Index

###Show

###Delete

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

#QUESTION

The 'Question' model is merely a form of boilerplate data points that must be supplied in order to create a profile.

###Create
```POST``` '/profiles/:profile_id/questions'

######Params:

* name
* email
* birthyear
* gender
* orientation
* occupation
* location
* profile_id

Example Success:

Example Failure:

###Edit
```GET``` '/profiles/:profile_id/questions/:id/edit'
###Update
```PUT``` '/profiles/:profile_id/questions/:id/edit'
###Index
```GET``` '/profiles/:profile_id/questions'
###Show
```GET``` '/profiles/:profile_id/questions/:id'

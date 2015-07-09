#User

###Register

###Login

###Index

###Show

###Delete

#Profile

###Create
```POST``` '/profiles'

Example Success:

```
{
  "id": 4,
  "profiler_id": 2,
  "profilee_id": 2,
  "created_at": "2015-07-09T19:13:43.741Z",
  "updated_at": "2015-07-09T19:13:43.741Z"
}
```

Example Failure:

In this API you MAY NOT create a profile for yourself.

	{
	  "errors": [
    "Profilee cannot be same as Profiler"
 	]
	}

###Index
```GET``` '/profiles'

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


###Edit

###Delete

#Question


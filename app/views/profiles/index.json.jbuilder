@profile = Profile.all
@image = Image.all
@video = Video.all
@question = Question.all

json.profiles @profile
json.questions @question
json.videos @video
json.images @image

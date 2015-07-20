@profile = Profile.all
@video = Video.all
@question = Question.all
@user = User.all

json.profiles @profile
json.question @question
json.videos @video
json.users @user

import json
from datetime import datetime

from db import db
from db import Post, User, Keyword
from flask import Flask
from flask import request

import os

app = Flask(__name__)
db_filename = "workdone.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = False

db.init_app(app)
with app.app_context():
    db.create_all()

def success_response(data, code=200):
    return json.dumps({"success": True, "data": data}), code

def failure_response(error, code=400):
    return json.dumps({"success": False, "error": error}), code

@app.route("/api/posts/")
def get_all_posts():
    return success_response([p.serialize() for p in Post.query.all()])

@app.route("/api/users/")
def get_all_users():
    return success_response([u.serialize() for u in User.query.all()])

@app.route("/api/posts/keyword/<string:keyword>/")
def get_specific_posts_from_keyword(keyword):
    word = Keyword.query.filter_by(word=keyword).first()
    if not word: 
        return success_response({}, 200) # Maybe want to change, but idea is that if you search for something, you should always get something back
    return success_response(word.serialize(), 201)


@app.route("/api/posts/user/<int:user_id>/")
def get_all_of_users_posts(user_id):
    user = User.query.filter_by(id = user_id).first()
    if not user:
        return failure_response("Sorry this user does not exist", 404)
    all_posts = [p.serialize() for p in user.posts]
    return success_response(all_posts, 201)

@app.route("/api/posts/<int:user_id>/", methods= ["POST"])
def create_post(user_id):
    data = json.loads(request.data)
    time = data.get("time")
    title = data.get("title")
    price = data.get("price")
    info = data.get("info")
    number = data.get("phone_number")
    keywords = data.get("keywords")
    name = data.get("name")
    likes = 1
    is_request = data.get("request") #True if request, False if offer
    if not time or not title or not price or not info or not number or not request or not name:
        return failure_response("You are missing one or more of the following: time,title, price, information, phone number, type of request, or name", 404)
  
    time = datetime.fromtimestamp(int(time))
    is_request = bool(is_request)
    
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found")

    new_post = Post(time = time, title = title, price = price, 
    info = info, number = number, likes = likes, request = is_request, 
    user_id = user_id, name = name)
    for key in keywords:
        keyword = Keyword.query.filter_by(word=key).first()
        if not keyword:
            keyword = Keyword(word = key)
            db.session.add(keyword)
        new_post.keywords.append(keyword)
        
    db.session.add(new_post)
    db.session.commit()
    return success_response(new_post.serialize(), 201)
    

@app.route("/api/users/", methods = ["POST"])
def create_user():
    data = json.loads(request.data)
    name = data.get("name")
    phone_number = data.get("phone_number")
    bio = data.get("bio")

    if not name or not phone_number:
        return failure_response("You are missing one or more of the following: name, phone_number")

    new_user = User(name = name, phone_number = phone_number, bio = bio)
    db.session.add(new_user)
    db.session.commit()
    return success_response(new_user.serialize(), 201)

@app.route("/api/posts/<int:post_id>/")
def get_specific_post(post_id):
    post = Post.query.filter_by(id = post_id).first()
    if not post:
        return failure_response("This post does not exist")
    data = post.serialize()
    return success_response(data)

@app.route("/api/users/<int:user_id>/")
def get_user(user_id):
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found")
    return success_response(user.serialize())

def change_votes_of_post(post_id, upvote):
    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return None
    post.likes = post.likes + (1 if upvote else -1)
    db.session.commit()
    return post
    

@app.route("/api/posts/<int:post_id>/upvote/", methods=["POST"])
def upvote_post(post_id):
    post = change_votes_of_post(post_id, True)
    if post is None:
        return failure_response("Post not found")
    return success_response(post.serialize())

@app.route("/api/posts/<int:post_id>/downvote/", methods=["POST"])
def downvote_post(post_id):
    post = change_votes_of_post(post_id, False)
    if post is None:
        return failure_response("Post not found")
    return success_response(post.serialize())


@app.route("/api/users/<int:user_id>/", methods=["DELETE"])
def delete_user(user_id):
    user = User.query.filter_by(id = user_id).first()
    if not user:
        return failure_response("Sorry, this post does not exist", 404)
    db.session.delete(user)
    db.session.commit()
    return success_response(user.serialize())


@app.route("/api/posts/<int:post_id>/", methods=["DELETE"])
def delete_post(post_id):
    post = Post.query.filter_by(id = post_id).first()
    if not post:
        return failure_response("Sorry, this user does not exist", 404)
    db.session.delete(post)
    db.session.commit()
    return success_response(post.serialize())

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)

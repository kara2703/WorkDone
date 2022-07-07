from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

keywords_association_table = db.Table(
    'keyword_association',
    db.Column('keyword_id', db.Integer, db.ForeignKey('keywords.id')),
    db.Column('post_id', db.Integer, db.ForeignKey('posts.id')),
)

# post - if completed
# user - ratings, #jobs completed

class User(db.Model):
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String, nullable=False)
    phone_number = db.Column(db.String, nullable=False)
    # Posts will reference the posts database
    posts = db.relationship("Post", cascade='delete')
    bio = db.Column(db.String, nullable=True)

    def __init__(self, **kwargs):
        self.name = kwargs.get("name")
        self.phone_number = kwargs.get("phone_number")
        self.bio = kwargs.get("bio") # I think this will work, even though bio is nullable, might not tho
    
    def serialize(self): 
        return {
            "id": self.id,
            "name": self.name,
            "phone_number": self.phone_number,
            "posts": [p.serialize() for p in self.posts],
            "bio": self.bio # Not sure how to include bio since it is nullable
        }

class Keyword(db.Model):
    __tablename__ = "keywords"
    id = db.Column(db.Integer, primary_key=True)
    word = db.Column(db.String, nullable=False)
    posts = db.relationship(
        'Post', secondary=keywords_association_table, back_populates="keywords")

    def __init__(self, **kwargs):
        self.word = kwargs.get("word")

    def serialize(self):
        return {
            "id": self.id,
            "word": self.word,
            "posts": [p.serialize() for p in self.posts]
        }
    
    def serialize_without_posts(self): 
        return {
            "id": self.id,
            "word": self.word
        }

class Post(db.Model):
    __tablename__ = "posts"
    id = db.Column(db.Integer, primary_key = True)
    time = db.Column(db.DateTime, nullable = False)
    title = db.Column(db.String, nullable = False)
    name = db.Column(db.String, nullable = False)
    price = db.Column(db.String, nullable = False)
    info = db.Column(db.String, nullable = False)
    number = db.Column(db.String, nullable = False)
    likes = db.Column(db.Integer, nullable = True)
    request = db.Column(db.Boolean, nullable = False)  
    keywords = db.relationship(
        'Keyword', secondary=keywords_association_table, back_populates="posts")
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"))

    def __init__(self, **kwargs):
        self.time = kwargs.get("time")
        self.info = kwargs.get("info")
        self.number = kwargs.get("number")
        self.likes = kwargs.get("likes")
        self.request = kwargs.get("request")
        self.user_id = kwargs.get("user_id")
        self.title = kwargs.get("title")
        self.price = kwargs.get("price")
        self.name = kwargs.get("name")

    def serialize(self):
        return {
            "id": self.id,
            "user_id": self.user_id,
            "time": (self.time).timestamp(),
            "title": self.title,
            "price": self.price,
            "info": self.info,
            "phone_number": self.number,
            "likes": self.likes,
            "request": self.request,
            "name": self.name,
            "keywords": [k.serialize_without_posts() for k in self.keywords]
        }

















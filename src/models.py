from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Song(db.Model):
  id = db.Column(db.Integer, primary_key=True)
  title = db.Column(db.String(200), nullable=False)
  length = db.Column(db.Integer, nullable=False)
  artist = db.Column(db.String(200), nullable=False)
  user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
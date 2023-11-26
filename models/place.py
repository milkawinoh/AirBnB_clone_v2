#!/usr/bin/python3

from models.base_model import BaseModel, Base
from sqlalchemy import Column, String, Integer, Float, ForeignKey
from sqlalchemy.orm import relationship

"""Place class for representing a place in the application."""
class Place(BaseModel, Base):
    """Place class for representing a place in the application."""

    __tablename__ = 'places'

    city_id = Column(String(60), ForeignKey('cities.id'), nullable=False)
    user_id = Column(String(60), ForeignKey('users.id'), nullable=False)
    name = Column(String(128), nullable=False)
    description = Column(String(1024), nullable=True)
    number_rooms = Column(Integer, nullable=False, default=0)
    number_bathrooms = Column(Integer, nullable=False, default=0)
    max_guest = Column(Integer, nullable=False, default=0)
    price_by_night = Column(Integer, nullable=False, default=0)
    latitude = Column(Float, nullable=True)
    longitude = Column(Float, nullable=True)

    # Relationship with User
    user = relationship('User', back_populates='places', cascade='all, delete-orphan')

    # Relationship with City
    city = relationship('City', back_populates='places', cascade='all, delete-orphan')
    # Establish relationship with Review class
    reviews = relationship('Review', back_populates='place', cascade='all, delete-orphan')
    # Establish Many-To-Many relationship with Amenity class
    amenities = relationship('Amenity', secondary='place_amenity', viewonly=False)




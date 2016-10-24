import factory
from django.utils.timezone import utc

from bookstore.models import Book
from bookstore.tests.features.test_base import faker


class BookFactory(factory.DjangoModelFactory):
    class Meta:
        model = Book

    title = faker.name()
    description = faker.text()
    author_name = faker.name()
    publisher_name = faker.name()
    published_at = faker.date_time(tzinfo=utc)
    unit_price = 50000
    photo = 'google.com'
    rating_count = 1
    rating_value = 10

import factory
from django.utils.timezone import utc

from bookstore.models import Comment
from bookstore.tests.factories.factory_book import BookFactory
from bookstore.tests.factories.factory_user import UserFactory
from bookstore.tests.features.test_base import faker


class CommentFactory(factory.DjangoModelFactory):
    class Meta:
        model = Comment

    user = factory.SubFactory(UserFactory)
    book = factory.SubFactory(BookFactory)

    rating = 1
    content = 'good'
    user = user
    book = book
    commented_at = faker.date_time(tzinfo=utc)

import factory

from bookstore.models import Category
from bookstore.tests.features.test_base import faker


class CategoryFactory(factory.DjangoModelFactory):
    class Meta:
        model = Category

    name = faker.name()
    sort_order = 0

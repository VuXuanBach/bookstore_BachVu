from django.test import TestCase

from bookstore.tests.factories.factory_category import CategoryFactory


class CategoryMethodTests(TestCase):
    def test_str(self):
        category = CategoryFactory(name='Science')
        self.assertEqual(str(category), 'Science')

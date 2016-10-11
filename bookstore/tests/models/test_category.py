from django.test import TestCase

from bookstore.models import Category


class CategoryMethodTests(TestCase):
    def test_str(self):
        category = Category.objects.create(name='Science', sort_order=0)
        self.assertEqual(str(category), "Science")

from django.test import TestCase

from bookstore.tests.factories.factory_book import BookFactory


class BookMethodTests(TestCase):
    def test_str(self):
        book = BookFactory(title='something')
        self.assertEqual(str(book), 'something')

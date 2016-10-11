from django.test import TestCase
from django.utils import timezone

from bookstore.models import Book


class BookMethodTests(TestCase):
    def test_str(self):
        now = timezone.now()
        book = Book.objects.create(title='Logistic', description='test logistic', author_name='Bach',
                                   publisher_name='Vu', published_at=now, unit_price=50000,
                                   photo='google.com', rating_count=1, rating_value=10)
        self.assertEqual(str(book), "Logistic")

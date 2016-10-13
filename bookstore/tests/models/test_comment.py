from django.test import TestCase
from django.utils import timezone

from bookstore.models import Comment, Book
from django.contrib.auth import get_user_model


class CommentMethodTests(TestCase):
    def test_str(self):
        now = timezone.now()
        user = get_user_model().objects.create(email="bach.vu@eastagile.com", password="test")
        book = Book.objects.create(title='Logistic', description='test logistic', author_name='Bach',
                                   publisher_name='Vu', published_at=now, unit_price=50000,
                                   photo='google.com', rating_count=1, rating_value=10)
        comment = Comment.objects.create(rating=1, content='good', user=user, book=book, commented_at=now)
        self.assertEqual(str(comment), "good")

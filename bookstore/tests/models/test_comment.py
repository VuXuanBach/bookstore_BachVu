from django.test import TestCase
from django.utils import timezone

from bookstore.models import User, Comment, Book


class CommentMethodTests(TestCase):
    def test_str(self):
        now = timezone.now()
        user = User.objects.create(email="bach.vu@eastagile.com", password="test", phone="123456789",
                                   full_name="Bach Vu", birthday=now, created_at=now)
        book = Book.objects.create(title='Logistic', description='test logistic', author_name='Bach',
                                   publisher_name='Vu', published_at=now, unit_price=50000,
                                   photo='google.com', rating_count=1, rating_value=10)
        comment = Comment.objects.create(rating=1, content='good', user=user, book=book, commented_at=now)
        self.assertEqual(str(comment), "good")

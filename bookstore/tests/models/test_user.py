from django.test import TestCase
from django.utils import timezone

from bookstore.models import User


class UserMethodTests(TestCase):
    def test_str(self):
        now = timezone.now()
        user = User.objects.create(email="bach.vu@eastagile.com", password="test", phone="123456789",
                                   full_name="Bach Vu", birthday=now, created_at=now)
        self.assertEqual(str(user), "Bach Vu")

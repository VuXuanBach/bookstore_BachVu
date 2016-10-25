from django.core.exceptions import ValidationError
from django.test import TestCase

from bookstore.models import MyUser
from bookstore.tests.factories.factory_user import UserFactory
from bookstore.tests.features.test_base import faker


class MyUserMethodTests(TestCase):
    def test_str(self):
        user = UserFactory(email='something@ea.com')
        self.assertEqual(str(user), 'something@ea.com')

    def test_invalid_phone_should_not_be_saved(self):
        user = MyUser(email=faker.email(), password='test123456', phone='something')
        with self.assertRaises(ValidationError):
            user.full_clean()
        user.save()
        self.assertFalse(MyUser.objects.filter(phone='something').exists())

        user = MyUser(email=faker.email(), password='test123456', phone='093811245a')
        with self.assertRaises(ValidationError):
            if user.full_clean():
                user.save()
        self.assertFalse(MyUser.objects.filter(phone='093811245a').exists())

    def test_valid_phone(self):
        phone_number = faker.phone_number()
        user = MyUser(email=faker.email(), password='test123456', phone=phone_number)
        if user.full_clean():
                user.save()
        self.assertTrue(MyUser.objects.filter(phone=phone_number).exists())

        user = MyUser(email=faker.email(), password='test123456', phone='+84938112451')
        if user.full_clean():
            user.save()
        self.assertTrue(MyUser.objects.filter(phone='+84938112451').exists())

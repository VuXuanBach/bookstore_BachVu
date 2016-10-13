from __future__ import unicode_literals

from django.conf import settings
from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.models import AbstractUser
from django.db import models

# Create your models here.
from django.utils import timezone


class MyUserManager(BaseUserManager):
    def create_user(self, email, password=None):
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            email=self.normalize_email(email),
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password):
        user = self.create_user(
            email,
            password=password,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user


class MyUser(AbstractBaseUser):
    AbstractUser
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
    )
    full_name = models.CharField(max_length=30, null=True, blank=True)
    date_of_birth = models.DateField(blank=True, null=True)
    date_joined = models.DateTimeField(default=timezone.now)

    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    objects = MyUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    def get_full_name(self):
        return self.full_name

    def get_short_name(self):
        return self.full_name

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.is_admin


class Category(models.Model):
    name = models.CharField(max_length=255)
    sort_order = models.IntegerField(default=0)

    def __str__(self):
        return self.name


class Book(models.Model):
    title = models.CharField(max_length=255)
    description = models.CharField(max_length=510)
    author_name = models.CharField(max_length=255)
    publisher_name = models.CharField(max_length=255)
    published_at = models.DateTimeField('published at')
    unit_price = models.IntegerField(default=0)
    photo = models.CharField(max_length=255)
    rating_count = models.IntegerField(default=0)
    rating_value = models.IntegerField(default=0)

    def __str__(self):
        return self.title


class Comment(models.Model):
    rating = models.IntegerField(default=0)
    content = models.CharField(max_length=1020)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    commented_at = models.DateTimeField('commented at')

    def __str__(self):
        return self.content


class Order(models.Model):
    ordered_at = models.DateTimeField('ordered at')
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    shipping_address = models.CharField(max_length=510)
    total_amount = models.IntegerField(default=0)


class OrderLine(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    unit_price = models.IntegerField(default=0)
    quantity = models.IntegerField(default=0)

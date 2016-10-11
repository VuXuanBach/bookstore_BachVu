from __future__ import unicode_literals

from django.db import models


# Create your models here.
class User(models.Model):
    email = models.CharField(max_length=500)
    password = models.CharField(max_length=500)
    phone = models.CharField(max_length=500)
    full_name = models.CharField(max_length=500)
    birthday = models.DateTimeField('birthday')
    created_at = models.DateTimeField('created at')

    def __str__(self):
        return self.full_name


class Category(models.Model):
    name = models.CharField(max_length=200)
    sort_order = models.IntegerField(default=0)

    def __str__(self):
        return self.name


class Book(models.Model):
    title = models.CharField(max_length=500)
    description = models.CharField(max_length=500)
    author_name = models.CharField(max_length=500)
    publisher_name = models.CharField(max_length=200)
    published_at = models.DateTimeField('published at')
    unit_price = models.IntegerField(default=0)
    photo = models.CharField(max_length=500)
    rating_count = models.IntegerField(default=0)
    rating_value = models.IntegerField(default=0)

    def __str__(self):
        return self.title


class Comment(models.Model):
    rating = models.IntegerField(default=0)
    content = models.CharField(max_length=2000)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    commented_at = models.DateTimeField('commented at')

    def __str__(self):
        return self.content


class Order(models.Model):
    ordered_at = models.DateTimeField('ordered at')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    shipping_address = models.CharField(max_length=500)
    total_amount = models.IntegerField(default=0)


class OrderLine(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    unit_price = models.IntegerField(default=0)
    quantity = models.IntegerField(default=0)


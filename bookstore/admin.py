from django.contrib import admin

from bookstore.models import Book, Order, OrderLine, MyUser
from bookstore.models import Category, Comment

# Register your models here.
admin.site.register(MyUser)
admin.site.register(Category)
admin.site.register(Book)
admin.site.register(Comment)
admin.site.register(Order)
admin.site.register(OrderLine)

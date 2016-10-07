from django.contrib import admin

# Register your models here.
from bookstore.models import Book, Category, Comment, Order, OrderLine

admin.site.register(Category)
admin.site.register(Book)
admin.site.register(Comment)
admin.site.register(Order)
admin.site.register(OrderLine)


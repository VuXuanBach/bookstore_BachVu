# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-10-13 03:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bookstore', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='birthday',
            field=models.DateTimeField(blank=True, null=True, verbose_name='birthday'),
        ),
        migrations.AlterField(
            model_name='myuser',
            name='phone',
            field=models.CharField(blank=True, max_length=30, null=True),
        ),
    ]

# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-10-20 04:25
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bookstore', '0008_add_phone_full_name_fields'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='birthday',
            field=models.DateField(blank=True, null=True, verbose_name='%d-%m-%y'),
        ),
    ]
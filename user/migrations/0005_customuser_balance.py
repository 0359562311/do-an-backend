# Generated by Django 4.0.2 on 2022-12-12 18:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0004_customuser_bio'),
    ]

    operations = [
        migrations.AddField(
            model_name='customuser',
            name='balance',
            field=models.IntegerField(default=0),
        ),
    ]

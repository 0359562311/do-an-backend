# Generated by Django 4.0.2 on 2022-12-05 16:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('job', '0009_job_duedate'),
    ]

    operations = [
        migrations.DeleteModel(
            name='JobVideo',
        ),
    ]
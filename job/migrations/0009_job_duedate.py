# Generated by Django 4.0.2 on 2022-12-04 04:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('job', '0008_alter_job_address'),
    ]

    operations = [
        migrations.AddField(
            model_name='job',
            name='dueDate',
            field=models.DateField(null=True),
        ),
    ]
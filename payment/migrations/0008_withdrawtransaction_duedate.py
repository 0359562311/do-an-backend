# Generated by Django 4.0.2 on 2022-12-12 19:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0007_remove_withdrawtransaction_duedate'),
    ]

    operations = [
        migrations.AddField(
            model_name='withdrawtransaction',
            name='dueDate',
            field=models.DateTimeField(null=True),
        ),
    ]

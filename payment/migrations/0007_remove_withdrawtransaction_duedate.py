# Generated by Django 4.0.2 on 2022-12-12 18:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0006_alter_deposittransaction_systembankaccount'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='withdrawtransaction',
            name='dueDate',
        ),
    ]

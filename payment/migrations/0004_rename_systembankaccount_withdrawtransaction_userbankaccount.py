# Generated by Django 4.0.2 on 2022-12-12 17:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0003_transaction_user'),
    ]

    operations = [
        migrations.RenameField(
            model_name='withdrawtransaction',
            old_name='systemBankAccount',
            new_name='userBankAccount',
        ),
    ]

# Generated by Django 4.0.2 on 2022-11-22 16:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('job', '0006_offer_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='offer',
            name='status',
            field=models.TextField(choices=[('Pending', 'Pending'), ('Approved', 'Approved'), ('Closed', 'Closed')], default='Pending'),
        ),
    ]
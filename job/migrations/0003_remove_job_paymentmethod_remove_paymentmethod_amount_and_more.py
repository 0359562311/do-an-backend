# Generated by Django 4.0.2 on 2022-11-21 00:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('job', '0002_alter_address_latitude_alter_address_longitude'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='job',
            name='paymentMethod',
        ),
        migrations.RemoveField(
            model_name='paymentmethod',
            name='amount',
        ),
        migrations.AddField(
            model_name='paymentmethod',
            name='title',
            field=models.TextField(default=''),
        ),
        migrations.CreateModel(
            name='JobPayment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('paymentMethod', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='job.paymentmethod')),
            ],
        ),
        migrations.AddField(
            model_name='job',
            name='payment',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='job.jobpayment'),
        ),
    ]

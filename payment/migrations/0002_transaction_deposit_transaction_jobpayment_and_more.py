# Generated by Django 4.0.2 on 2022-12-12 15:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='transaction',
            name='deposit',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='payment.deposittransaction'),
        ),
        migrations.AddField(
            model_name='transaction',
            name='jobPayment',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='payment.jobpaymenttransaction'),
        ),
        migrations.AddField(
            model_name='transaction',
            name='jobPromotion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='payment.jobpromotiontransaction'),
        ),
        migrations.AddField(
            model_name='transaction',
            name='profilePromotion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='payment.profilepromotiontransaction'),
        ),
        migrations.AddField(
            model_name='transaction',
            name='profileView',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='payment.profileviewtransaction'),
        ),
        migrations.AddField(
            model_name='transaction',
            name='viewJobSeekers',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='payment.viewjobseekerstransaction'),
        ),
        migrations.AddField(
            model_name='transaction',
            name='withdraw',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='payment.withdrawtransaction'),
        ),
    ]
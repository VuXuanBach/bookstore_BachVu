from datetime import date

from django import forms
from django.contrib.auth import get_user_model
from django.core.validators import RegexValidator


class SignUpForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(SignUpForm, self).__init__(*args, **kwargs)
        self.fields['email'].widget = forms.TextInput(attrs={'placeholder': '@'})
        self.fields['full_name'].widget = forms.TextInput(attrs={'placeholder': 'Full Name'})
        self.fields['password1'].widget = forms.PasswordInput(
            attrs={'placeholder': 'Minimum 8 characters and 1 number'})
        self.fields['password2'].widget = forms.PasswordInput(attrs={'placeholder': 'Retype the password'})
        self.fields['birthday'].widget = forms.DateInput(attrs={'placeholder': 'Select a date', 'type': 'date',
                                                                'class': 'datepicker'})
        self.fields['phone'].widget = forms.TextInput(attrs={'placeholder': 'Phone Number'})

        self.fields['password2'].label = "Confirm Password"

        self.fields['password1'].validators.append(RegexValidator(
            regex='^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{9,}$',
            message='This password is too short. It must contain at least 8 characters and 1 number.',
            code='invalid_password'
        ))

    def clean_birthday(self):
        data = self.cleaned_data['birthday']
        if data:
            if date.today() > data:
                return data
            else:
                raise forms.ValidationError("You must choose a date from the past.")
        return data

    def signup(self, request, user):
        user.full_name = self.cleaned_data['full_name']
        user.birthday = self.cleaned_data['birthday']
        user.phone = self.cleaned_data['phone']
        user.save()

    class Meta:
        model = get_user_model()

        fields = [
            'full_name',
            'birthday',
            'phone',
        ]

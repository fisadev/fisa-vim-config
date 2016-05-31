#-*- coding:utf-8 -*-
from django.db import models


class Team(models.Model):
    '''Team of people.'''
    name = models.CharField(max_length=100, unique=True)
    description = models.TextField()
    logo = models.ImageField(upload_to='logos')
    url = models.CharField(max_length=15, unique=True)

    private = models.BooleanField()
    private_password = models.CharField(max_length=100, blank=True)
    require_auth = models.BooleanField()

    def __unicode__(self):
        return self.name


class Status(models.Model):
    '''Possible status of a team member.'''
    team = models.ForeignKey(Team)

    name = models.CharField(max_length=100)
    color = models.CharField(max_length=25)


class User(models.Model):
    '''A user.'''
    name = models.CharField(max_length=100)
    email = models.CharField(max_length=255)
    facebook = models.CharField(max_length=100, blank=True)
    twitter = models.CharField(max_length=100, blank=True)


ROLE_ADMIN, ROLE_WORKER, ROLE_OBSERVER = range(3)

ROLES = (
    (ROLE_ADMIN, u'Team Administrator'),
    (ROLE_WORKER, u'Team Member'),
    (ROLE_OBSERVER, u'Observer'),
)


class Member(models.Model):
    '''A team member.'''
    user = models.ForeignKey(User)
    team = models.ForeignKey(Team)
    role = models.IntegerField(choices=ROLES)
    group_tags = models.TextField()

    status = models.CharField(max_length=100)
    status_extra = models.TextField()
    status_date = models.DateTimeField(auto_now=True)


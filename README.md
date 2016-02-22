# Chef Essentials

This is a repo for developing Chef Essentials.

## Abstract

Chef Essentials is a comprehensive instructor-led course covering the basic architecture of Chef, the use of Chef Development Kit (ChefDK), and associated tools. Development, engineering, and operations staff will learn to use Chef to automate the configuration, deployment, and management of server infrastructure. Participants will also learn how to test their configurations. Each of the core units in this course has hands-on exercises to reinforce the material. At the end of the course, students will have a code repository that can be used and modified to solve real business problems.

## Learner Requirements

Attendees need a network-enabled laptop with a terminal that supports SSH.

* Windows 7+ through [Putty](http://www.putty.org/) or [Cygwin with OpenSSH](https://www.cygwin.com/).

* Mac OS X 10.11

* Ubuntu 14.04


It’s best that learners have some familiarity and comfort with the following:

* Writing code (of just about any flavor) in a text editor
* Working on the command line
* Basic system administration – installing packages, configuring those packages, starting services

## Agenda

1. Introduction
2. Resources
3. Cookbooks
4. chef-client
5. Testing Cookbooks6
6. Details About the System
7. Desired State and Data
8. Workstation Installation
9. The Chef Server
10.	Community Cookbooks
11.	Managing Multiple Nodes
12.	Roles
13.	Search
14.	Environments
15.	Further Resources

## Published Content

Video on how to export the content to a Participant guide: https://drive.google.com/file/d/0B4WmSTt8VtdKZDY5RnhIWVVYZkk/view?usp=sharing

### Participant Guide

The participant guide is a PDF that contains the notes export from the content slides.

This content can be found here: https://opscode.box.com/s/75s0s971d7z5hdmtb6ua0os2vekf7zz6

### Instructor Kit

* All 15 PPT slide decks for each module.

* Instructor Guide for you to learn from, practice with, and perhaps use as reference while teaching. The instructor guide contains the notes export from the content slides with additional instructor notes and lab setup instructions.

* Participant Guide

This content can be found here: https://opscode.box.com/s/bx51ra6nk8r25f1c869xc5xkxckcxpte

### Screencast Videos

This content can be found here: https://drive.google.com/open?id=0B1nt6eQeCbyRb3BCZHFPcHZ5N2c

## Known Issues

* MODULE 05 - Currently the testing section relies on Docker to assist with the creation of a instance for testing. There have been occasions where Test Kitchen will fail. In the even of a failure or an error related to Docker it is often best to restart the docker service.

```
$ sudo service docker restart
```

## Workstation Setup

The first series of modules focus on getting learners engaged with the content as quickly as possible. A workstation is provided to the learners.

### Amazon Machine Instance

This workstation is currently being managed as a Amazon Machine Instance (AMI). This AMI is managed by Chef through the Training AWS Account.

* Essentials - CentOS 6.7 - 4.1.0 (ami-506a473a)

> The AMI was generated with [Packer](https://github.com/chef-training/chefdk-fundamentals-image) and adheres to the following [policy](https://github.com/chef-training/chefdk-image/blob/master/cookbooks/workstations/recipes/essentials.rb). It is based on a Marketplace AMI so it cannot be made public. If you would like access to this AMI to deliver training please contact [training@chef.io](mailto:training@chef.io) the request that includes your Amazon Account Id.

### Creating the Workstation

> An chef recipe that automates the creation of the workstation can be found in the [ChefDK Image](
https://github.com/chef-training/chefdk-image/blob/master/cookbooks/workstations/recipes/essentials.rb
) project

* Installation of ChefDK

* Create a user named 'chef' with the password 'chef'

* Ensure the yum package repository is up-to-date

```
$ yum update -y
```

* Uninstall various editors and tools that the attendee will install: vim; emacs; nano; tree; and git.

* Install [Docker on CentOS](https://docs.docker.com/engine/installation/centos/)

* Allow Password Authentication

* Disable the iptables service

* Disable SELINUX

* Added an ec2 json hints file (content: `{}`) to `/etc/chef/ohai/hints/ec2.json`

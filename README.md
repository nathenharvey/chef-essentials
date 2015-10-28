# Chef Fundamentals 4.x

This is a repo for developing Chef Fundamentals 4.x. This course has been renamed to Chef Essentials.

The latest published version of these training materials are located as follows:

Chef-Essentials-Instructor-Kit, which contains

•	All 15 PPT slide decks, which you should teach from.
•	Instructor Guide for you to learn from, practice with, and perhaps use as reference while teaching. (The instructor guide contains speaker notes, instructor notes, and Appendix Z. Appendix Z contains lab setup info.)
•	Participant Guide, which is the same as the Instructor Guide sans instructor notes and Appendix Z.
•	README.
https://opscode.box.com/s/bx51ra6nk8r25f1c869xc5xkxckcxpte

Here is the link to only the Chef-Essentials-Participant-Guide. (3.7 MB.) This is the link that will be in the student's confirmation email so some students may already have it prior to class starting.

https://opscode.box.com/s/75s0s971d7z5hdmtb6ua0os2vekf7zz6


## Modules

1. Intro
2. Resources
3. Cookbooks
4. chef-client
5. Testing Cookbooks6
6. Details About the System
7.	Desired State and Data
8.	Workstation Installation
9.	The Chef Server
10.	Community Cookbooks
11.	Managing Multiple Nodes
12.	Roles
13.	Search
14.	Environments
15.	Further Resources

## Publishing

Video on how to export the content to a Participant guide: https://drive.google.com/file/d/0B4WmSTt8VtdKZDY5RnhIWVVYZkk/view?usp=sharing

## Workstation Setup

The first series of modules focus on getting learners engaged with the content as quickly as possible. A workstation is provided to the learners.

This workstation is currently being managed as a Amazon Machine Instance (AMI). This AMI is managed by Chef through the Training AWS Account.

* CentOS 6.7 chef-essentials-4.0.0 (ami-11410d74)

> The the AMI was generated with [Packer](https://github.com/chef-training/chefdk-fundamentals-image) and adheres to the following [policy](https://github.com/chef-training/chefdk-fundamentals-image/blob/master/cookbooks/fundamentals/recipes/centos.rb). It is based on a Marketplace AMI so it cannot be made public. If you would like access to this AMI to deliver training please contact [training@chef.io](mailto:training@chef.io) the request that includes your Amazon Account Id.

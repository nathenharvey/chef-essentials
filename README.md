# Chef Fundamentals 4.x

This is a repo for developing Chef Fundamentals 4.x. This course has been renamed to Chef Essentials. 

The published version of these training materials are located as follows:

Chef-Essentials-Instructor-Kit-v1.0.0 which contains 

•	All 15 PPT slide decks, which you should teach from.
•	Instructor Guide for you to learn from, practice with, and perhaps use as reference while teaching. (The instructor guide contains speaker notes, instructor notes, and Appendix Z.)
•	Participant Guide, which is the same as the Instructor Guide sans instructor notes and Appendix Z.
•	README.
https://opscode.box.com/s/bx51ra6nk8r25f1c869xc5xkxckcxpte

Here is the link to only the Chef-Essentials-Participant-Guide-v1.0.0. (3.7 MB.) This is the link that will be in the student's confirmation email so some students may already have it prior to class starting.

https://opscode.box.com/s/eq0w3lqkbhx9a3two3wq6bohso2k29nk


## Modules

1. Intro
2. Getting a workstation
3. Resources
4. Cookbooks
5. chef-client
6.	Testing Cookbooks
7.	Details About the System
8.	Desired State and Data
9.	Workstation Installation
10.	The Chef Server
11.	Community Cookbooks
12.	Managing Multiple Nodes
13.	Roles
14.	Search
15.	Environments
16.	Further Resources

## Publishing

Video on how to export the content to a Participant guide: https://drive.google.com/file/d/0B4WmSTt8VtdKZDY5RnhIWVVYZkk/view?usp=sharing

## Workstation Setup

The first series of modules focus on getting learners engaged with the content as quickly as possible. A workstation is provided to the learners.

This workstation is currently being managed as a Amazon Machine Instance (AMI). This AMI is managed by Chef through the Training AWS Account.

* CentOS 6.7 chef-essentials-4.0.0 (ami-11410d74)

> The the AMI was generated with [Packer](https://github.com/chef-training/chefdk-fundamentals-image) and adheres to the following [policy](https://github.com/chef-training/chefdk-fundamentals-image/blob/master/cookbooks/fundamentals/recipes/centos.rb). It is based on a Marketplace AMI so it cannot be made public. If you would like access to this AMI to deliver training please contact [training@chef.io](mailto:training@chef.io) the request that includes your Amazon Account Id.

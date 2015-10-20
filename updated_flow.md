# This is suggested updated flow Franklin & JohnF discussed for Essentials.

## Section 09-Chef-Server

In 09-Chef-Server section they have bootstrapped a Web Server, so this is the proposed subsequent flow:-

## "Section 10: Search and Dynamic Content (Dynamically scaling out)"

We present the problem that our site has just got super busy so we need further web servers to handle the traffic. More web servers also means we'll also need a load balancer.  

1. They spin up another web server. This time they use the single command `knife bootstrap FQDN -x USER -P PWD --sudo -N node3 –r 'recipe[apache]'`

 - They now have two web servers

1. We show `knife node list` – not much detail, ugh!

1. We show more details with `knife node show web01` and `knife node show web02` - but how that’s used for single nodes.  How do we find info on both nodes?

1. Introduce search `knife search node "*:*”`` and `knife search node "*:*" -a cloud.public_ipv4`

1. They hit these two web servers individually, and explain we need an LB to distribute traffic

1. They  chef generate cookbook cookbooks/haproxy and add `package`, `template`, & `service` resources


```ruby
package 'haproxy' do
  action :install
end

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
end

service 'haproxy' do
  action [:start, :enable]
end
```

1. Then `chef generate template cookbooks/haproxy haproxy.cfg`, pull in content from http://bit.ly/1M4yvjE and hardcode the IP Addresses from Step 5, so `haproxy.cfg.erb` looks like this

```ruby
...
backend app
 balance     roundrobin
 server ec2-54-15-38-10.compute-1.amazonaws.com 54.15.38.10:80 weight 1 maxconn 100 check
 server ec2-52-23-23-20.compute-1.amazonaws.com 52.23.23.20:80 weight 1 maxconn 100 check
```

1. Upload cookbook `knife cookbook upload haproxy`

1. They bootstrap their LB Node command `knife bootstrap FQDN -x USER -P PWD --sudo -N node3 –r ‘recipe[haproxy]'`

1. Present the issue – we’ve hardcoded IPs. Must be a better way.  

1. Refactor haproxy recipe to include a search on `'recipes:apache\:\:default’`, pass the resulting array into ERB file and iterate over it to create dynamic content.
backend servers-http

```ruby
package 'haproxy' do
  action :install
end

webservers = search("node","recipes:apache\:\:default")

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  variables(
  :webservers => webservers
  )
end

service 'haproxy' do
  action [:start, :enable]
end
```

1. Change the `haproxy.cfg.erb` as follows

```ruby
...
backend app
balance     roundrobin
<% @webservers.each do |web| -%>
  server <%= web['cloud']['public_hostname'] %> <%= web['cloud']['public_ipv4'] %>:80 weight 1 maxconn 100 check
<% end -%>
```

## "Section 11: Cookbook Attributes"

We now present the problem that we don’t want direct access to the web servers. We must move apache to tcp/8080 and block that port on the firewall

So we must refactor both apache & haproxy default recipes to move apache traffic from tcp/80 to tcp/8080.

1. Create an attributes file `cookbooks/apache/attributes/default.rb`

1. Add an attribute `default['apache']['port'] = 8080`

1. Add a template resource in default recipe for `/etc/httpd/conf/httpd.conf`

```ruby
template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
end
```

1. Create the template file - `chef generate template cookbooks/apache httpd.conf`

1. They pull http://bit.ly/1M4BRmC (probably could trim that file way back) into `httpd.conf.erb`

1. Set line 27 to node['apache']['port']

```ruby
...
Listen node['apache']['port']
...
```

1. Set update `haproxy.cfg.erb`

```ruby
backend servers-http
<% @webservers.each do |web| -%>
  server <%= web['cloud']['public_hostname'] %> <%= web['cloud']['public_ipv4'] %>:<%= node['apache']['port'] %> weight 1 maxconn 100 check
<% end -%>
>
```

1. The create iptables cookbook and block tcp/8080 (or set this in apache::default)

1. We now introduce `knife ssh "*:*" -x USERNAME -P PASSWORD "sudo chef-client"` to reconverge everything.

1. We segway into Community Cookbooks by showing that an all-singing all-dancing `haproxy` cookbook already exists!

## "Section 12: Community Cookbooks"
We now present the problem that we don’t want manually run `chef-client` each time we make a change, and would prefer it runs periodically.

1. Then have them download `chef-client` cookbook and upload w/ `berks` etc., and use Community Cookbooks to cover the 'chef-client' cookbook, just as in fundamentals. Berks used here to manage the intricate dependencies.  

1. We create `my-chef-client` wrapper cookbook to change the default attribute setting for this cookbook to have chef-client converge every 5 mins.

1. This is similar to Chef Fundamentals flow (but without the delete validation key bit) I believe these are fundamental principles we need to get across.

This content exists already, and what doesn't wouldn't take long to develop.

## "Section 13: Roles"
We add the following key learnings to the _Roles_ section.

1. They change apache port to tcp/8081 - Look role attributes trump cookbook attributes!

2. We introduce nested roles by adding a base role that includes `chef-client::default` to both `proxy` and `web` roles

## "Section 14: Environments"
We add the following key learnings to The _Environments_ section.

1. They change apache port to tcp/8181 - Look environment (override) attributes trump role attributes!


## Other topics to include- Managing logging on `chef-client`

- Contents of `/etc/chef`, and particularly `client.rb` & how it connects to Chef Server.

- Drill down on what happens during bootstrap

- how authentication works

- compile/execute phase os chef-client, & in particular how ruby in a recipe gets executed in compile phase.

- using `not_if` & `only_if` with `execute` resource to ensure idempotency.

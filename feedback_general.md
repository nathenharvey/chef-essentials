# General Feedback

- This is no biggie, but I don't like the line at the bottom of the slide - too restrictive & imposing/in your face.

- I need a deck that I can use for both in person and online classes, rather than maintaining two deck, and some aspects of this class don't lend themselves to online delivery (e.g. talk amongst yourselves, or take a few mins to read the docs)

- I have a problem with charging folks >$1500, then telling then to go RTFM, especially from the very start.  I dont think I'll be doing this in practice, at least early in the class - later in the class for other concepts, maybe.  In any case I will certainly be covering the docs with them as a separate/side discussion

- We should follow good practice around when to use "" and when to use '', and be consistent throughout the class.  There was preference in Chef Fundamentals to use single quotes, unless there was string interpolation. I dont think this class is too bad in this regard, but I spotted a few diffs and worth a check/runthrough

- I find the PPT template hard to follow, in what is a section header, whats is a lab intro, and when does that lab end, what is confirming a lab step is complete, what is the next step in a lab. I'm also getting confused with all the different graphics on top-right of the slides, and what they mean.

- In _03-Cookbooks.pptx_ they should they do `chef generate repo reponame` before creating a cookbook. This flow would be in the context of setting up their workspace while talking about git, github, repos etc? (Already chatted w/ @frank on this)

- I think we should rename "details-about-the-system" to "The Node Object".  It is important that they come away knowing that the _the node object_ is a thing, and differs from _the node_, as that is a fundamental concept in Chef.

- I believe we should start with `knife cookbook upload` rather than introducing `berks` from the outset when there are no dependencies. Non developers will not appreciate the dependency thing, and we can explain later why `berks` was developed and is used to manage cookbook dependencies etc, and maintain a clean repo.  Also, I think it would seem wrong for folks to leave a Chef class without knowing the command `knife cookbook upload ...`.

- Also, `berks` requires `git` to be installed, so this may be an issue and should be called out as a prereq for the course, in case their laptops are locked down and cant instal s/w in class.  I've been stung by this in class before.

- I think section '10-community-cookbooks' needs a clearer explanation of what we're trying to achieve. I don't think it explains the reason for the wrapper cookbook, and thats added to by the fact that we have not covered cookbook attributes, or the attributes file.

- I'd prefer the term 'load balancer' than 'proxy server' throughout as its more descriptive and helps visualise what application stack we're trying to create.  A load balancer is by its nature a proxy, but a proxy is not necessarily a load balancer, and we dont want to start explaining in class its actually a reverse proxy we mean.

- "11-managing-multiple-nodes.pptx" section. I'm not sure of the purpose of this section, as contains no new learnings and the lab repeats everything already covered in the previous section.  If its a review section then thats fine, but maybe more worthwhile having that at the very end of the course to recap on everything?

- It might been easier if the naming convention when bootstrapping each node the name was 'proxy' (or 'lb'), 'web01', & 'web02', instead of 'node1' ,'node2' ,'node3'.  This would make it easier to follow the diagrams, and which node to assign roles, etc.

- Lab slides that repeat as they progress through the lab should be numbered - step 1/3, step 2/3, step 3/3.  It took me to 3/4 way through the class to realise it wasn't just needless repetition.

- After the first time they have done `knife bootstrap IP -x chef -P chef --sudo -N nodename` then manually set the runlist by `knife node run_list set nodename "recipe[foo]"`, then for subsequent nodes we could have them combine these an just `knife bootstrap IP -x chef -P chef --sudo -N nodename -r "recipe[foo]"`

- They should come away from the class knowing how to run chef-client as a service/task.

- From '09-chef-server' they start using use their own laptop as a workstation, so can the screen be a different colour - blue? I think we need a clearer distinction here.  Might not come out in print, but at least will on screen.

- This is for revision 2.#.# of the course, but would be great if each student had their own Chef Server, spun up as a marketplace AMI.  They could then either download starterkit, or `knife configure ... ` - more like they'd do in real life.  I have a cookbook that could spin up a chef server and workstation per student.  Also introduces Chef Server in marketplace!

- There seems to be too much hard-coding of IP Addresses right up to Section 11, when we should be advocating automation all the way


# Concepts missing/dropped from fundamentals:-
I think its fine if there was conscious decision to omit these, but just so I know.

- Attribute files

- Precedence levels on attributes (roles attributes overwrite attribute files, etc etc)

- chef-client as a service/task

- Managing logging on `chef-client`

- contents of `/etc/chef`, and particularly `client.rb`.

- what happens during bootstrap - should drill down on that, & explain other approaches

- how authentication works.

- compile/execute phase, & in particular how ruby in a recipe gets executed in compile phase.


# Suggested Change in Flow.
Here is a suggestion for a change of flow.

1) Move '10-community-cookbooks.pptx' to later (see 3. below).

2) In its place, after '09-chef-server' we have them manually create HAProxy cookbook from scratch and and use that section to teach them search & template variables along the way, so there is no hard-codong IP Addresses in the cookbook. Something like this

    ```ruby
    package 'haproxy' do
      action :install
    end

    webservers = search("node","role:web")

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

 Then have them do `webservers.each` in the erb file.  Could include a bunch of the stuff from '11-managing-multiple-nodes' in this to set up an LB in front of two web servers.

3) Could segway into Community Cookbooks by showing that an all-singing all-dancing haproxy cookbook already exists. Then have them download `chef-client` cookbook and upload w/ `berks` etc., and use Community Cookbooks to cover the 'chef-client' cookbook, just as in fundamentals. Berks used here to manage the intricate dependencies.  A `my-chef-client` wrapper cookbook could be used to change the default attribute setting for this cookbook to have chef-client converge every 5 mins.

4) Then roles sections, set apache port to tcp/8080 (and maybe close tcp/80 on in the web nodes' EC2 Security Groups, so they're hidden behind a firewall, like real life) then configure haproxy accordingly to listen on tcp/80 but contact apache on tcp/8080, and do this as role attributes for both `haproxy` and `apache` roles. Base role would have them config `chef-client` as as service on all three nodes, converging every 5 mins.

Some of this is similar to Chef Fundamentals flow, but I believe these are fundamental principles we need to get across. The majority of this content exists already, and what doesn't wouldn't take long to develop.

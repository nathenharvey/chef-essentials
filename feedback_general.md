# General Feedback

- This is no biggie, but I don't like the line at the bottom of the slide - too restrictive & imposing/in your face.

> I don't think it is all that necessary at all. I'm not sure the importance of a slide footer. I am also not sure why we feel the need to include both the logo and a copyright on every slide.

- I need a deck that I can use for both in person and online classes, rather than maintaining two deck, and some aspects of this class don't lend themselves to online delivery (e.g. talk amongst yourselves, or take a few mins to read the docs)

> When you deliver the course you are welcome to augment how you get the learners to answer your questions. Right now I move down the list of learners and have them answer them one at a time. You could also open a Google Document, share the link, and then have everyone share their answers in there. With Zoom you could have them chat with a buddy that you pre-assign and then ask for one of them to share the answer with you.

- I have a problem with charging folks >$1500, then telling then to go RTFM, especially from the very start.  I dont think I'll be doing this in practice, at least early in the class - later in the class for other concepts, maybe.  In any case I will certainly be covering the docs with them as a separate/side discussion

> I think that our documentation is great and I think that it is definitely important to show people that they have the ability within themselves to learn. When you teach it you are welcome to instead share the information from the docs and use the URL as a reference that you give them.

- We should follow good practice around when to use "" and when to use '', and be consistent throughout the class.  There was preference in Chef Fundamentals to use single quotes, unless there was string interpolation. I dont think this class is too bad in this regard, but I spotted a few diffs and worth a check/runthrough

> I am going to comb through all the content and make it single quote in every place that it makes sense. I sense only a few problems from doing so -- namely in the the 'details about the system' section where we introduce string interpolation within an existing string.

- I find the PPT template hard to follow, in what is a section header, whats is a lab intro, and when does that lab end, what is confirming a lab step is complete, what is the next step in a lab. I'm also getting confused with all the different graphics on top-right of the slides, and what they mean.

> The top-right images had more meaning in the beginning. Then the 'chef hat' made its appearance. That one doesn't make any sense to me. I even added it.
>
> I agree with you. The format of the slides are difficult to follow. I think that is relatively consistent but is lacking some very important visual distinctions. I would love to discuss how we could do this better with Steve and Rebekah.

- In _03-Cookbooks.pptx_ they should they do `chef generate repo reponame` before creating a cookbook. This flow would be in the context of setting up their workspace while talking about git, github, repos etc? (Already chatted w/ @frank on this)

> As we talked about already, I think that adding it to the chef-client section would make the most sense. In the cookbooks section they have no need for a repository.

- I think we should rename "details-about-the-system" to "The Node Object".  It is important that they come away knowing that the _the node object_ is a thing, and differs from _the node_, as that is a fundamental concept in Chef.

> I agree. By that same convention we should call 'desired state and data' the 'template' section. When I initially thought of naming each section I wanted to make it more human-readable (non-Chef) about the goal that they were trying to accomplish. I think I only tried that in those two sections.

- I believe we should start with `knife cookbook upload` rather than introducing `berks` from the outset when there are no dependencies. Non developers will not appreciate the dependency thing, and we can explain later why `berks` was developed and is used to manage cookbook dependencies etc, and maintain a clean repo.  Also, I think it would seem wrong for folks to leave a Chef class without knowing the command `knife cookbook upload ...`.

> I don't know if knowing `knife cookbook upload` is that important. When you teach `berks install` and `berks upload` you teach one workflow that works in all situations. It is definitely not that intuitive and I often get asked why the install step before the upload, but most accept it.

- Also, `berks` requires `git` to be installed, so this may be an issue and should be called out as a prereq for the course, in case their laptops are locked down and cant instal s/w in class.  I've been stung by this in class before.

> I have not seen that dependency.

- I think section '10-community-cookbooks' needs a clearer explanation of what we're trying to achieve. I don't think it explains the reason for the wrapper cookbook, and thats added to by the fact that we have not covered cookbook attributes, or the attributes file.

> Definitely right. The introduction of cookbook attributes are definitely missing. We could add it to 'Details About the System' or a whole new section.

- I'd prefer the term 'load balancer' than 'proxy server' throughout as its more descriptive and helps visualise what application stack we're trying to create.  A load balancer is by its nature a proxy, but a proxy is not necessarily a load balancer, and we dont want to start explaining in class its actually a reverse proxy we mean.

> I agree with you. Make the change.

- "11-managing-multiple-nodes.pptx" section. I'm not sure of the purpose of this section, as contains no new learnings and the lab repeats everything already covered in the previous section.  If its a review section then thats fine, but maybe more worthwhile having that at the very end of the course to recap on everything?

> I like repetition particularly if it reinforces a workflow that we want to make sure they understand when they leave the training. You made some other good points of possibly using this section after you have setup the dynamic recipe with search to see this all working. Try it.

- It might been easier if the naming convention when bootstrapping each node the name was 'proxy' (or 'lb'), 'web01', & 'web02', instead of 'node1' ,'node2' ,'node3'.  This would make it easier to follow the diagrams, and which node to assign roles, etc.

> I know that we are not getting the learner attached to the idea of naming their nodes. I'm not keen on having them name the node based on its fuction when that is done with the role.

- Lab slides that repeat as they progress through the lab should be numbered - step 1/3, step 2/3, step 3/3.  It took me to 3/4 way through the class to realise it wasn't just needless repetition.

> I think a progress indicator would a good addition. When teaching it I have not had a problem with learners feeling like this was needless repetition. I know browsing through the deck it feels that way.

- After the first time they have done `knife bootstrap IP -x chef -P chef --sudo -N nodename` then manually set the runlist by `knife node run_list set nodename "recipe[foo]"`, then for subsequent nodes we could have them combine these an just `knife bootstrap IP -x chef -P chef --sudo -N nodename -r "recipe[foo]"`

> I often teach that after the second bootstrap. I don't want to make that a requirement because for some people still struggle with the idea of a run_list and how to set it.

- They should come away from the class knowing how to run chef-client as a service/task.

> I agree. If we continue to find the content has room for it. That should be added to a the roles section. I left some extensive comments in the specific feedback section.

- From '09-chef-server' they start using use their own laptop as a workstation, so can the screen be a different colour - blue? I think we need a clearer distinction here.  Might not come out in print, but at least will on screen.

> I created a blue prompt that appears in the introduction. It is never used anywhere else within the whole deck. I would like for it to be used exactly as you are describing.

- This is for revision 2.#.# of the course, but would be great if each student had their own Chef Server, spun up as a marketplace AMI.  They could then either download starterkit, or `knife configure ... ` - more like they'd do in real life.  I have a cookbook that could spin up a chef server and workstation per student.  Also introduces Chef Server in marketplace!

> There is the chef_portal project that I will finish up that sets up a Chef Server for the entire class with all their nodes.

- There seems to be too much hard-coding of IP Addresses right up to Section 11, when we should be advocating automation all the way

> I chose that purposefully to show the need to refactor to something better.

# Concepts missing/dropped from fundamentals:-
I think its fine if there was conscious decision to omit these, but just so I know.

- Attribute files

> I agree.

- Precedence levels on attributes (roles attributes overwrite attribute files, etc etc)

> I don't know that we should try to exhaustively demonstrate these unless they are necessary.

- chef-client as a service/task

> I think that this concept could be a follow up course.

- Managing logging on `chef-client`

> I agree if you can teach them to do it with the chef-client cookbook and not manually manipulate that setting.
>
> I think that this concept could be a follow up course.

- contents of `/etc/chef`, and particularly `client.rb`.

> I agree that some people would be interested in knowing more about the file structure on node.
>
> I think that this concept could be a follow up course.

- what happens during bootstrap - should drill down on that, & explain other approaches

> I think that we should definitely discuss more about the bootstrap process. I don't know the right level of detail. I don't know what you mean by other approaches.

- how authentication works.

> I think that this concept could be a follow up course.

- compile/execute phase, & in particular how ruby in a recipe gets executed in compile phase.

> I think that this concept could be a follow up course.


# Suggested Change in Flow.
Here is a suggestion for a change of flow.

1) Move '10-community-cookbooks.pptx' to later (see 3. below).

2) In its place, after '09-chef-server' we have them manually create HAProxy cookbook from scratch and and use that section to teach them search & template variables along the way, so there is no hard-coding IP Addresses in the cookbook. Something like this

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

Then do this in the erb file:-

```ruby
...
backend servers-http
<% @webservers.each do |web| -%>
  server <%= web["cloud"]["public_hostname"] %> <%= web["cloud"]["public_ipv4"] %>:80 weight 1 maxconn 100 check
<% end -%>
```

Could include a bunch of the stuff from '11-managing-multiple-nodes' in this section (bootstrapping further nodes etc) to set up an LB in front of two web servers.

> I think having them make the haproxy cookbook would be a good idea. I would start with them hard-coding the values of the servers into the template and then lead them into a discussion of refactoring that recipe to use search.

3) Could segway into Community Cookbooks by showing that an all-singing all-dancing haproxy cookbook already exists. Then have them download `chef-client` cookbook and upload w/ `berks` etc., and use Community Cookbooks to cover the 'chef-client' cookbook, just as in fundamentals. Berks used here to manage the intricate dependencies.  A `my-chef-client` wrapper cookbook could be used to change the default attribute setting for this cookbook to have chef-client converge every 5 mins.

> I like the repetition of having the learner wrap another cookbook. This would be a good addition with/without the changes above.

4) Then in roles sections, set apache port to tcp/8080 (and maybe close tcp/8080 on in the web nodes' EC2 Security Groups, so they're hidden behind a firewall, like real life) then configure haproxy accordingly to listen on tcp/80 but contact apache on tcp/8080, and do this as role attributes for both `haproxy` and `apache` roles. Base role would have them config `chef-client` as as service on all three nodes, converging every 5 mins.

> The only limitation in this plan is that the apache cookbook does not write out a configuration file so they would need to add that before they could override the port to 8080.

Some of this is similar to Chef Fundamentals flow, but I believe these are fundamental principles we need to get across. The majority of this content exists already, and what doesn't wouldn't take long to develop.

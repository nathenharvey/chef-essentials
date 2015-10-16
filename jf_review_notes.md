# 01-Intro.pptx

Don't like the line at the bottom of the slide - too restrictive

Slide 5 - On paper it sounds like  a nice split - Day1=No Chef Server, Day2=With Chef Server - but I feel this is too restrictive.  What if we get one the 'Day 1' stuff early, can we not start on the 'Day 2' stuff.  In such circumstances I'd prefer to forge ahead to complete earlier on Day2, and give some time to talk about other things not on the agenda, like data bags, provisioning, policy files, etc.  Also, if these are hard schedules, then some folks might see this and decide to return on 'Day 2'

Slide 6 - The point "Your infrastructure becomes as versionable, testable, and repeatable as application code enabling you to automate the process of configuring, deploying and scaling servers and applications" is very important an warrants a bulletpoint. In class most folks try read every slide in case they miss something, often at the expense of listen to what the instructor is saying.

Slide 6 - also on Slide 6, I'd use 'Azure' instead of 'Rackspace'.  RAX is kinda old hat, and Azure if more current.

Slide 7 - "Chef is a large set of tools that are able to be used on multiple platforms and in numerous configurations" is a bit of a mouthful, and could probably be more succinct, and not sure what 'in numerous configurations' means. What about something like this "The Chef platform provides tools that can work together to configure complex systems across many platforms"

"Learning Chef is like learning a language" - learning chef IS learning a language.

Slide 8 - This is a great point "Sometimes its more important to know what something looks like when it does not work than when it does work." - is it bulletworthy?

Slides 10&11 - I would add hat this VM is actully in EC2, rather than some random datacenter somewhere. Means they could easily create the same machine.  This may well be put across verbally in class, but for those download & reading the slides & preparing to teach it.

Slide 14 - s/password-less sudoers access/passwordless sudo access/

# 02-Resources.pptx
Slide 1 - maybe move the note to Slide 2 (picky)

Slide 3 - Do we show how to set up remote access using Sublime? and same for Atom, and should we say that? (JF> delete this comment if/when I come across that)

For future revs, can we have them install `tree` instead and have them just use `vi`. `tree` is a useful learning tool

Slide 6 & 7 - what about `which [nano vim emacs]`. JF> check this output

Slide 10 - I have a problem with charging folks >$1500, then telling then to go RTFM at the very start.  I dnt think I'll be doing this in practice so early - later in the class for other concepts, maybe.

slide 12 - Since this is the first time they;ve seen resource, should it not be explicit
```ruby
package 'httpd' do
  action :install
end
```
Also, this might not be an issue (I'm only at section 2), but we should follow good practice around when to use "" and when to use '', and be consistent throughout the class.

Slide 13 - Could add "for those familiar w/ ruby, this is an array of actions, & for those who arn't then thats tl;dr"

Slide 17 - Instructor node that if they mention that this takes longer than a simple `yum install`, do the handwavey there's ohai etc running in the background, etc and it would be much quicker over multiple rsources.

Slide 22 - Havn't discussed recipes yet, just resources.probbaly fine as its a group exercise, but we should explin that a recipe is .rb file that contains resources.  Oh, ok, we explain this in slide 24

Slide 31 - JF> Check this - if you dont set mode, so it set them to the default for the file resource, or leave them as default for the system?

Slide 36 - we already covered not specifcying the action when we used `chef-apply` to install the packaage.

Slide 37 - I'm not 100% clear what the student has to do here


# 03-Cookbooks.pptx

Should they do `chef generate repo reponame` before creating a cookbook, and while talking about git, github, reops etc? Or else the may have to `berks vendor cookbookname`

Slide 12 - reading docs again :(

# 04-chef-client.pptx
Slide 4 - "When a chef-client is run" sound manual.  "When a chef-client runs" sound like it could manual or automatic.

Slide 7 - Explain that the '\' is just a wrapping thing, and its all on one line

Slide 23 - Maybe this is an advanced thing, and too soon to mentioned, but using the `include_recipe` construct allows you to put some logic around if a recipe gets executed or not.

# 05-testing-cookbooks.pptx

# 06-details-about-the-system.pptx
Slide 26 - What does 'ohai + chef-client = <3' mean?
Slide 27 - should be "The Node Object", not "The Node"

# 09-chef-server.pptx
Slide 1 - "A Hub for Configuration Data". Its more than that, so maybe change to "A Hub for Configuration Data & A Searchable Index"

Should we be using `berks` from the outset when there are no dependencies, and not `knife cookbook upload ...`??

Also, maybe an instructor note that `berks` may require `git` to be installed.  In fact this should be called out as a prereq for the course for this reason.

# 10-community-cookbooks.pptx
I think this section needs a clearer explanation of what we're trying to achieve, and whats running on each node etc

Slide 13 - should not talk here about precedence and how values get overwritten?

Slide 19 - need to explain `hints.json` here

Slide 35 - They've already done `knife bootstrap FQDN2 -x USER -P PWD --sudo -N node1`, so why not now introduce setting run_list at bootstrap time `knife bootstrap FQDN2 -x USER -P PWD --sudo -N node2 -r 'recipe[myhaproxy]'`

Slide 44/45 - :%s\Chef Super Market\Chef Supermarket\g

Worth noting in this section that Chef Supermarket is itself opensource, and you can run your own behind a firewall, e.g. if you want to share cookbooks internally within an enterprise, but not externally or dont want to use external supermarket.

# 11-managing-multiple-nodes.pptx
I'm not sure of the purpose of this section, as contains no new learnings and the lab repeats everything already covered in the previous section.  If its a review section then thats fine, but maybe more worthwhile having that at the very end of the course to recap on everything?

Slide 1 - I prefer the term _add it to the Loadbalancing pool_ to _add it as a proxy member_ (same goes for last section also). Proxy's dont have members, loadbalancers do.  A proxy passes traffic through it, and a loadbalancer distributes traffic - they're two separate functions. Just so happens that an LB also proxies that traffic, but thats an implementation thing.  

Slide 3 - It would be useful on these diagrams (in all sections) to include 'node1', 'node2' etc, so they can map the node they bootstrapped to the diagram

Slide 4 - Maybe change "Another Web Node" to "Create Another Web Node" - I thing the Lab title should be more action orientated!

# 12-roles.pptx
We should include a huge instructor note about the windows issue that creates 'role[recipe]', i.e. having an 's' in the role name and how to escape that.

Also this section doesn't mention setting attributes in a role.  In fact this whole course doesn't mention the `attributes/default.rb` or setting attributes at all :(

Slide 5 - Again I'd prefer the term _Loadbalancer_ to _proxy_.

Slide 27 - I think we should include an example of a nested roles, like a base role for all tyypes of server that contains 'recipe[ntp::client]', and use that to explain that all nodes must be running the same clock or `chef-client` may not authenticate with Chef Server.

# 13-search.pptx
Slide 7 - We've also used `knife ssh "role:web" ...`

Slide 17 - I think too much talk of 'hahses' and a'arrays' here.  This might be ok if we gave a quick 'Ruby Hash and Array 101' first.

Slide 18 - Lots of ruby talk here "'"method available on every array object named 'each'"

Slide 21 - Should _Dynamic Web Proxy_ be _GE: Dynamic Web Proxy_. Also I thin these lab slides that repeat as they progress through the lab should be numbered - step 1/3, step 2/3, step 3/3 - as I've just clocked on that they are showing progress. I just thought there was a load of repetition.

Slide 25 - Remove _PS C:\Users\sdelfante\chef-repo\cookbooks\myhaproxy>_

I think after this section would be a better place to include the _11-managing-multiple-nodes.pptx section_, so they can see it dynamically update.


# 14-environments.pptx
Slide 4 - folks could confus the 'node 1', 'node 2' etc with their lab nodes - maybe call them 'web01', 'web02' etc.  Also, _You likely are familiar with the concept of environments._ - I would't assume that

Slide 6 - Maybe change _GE: Production_ to something more actiony like _GE: Create a Production Environemt_

Slide 22 - Labs have them change env for node1 & node2 - what about node3?  Maybe a diagram here would be good showing what we're trying to achieve.

Slide 24, ok I see reference to 'node3' now, but I think an explanation earlier would been useful

In fact, might been easier if the naming convention when bootstrapping each node was 'proxy', 'web01', & 'web02', instead of 'node1' ,'node2' ,'node3'.  

Slide 31 - _Separating Environments_ to _GE: Separating Environments_.  Also what about the 1/3 thing again to show this slide shows progress

Slide 42 - 'Step 3/3'? Also footer here says '14'




# Second Pass
-) See some review comments in slides
-) Why not `git clone ...` instead of downloading ZIP file. Because maybe no git? Then Berks wont work!

-) Why no attributes file?

-) Why no precedence levels on attribues?

-) No attributes set in roles?

-) Should have them run chef-client as a service, and use berks for this cookbook?

-) knife bootstrap 52.91.245.245 -x chef -P chef --sudo -N node1

-) From '09-chef-server' they use their own laptop as a workstation, so can the screen be a different colour - blue? Definitely need a clearer distinction here.

-) Change terminology from 'Proxy Server' to 'Load Balancer' as its more descriptive on what we're trying to achieve

-) Suggestion: leave community cookbooks for 'chef-client' and using `berks`.  Instead manually create the haproxy cookbook manually, and use that section to focus on search.  Could segway into chef-client by showing that an all-singing all-dancing haproxy cookbook already exists.

-) In '10-community-cookbook' why are we still hardcoding IP Addresses when the last section showed how to avoid that

-) I'm getting confused with all the different graphics on top-right of the slides, and what they mean.

-) In community cookbooks, uploading myhaproxy for first time, Need to `berks init` first

-) We need to show them `knife cookbook upload` first to help explain why we use `berks`, as non developers will not appreciate the dependency thing.  Seems this was written by someone with a programming background.

-) Slide after "GE: Using knife ssh" has wrong title, AND we haven't taught them search yet, so `knife ssh "*:*" ...` means nothing.  This problem would go away of this seciotn was used to teach search, adn have them manually create the `haproxy` cookbook.

-) I think this course would be better served if they each had their own Chef Server, spun up as a marketplace AMI.  They could then either download starterkit, or `knife configure`, more like they'd do in real life.  I have a cookbok that could spin up a chef server and workstation per student.



-) In '11-Managing-multiple-nodes' section, can we call the nodes webnode01, webnode02, lbnode etc?

-) Nooo stop hardcoding IPs in for haproxy lb pool!  



-) Section '13-search' MUST be earlier.

-) "Chef Server maintains a representation of all the nodes within our infrastructure that can be searched on. " reword as "Chef Server maintains searchable index of all the nodes within our infrastructure"

-) "The search criteria that we have been using up to this point is "*:*"" - No, we've done "knife ssh "role:web""

-) Slide titled 'Search Syntax within a Recipe', I'd give an exampe recipe first so they can see the context - they might thing _all_web_nodes_ is a keyword, and not some arbitrary text.

-) Search section shows searhing from recipe, but not searching using knife.

-) Search and roles sections could be enhanced by setting apache port to tcp/8080, reconfiging this as role attributes.


-) "11-Environments". Could be wrong, but I think this is the first mention of `knife search`

-) Might be nice to bootstrap another node directly into an environemt with the `-E` flag

-) We should have them increase logging on `chef-client`

-) In this class we dont cover contents of `/etc/chef`, and particularly `client.rb`.

-) Dont explain how authentication works.

-) Dont explain the compile/execute phase.  Dont explain how ruby in a recipe gets executed in compile phase.

-) would been nice to show setting attributes in environment files.

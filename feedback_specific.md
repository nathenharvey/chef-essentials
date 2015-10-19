
# Specific Feedback

## 01-Intro.pptx

Slide 5 - On paper it sounds like  a nice split - Day1=No Chef Server, Day2=With Chef Server - but I feel this is too restrictive.  What if we get done with the 'Day 1' stuff early, can we not start on the 'Day 2' stuff.  In such circumstances I'd prefer the flexibility to forge ahead to complete earlier on Day2, and give some time to talk about other things not on the agenda, like data bags, provisioning, policy files, etc, but if we tie ourselves to hard schedules, then some folks might see this and decide to return on 'Day 2'.

> The outline of events are a loose guideline. The only thing is that before you move to the second day you will need to stop and do the workstation configuration. I usually use that as the ending activity for the first day.

Slide 6 - The point "Your infrastructure becomes as versionable, testable, and repeatable as application code enabling you to automate the process of configuring, deploying and scaling servers and applications" is very important an warrants a bulletpoint. In class most folks try read every slide in case they miss something, often at the expense of listen to what the instructor is saying.

> Definitely add it.

Slide 6 - also on Slide 6, I'd use 'Azure' instead of 'Rackspace'.  RAX is kinda old hat, and Azure if more current.

> I would agree as well.

Slide 7 - "Chef is a large set of tools that are able to be used on multiple platforms and in numerous configurations" is a bit of a mouthful, and could probably be more succinct, and not sure what 'in numerous configurations' means. What about something like this "The Chef platform provides tools that work together to configure complex systems across many platforms"

"Learning Chef is like learning a language" - learning chef IS learning a language.

> Sounds good.

Slide 8 - This is a great point "Sometimes its more important to know what something looks like when it does not work than when it does work." - is it bulletworthy?

> It's definitely a point I like to drive home for those that finish the work early. I think that we could go further, show an example of working code, making a small change, seeing the error, and then fixing it again.

Slides 10&11 - I would add that this VM is actually in EC2, rather than some random datacenter somewhere. Means they could easily create the same machine.  This may well be put across verbally in class, but useful for those download & reading the slides & preparing to teach it.

> Sure that would fine addition. I usually say it aloud in class when the time is right. I don't have feelings any which way on it.

Slide 14 - s/password-less sudoers access/passwordless sudo access/

> Sounds good.

## 02-Resources.pptx
Slide 1 - maybe move the note to Slide 2 (picky)

> That should be done. That was a mistake that Steve made. I promised to move them. I failed to move them all.

Slide 3 - Do we show how to set up remote access using Sublime? and same for Atom, and should we say that?

> I believe that comment has been removed.

For future revs, can we have them install `tree` instead and have them just use `vi`. `tree` is a useful learning tool, and installing multiple editors doesn't make a lot of sense.

> I talked with Nathen and he has opted now to start the learning activity with having them install 'cowsay'. I think that we should probably install all the editors, let them pick whatever one they want, and have them install 'cowsay'.

Slide 6 & 7 - what about `which nano vim emacs`.

> I didn't know that it worked that way. Please change the slide. Steve loves when we can remove more slides.

Slide 10 - Link to the docs surely, but I dont like the RTFM

> I believe our documentation is pretty decent and I think that it is a good idea to have them experience it the first time with a trainer in the room. When I facilitate a training I intend to show them the abilities they have within themselves.

slide 12 - Since this is the first time they've seen resource, should it not be explicit
  ```ruby
  package 'httpd' do
    action :install
  end
  ```

> I'm not sure. Resources have many ways that they can be installed. Some days I think that we should show them the entire resource definition with the explicit action defined. Other times I think it is important that they also learn about the shorthand way to describe them.

Slide 13 - Could add "for those familiar w/ ruby, this is an array of actions, & for those who aren't then thats tl;dr"

> When I teach it I usually convey that information.

Slide 17 - Instructor node that if they mention that this takes longer than a simple `yum install`, do the handwavey there's ohai etc running in the background, etc and it would be much quicker over multiple resources.

> I have never been challenged on that point. But it is something to consider. If a person did challenge the trainer would they accept being told that a number of processes are also being run along with this command in the background?

Slide 22 - Haven't discussed recipes yet, just resources. probably fine as its a group exercise, but we should explain that a recipe is .rb file that contains resources.  Oh, ok, we explain this in slide 24

Slide 31 - JF> Check this - if you don't set mode, so it set them to the default for the file resource, or leave them as default for the system?

Slide 36 - we already covered not specifying the action when we used `chef-apply` to install the package.

Slide 37 - I'm not 100% clear what the student has to do here.  The following slide gives the answer, but the problem statement isn't clear

> I haven't had trouble with it yet but I always welcome refinements if you have some suggestions.

## 03-Cookbooks.pptx

Should they do `chef generate repo reponame` before creating a cookbook, and while talking about git, github, repos etc?

> We talked about this in relation to the next section. I would choose not to introduce the concept of a repository here because it is not essential for completing the work with the cookbooks.

Slide 12 - reading docs again :(

> I think that the information in the documentation is useful and complete. I think it is also a useful exercise that engages the learner in a different way during the course of the training. I welcome alternative slides.


## 04-chef-client.pptx
Slide 4 - "When a chef-client is run" sound manual.  "When a chef-client runs" sound like it could manual or automatic.

> I think that is a typo. I like the correction you have proposed.

Slide 7 - Explain that the '\' is just a wrapping thing, and its all on one line

> Definitely add an instructor note for this slide that describes what that is doing.

Slide 23 - Maybe this is an advanced thing, and too soon to mentioned, but using the `include_recipe` construct allows you to put some logic around if a recipe gets executed or not.

> I think that could be a good idea. I imagine that if we wanted to take the workstation / apache cookbook idea further we could have them write two recipes and then switch on the one based on the platform. This could be introduced later as well. Keep that in mind.

## 05-testing-cookbooks.pptx

## 06-details-about-the-system.pptx
Slide 26 - What does 'ohai + chef-client = <3' mean?

> ohai and chef-client = HEART.
>
> Definitely change it. When I came up with the title I didn't really think deeply about it.

Slide 27 - should be "The Node Object", not "The Node"

> Definitely change it.

## 09-chef-server.pptx
Slide 1 - "A Hub for Configuration Data". Its more than that, so maybe change to "A Hub for Configuration Data & A Searchable Index"

> Definitely change it.

Should we be using `berks` from the outset when there are no dependencies, and not `knife cookbook upload ...`??

> I think that teaching berks from the beginning is alright even if there are no dependencies. Mostly because it would mean having the same workflow from start to finish.

Also, maybe an instructor note that `berks` requires `git` to be installed.  In fact this should be called out as a prereq for the course for this reason.

> I don't remember berkshelf having a dependency on git. But I could very much be mistaken. I know that `knife cookbook site install COOKBOOKNAME` does.

## 10-community-cookbooks.pptx
I think this section needs a clearer explanation of what we're trying to achieve, and whats running on each node etc

-) In '10-community-cookbook' why are we still hardcoding IP Addresses when the last section showed how to avoid that

> I'm not sure where we did that in the last section.

Slide 13 - should not talk here about precedence and how values get overwritten?

> We definitely should talk about it. I did a poor job with the slides explaining the replacing of the default values of the attributes in the community cookbook. I did a poor job to explain attributes in general because in the previous sections we simply use the ones on the node object and never define any cookbook level attributes. If we could find a way to smartly add a cookbook attribute in a previous section (details about the system) or a new section it would make a conversation about attribute precedence here relevant.

Slide 19 - need to explain hints file here `/etc/chef/ohai/hints/ec2.json`, as they wont see this if they simply spin up an node in ec2 and try to bootstrap it.

> This would be an excellent instructor note. It is definitely not data that is there by default. I don't know that most learners need to know that ohai does not load this data without the ohai plugin in place.

Slide 29 - Uploading myhaproxy for first time, Need to `berks init` first

> It works without init. `berks install` and `berks upload`.

Slide 35 - They've already done `knife bootstrap FQDN2 -x USER -P PWD --sudo -N node1`, so why not now introduce setting run_list at bootstrap time `knife bootstrap FQDN2 -x USER -P PWD --sudo -N node2 -r 'recipe[myhaproxy]'`

> You are definitely right. They could do that. This would be a good instructor note. When I facilitate, I usually introduce that idea in the next section when the bootstrap for the third time.

Slide 41 - Wrong title on slide "GE: Define the Run List" , AND we haven't taught them search yet, so `knife ssh "*:*" ...` means nothing.  This problem would go away of this section was used to teach search, and have them manually create the `haproxy` cookbook.

> Definitely a typo.
>
> You are right. The search syntax being presented here has a problem in that it is being presented without much introduction. Your proposal to write up an alternative section that introduces writing the haproxy cookbook with the inclusion of search would definitely be reviewed and merged.

Slide 44/45 - :%s\Chef Super Market\Chef Supermarket\g

> Definitely make that change.

Worth noting in this section that Chef Supermarket is itself opensource, and you can run your own behind a firewall, e.g. if you want to share cookbooks internally within an enterprise, but not externally or dont want to use external supermarket.

> Sure add it as a Instructor Note.

## 11-managing-multiple-nodes.pptx
I'm not sure of the purpose of this section, as contains no new learnings and the lab repeats everything already covered in the previous section.  If its a review section then thats fine, but maybe more worthwhile having that at the very end of the course to recap on everything?

> It is definitely a review of bootstrapping a node, adding a recipe to the run list, updating the instances, editing a recipe, versioning a cookbook, uploading the cookbook, and updating the instances.
>
> There is a fair amount of repetition within this entire training and done so on purpose. Here I enjoy that the learner repeats all the steps that they have done up to this point to ensure they get a feeling for the workflow of Chef.
>
> We are missing even more repetition. There is no testing/validation at all during the second day.

There is also too much hard-coding of content in `cookbooks/myhaproxy/recipes/default.rb`

> Adding more to the myhaproxy's default recipe sets up the work in the following sections to refactor it to using search.

Slide 1 - I prefer the term _add it to the Loadbalancing pool_ to _add it as a proxy member_ (same goes for last section also).
Proxy's dont have members, loadbalancers do.  A proxy passes traffic through it, and a loadbalancer distributes traffic - they're two separate functions. Just so happens that an LB also proxies that traffic, but thats an implementation thing.

> You make a good point. Replacing all the instances of proxy with load balancer would be more clear.

Slide 3 - It would be useful on these diagrams (in all sections) to include 'node1', 'node2' etc, so they can map the node they bootstrapped to the diagram

> You are right. When I draw this on the board I often use the names of the nodes with the images that I draw.

Slide 4 - Maybe change "Another Web Node" to "Create Another Web Node" - I think the Lab title should be more action orientated!

> Definitely make that change.

## 12-roles.pptx
Should we include a huge instructor note about the windows issue that creates 'role[recipe]', i.e. having an 's' in the role name and how to escape that - even as an instructor node to troubleshoot if it arises in class.

> That note would be useful. I know that I intentionally choose names for roles that would not trigger that issue but it could be something that someone sees.

Slide 5 - Again I'd prefer the term _Loadbalancer_ to _proxy_.

> I agree with you.

Slide 27 - I think we should include an example of a nested roles, like a base role for all types of server that contains 'recipe[ntp::client]', and use that to explain that all nodes must be running the same clock or `chef-client` may not authenticate with Chef Server.

> Yeah I want that as well. I welcome an addition that downloads the ntp and/or chef-client cookbook using Berkshelf. Creates a base role. Then has the learner add that base role to the web/load_balancer role that they create.

## 13-search.pptx
Section '13-search' should be earlier, and used more throughout.  Also, search section shows searching from recipe, but not searching using knife - `knife node search ...`, `knife role search ...` etc.

> I think you mean `knife search node` ...
>
> Based on our conversation, I think that search could be presented earlier in this series. Perhaps after the second node is introduced. Perhaps first as a limitation to how `knife node show` will only show you one node at a time. Search from the command-line could be used and then, of course it could transition into the recipe.

Slide 7 - "The search criteria that we have been using up to this point is "*:*"" - No, we've done `knife ssh "role:web" ...`

> Definitely true. You've caught us in a lie. That was my fault because I changed the last sections.

Slide 9 - Slide titled 'Search Syntax within a Recipe', I'd give an example recipe first so they can see the context - they might think _all_web_nodes_ is a keyword, and not some arbitrary text.

> I think that the example recipe would definitely be a good way to start. Then isolate this search query with the broken down components would be right. I don't know if that will stop someone thinking that _all_web_nodes_ is a keyword or not. But I like the change.

Slide 13 - Reword "Chef Server maintains a representation of all the nodes within our infrastructure that can be searched on. "  as "Chef Server maintains searchable index of all nodes within your infrastructure"

> Definitely make that change.

Slide 17 - I think too much talk of 'hashes' and 'arrays' here.  This might be ok if we gave a quick 'Ruby Hash and Array 101' first.

> I agree with you. Similar to the template section where I carefully explained ERB I definitely believe that this section would benefit from a small primer on Hash and Array.

Slide 18 - Lots of ruby talk here "'"method available on every array object named 'each'".  Whats a 'method'? - I know but Ops guys may not!

> I definitely agree. I think that this section is way off the tracks. Perhaps this all goes away with simply having them write their own haproxy or if we ever fix the haproxy cookbook.

Slide 21 - Should _Dynamic Web Proxy_ be _GE: Dynamic Web Proxy_. Also I think these lab slides that repeat as they progress through the lab should be numbered - step 1/3, step 2/3, step 3/3 - as I've just clocked on that they are showing progress. I just thought there was a load of repetition.

> I would definitely love if the slides for the review of the lab showed progress. That would be great addition.

Slide 25 - Remove _PS C:\Users\sdelfante\chef-repo\cookbooks\myhaproxy>_

> Definitely a typo. It is also the wrong output as most of those cookbooks are frozen at the moment.

I think after this section would be a better place to include the _11-managing-multiple-nodes.pptx section_, so they can see it dynamically update.

> I originally kept it the current way because I wanted to have the learner experience the need to refactor instead of prescribing it. That may be a better approach.

## 14-environments.pptx
Could be wrong, but I think this is the first mention of `knife search`.  Should maybe introduce this earlier

> Definitely right. In the search section it would be great to have some group exercises and a lab that uses `knife search`.

Might be nice to bootstrap another node directly into an environment with the `-E` flag

> Sure. I'm fine as long as they experiencing setting the environment a few times for the nodes that currently exist.

Would been nice to show setting attributes in environment files

> If there is a reason to do then I definitely agree. Without a reason, I am against it.

Slide 4 - folks could confuse the 'node 1', 'node 2' etc with their lab nodes - maybe call them 'web01', 'web02' etc.  Also, _You likely are familiar with the concept of environments._ - I wouldn't assume that

> That definitely sounds like a good idea. I believe Steve came up with some node names arbitrarily.

Slide 6 - Maybe change _GE: Production_ to something more actiony like _GE: Create a Production Environemt_

> Definitely make the change.

Slide 22 - Labs have them change env for node1 & node2 - what about node3?  Maybe a diagram here would be good showing what we're trying to achieve.

> You're very right. I tend to draw that very thing on the board. I think that is definitely missing and should be added immediately.

Slide 24, ok I see reference to 'node3' now, but I think an explanation earlier would been useful

> I completely agree.

Slide 31 - _Separating Environments_ to _GE: Separating Environments_.  Also what about the 1/3 thing again to show this slide shows progress

> I originally wrote a much more grueling exercise that required them to read the documentation and solve the problem. This was changed by Rebekah. I don't think she adhered to the Steve's conventions.

Slide 42 - 'Step 3/3'? Also footer here says '14'

> This is a typo. Definitely open an issue.

# Review Comments In PPTs


v0.11.0 / 2011-12-13
====================

** New theme, minor fixes **

  * Merge pull request #39 from gflandre/feature-new-theme-simple-grey
  * Centered theme Minimalist
  * version 1 of the minimalist theme (not centered)
  * ignore database.yml
  * Removed database.yml from repo
  * Wrap everything in a div

v0.10.6 / 2011-11-13
====================

  * carying to portfolio around to remote accounts

v0.10.5 / 2011-11-13
====================

  * Oops, I must have been drunk when I commited that
  * Merge remote branch 'origin/feature-design' into development
  * CSS Style improvement

v0.10.4 / 2011-10-16
====================

  * Wording
  * Oops forgot a migration; Added module supposed to remove all www calls (GH #38)
  * Ability to have basic SEO and facebook optimization. (GH #37) Added posibility to add a like button on the about page

v0.10.3 / 2011-10-09
====================

** Major layout issue fix**

  * Do not reset in shared css

v0.10.2 / 2011-10-08
====================

** Tests, minor fixes, refactoring and CSS changes for backend **

  * moved remote account creation logic out of the controller and into the model
  * Bunch of minor fixes, typos, removed whitespaces and so on
  * More controller tests on remote accounts and categories
  * Minor fixes and tests on front controller
  * Added spork
  * Order stats to have most viewed on top
  * Better signup path
  * Copy changes; Limit increased to 16 photos per category
  * Class on link to 3rd party sites (GH #33)
  * Removed DS_Store
  * Improvement of BO design
  * Style bouton + style global du back

v0.10.1 / 2011-10-01
====================

** Bugfix that would prevent adding any facebook or instagram account ^^ **

  * added skip_before_filter :ensure_portfolio_setup when needed
  * Do not display request link when logged in, instead display user name

v0.10.0 / 2011-09-30
====================

** Update to rails 3.0.10; New themes; Lots of tests & bug fixes **

  * Fixed bug where no one could ask for a beta account (lol); Lots of tests
  * mocking user sessions and gettng ready for controller tests
  * Removed unused files
  * Added two themes with custom css
  * A lot of tests; Going to rails 3.0.10; Added simplecov
  * Added simplecov; travis configuration

v0.9.1 / 2011-09-24
===================

** Minor CSS tweaks and bug fixes **

  * Fixed issue where the About link in nav would never be highlighted correctly
  * Minor tweaks for the default theme
  * Rlvnt is no more, kthx

v0.9.0 / 2011-09-24
===================

** Added stats screen. Fixed flickr bugs; Refactoring and documentation **

  * I was young and crazy, this could have never worked: fixes to handle heroku
  * formating and setting sqlite version
  * Doc mistake
  * Friendlier way to setup the project localy, and hopefully fixing travis (#23)
  * Removed useless blah
  * Adding some things to read
  * Testing github editor for readme
  * Fetch sizes for each flickr photo to avoid bugs. reduced max fetch items to 100 to avoid crazy API calls (#25)
  * Do not ask to set slug on category creation (#26)
  * Do not register stats when coming from the portfolio admin
  * Basic stats screen
  * Added very basic instagram theme

v0.8.1 / 2011-09-23 
==================

  ** Minor CSS bug only seen in prod **

  * Merge branch 'development'
  * fixed layout for rlvnt yellow theme

v0.8.0 / 2011-09-22
===================

  ** Various small features (stats, analytics, preview themes...) and
commercial website draft **

  * Merge branch 'development'
  * Added warning because I want to deploy in production
  * better UX for requesting invite
  * First draft for featured photographers (todo: an admin panel to handle that)
  * Fixed edit issue (issue #16); Some basic stats (issue #20); Permalink on photo (issue #19)
  * Getting ready for 1.9.2 (I know this should have been done before); Minor CSS issue; Fixed issue #18
  * Added some tests
  * Ignoring DS store files
  * Commercial website first draft
  * How to create a theme simple tutorial
  * Added custom google analytics
  * shared css for front actions
  * ability to preview theme (issue #12)
  * Do not display containers if there isn't content (issue #11)

v0.7.0 / 2011-08-27
===================

  ** Do not fail when tokens expire; Google Analytics hardcoded **

  * Merge branch 'development'
  * handling expiration on a create category level
  * Merge branch 'development'
  * oops, bad var name
  * Merge branch 'development'
  * use public name and not class name
  * Merge branch 'development'
  * check instagram account expiration (issue #9)
  * Merge branch 'development'
  * Added a scenario to refresh Facebook access tokens
  * Removed hardcoded example link on not_setup action
  * added google analytics + fixed bug that would prevent /about to display correctly

v0.6.1 / 2011-08-14
===================

  ** Fixed integration issues with heroku **

  * problem with heroku and postgres
  * fixed rake task for set photos as active
  * do not crash if there is no remote_account
  * check .nil instead of just the object (problems with heroku apparently)

v0.6.0 / 2011-08-14
===================

  ** Better URL for Portfolios; Fixed refresh bug; Removed flickr tags;
CSS fixes & front's DOM changes for better templating **

  * Merge branch 'development'
  * misc minor CSS fixes
  * ability to request beta codes
  * Removed rlvnt references except logo (issue #5) + improved DOM for front layout + refacto for photos named_scopes
  * [Issue #4] Better URL for portfolios
  * [Issue #1] Do not delete photos, keep them to avoid refreshing them by mistake
  * removed flickr submodels; we do not handle flickr tags anymore (too error prone)
  * Add type of account in front layout
  * New way to handle portfolios that are not setup

v0.5.0/ 2011-07-11
===================

** New Themes select screen and minors UI changes **

  * Merge branch 'development'
  * minor js fixes; proper error message when login fails
  * new themes select screen; changed some gems versions
  * cancel buttons, cancel buttons everywhere
  * delete remote accounts; wording & css; display category count next to each remoteaccount

v0.4.1 / 2011-07-10
-------------------

** Pushing on Github is nice, but deploying is better **

  * heroku configuration

v0.4.0 / 2011-07-10
-------------------

** Github-able version; Facebook works again; New Layout in progress **

  * preparing removing sensitive data
  * Implemented Oauth for Facebook
  * layout and wording
  * Updated some gems; CSS update

v0.3.0 / 2011-06-23
-------------------

** Handling Instagram **

  * wording
  * added instagram image
  * bad callback url
  * instagram

v0.2.0 / 2011-06-23
-------------------

** CSS changes, better error handling, beta codes.**
** More generic handling of Photo Accounts, draft for Facebook items **

  * minor updates related to facebook error handling
  * open security breach to debug something
  * do not crash everything on facebook error
  * better facebook errors handling
  * ability to add photos from facebook
  * Better layout for creating a category and a remote account
  * Extracted all flickr logic from Portfolio and moved it inside a more modular solution that is the RemoteAccounts
  * create first user beta code on the fly when needed
  * Beta codes
  * display errors on signups
  * display CSS only when needed; update category link
  * set position on each photo when creating category; css fix for default css
  * allow some HTML in about description
  * more css changes again again again... ffs
  * more css changes again again
  * more css changes again
  * more css changes
  * category specific layout

v0.1.0 / 2011-06-13
-------------------

** First Release **


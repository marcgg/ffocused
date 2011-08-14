
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


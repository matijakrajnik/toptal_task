# Quality assurance at Toptal

## Environment

To run the [Selenium webdriver tests](http://docs.seleniumhq.org/projects/webdriver/) you will have to install Ruby (look at `.ruby-version` and `ruby-gemset` files for the exact version), the latest versions of Firefox or Chrome. The easiest way to install Ruby on Linux/Unix/MacOs is [RVM](https://rvm.io/) and on Windows [RubyInstaller](http://rubyinstaller.org/downloads).  

MacOs requires XCode, and Xcode command line tools. To install XCode cmd line tools, choose XCode->Preferences->Downloads.
After you have installed latest rvm (or if you already have one be sure to check for the [latest version](https://rvm.io/rvm/upgrading/)), install required Ruby version with predefined [gemset](https://rvm.io/gemsets/basics/) using following command:

    rvm gemset create toptal_task

Clone repository:

    git clone git@github.com/matijakrajnik/toptal_task.git

Install required gems:

    cd toptal_task
    bundle install

To update to latest gem versions, run

    bundle update

## Windows environment
aInstall [github for windows](http://windows.github.com/). Notice github shell program.  
Install Ruby [RubyInstaller](http://rubyinstaller.org/downloads) and appropriate development kit. For Ruby leave default folder and check all three checkboxes. For devkit do not leave default extract folder, at the add end some descriptive name. For devkit follow installation [instructions](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit).  
Install [ansicon](http://qastuffs.blogspot.com/2011/02/how-to-install-ansicon-for-cucumber-to.html)  
Install 32 or 64 bit [IEDriverServer](https://code.google.com/p/selenium/wiki/InternetExplorerDriver)  

Go to step clone repository.  

Install required gems:

    cd toptal_task
    gem install bundler
    bundle install

To update installed gems run

    gem update bundle
    bundle update


## Browser drivers

To run browser tests in Chrome, you have to download latest [chromedriver](http://chromedriver.storage.googleapis.com/index.html), unzip it and put it on system path. For linux this is /usr/local/bin/ folder and for Windows add browser driver folder to windows path.

Prepare environment:

TO run tests you will need to open config/application.yml file and edit it with valid username and password. SITE needs to remain in same format, just replace <user> and <password> with credentials for basic HTTP authentication. For EMAIL and PASSWORD sections you need to set valid account credentials for login. In BROWSER_LABEL section you can set desired browser (if left empty default will be Firefox). TIMEOUT is maximum number of seconds to wait for elements on page to become visible.

## Runing tests

To run a single test enter `cucumber features/job_creation.feature`.

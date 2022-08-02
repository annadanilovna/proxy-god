# proxy-god

Instead of a proxy scraper to grab data from all the usual suspects, use existing scraped data and consolidate it. 

## usage 

On the first run, some setup is required. 

    git clone ...
    cd proxy-god/util
    chmod +x setup.sh
    chmod +x update.sh

    ./setup.sh  # init submodules, add new repos.

After setup, to update the lists:

    cd proxy-god/util
    ./update.sh

## adding repos
If you have any additioal repositories, you would like to use, add them to `res/repos.txt` like this:

    git@github.com:<user1>/<repo1>.git
    git@github.com:<user2>/<repo2>.git

And run `util/setup.sh`.


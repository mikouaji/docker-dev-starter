# Docker dev starter

## What

This is a docker configuration I like to use for working on node and php based apps.

## Why

Applications tend to have different envionment setups, 
so not to have problems with trying to run them with different settings
and having to configure them all locally 
I'm using docker containers to best mirror production environments.


## How

Both `php` and `node` directories have a `Makefile` (which needs `make` to work properly).

There are commands prepared there that help with setting up, statring, stopping, resetting and building.

Also in both there's a `.docker` direcotry with en `env` file that needs to be copied to `.env` and filled out.

To use a proper version of `node`, `php`, `mysql`, `mongo` you just need to change the docker image in the corresponding `Dockerfile`

You don't have to use both DB setups that are defined in `php` and also using a DB config from `php` inside `node` will work fine.

Most of that stuff can be changed and commented out.

## More

Feel free to use and ask any questions

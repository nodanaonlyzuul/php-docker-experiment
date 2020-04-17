# PHP Docker Experiment

A proof-of-concept that you can add a supervisord file,
that calls a bash script (which runs at startup via supervisord).

## Demonstration

1.  Pull this repository
2.  `docker build .`
3.  `docker run <Image SHA>`

You will see that migration-tasks.conf gets parsed on startups:

    2020-04-17 12:38:17,079 INFO success: my-program-name entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)

4.  (In a different tab) `docker exec -it <container (not image) SHA>`
5.  See that the shell script was executed because `/root/i-was-written.txt` exists.

## Things I did that were (probably?) useful

1.  My shell script is `chmod +x` in source control.
2.  The shell and supervisord files use absolute paths.

## Order of Operations

Supervisord has endless knobs & levers for controlling
retry and order of operations. In case you really care if
your script runs _before_ or _after_ nginx is up and running.

## Why doesn't this work if you `docker run -it bash` ?

Because supervisord does all the work in this image.
supervisord seems to be the default CMD/ENTRYPOINT and by running bash you are overriding the entrypoint.

## For More Info

[This walkthrough](https://youtu.be/9Gc4QTqslN4) helped me understand.
Not just supervisord. But EVERYTHING. EVER.

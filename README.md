# Resume Code #

This repo contains an exmaple of the code I use to create my resume:

http://resume.antoncohen.com/

The data is stored in YAML. ERB templates are used for different formats,
e.g., web, print, plain text. Rake is used to build the files and push
them to S3.

The PDF is created manually by printing the print version from Chrome.

robots.txt.rb creates a robots.txt file that allows indexing of only /.

## Usage ##

* Put your data in resume.yaml.
* Customize the .erb files.
* If you are using S3, install s3cmd.
* Create an s3cmd config file.
* Modify Rakefile for your needs, especially the 'sync' task.
* Run 'rake build' and check the results in site/.
* Run 'rake sync' to push to S3.

## Author ##

* Anton Cohen <anton@antoncohen.com>
* [Source](https://github.com/antoncohen/resume-web-example)
* [Homepage](http://www.antoncohen.com/)
* [@antoncohen](http://twitter.com/antoncohen)


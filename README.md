# Ruby Base Container

[![Build Status](https://travis-ci.org/UKHomeOffice/docker-ruby.svg?branch=master)](https://travis-ci.org/UKHomeOffice/docker-ruby)

This is a base container for projects that require ruby.

## Usage  

Example:
```
FROM quay.io/ukhomeofficedigital/ruby
USER app
``` 

This is an onbuild image and will automatically install copy your app to /app and install it's dependencies with bundler, 
as well as updating OS packages. It has a pre-setup user called app to ensure your app doesn't run as root.

### Useful Directories

* `/app` - Where you app will be copied to on build

## Contributing

Feel free to submit pull requests and issues. If it's a particularly large PR, you may wish to
discuss it in an issue first.

Please note that this project is released with a
[Contributor Code of Conduct](https://github.com/UKHomeOffice/docker-ruby/blob/master/CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.

## Versioning

We use [SemVer](http://semver.org/) for the version tags available See the tags on this repository.


## Authors

* **Jay Keshur** - *Initial work* - [jaykeshur](https://github.com/jaykeshur)
* **Tim Gent** - *Updates* - [timgent](https://github.com/timgent)

See also the list of
[contributors](https://github.com/UKHomeOffice/docker-ruby/graphs/contributors) who participated
in this project.

## License

This project is licensed under the GPL v2 License - see the
[LICENSE.md](https://github.com/UKHomeOffice/docker-ruby/blob/master/LICENSE.md) file for details

## Acknowledgments

* [RVM](https://rvm.io/)

# Custom Node.js with Oracle's JDK 8 Buildpack
[![CF Slack](https://s3.amazonaws.com/buildpacks-assets/buildpacks-slack.svg)](http://slack.cloudfoundry.org)

A Custom Buildpack [buildpack](http://docs.cloudfoundry.org/buildpacks/) for Node.js based apps with Oracle's JDK 8 installed.

This is based on the Cloud Foundry Node.js buildpack [buildpack](http://docs.cloudfoundry.org/buildpacks/) which is also based on the [Heroku buildpack] (https://github.com/heroku/heroku-buildpack-nodejs).

Additional documentation can be found at the [CloudFoundry.org](http://docs.cloudfoundry.org/buildpacks/).

## Usage

This buildpack will get used if you have a `package.json` file in your project's root directory.

```bash
cf push my_app -b https://github.com/syahrul-aiman/nodejs-java-buildpack.git
```

In order to use the JAVA, Node.js needs to use child_process and execute the JAVA command such as:
```bash
const exec = require('child_process').exec;
exec("java lib/HelloWorld.jar", {shell: '/bin/bash'}, function (err, stdout, stderr) {
	console.log(stderr);
	console.log(stdout);
});
```

## Options

### Specify a node version

Set engines.node in package.json to the semver range
(or specific version) of node you'd like to use.
(It's a good idea to make this the same version you use during development)

```json
"engines": {
  "node": "0.11.x"
}
```

```json
"engines": {
  "node": "0.10.33"
}
```

## Contributing

Find our guidelines [here](./CONTRIBUTING.md).


## Reporting Issues

Open an issue on this project

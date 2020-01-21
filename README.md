# puppet-lint-parameter_type-check
puppet-lint plugin to check if all parameters are declared with a specific type

# Installation
To install add the following to your Gemfile and run `bundle install`
`gem puppet-lint-parameter_type-check, :require => false`

or

`gem install puppet-lint-parameter_type-check`

# Usage 
The plugin provides new check through `puppet-lint` 

## parameter_type-check

### --fix support: No

To disable this check use `--no-parameter_type-check`

This check will tell you if your parameters are not defined with a specific data type


```
define foo( 
    $foo, 
    $bar,
) { }
``` 
will result in a warning with the fallowing message:

`WARNING: expected a parameter with type declared`

Define examle that will pass this check: 

```
define foo( 
  String $foo, 
  Integer $bar,
) { }
```

# References 
https://puppet.com/docs/puppet/latest/style_guide.html#type-signatures
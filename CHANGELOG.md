# v0.16.0
* Enhancements
  * Can now specify which config block the `joken_config` key is on

* Breaking
  * Must now add `use Joken, otp_app: :myapp` where `:myapp` is the name of the config block with the
  `joken_config` key on it.
  * `Joken.encode` and `Joken.decode` are now `Joken.encode_token` and `Joken.decode_token`

# v0.15.0
* Enhancements
  * Add options parameter to `Joken.Config.validate_claim`
  * Moved validation helpers functions to `Joken.Helpers`

# v0.14.1

  * Enhancements
    * Using the Dict Protocol for accessing data

# v0.14.0

  * Enhancements
    * The `Joken.Config` behaviour handles the configuration of the secret_key, algorithm, encode and decode functions, as well as functions for adding and validating claims 
    * Add `options` parameter to `Joken.Token.decode`
    * Add `options` parameter to `Joken.decode`
    * Removed `:none` algorithm completely

  * Breaking
    * `Joken.Codec` is replaced by `Joken.Config`. 
    * `json_module` in config is replaced by `config_module`. 
    * `algorithm` and `secret_key` in config is replaced by implementing the `algorithm` and `secret_key` functions on `Joken.Config`. 
    * `Joken.Token.encode` now has a signature of `(joken_config, payload)` since the algorithm and secret key are defined inside of the passed in `joken_config` module.
    * `Joken.Token.decode` now has a signature of `(joken_config, jwt, options \\ [])` since the algorithm and secret key are defined inside of the passed in `joken_config` module.

# v0.13.1

  * Enhancements
    * Checking to make sure signature is on token unless `:none` is passed as the algorithm

# v0.13.0

  * Enhancements
    * Validating iat claim
    * Verifying signature before getting the data

# v0.12.0

  * Enhancements
    * Signature is now verified just from the header and payload strings.
    * Added `decode_secret_key?` parameter

# v0.11.0

  * Enhancements
    * `Joken` module now looks more like old API from 0.8 with the exception that it reads configuration from a :joken config block.
    * For security reasons, now using the configured algorithm for checking signature instead of the one specified in the header.
    * Added algorithm paramter to `Joken.Token.decode` to be used when verifying signatures

# v0.10.1

  * Enhancements
    * Fixed documentation typos
    * Joken now uses an Agent instead of implementing GenServer


# v0.10.0

  * Enhancements
    * No longer has a dependency on Timex or JSX
    * Can now use any json library as long as you implement the behaviour, `Joken.Codec`
    * Joken module is now a GenServer
    * secret_key, algorithm, and json_module are now configured when the starting Joken module

  * Breaking
    * `Joken.encode(payload, secret, algorithm, claims)` is now `Joken.encode(pid, payload, claims)` and `Joken.decode(token, secret, claims)` is now `Joken.decode(pid, token, claims)`. `secret_key` and `algorithm` are now configured along with `json_module` when starting the Joken module via any of the `Joken.start_link` functions. You could also use the `Joken.Token` module directly instead which isn't a GenServer and allows you to put in all of the parameters needed whenever you call encode or decode. 

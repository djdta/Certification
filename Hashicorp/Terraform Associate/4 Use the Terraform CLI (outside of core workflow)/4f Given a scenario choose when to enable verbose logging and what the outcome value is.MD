# 4f Given a scenario: choose when to enable verbose logging and what the outcome/value is

#### Summary
Terraform has detailed logs which can be enabled by setting the TF_LOG environment variable to any value. This will cause detailed logs to appear on stderr.


#### Key Information

* You can set TF_LOG to one of the log levels TRACE, DEBUG, INFO, WARN or ERROR
* To persist logged output you can set TF_LOG_PATH
* TF_LOG needs to been enable.

#### Interpreting a Crash Log
If Terraform ever crashes (a "panic" in the Go runtime), it saves a log file with the debug logs from the session as well as the panic message and backtrace to crash.log. Generally speaking, this log file is meant to be passed along to the developers via a GitHub Issue. As a user, you're not required to dig into this file.

However, if you are interested in figuring out what might have gone wrong before filing an issue, here are the basic details of how to read a crash log.


| Index |
|:----------:|
|[Logging](https://www.terraform.io/docs/internals/debugging.html)|

// in your code this `use` statement would be:
// use "logger"
use "../../logger"

actor Main
  new create(env: Env) =>
    let logger = StringLogger(Fine, env.out)
    logger(Info) and logger.log("hello from logger")

justDoItDoE <- function (command)
{
    Message()
    if (!getRcmdr("suppress.X11.warnings")) {
        messages.connection <- file(open = "w+")
        sink(messages.connection, type = "message")
        on.exit({
            sink(type = "message")
            close(messages.connection)
        })
    }
    else messages.connection <- getRcmdr("messages.connection")
    result <- try(eval(parse(text = command),envir = .GlobalEnv))
    Rcmdr:::checkWarnings(readLines(messages.connection))
    result
}
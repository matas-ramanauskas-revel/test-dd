import DatadogCore
import DatadogLogs

public func ddLogs(){

Datadog.initialize(
    with: Datadog.Configuration(
        clientToken: "",
        env: "dev",
        site: .eu1
    ),
    trackingConsent: .granted
)
Datadog.verbosityLevel = .debug
Logs.enable()

let logger = Logger.create(
    with: Logger.Configuration(
        service: "ios-sdk-example-app",
        name: "logger name",
        networkInfoEnabled: true,
        remoteSampleRate: 100,
        consoleLogFormat: .shortWith(prefix: "[iOS App] ")
    )
)

logger.debug("A debug message.")
logger.info("Some relevant information?")
logger.notice("Have you noticed?")
logger.warn("An important warning…")
logger.error("An error was met!")
logger.critical("Something critical happened!")

logger.info("Clicked OK", attributes: ["context": "onboarding flow"])

print("Done! No logs tho :(")
}

ddLogs()

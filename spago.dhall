{ sources =
    [ "src/**/*.purs" ]
, name =
    "PureScript Quickstart"
, dependencies =
    [ "elmish", "elmish-html", "psci-support" ]
, packages =
    ./packages.dhall
}

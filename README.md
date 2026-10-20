# test-selection-fixture

iOS fixture for trying the Bitrise [Test Selection step](https://github.com/bitrise-steplib/bitrise-step-test-selection) end to end.
Bitrise app: `049f5fff-2fe1-49ce-94d1-618a89beb290` (stack osx-xcode-16.4.x). The app uses the config stored on
bitrise.io; `bitrise.yml` here is a mirror of it.

Structure: local Swift packages `Core` ← `Networking` ← `Feature`, an app target, four test targets
(CoreTests, NetworkingTests, FeatureTests, FixtureAppTests). The Xcode project is generated from `project.yml`
with XcodeGen and committed.

Workflows:
- `full_tests` – baseline, every target runs.
- `selective_tests` – Test Selection + Xcode Test without building (`test-selection` branch) with `on_empty_selection: skip`;
  manual builds pass `TS_BASE_REF` (ref or SHA) and `TS_CONFIG` (backend-style JSON) as build env vars.
- `selective_tests_main_base` – what pushes trigger: `selective_tests` with `TS_BASE_REF=main`.
- `selective_tests_shallow` – same with a depth-1 clone.
- `selective_tests_trust_list` – uses the backend's `BITRISE_GIT_CHANGED_FILES` as a complete list (PR builds and `try/list/*` pushes).
- `selective_tests_xcode_test` – the one-shot Xcode Test step (`test-selection` branch) as the consumer.

Scenario branches: `try/networking`, `try/feature-tests`, `try/app`, `try/xcconfig`, `try/two-commits` (Core then Feature),
`try/list/cap` (2100 generated files + a Core test change, shows the backend's 2000-file cap).

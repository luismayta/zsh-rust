<!-- Space: Projects -->
<!-- Parent: ZshRust -->
<!-- Title: Releasing Project -->
<!-- Label: Project -->
<!-- Label: Project -->
<!-- Label: Releasing -->
<!-- Include: disclaimer.md -->
<!-- Include: ac:toc -->

# Releasing

## Bump a new version

Make a new version of zsh-rust in the following steps:

### Generate version major

```bash
task version:major
```

### Generate version minor

```bash
task version:minor
```

### Generate version patch

```bash
task version:patch
```

## Generate Changelog

### Generate Changelog Next Tag

```bash
task changelog:next APP_TAG={{tag}}
```

#### Parameters

| Name     | Description   | sample | Required |
| -------- | ------------- | ------ | :------: |
| tag name | Name next tag | 0.1.0  |   yes    |

### Generate Changelog Tag Now

```bash
task changelog:tag
```

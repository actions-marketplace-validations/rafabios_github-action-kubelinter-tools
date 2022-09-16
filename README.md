# kube-linter

Lint Kubernetes files with kube-linter. Simply and that's all.

## Usage

```yaml
- uses: rafabios/github-action-kubelinter-tools@v1.0.3
  with:
    file_or_dir: ./
```

## Parameters
 - `file_or_dir` - files to check - **required**
 - `enable_all` - AddAllBuiltIn, if set, adds all built-in checks, this allows users to explicitly opt-out of checks that are not relevant using exclude - *optional*
 - `config_file` - path to config file - *optional*
 - `no_defaults` - DoNotAutoAddDefaults, if set, prevents the automatic addition of default checks - *optional*
 - `exclude` - exclude is a list of check names to exclude - *optional*
 - `format` - output format allowed values json, plain, sarif. (default "plain") - *optional*
 - `include` - include is a list of check names to include, if a check is in both include and exclude, exclude wins - *optional*
 - `verbose` - enable verbose logging - *optional*

## License

The scripts and documentation in this project are released under the MIT License.

## 0.2.0

- BREAKING: FileOutputLogger, uses positional arguments, passing `parentName` in the same way as its parent.
- fix:  If `selfonly` is false, all logs with a `parentName` match are output.

## 0.0.2

- The logger name is set to selfname.
- selfonly, when true, filter by selfname. Otherwise, output all.

## 0.0.1

- Initial version.

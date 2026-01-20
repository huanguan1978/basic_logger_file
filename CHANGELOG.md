## 0.1.3

- perf: use conditional constructor termination to share a unified data type while bypassing redundant base-class logic during inheritance.

## 0.1.2

- feat: implement daily log rotation.

## 0.1.1

- feat: allow custom log extensions via `ext` parameter for log categorization.

## 0.1.0

- BREAKING: FileOutputLogger, uses positional arguments, passing `parentName` in the same way as its parent.
- fix:  If `selfonly` is false, all logs with a `parentName` match are output.

## 0.0.2

- The logger name is set to selfname.
- selfonly, when true, filter by selfname. Otherwise, output all.

## 0.0.1

- Initial version.

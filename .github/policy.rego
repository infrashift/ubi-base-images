package grype

default allow = true

allow = false {
  some match
  input.matches[match].vulnerability.severity in ["Critical", "High", "Medium"]
}

violations[match] {
  match := input.matches[_]
  match.vulnerability.severity in ["Critical", "High", "Medium"]
}
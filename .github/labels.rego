package labels

default allow = false

required_labels := {
  "org.opencontainers.image.title": "",
  "org.opencontainers.image.maintainer": "",
  "org.opencontainers.image.version": "",
  "org.opencontainers.image.description": "",
  "io.infrashift.image.signing-oidc-issuer": "",
  "io.infrashift.image.source-registry": "",
  "io.infrashift.image.source-repo": "",
  "io.openshift.tags": "",
  "io.openshift.expose-services": ""
}

allow {
  every label, _ in required_labels {
    some key in object.keys(input.labels)
    key == label
    input.labels[key] != ""
  }
}

violations[label] {
  some label in object.keys(required_labels)
  not label in object.keys(input.labels)
}

violations[label] {
  some label in object.keys(required_labels)
  label in object.keys(input.labels)
  input.labels[label] == ""
}
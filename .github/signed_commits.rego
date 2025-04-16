package git

default allow = false

allow {
  count(input.commits) > 0
  every commit in input.commits {
    commit.signed == true
  }
}

violations[commit] {
  some i
  commit := input.commits[i]
  commit.signed == false
}
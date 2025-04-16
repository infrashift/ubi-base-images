package container

default allow = false

allow {
  sbom_exists
  sbom_signed
  image_signed
  hash_matches
}

sbom_exists { input.sbom.exists == true }
sbom_signed { input.sbom.signed == true; input.sbom.signature_valid == true }
image_signed { input.image.signed == true; input.image.signature_valid == true }
hash_matches { input.image.full_hash != ""; short_hash := substring(input.image.full_hash, 0, 12); endswith(input.image.tag, short_hash) }

violations["sbom_missing"] { not sbom_exists }
violations["sbom_not_signed"] { not sbom_signed }
violations["image_not_signed"] { not image_signed }
violations["hash_mismatch"] { not hash_matches; input.image.full_hash != "" }
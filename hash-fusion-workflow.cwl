#!/usr/bin/env cwlrunner

class: Workflow

cwlVersion: "draft-3"

inputs:

  - id: input
    type: File
    description: "to be hashed all the ways"

outputs:

  - id: output
    type: File
    source: "#unify/output"

steps:

  - id: md5
    run: hash-fusion-md5.cwl
    inputs:
      - { id: input, source: "#input" }
    outputs:
      - { id: output }

  - id: sha
    run: hash-fusion-sha.cwl
    inputs:
      - { id: input, source: "#input" }
    outputs:
      - { id: output }

  - id: whirlpool
    run: hash-fusion-whirlpool.cwl
    inputs:
      - { id: input, source: "#input" }
    outputs:
      - { id: output }

  - id: unify
    run: hash-fusion-unify.cwl
    inputs:
      - { id: md5, source: "#md5/output" }
      - { id: sha, source: "#sha/output" }
      - { id: whirlpool, source: "#whirlpool/output" }
    outputs:
      - { id: output }

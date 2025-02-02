# Proof-Of-Concept of I2B2 using IRIS as backend

## Executive Summary

InterSystems IRIS platform is a leading technical infrastructure used in production and research settings for Healthcare and Life Sciences.

The i2b2/Transmart community has implemented its query builder and underlying i2b2 core on top of three mainstream data sources - MS SQL Server, Oracle and Postgres.

This POC is focused on assessment and gap analysis for adding InterSystems IRIS as an additional data source. This would allow i2b2 clients to take advantage of the IRIS high-performance data querying capabilities as well as multitude of other features and functionality offered by IRIS.

## What & Why

### Introduction: POC Goals

    * Investigate compatibility of the i2b2 Query builder, i2b2 web and i2b2 core with IRIS backend and identify gaps preventing usage of the i2b2 Web client with IRIS back end.
    * Determine steps necessary to mitigate compatibility gaps for i2b2 with IRIS backend.
    * Develop a data migration path from i2b2- to IRIS.
    * Execute direct SQL queries against i2b2 data in IRIS and achieve equivalence of the results with the results in the relational DB (Postgres) within limited POC scope. Capture and document the differences as well as steps to expand to a larger scope.
    * Implement an infrastructure for exporting i2b2 patient data as FHIR resources, map and export sample resources (e.g. Patient, Meds) based on the data in the i2b2 instance.
    * Document findings and publish to InterSystems open exchange.

### How it was done

Steps creating the project

    1. Set up Linux VM.
    2. Install and configure InterSystems IRIS for Health 2020.3 or higher on this VM.
    3. Install and configure a reference i2b2 instance on the POC Linux VM with Postgres DB as a data source with a demo patient data set
    4. Configure and test i2b2 Web client (query builder) with the Postgres DB as a data source.
    5. Migrate i2b2 schema and demo patient data from the reference i2b2 instance into IRIS.
    6. Create and execute several representative identical queries in IRIS SQL tool and in a Postgres SQL UI (PGAdmin). Compare results and document difference between I2B2 and IRIS.
    7. Create and implement I2B2 - FHIR mapping for two representative FHIR resources (e.g. Patient, MedicationRequest) and demonstrate FHIR export for a few patients.
    8. Create IRIS production to export patient data from IRIS as FHIR resources (e.g. by patient_id).
    9. Document the process of implementation of I2B2 on IRIS.
    10. Publish the implementation and documentation to InterSystems Open Exchange.

## Running IRIS with sample I2B2 dataset

These steps are following instructions provided by InterSystems community.

### Prerequisites

Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

### Installation 

1. Clone/git pull the repo into any local directory

```
$ git clone https://github.com/ELynx/i2b2-on-iris-raw-structure.git
```

2. Open the terminal in this directory and run:

```
$ docker-compose build
```

This step may take some time to complete, since FHIR packages are prepared. If process seem to stop at

```
$ Load Resources: hl7.fhir.r3.core@3.0.2
```

then wait some more time, up to 25 minutes may be necessary, or more, depending on your machine power.

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

### How to Test it

On Docker host machine execute:

```
$ curl -H "Accept: application/fhir+json" -X GET http://localhost:65282/i2b2/fhir/r4/Patient/1000000035
```

Expected response is:

```json
{"resourceType":"Patient","address":[{"city":"Braintree","country":"US","postalCode":"02185","state":"Massachusetts","type":"both","use":"home"}],"birthDate":"1988-01-20","communication":[{"language":{"coding":[{"code":"es","display":"spanish","system":"http://hl7.org/fhir/ValueSet/languages"}]},"preferred":true}],"deceasedBoolean":false,"extension":[{"url":"http://hl7.org/fhir/StructureDefinition/patient-nationality","valueCoding":{"code":"2186-5","display":"Not Hispanic or Latino","system":"http://terminology.hl7.org/CodeSystem/v3-Ethnicity"}},{"url":"http://hl7.org/fhir/StructureDefinition/patient-religion","valueCoding":{"code":"1007","display":"Atheism","system":"http://terminology.hl7.org/CodeSystem/v3-ReligiousAffiliation"}}],"gender":"male","id":"1000000035","identifier":[{"assigner":{"display":"i2b2"},"period":{"start":"2010-11-04"},"type":{"coding":[{"code":"PLAC","system":"http://terminology.hl7.org/CodeSystem/v2-0203"}]},"use":"usual","value":"1000000035"}],"maritalStatus":{"coding":[{"code":"U","display":"unmarried","system":"http://terminology.hl7.org/CodeSystem/v3-MaritalStatus"}]}}
```

## More info

For data migration, POC queries and diagrams, see `Documentation i2b2 on Iris.pdf`

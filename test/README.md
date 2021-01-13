# Test Folder

This is a placeholder folder for future test cases and test artifacts

## How to ingest the data folder into Sentinel

We would be using logger to forward the cef event into syslog and in return syslog will forward the event to sentinel

| Sample:          | https://techcommunity.microsoft.com/t5/azure-sentinel/ingest-sample-cef-data-into-azure-sentinel/ba-p/1064158 |
|------------------|---------------------------------------------------------------------------------------------------------------|
|**Log forwarder:**| **https://docs.microsoft.com/en-us/azure/sentinel/connect-cef-agent?tabs=rsyslog**                              |
| **CEF Format:**  | **https://docs.microsoft.com/en-us/azure/sentinel/connect-common-event-format**                               |

Command:

`$ logger -p local4.warn -t CEF "[CEF DATA]"`

Example:

`$ logger -p local4.warn -t CEF "CEF:0|Microsoft|ATA|1.9.0.0|AbnormalSensitiveGroupMembershipChangeSuspiciousActivity|Abnormal modification of sensitive groups|5|start=2018-12-12T18:52:58.0000000Z app=GroupMembershipChangeEvent suser=krbtgt msg=krbtgt has uncharacteristically modified sensitive group memberships. externalId=2024 cs1Label=url cs1=https://192.168.0.220/suspiciousActivity/5c113d028ca1ec1250ca0491"`

**Note: There might be other ways to push the cef into sentinel**

## TODO

1. It would be nice if we can create test data that are not persistent
    1. Mock
    2. Stub

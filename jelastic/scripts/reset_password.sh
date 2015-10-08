#!/bin/bash

SED=$(which sed);

#
# This is an example of reset password hook in Jelastic
#

#$J_OPENSHIFT_APP_ADM_USER        ;   Operate this variable for the username
#$J_OPENSHIFT_APP_ADM_PASSWORD    ;   Use this varible for your password

function _setPassword() {
    NEO4J_SERVER_PROP_FILE="${OPENSHIFT_NEO4J_DIR}/versions/2.1/neo4j-2.1/conf/neo4j-server.properties";
    $SED -i "s/^org.neo4j.server.credentials=.*/org.neo4j.server.credentials=${J_OPENSHIFT_APP_ADM_USER}:${J_OPENSHIFT_APP_ADM_PASSWORD}/" $NEO4J_SERVER_PROP_FILE;
    service cartridge restart;
}






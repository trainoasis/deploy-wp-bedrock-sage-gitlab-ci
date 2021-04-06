#!/bin/bash         

echo "## Deploying to DEVELOP (your.website.com) .."

###############################
##### VARIABLES ###############
###############################

ZIP_TEMP_FOLDER_NAME="DEPLOY_TMP"
SERVER="your@server.com"
PORT="5050"
SERVER_ROOT_WHERE_DEPLOY_FOLDER="/home/your/www/or/"
SERVER_FOLDER_NAME="whatever"
WP_THEME_PATH="web/app/themes/YOUR_THEME_NAME"

###############################
##### MAIN ####################
###############################

ssh ${SERVER} -p ${PORT} <<EOT
    set -e;
    mkdir -p ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME};
    cd ${SERVER_ROOT_WHERE_DEPLOY_FOLDER};
    
    zip -q -r ${SERVER_FOLDER_NAME}.zip ${SERVER_FOLDER_NAME};
    unzip -q -o ${ZIP_TEMP_FOLDER_NAME}.zip -d ${ZIP_TEMP_FOLDER_NAME};
    cd ${SERVER_ROOT_WHERE_DEPLOY_FOLDER};
    if [ -f ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/.env ]; then
        cp ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/.env ${ZIP_TEMP_FOLDER_NAME};
    fi
    if [ -f ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/web/.htaccess ]; then
        cp ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/web/.htaccess ${ZIP_TEMP_FOLDER_NAME}/web;
    fi
    if [ -d "${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/web/app/uploads/" ]; then
        mkdir -p ${ZIP_TEMP_FOLDER_NAME}/web/app/uploads;
        cp -r ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/web/app/uploads/* ${ZIP_TEMP_FOLDER_NAME}/web/app/uploads/;
        rm -rf ${ZIP_TEMP_FOLDER_NAME}/web/app/uploads/cache;
    fi
    if [ -d ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/${WP_THEME_PATH}/resources/languages ]; then
        mkdir -p ${ZIP_TEMP_FOLDER_NAME}/${WP_THEME_PATH}/resources/languages;
        cp -r ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/${WP_THEME_PATH}/resources/languages/* ${ZIP_TEMP_FOLDER_NAME}/${WP_THEME_PATH}/resources/languages/;
    fi
    if [ -d ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/web/app/languages ]; then
        mkdir -p ${ZIP_TEMP_FOLDER_NAME}/web/app/languages/;
        cp -R ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/web/app/languages/. ${ZIP_TEMP_FOLDER_NAME}/web/app/languages/;
    fi
    if [ -d ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/web/app/plugins ]; then
        cp -Rn ${SERVER_ROOT_WHERE_DEPLOY_FOLDER}/${SERVER_FOLDER_NAME}/web/app/plugins/. ${ZIP_TEMP_FOLDER_NAME}/web/app/plugins/;
    fi
    rm -rf ${ZIP_TEMP_FOLDER_NAME}.zip;
    mv ${SERVER_FOLDER_NAME} ${SERVER_FOLDER_NAME}_BEFORE_DEPLOY;
    mv ${ZIP_TEMP_FOLDER_NAME} ${SERVER_FOLDER_NAME};
    rm -rf ${SERVER_FOLDER_NAME}_BEFORE_DEPLOY;
    find ./${SERVER_FOLDER_NAME} -type d -execdir chmod 755 {} +
EOT

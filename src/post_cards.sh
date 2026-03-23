#!/bin/bash

params=null
api="https://postcards-app-kynxwa45.nbalin.dev"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

authenticate() {
    params="vk_access_token_settings=${5:-}&vk_app_id=51412772&vk_are_notifications_enabled=${6:-0}&vk_is_app_user=${7:-0}&vk_is_favorite=${8:-0}&vk_language=${9:-ru}&vk_platform=${10:-desktop_web}&vk_ref=$4&vk_ts=$3&vk_user_id=$2&sign=$1"
}

_get() {
    curl -s -X GET "$api/$1"                \
        -H "User-Agent: $user_agent"        \
        -H "content-type: application/json" \
        -H "authorization: Bearer $params"
}

app_initialize() {
    _get "initialize"
}

get_categories() {
    _get "categories"
}

# 1 - offset   (default: 0)
# 2 - limit    (default: 15)
# 3 - order_by (default: cost)
# 4 - ASC      (default: 1)
get_post_cards() {
    _get "postcards?offset=${1:-0}&limit=${2:-15}&orderBy=${3:-cost}&ASC=${4:-1}"
}

get_orders() {
    _get "orders"
}

# 1 - post_card_id
review_post_card() {
    _get "reviews/$1"
}

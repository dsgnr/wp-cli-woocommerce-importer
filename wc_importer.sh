#!/bin/bash
echo -e "Grabbing your products now!"
while IFS='|' read -r sku product_title description category regular_price weight images
do
wp media import "${images}" --featured_image --post_id=$(wp wc product create --title="${product_title}" --short_description="${description}" --categories="{$category}" --weight="${weight}" --regular_price="${regular_price}" --sku="${sku}" --allow-root | awk '{print $4}') --allow-root
done < test.txt

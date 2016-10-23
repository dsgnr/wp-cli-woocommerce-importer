#!/bin/bash
echo -e "Grabbing your products now!"
while IFS='|' read -r product_title sku regular_price images
do
wp media import "${images}" --featured_image --post_id=$(wp wc product create --title="${product_title}" --regular_price="${regular_price}" --sku="${sku}" --allow-root | awk '{print $4}') --allow-root
done < products.txt

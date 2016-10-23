#!/bin/bash
echo -e "I am about to import products!"

while IFS='|' read -r product_title sku regular_price images
do
  wp wc product create --title="${product_title}" --regular_price="${regular_price}" --sku="${sku}" --allow-root
wp media import "${images}" --featured_image --post_id= --allow-root
done < products.txt

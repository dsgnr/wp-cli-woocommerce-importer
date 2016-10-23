#!/bin/bash
echo -e "I am about to import products!"

while IFS='|' read -r product_title sku regular_price images
do
ID=$(wp wc product create --title="${product_title}" --regular_price="${regular_price}" --sku="${sku}" --allow-root | awk '{print $4}')
  wp media import "${images}" --featured_image --post_id=$ID --allow-root
done < products.txt

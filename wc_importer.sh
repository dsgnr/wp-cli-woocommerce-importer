#!/bin/bash
echo -e "I am about to import products!"

while IFS='|' read -r product_title sku regular_price
do
  wp wc product create --title="${product_title}" --regular_price="${regular_price}" --sku="${sku}" --allow-root
done < products.txt

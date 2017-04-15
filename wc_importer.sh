#!/bin/bash
echo -e "Grabbing your products now!"
while IFS='|' read -r sku product_title description category regular_price weight images length height width stock_qty manage_stock
do
wp media import "${images}" --featured_image  --post_id=$(wp wc product create --name="${product_title}" --short_description='${short_description}' --categories=66 --weight="${weight}" --regular_price="${regular_price}" --dimensions='{"length":"${length}","height":"${height}","width":"${width}"}' --stock_quantity="${stock_qty}" --manage_stock="${manage_stock}" --allow-root  | awk '{print $4}')  --allow-root
done < test.txt

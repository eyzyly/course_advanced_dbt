# Bingeflix Docs
This file contains doumentation for Bingeflix data sources.

## Ads
This section contains documentation from the Bingeflix Ads table.

{% docs bingeflix_ads_table %}
This table contains information about Bingeflix's marketing ads.
{% enddocs %}

{% docs bingeflix_ads_column_date %}
When the ad campaign was served
{% enddocs %}

{% docs bingeflix_ads_column_campaign_id %}
The unique identifier of the ad campaign
{% enddocs %}

{% docs bingeflix_ads_column_surrogate_key %}
Generates a surrogate key using date and campaign id
{% enddocs %}

{% docs bingeflix_ads_column_spend %}
The amount spent on the ad campaign
{% enddocs %}

{% docs bingeflix_ads_column_cpm %}
The average cost per 1,000 impressions
{% enddocs %}

{% docs bingeflix_ads_column_ctr %}
The average click-through rate on ads served
{% enddocs %}


## Users
This section contains documentation from the Bingeflix Users table.

{% docs bingeflix_column_user_id %}
The unique identifier of the Bingeflix user. A user is created when...
{% enddocs %}

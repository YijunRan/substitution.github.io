
The datasets mentioned above can be collected from public resources directly. Specifically, the automobile dataset can be obtained from Good Car Bad Car website; The app dataset can be obtained from Apptopia, and the scientific field dataset can be collected through MAG API or by contacting Microsoft. The mobile phone dataset is not publicly available due to commercially sensitive information contained. 

In the following, we provide the data and code which is necessary to reproduce the results in the manuscript. 


1. To study the early growth pattern, please find the matlab codes in the early_growth folder, where the code for impact growth dynamics and normalized curves are provided.

The data structure for early_dynamic.txt is: 

item_id1 \t time \t cumulative_impact \t item_type

where the item_type equals to 2 for automobiles, 3 for apps and 4 for scientific fields.


2. To explore the growth dynamics for items with fitness close to 1.5, we provide the data for selected products and the related codes in folder focused_fitness.

The data structure for point5_dynamics.txt is:

item_id2 \t time \t cumulative_impact \t item_type

where the item_type equals to 2 for automobiles, 3 for apps and 4 for scientific fields.



3. The rescaled dynamic for different products can be found in folder dynamics_rescale. The data structure for rescale_dynamics.txt is: 

item_id3 \t rescaled_time \t rescaled_dynamics \t item_type

Notice that, item_id1, item_id2 and item_id3 are different to each other. 


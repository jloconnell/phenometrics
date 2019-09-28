# Phenometrics

Step 1. Extract color information from digital images to create phenology indices such as the Green Chromatic Coordinate (GCC) from PhenoCam data. An example of how to do this is provided in get_RGB_from_digital_image_calculate_color_index.r

Step 2. Use the curve function found at curve_derivative.r to fit a curve to the phenology indices and take it's derivative. This can be used to identify the minima and maxima of the derivative, which is the phenophase transition date

![](/img/phenocureve.jpg)


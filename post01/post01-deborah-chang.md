Post \#1: Ggplot and its Applications: Faceting
================

Introduction
------------

R has numerous features that can beautify our data and graphically appeal to the audience. From different analysis tools to functions that can summarize a whole bunch of data, R packages seem to contain more options than we can ever imagine. As I continue to dive deeply into more data analysis, download more datasets, and perform a certain technique to determine a holistic answer to a research question, I enjoyed the efficient help documentations and new tips on creating concise reports. One certain package, ggplot2, has caught my eye for a while. As I delved into the lab, I discovered new functions and features that were aesthetically concise and pleasing to the eye of the audience. Developed by Hadley Wickham, the ggplot2 package has numerous selections of chart types, modifications, and features to the user’s delight. As I excitedly finished learning how to create scatterplots and star plots with neat functions, I stumbled across the very last exercise in the lab, which was faceting. I was amazed at the different perspective that faceting provided, and how much information data can hold across one variable. Below is an example of faceting (what caught my eye in the first place):

![](http://eriqande.github.io/rep-res-web/lectures/lecture_figs/ggplot-more-unnamed-chunk-16-1.png)

Faceting has brought much interest to users lately, bringing a new perspective of presenting multiple sets of categorical variable.

Motivation
----------

So what exactly is faceting? According to a Harvard tutorial, “faceting is a ggplot2 parlance for small multiples: the idea is to create separate graphs for subsets of data.” Similarly, if I want to compare the effect of salaries of people to their health and well being, I could split up the categorical variable of people into different age groups. A categorical variable is qualitative information about an observation ie. Gender, level, hometown, etc. Often, these variables could be classified into factors, which are used to handle categorical data. Then, I could graph each age group in its own visual and have multiple graphs lined up together. I could now better visualize what’s going on for each age group. For example, if I created scatterplots, there would be less results to weave through and better views of certain patterns and relationships within and among age groups in relation to salaries.

Background
----------

As mentioned, faceting splits data into different subgroups for deeper analysis. I could facet with more than one variable, and there are truly no limits to how many features there are to faceting. Here is an interesting example of faceting:

![](https://cloud.githubusercontent.com/assets/1275592/26282369/611ab89e-3dc5-11e7-86eb-65685cc2948b.png)

I like how this visual is partitioned by state; there are multiple pieces of information per plot, and colorful bars to color code each variable. Imagine if this were condensed into one plot. There would be too many color bars and variables to repeat for each state, not to mention the confusion one might experience from viewing a giant graph of multiple variables and states.

Examples
--------

Firstly, to begin creating my visual, I would do the usual ggplot() function and use the ‘+’ operator to add additional aesthetics. Refer to <https://cran.r-project.org/web/packages/ggplot2/ggplot2.pdf> for more information on how to plot. Here is a sample code on graphing a density plot:

``` r
ggplot(data = dat, aes(salary)) + geom_density()
```

![](post01-deborah-chang_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-1-1.png)

I always need the ggplot() function with the respective variables I want to measure. The operators are for the specification of the type of visual I want as well as the labels and titles I want to incorporate. I would finally add another ‘+’ operator before utilizing the faceting function.

There are two types of faceting functions in ggplot2. One is facet\_grid(). It places the subset visuals in a gridlike format, and can be done so in a horizontal or vertical format. Below is an example of a scatterplot coded with the facet\_grid function from the cookbook:

![](https://i.stack.imgur.com/EC4xF.png)

As you can see, the plots are arranged by day and gender. I can better pinpoint and approximate how much a female would typically pay on Saturday compared to the bill of a male.

Another type of faceting is called facet\_wrap(). This function brings each plot next to each other, by column or by row; your choice. Here is an example (again, from the cookbook):

![](https://i.stack.imgur.com/pXez8.png)

Here is a faceting plot that I created:

``` r
ggplot(data = dat, aes(x =dat$height, y = dat$weight)) + geom_point() + facet_wrap(~ position)
```

![](post01-deborah-chang_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-2-1.png)

``` r
# aggregated plot
```

This scatterplot arranges the players’ weights by position. Hence, maybe an answer that we could be seeking is the effect of position on weight, or vice versa.

Here is a cooler plot that we created:

``` r
ggplot(data = dat, aes(x =dat$height, y = dat$weight)) + geom_point() + geom_density2d() + facet_wrap(~ dat$position)
```

![](post01-deborah-chang_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-3-1.png)

``` r
# adding density plot function
# adding facet wrap
```

This graph brings the data alive, in a two-dimensional version.

If I wanted to add another variable to wrap, I would use a vector, such as c(“salary”, “weight”) , salary~weight, ~salary + weight.

One neat feature of creating facet visuals is the use of the argument “labeller.” We can adjust the names of the visuals and variables with these different functions:

Label\_value(): Shows factor value Label\_both(): Name and value Label\_context(): Based on context Label\_parsed(): Viewed as math expression Label\_wrap\_gen(): Wraps line

Here is an application of labeller:

``` r
ggplot(data = dat, aes(x =dat$experience, y = dat$salary)) + geom_point() + facet_wrap(~ dat$team, labeller = label_both)
```

![](post01-deborah-chang_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-4-1.png)

This displays both the names of the factor(dat$team) and the team names at the top of the visuals for each plot.

Discussion
----------

Faceting definitely brings out new insights that one may not easily notice in an aggregated visual. With the numerous amounts of data coming in through all various industries, never has analysis become much more convenient with the features of ggplot. Especially in analytics today, faceting can bring better observations for companies. For example, in the business or healthcare industries, faceting in R can better clear up overlaps and potential third variables. With the numerous resources and documentations of faceting functions and features, more information can be dug out of our data.

Conclusions
-----------

Data is exciting different industries today. All inputs in our daily lives utilize data in some way, and it doesn’t seem to be stopping any time soon. Data is endless. The limits of data stretch beyond the horizons. With faceting, data can be even better applied and visualized.

The next steps of faceting could be generating more 3d models of visuals. How cool does that sound? I never knew about faceting until coming across this course, and specifically, the ggplot2 package. There must be more features ahead…

Take-home
---------

Facets really do bring a new perspective of visualizing data. The different examples and functions that faceting brings can allow users to better analyze data across the subgroups of categorical variables. With growing excitement about the immense access and use of data, ggplot2 allows much efficiency and interactivity of creating visuals across different dimensions.

References
----------

Works Cited

-   "Conditionally Change Panel Background with Facet\_grid?" R - Conditionally Change Panel Background with Facet\_grid? - Stack Overflow. N.p., n.d. Web.
-   Facets (ggplot2). N.p., n.d. Web.
-   "Ggplot2: Facet\_wrap Strip Color Based on Variable in Data Set." R - Ggplot2: Facet\_wrap Strip Color Based on Variable in Data Set - Stack Overflow. N.p., n.d. Web.
-   Google Search. Google, n.d. Web.
-   Holtz, |. "\#223 Faceting with Ggplot2." The R Graph Gallery. N.p., 10 Feb. 2017. Web.
-   "Lay out Panels in a Grid." Lay out Panels in a Grid - Facet\_grid • Ggplot2. N.p., n.d. Web.
-   N.p., n.d. Web.
-   "Plotting Multiple Groups with Facets in Ggplot2." University of Notre Dame. N.p., n.d. Web.
-   <Robk@statmethods.net>, Robert Kabacoff -. "Graphics with Ggplot2." Quick-R: Ggplot2 Graphs. N.p., n.d. Web.
-   "Useful Labeller Functions." Useful Labeller Functions - Labellers • Ggplot2. N.p., n.d. Web.
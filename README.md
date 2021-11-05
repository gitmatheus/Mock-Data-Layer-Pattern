# Mock Data Layer Pattern

###### _Presented by [Matheus Gonçalves](https://matheus.dev)_

[![Mock Data Layer](https://matheus.dev/wp-content/uploads/2021/11/MockDataLayerPattern_cover.png)](https://www.youtube.com/watch?v=kuJaa6G2O9I)

Originally presented at [Salesforce Developer Group, Tampa, United States](https://trailblazercommunitygroups.com/events/details/salesforce-salesforce-developer-group-tampa-united-states-presents-speeding-up-your-apex-tests-with-a-mock-data-layer-pattern/).

---

Files used in this exploratory presentation:

```
force-app
    main
        default
            classes
                ◦ AccountTriggerHandler.cls
                ◦ DataLayerHandler.cls
                ◦ DocumentHelper.cls
                ◦ DocumentHelperTest.cls
                ◦ DocumentHelperWithDataLayer
                ◦ DocumentHelperWithDataLayerTest
                ◦ TestDataFactory.cls
                ◦ TestUtils.cls
            triggers
                ◦ AccountTrigger.trigger
```

---

**A**pex tests are essential to the overall health of your Salesforce org. The Apex testing framework enables you to write and execute tests for your Apex classes and triggers on the Lightning Platform. Apex unit tests ensure high quality for your Apex code and let you meet the requirements for deploying Apex.

It's very common to have a Test Factory for your Apex tests, creating several records, which is absolutely needed especially when testing bulk processing operations.

However, besides bulk testing, you may want to test a singular method from a Helper class or run your tests with fake data. Here, instead of inserting real records in your Salesforce org, you can use the Data Layer pattern, and implement an interface that will allow you to run tests with mock data, which makes your tests run a lot faster.

You can mock virtually any relationship if you use a Mock Data Layer Pattern, by adding an `Interface` to your Helper class. Let’s call it `IDataLayer`.

Add this new Interface to the Helper class (here, called `DocumentHelperDataLayer.cls`).

More details at [matheus.dev](https://matheus.dev/unit-test-mock-relationships-apex/).

---

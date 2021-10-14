package FeaturePackage;


import org.junit.runner.RunWith;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

@RunWith(Karate.class)
@KarateOptions(features="classpath:FeaturePackage/Create_finish_item.feature")
public class TestRunner
{

}

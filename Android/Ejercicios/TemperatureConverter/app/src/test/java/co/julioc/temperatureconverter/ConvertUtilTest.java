package co.julioc.temperatureconverter;

/**
 * Created by JulioC on 5/24/17.
 */

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import co.julioc.temperatureconverter.ConvertUtil;

public class ConvertUtilTest {

    @Test
    public void testConvertFahrenheitToCelsius() {
        float actual = ConvertUtil.convertCelsiusToFahrenheit(100);
        // expected value is 212
        float expected = 212;
        // use this method because float is not precise
        assertEquals("Conversion from celsius to fahrenheit failed", expected, actual, 0.001);
    }

    @Test
    public void testConvertCelsiusToFahrenheit() {
        float actual = ConvertUtil.convertFahrenheitToCelsius(212);
        // expected value is 100
        float expected = 100;
        // use this method because float is not precise
        assertEquals("Conversion from celsius to fahrenheit failed", expected, actual, 0.001);
    }

}
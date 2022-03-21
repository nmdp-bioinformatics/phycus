package org.dash.freq.uploadData;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

import org.dash.freq.uploadData.*;
 
class FileUploaderTest{

	private final FileUploader fileUploader = new FileUploader();
	// private final String[] ionPositiveTestArray = {"3553", "NMDP-National Marrow Donor Program/Be The Match"};
	// private final String[] ionNegativeTestArray = {"", ""};
	
	// @Disabled("Requires internet and time to test, currently passing")
	// @Test
	// @DisplayName("FileUploader.java test")
	// void objectReturnsArrayOnMatch() {
 // 		assertEquals(2, ionCheck.checkIon("3553").length, "NMDP ION match array length");
 // 		assertArrayEquals(ionPositiveTestArray, ionCheck.checkIon("3553"), "Found NMDP ION match array");
 // 		assertEquals("3553", ionCheck.checkIon("3553")[0], "Found NMDP ION match");
 // 		assertEquals("NMDP-National Marrow Donor Program/Be The Match", ionCheck.checkIon("3553")[1], "Found NMDP name match");
	// }

	// @Disabled("Requires internet and time to test, currently passing")
	// @Test
	// @DisplayName("IonCheck.java negative test")
	// void objectReturnsArrayOnNoMatch() {
 // 		assertArrayEquals(ionNegativeTestArray, ionCheck.checkIon("0000"), "Found NMDP Ion Match Array");
 // 		assertEquals("", ionCheck.checkIon("0000")[0], "Returned empty ION on bad data");
 // 		assertEquals("", ionCheck.checkIon("0000")[1], "Returned empty name on bad data");
	// }
}


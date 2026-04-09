package com.hp.utils;

import org.springframework.beans.factory.annotation.Autowired;

public class TestE {

	@Autowired
	static
	EncriptionData encriptionData;
	public static void main(String[] args) {
        try {
            String originalText = "6";
            String ecriptedText = "3u5tcx/9AJWAJBAEpH36Bg==";

            // Encrypt
            String encrypted = encriptionData.encrypt(originalText);
            System.out.println("Encrypted Text: " + encrypted);

            // Decrypt
            String decrypted = encriptionData.decrypt(ecriptedText);
            System.out.println("Decrypted Text: " + decrypted);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

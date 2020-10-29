package com;

import java.io.IOException;

public class InternetControl {

    SendMessage sendMessage = new SendMessage();

    public void InternetOn(String room) {
        try {
            Runtime.getRuntime().exec("cmd /c C:\\WCUC_InternetControl\\WCUC_Autoit\\" + room + "_UnBlock.exe.lnk");
        } catch (IOException e) {
        }
    }

    public void InternetOff(String room) {
        try {
            Runtime.getRuntime().exec("cmd /c C:\\WCUC_InternetControl\\WCUC_Autoit\\" + room + "_Block.exe.lnk");
        } catch (IOException e) {
        }
    }

}

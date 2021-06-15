package org.lunatic_devs.utils;

import org.ocpsoft.prettytime.PrettyTime;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * Created by CryptoSingh1337 on 6/15/2021
 */
@Component
public class TimeFormatter {

    private final PrettyTime prettyTime;

    public TimeFormatter() {
        this.prettyTime = new PrettyTime();
    }

    public String formatTime(LocalDateTime dateTime) {
        return prettyTime.format(dateTime);
    }
}

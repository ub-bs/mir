package org.mycore.mir.date;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Year;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
import java.util.Locale;

import org.apache.logging.log4j.LogManager;

public class MIRDateConverter {

    public static String convertDate(String date, String format) {
        try {
            String formatterClassName = "org.mycore.mir.date.MIR" + format.toUpperCase(Locale.ROOT) + "Formatter";
            MIRDateFormatterInterface formatter = (MIRDateFormatterInterface) Class.forName(formatterClassName)
                .getDeclaredConstructor().newInstance();
            return getFormatedDateString(date, formatter.getFormatter(date));
        } catch (Exception e) {
            LogManager.getLogger().warn("Error while converting " + date + " from format " + format, e);
            return date;
        }
    }

    private static String getFormatedDateString(String date, DateTimeFormatter formatter) {
        TemporalAccessor ta = formatter.parseBest(date,
            LocalDateTime::from, LocalDate::from, YearMonth::from, Year::from);
        if (ta instanceof LocalDateTime) {
            LocalDateTime ld = LocalDateTime.from(ta);
            return ld.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss", Locale.ROOT));
        }
        if (ta instanceof LocalDate) {
            LocalDate ld = LocalDate.from(ta);
            return ld.format(DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ROOT));
        }
        if (ta instanceof YearMonth) {
            YearMonth ld = YearMonth.from(ta);
            return ld.format(DateTimeFormatter.ofPattern("yyyy-MM", Locale.ROOT));
        }
        if (ta instanceof Year) {
            Year ld = Year.from(ta);
            return ld.format(DateTimeFormatter.ofPattern("yyyy", Locale.ROOT));
        }
        return date;
    }
}

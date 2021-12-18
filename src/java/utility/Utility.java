/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import com.password4j.Hash;
import com.password4j.Password;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.UUID;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author tddaij
 */
public class Utility {

    final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

    public String passwordEncode(String plainText) {
        Hash hash = Password.hash(plainText).withBCrypt();
        return hash.getResult();
    }

    public boolean passwordDecode(String plainText, String encryptPassword) {
        return Password.check(plainText, encryptPassword).withBCrypt();
    }

    public String generateToken() {
        StringBuilder sb = new StringBuilder();
        sb = sb.append(UUID.randomUUID());
        sb = sb.append(UUID.randomUUID());

        System.out.println(sb.toString());
        return sb.toString();
    }

    public List<Integer> page(List<?> list, String page_raw, int amount_per_page) {
        int current;
        if (page_raw == null || page_raw.isEmpty()) {
            current = 1;
        } else {
            current = Integer.parseInt(page_raw);
        }
        int next = current + 1;
        int prev = current - 1;
        int start = (current - 1) * amount_per_page;
        int end;
        if (current * amount_per_page > list.size()) {
            end = list.size();
        } else {
            end = current * amount_per_page;
        }
        int size = list.size();
        int pagenum = (size % amount_per_page == 0) ? (size / amount_per_page) : (size / amount_per_page + 1);
        return Arrays.asList(current, start, prev, next, end, pagenum);
    }

    public <T> List<T> getListByPage(List<T> list, int start, int end) {

        List<T> listP = new ArrayList<>();
        for (int i = start; i < end; i++) {
            listP.add(list.get(i));
        }

        return listP;
    }

    public String getParam(String paramName, String defaultValue, HttpServletRequest req, String ruleFor) {
        String paramVal = req.getParameter(paramName);
        if (paramVal == null || "".equals(paramVal.trim())) {
            return defaultValue;
        } else if ("numberOnly".equalsIgnoreCase(ruleFor)) {
            if (!paramVal.matches("^[0-9]+$")) {
                paramVal = defaultValue;
            }
            return paramVal;
        } else if ("id".equalsIgnoreCase(ruleFor)) {
            if (!paramVal.matches("^[1-9][0-9]*$")) {
                paramVal = defaultValue;
            }
            return paramVal;
        } else if ("alphabetOnly".equalsIgnoreCase(ruleFor)) {
            if (!paramVal.matches("^[a-zA-Z]+$")) {
                paramVal = defaultValue;
            }
            return paramVal;
        } else if ("characterOnly".equalsIgnoreCase(ruleFor)) {
            if (!paramVal.matches("^[\\w]+$")) {
                paramVal = defaultValue;
            }
            return paramVal;
        }
        return defaultValue;
    }

    public String test(int number) {
        return null;
    }

    public String getTimeAfter(String dateBeforeString) {

        //Parsing the date
        LocalDateTime dateBefore = LocalDateTime.parse(dateBeforeString, dtf);
        LocalDateTime now = LocalDateTime.now();

        //calculating number of days in between
        long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore, now);
        StringBuilder result = new StringBuilder();
        if (noOfDaysBetween <= 0) {
            long noOfHourBetween = ChronoUnit.HOURS.between(dateBefore, now);
            if (noOfHourBetween <= 0) {
                long noOfMinuteBetween = ChronoUnit.MINUTES.between(dateBefore, now);
                if (noOfMinuteBetween <= 0) {
                    long noOfSecondBetween = ChronoUnit.SECONDS.between(dateBefore, now);
                    result.append(noOfSecondBetween).append(" second");
                } else {
                    result.append(noOfMinuteBetween).append(" minute");
                }
            } else {
                result.append(noOfHourBetween).append(" hour");
            }
        } else if (noOfDaysBetween > 0 && noOfDaysBetween <= 30.4167) {
            result.append(noOfDaysBetween).append(" day");
        } else if (noOfDaysBetween > 30.4167 && noOfDaysBetween < 365) {
            long noOfMonthBetween = ChronoUnit.MONTHS.between(dateBefore, now);
            result.append(noOfMonthBetween).append(" month");
        } else {
            long noOfYearBetween = ChronoUnit.YEARS.between(dateBefore, now);
            result.append(noOfYearBetween).append(" year");
        }
        if (result.toString().matches("^[2-9]{1}[0-9]*[ a-zA-Z]+$|^[0]+[2-9]+[ a-zA-Z]+$|^[1]+[0-9]+[ a-zA-Z]+$")) {
            result.append("s");
        }
        return result.toString();
    }

    public String barratingGenerate(int number) {
        StringBuilder s = new StringBuilder();
        for (int i = 1; i <= 5; i++) {
            if (i < number) {
                s.append("\n<a href=\"#\" data-rating-value=\"" + i + "\" data-rating-text=\"" + i + "\" class=\"br-selected\"></a>");
            } else if (i == number) {
                s.append("\n<a href=\"#\" data-rating-value=\"" + i + "\" data-rating-text=\"" + i + "\" class=\"br-selected br-current\"></a>");
            } else {
                s.append("\n<a href=\"#\" data-rating-value=\"" + i + "\" data-rating-text=\"" + i + "\"></a>");
            }
        }
        return s.toString();
    }

    public static void main(String[] args) {
        System.out.println(new Utility().getTimeAfter("2021-11-02 17:07:50.0"));
    }

}

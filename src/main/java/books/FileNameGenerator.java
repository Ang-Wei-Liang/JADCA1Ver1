
package books;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FileNameGenerator {
    public static String generateUniqueFileName(int bookID) {
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        return "book_" + bookID + "_" + timeStamp + ".png";
    }
}


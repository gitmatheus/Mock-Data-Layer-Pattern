/**
 * @description       : Test Utils
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-03-2021
 * @last modified by  : contact@matheus.dev
 **/
public class TestUtils {
    private static Integer fakeIdCounter = 1;

    public static String getFakeId(Schema.SObjectType type) {
        String result = String.valueOf(fakeIdCounter++);
        return type.getDescribe().getKeyPrefix() +
            '0'.repeat(12 - result.length()) +
            result;
    }
}

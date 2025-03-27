#include "unity.h"
#include <stdbool.h>
#include <stdlib.h>
#include "../../examples/autotest-validate/autotest-validate.h"
#include "../../assignment-autotest/test/assignment1/username-from-conf-file.h"



void test_validate_my_username()
{
    /**
     * TODO: Replace the line below with your code here as described above to verify your /conf/username.txt 
     * config file and my_username() functions are setup properly
     */

    const char *username_from_code = my_username();

    const char *username_from_conf = malloc_username_from_conf_file();

   // TEST_ASSERT_TRUE_MESSAGE(false,"AESD students, please fix me!");
    // 3) Verificare che i due username siano uguali
    TEST_ASSERT_EQUAL_STRING_MESSAGE(username_from_code, username_from_conf, "I due username non corrispondono!");
}

#include <stdio.h>
#include <string.h>

/* extern void scheme_helloinit (void); */
/* extern void scheme_hellofinal (void); */
/* extern int hello_ada (int); */

/* int main(void) { */
/* 	scheme_helloinit(); */
/* 	hello_ada(1337); */
/* 	scheme_hellofinal(); */
/* 	return 0; */
/* } */

/* int hello_scheme (char* message) { */

/* 	printf("\nHi from C, message received was:\n"); */
/* 	printf("%s", message); */
/* 	printf("\nThe length of the message was: %d", strlen(message)); */
/* 	return strlen(message); */
//}
extern int hello_scheme (char* message);
void hello_ada(int num) {
	int c = num + 1;
	printf("Hello from C. \n");
	printf("The number given was: %d", num);
	int length = hello_scheme("I am calling from C.\n");
	printf("\nThe string length was: %d", length);
	return;
}


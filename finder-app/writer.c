#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

void usage() {
    printf("Uso: writer <writefile> <writestr>\n");
    printf("  <writefile>  : percorso completo al file (incluso il nome del file) dove scrivere il contenuto\n");
    printf("  <writestr>   : stringa di testo da scrivere nel file\n");
    exit(1);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        usage();
    }

    char *writefile = argv[1];
    char *writestr = argv[2];

    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        // Se il file non può essere aperto, registriamo un errore nel syslog
        syslog(LOG_ERR, "Error: cannot open file %s for writing", writefile);
        perror("Error opening file");
        exit(1);
    }

    if (fputs(writestr, file) == EOF) {
        // Se c'è un errore durante la scrittura, registriamo un errore nel syslog
        syslog(LOG_ERR, "Error: cannot write to file %s", writefile);
        perror("Error writing to file");
        fclose(file);
        exit(1);
    }

    fclose(file);

    syslog(LOG_DEBUG, "Successfully wrote to file %s", writefile);

    closelog();

    return 0;
}

/* vi: set sw=4 ts=4: */
/*
 * Copyright (C) 2019 Denys Vlasenko <vda.linux@googlemail.com>
 * Licensed under GPLv2, see file LICENSE in this source tree.

//config:config FORK
//config:	bool "fork (1 bytes)"
//config:	default y

//applet:IF_FORK(APPLET(fork, BB_DIR_USR_BIN, BB_SUID_DROP))

//kbuild:lib-$(CONFIG_FORK) += fork.o

//usage:#define fork_trivial_usage
//usage:       "[-is] [STRFTIME]"
//usage:#define fork_full_usage "\n\n"
//usage:       "Pipe stdin to stdout, add timestamp to each line\n"
*/

#include "libbb.h"

int fork_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
int fork_main(int argc, char **argv)

{
    int fd1[2];

    if (pipe(fd1) == -1)
    {
        printf("Pipe Failed\n");
        return 1;
    }

    /*Spawn a child to run the program.*/
    pid_t pid = fork();
    if (pid < 0)
    {
        printf("fork Failed\n");
        return 1;
    }

    if (pid == 0)
    {

        char *test[1];
        test[1] = NULL;

        errno = execv(argv[1], argv);
        if (errno == -1)
        {
            printf("shell launch error : error in child process > execvp failed %d \n", errno);
            exit(errno);
        }
        else
        {
            printf("exec failed \n");
        }

        exit(127); /* only if execv fails */
    }
    else
    { /* pid!=0; parent process */
        printf("wait for child \n");
        // close(fd1[1]);
        waitpid(pid, 0, 0); /* wait for child to exit */
    }
    return 0;
}

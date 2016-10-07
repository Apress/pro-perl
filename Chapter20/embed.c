/* embed.c (p817) */
#include <EXTERN.h>
#include <perl.h>

PerlInterpreter *my_perl;

int main(int argc, char *argv[], char *env[])
{
    /* initialise */
    PERL_SYS_INIT3(&argc,&argv,&env);

    /* create the interpreter */
    my_perl = perl_alloc();
    perl_construct(my_perl);
    PL_exit_flags |= PERL_EXIT_DESTRUCT_END;

    /* invoke perl with arguments */
    char *code="print scalar(localtime).\"\\n\"";
    char *perl_argv[] = {argv[0], "-e",code};
    perl_parse(my_perl, NULL, 3, perl_argv, env);
    perl_run(my_perl);

    /* clean up */
    perl_destruct(my_perl);
    perl_free(my_perl);

    /* finish */
    PERL_SYS_TERM();
}

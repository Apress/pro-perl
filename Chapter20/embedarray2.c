/* embedarray1.c (p822) */
#include <EXTERN.h>
#include <perl.h>

PerlInterpreter *my_perl;

void do_stuff(void);

int main(int argc, char *argv[], char *env[])
{
    char *perl_argv[] = {argv[0], "-e","0"};

    /* initialise */
    PERL_SYS_INIT3(&argc,&argv,&env);

    /* create the my_perlreter */
    my_perl = perl_alloc();
    perl_construct(my_perl);
    PL_exit_flags |= PERL_EXIT_DESTRUCT_END;

    /* invoke perl with arguments */
    perl_parse(my_perl, NULL, 3, perl_argv, env);
    perl_run(my_perl);

    do_stuff();

    /* clean up */
    perl_destruct(my_perl);
    perl_free(my_perl);

    /* finish */
    PERL_SYS_TERM();
} 

void do_stuff(void)
{
    AV *inc = get_av("INC",TRUE); /* get @INC array */
    SV **valuep;

    /* store value at index 1000 */
    if (av_store(inc, 1000, newSVpv("newvalue",8))==NULL) {
        exit(99); /* NULL=failed store */
    }

    /* test for and retrieve value at index 1000 */
    if (av_exists(inc, 1000)) {
        valuep = av_fetch(inc, 1000, FALSE);
        printf("1000: %s\n", SvPV(*valuep, PL_na));
        printf("length of @INC is %d\n---\n", av_len(inc));
        av_delete(inc, 1000, FALSE); /*flag arg needed but ignored*/
    }

    /* loop over array values and print them out */
    printf("length of @INC is now %d\n---\n", av_len(inc));
    for (int index=0; index<=av_len(inc); index++) {
        valuep = av_fetch(inc, index, FALSE);
        if (valuep != NULL) {
            printf("%d: %s\n", index, SvPV(*valuep, PL_na));
        }
    }
}

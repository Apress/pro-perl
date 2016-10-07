/* embedsplit.c (p826-827) */
#include <EXTERN.h>
#include <perl.h>

PerlInterpreter *my_perl;

void do_stuff(void);

int main(int argc, char *argv[], char *env[])
{
    /* initialise */
    PERL_SYS_INIT3(&argc,&argv,&env);

    /* create the my_perlreter */
    my_perl = perl_alloc();
    perl_construct(my_perl);
    PL_exit_flags |= PERL_EXIT_DESTRUCT_END;

    /* invoke perl with arguments */
    char *perl_argv[] = {argv[0], "-e","0"};
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
    dSP;                          /* declare local stack (SP) */
    int count;                    /* number of return arguments */

    /* Perl sub to split a string and return first N parts, reversed */
    eval_pv("sub rsplit ($$;$) { return reverse split $_[0],$_[1],$_[2] }",TRUE);

    ENTER;                        /* prepare local stack for modification */
    SAVETMPS;                     /* note existing temporaries */

    PUSHMARK(SP);                 /* note where we started */
    XPUSHs(sv_2mortal(newSVpv(",",1)));
    XPUSHs(sv_2mortal(newSVpv("one,two,three",13)));
    XPUSHs(sv_2mortal(newSViv(2))); 
    PUTBACK;                      /* update global stack */

    count = call_pv("rsplit", G_ARRAY); /* call sub, return number of return values */
    printf("Got %d results\n",count); 

    SPAGAIN;                      /* query the stack */
    for (int i=0; i<count; i++) {
        char *part = POPp;
        printf("result %d is '%s'\n",i,part); /* pop (string) results */
        free(part);               /* free allocated memory */
    }
    PUTBACK;                      /* clean up global stack */

    FREETMPS;                     /* free any temporaries created by us */
    LEAVE;                        /* free local stack */
}

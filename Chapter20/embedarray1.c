/* embedarray1.c (p821) */
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
    AV *thetime,*anotherarray; /*AV is C type for arrays*/
    SV *isdst_sv,*hour_sv;     /*array elements are SVs*/
    I32 thehour,theminute;     /*explicitly 32-bit int*/

    /* create an array */
    eval_pv("@time=localtime",TRUE);
    thetime = get_av("time",FALSE); /* the array */
    theminute = SvIV(* av_fetch(thetime, 1, FALSE));
    thehour = SvIV(* av_fetch(thetime, 2, FALSE));
    printf("It is %d:%d \n",thehour,theminute);
    printf("@time has %d elements\n",av_len(thetime)+1);
    isdst_sv=av_pop(thetime); /* pop a value */
    printf("@time has %d elements\n",av_len(thetime)+1);
}

/* embedeval.c (p818-819) */
#include <EXTERN.h>
#include <perl.h>

PerlInterpreter *my_perl;

void do_stuff(void);

int main(int argc, char *argv[], char *env[])
{
    char *perl_argv[] = {argv[0], "-e","0"};

    /* initialise */
    PERL_SYS_INIT3(&argc,&argv,&env);

    /* create the interpreter */
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
    SV *intscalar, *strscalar;
    int intval;
    char *strval;
    AV *thetime,*anotherarray;
    SV *isdst_sv,*hour_sv;
    I32 thehour,theminute;

    /* evaluate an expression */
    eval_pv("($int,$str)=(6,'Number 6')",TRUE);

    /* get the result */
    intscalar=get_sv("int",FALSE); /*get $int*/
    intval=SvIV(intscalar);        /*extract integer slot*/
    strscalar=get_sv("str",FALSE); /*get $str*/
    strval=SvPV(strscalar,PL_na);     /*allocate and extract string slot*/
    printf("The answer is %d (%s)\n",intval,strval);

    /* create an array */
    eval_pv("@time=localtime",TRUE);
    thetime = get_av("time",FALSE); /* the array */
    theminute = SvIV(* av_fetch(thetime, 1, FALSE));
    thehour = SvIV(* av_fetch(thetime, 2, FALSE));
    printf("It is %d:%d \n",thehour,theminute);
    printf("@time has %d elements\n",av_len(thetime)+1);
    isdst_sv=av_pop(thetime); /* pop a value */
    printf("@time has %d elements\n",av_len(thetime)+1);

    SvREFCNT_dec(isdst_sv);
    printf("isdst_sv has %d references\n",SvREFCNT(isdst_sv));
    SvREFCNT_inc(isdst_sv);
    anotherarray = newAV();
    if (av_store(anotherarray,0,isdst_sv)==NULL) {
        SvREFCNT_dec(isdst_sv);
    }
    printf("isdst_sv has %d references\n",SvREFCNT(isdst_sv));
}

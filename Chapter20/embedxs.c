/* embedeval.c */
#include <EXTERN.h>
#include <perl.h>

PerlInterpreter *my_perl;

void do_stuff(void);

EXTERN_C void boot_DynaLoader (pTHX_ CV* cv);
EXTERN_C void xs_init(pTHX)
{
    char *file = __FILE__;
    dXSUB_SYS;

    /* DynaLoader is a special case */
    newXS("DynaLoader::boot_DynaLoader", boot_DynaLoader, file);
}

int main(int argc, char **argv, char **env)
{
    /* initialise */
    PERL_SYS_INIT3(&argc,&argv,&env);

    /* create the my_perlreter */
    my_perl = perl_alloc();
    perl_construct(my_perl);
    PL_exit_flags |= PERL_EXIT_DESTRUCT_END;

    /* invoke perl with arguments */
    char *perl_argv[] = {argv[0], "-e","0"};
    perl_parse(my_perl, xs_init, 3, perl_argv, env);
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
    SV *scalar;
    int intval;
    char *strval;

    /* load a module with eval_pv */
    eval_pv("use Scalar::Util 'dualvar'",TRUE);
    eval_pv("use Socket",TRUE);
    /* evaluate an expression */
    eval_pv("$value=dualvar(6,'Number 6')",TRUE);
    eval_pv("$ssh_service=getservbyname('ssh','tcp')",TRUE);
    /* get the result */
    scalar=get_sv("value",FALSE); /*get $value*/
    intval=SvIV(scalar);          /*extract integer slot*/
    strval=SvPV(scalar,PL_na);    /*allocate and extract string slot*/
    printf("The answer is %d (%s)\n",intval,strval);
    printf("SSH port is %d\n",SvIV(get_sv("ssh_service",FALSE)));
}

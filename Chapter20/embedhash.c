/* embehash.c (p822-823) */
#include <EXTERN.h>
#include <perl.h>

PerlInterpreter *my_perl;

void do_stuff(void);

int main(int argc, char **argv, char **env)
{
    /* initialise */
    PERL_SYS_INIT3(&argc,&argv,&env);

    /* create the interpreter */
    my_perl = perl_alloc();
    perl_construct(my_perl);
    PL_exit_flags |= PERL_EXIT_DESTRUCT_END;

    /* invoke perl with arguments */
    char *perl_argv[] = {argv[0], "-e","0"};
    perl_parse(my_perl, NULL, 3, perl_argv, env);
    perl_run(my_perl);

    do_stuff();

    /* evaluate an expression */
    eval_pv("($int,$str)=(6,'Number 6')",TRUE);

    /* clean up */
    perl_destruct(my_perl);
    perl_free(my_perl);

    /* finish */
    PERL_SYS_TERM();
} 

void do_stuff(void) {
    HV* env = get_hv("ENV",TRUE); /* get %ENV hash */
    SV *value;   /* key value */
    I32 length;  /* key length */
    char* key;   /* key name */

    /* store, retrive, and delete  a new key*/
    hv_store(env, "newkey", 6, newSVpv("newvalue",8), TRUE);
    if (hv_exists(env, "newkey", 6)) {
        value = * hv_fetch(env, "newkey", 6, TRUE);
        printf("newkey => %s\n---\n", SvPV(value, PL_na));
        hv_delete(env, "newkey", 6, G_DISCARD);
    }

    /* iterate over keys and print them out*/
    hv_iterinit(env);
    while ((value = hv_iternextsv(env, &key, &length))) {
        printf("%-20s => %s\n", key, SvPV(value, PL_na));
    }
}

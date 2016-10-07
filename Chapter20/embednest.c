/* embednest.c (p823-824) */
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
    SV *scalar,*reference;
    AV *array,*array2;
    HV *hash;
    SV **valuep;

    /* create an array of 10 elements */
    array = newAV();
    for (int i=0; i<10; i++) {
        scalar = newSVpvf("value %d",i+1); 
        av_push(array, scalar);
    }
    
    /* create reference for array */
    reference = newRV_noinc((SV *)array);

    /* add reference to a new array */
    if (array2 = newAV()) {
        av_push(array2, reference);
    }

    /* add reference to hash. As the array also holds the
       reference we increment the ref count if successful */
    if (hash = newHV()) {
        SvREFCNT_inc(reference);
        if (hv_store(hash, "array", 6, reference, 0)==NULL) {
            SvREFCNT_dec(reference);
        }
    }

    /* extract array from hash */
    if (valuep = hv_fetch(hash, "array", 6, FALSE)) {
        SV *svref = *valuep;
        if (SvOK(svref) && SvROK(svref)) {
            SV *sv = SvRV(svref);
            if (SvTYPE(sv) == SVt_PVAV) {
                AV *av = (AV *) sv; /*recast*/
                SV **svp;
                if (svp = av_fetch(av, 2, FALSE)) {
                    printf("Got '%s' from index 2 of array\n",SvPV(*svp,PL_na));
                }
            }
        }
    }
}

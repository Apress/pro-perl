# My/Module.pm (p303)
# (this module is used by import.pl, p304)
package My::Module;
use Exporter;

# inherit from it
@My::Module::ISA = qw(Exporter);

# define export symbols
@My::Module::EXPORT = qw(greet_planet);

sub greet_planet {
    return "Hello World\n";
}

1;

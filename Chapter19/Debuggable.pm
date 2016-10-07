# Debuggable.pm (p752-754)
# (this module is used by debugged.pl, p754-755)
package Debuggable;
use strict;
no strict 'refs';
# global debugging flag ?? all classes
my $global_level = 0;

# object constructor
sub new {
    my ($self, $level) = @_;
    my $class = (ref $self) || $self;

    $self = bless {}, $class;
    $self->initialize($level);
    return $self;
}

# initializer for existing objects
# (actually just a wrapper for debug_level)
sub initialize {
   my ($self, $level) = @_;
   $self->debug_level($level);
}

# get/set global debug level
sub global_debug_level {
    my ($self, $level) = @_;

    if (defined $level) {
        # set new level, return old one
        my $old = $global_level;
        $global_level = $level;
        return $old;
    }

    # return current global debug level
    return $global_level;
}

# get/set class debug level
sub class_debug_level {
    my ($self, $level) = @_;
    my $class = (ref $self) || $self;

    if (defined $level) {
        # set new level, return old one
        my $old = ${"${class}::class_debug"};
        ${"${class}::class_debug"} = $level;
        return $old;
    }

    # return current class debug level
    return ${"${class}::class_debug"};
}

# get/set object debug level
sub debug_level {
    my ($self, $level) = @_;
    my $class = ref $self;

    # check to see if we were called as class method
    unless (my $class = ref $self) {
        # '$self' is a class name
        return $self->class_debug_level($level);
    }

    if (defined $level) {
        # set new level, return old one
        my $old = $self->{'debug_level'};
        $self->{'debug_level'} = $level;
        return $old;
    }

    # return current object debug level
    return $self->{'debug_level'};
}

sub debug {
    my ($self, $level) = (shift, shift);

    # if no message, set the (class or object) debug level itself
    return $self->debug_level($level) unless @_;

    # write out debug message if criteria allow
    # object debug is allowed if object, class or global flag allows
    # class debug is allowed if class or global flag allows
    my $class = (ref $self) || $self;
    print STDERR @_, "\n" if
    $level <= $global_level || (
        defined ${"${class}::class_debug"} and
           $level <= ${"${class}::class_debug"}
      ) || (
         ref($self) and $level <= $self->{'debug_level'}
      );
}

1;

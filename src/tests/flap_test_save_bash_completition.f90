!< Test `save_bash_completition` method.
program flap_save_bash_completition
!< Test `save_bash_completition` method.

use flap, only : command_line_interface
use penf

implicit none
type(command_line_interface) :: cli                                               !< Command Line Interface (CLI).
character(37)                :: bash_file='flap_test_save_bash_completition.bash' !< Bash script file name.

call cli%init(progname='flap_test_save_bash_completition')
call cli%add_group(group='compile', description='compile sources')
call cli%add_group(group='clean',   description='clean compiled objects')
call cli%add(group='compile', switch='--compiler',  switch_ab='-c',  required=.false., act='store',      def='gnu'    )
call cli%add(group='compile', switch='--flags',     switch_ab='-f',  required=.false., act='store',      def='-O2'    )
call cli%add(group='clean',   switch='--clean',     switch_ab='-c',  required=.false., act='store_true', def='.false.')
call cli%add(group='clean',   switch='--clean-all', switch_ab='-ca', required=.false., act='store_true', def='.false.')
call cli%add(group='compile', positional=.true., position=1,         required=.false.,                   def='1.0'    )
call cli%parse
call cli%save_bash_completition(bash_file=trim(bash_file))
endprogram flap_save_bash_completition

package FusionInventory::Agent::Task::Inventory::Generic::Remote_Mgmt::AnyDesk;

use strict;
use warnings;

use parent 'FusionInventory::Agent::Task::Inventory::Module';

use English qw(-no_match_vars);

use FusionInventory::Agent::Tools;

sub getSystemFile {
    return (($OSNAME eq 'MSWin32') ? 'C:\ProgramData\AnyDesk\system.conf' : '/etc/anydesk/system.conf');
}

sub AnydeskFileExists {
	if( -r getSystemFile() ) { 
		return 1;
	} else {
		return 0;
	}
}

sub isEnabled {
	AnydeskFileExists();
}

sub isEnabledForRemote {
	AnydeskFileExists();
}

sub doInventory {
    my (%params) = @_;

    my $inventory = $params{inventory};
    my $logger    = $params{logger};

    my $AnyDeskID = _getID(logger => $logger);
    if (defined($AnyDeskID)) {
        $logger->debug('Found AnyDesk ID : ' . $AnyDeskID) if ($logger);

        $inventory->addEntry(
            section => 'REMOTE_MGMT',
            entry   => {
                ID   => $AnyDeskID,
                TYPE => 'anydesk'
            }
        );
    } else {
        $logger->debug('AnyDesk ID not found') if ($logger);
    }
}

sub _getID {
    my (%params) = @_;

    if ($OSNAME eq 'MSWin32') {

        FusionInventory::Agent::Tools::Win32->use();

		my $AnyDeskIDString = getFirstMatch(
            file    => getSystemFile(),
            logger  => $params{logger},
            pattern => qr/^ad.anynet.id=(\S+)/
		);

        return $AnyDeskIDString;
    }

    if ($OSNAME eq 'darwin') {
		my $AnyDeskIDString = getFirstMatch(
            file    => getSystemFile(),
            logger  => $params{logger},
            pattern => qr/^ad.anynet.id=(\S+)/
		);

        return $AnyDeskIDString;
    }

}

1;

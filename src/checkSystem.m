function checkSystem(callerName)
% devTools
%
% PURPOSE: checks the configuration of the system (installation of git and curl)
%

    global gitConf
    global gitCmd

    confDevTools;

    if nargin < 1
        callerName = '';
    else
        callerName = ['(caller: ', callerName, ')'];
    end

    % check if git is properly installed
    [status_gitVersion, result_gitVersion] = system('git --version');

    if status_gitVersion == 0 && strfind(result_gitVersion, 'git version')
        if gitConf.verbose
            fprintf([gitCmd.lead, ' [', mfilename, ']', callerName, ' git is properly installed.', gitCmd.success, gitCmd.trail]);
        end
    else
        result_gitVersion
        error([gitCmd.lead, ' [', mfilename, ']', callerName, ' git is not installed. Please follow the guidelines how to install git.']);
    end

    % check if curl is properly installed
    [status_curl, result_curl] = system('curl --version');

    if status_curl == 0 && strfind(result_curl, 'curl') && strfind(result_curl, 'http')
        if gitConf.verbose
            fprintf([gitCmd.lead, ' [', mfilename, ']', callerName, ' curl is properly installed.', gitCmd.success, gitCmd.trail]);
        end
    else
        error([gitCmd.lead, ' [', mfilename, ']', callerName, ' curl is not installed. Please follow the guidelines how to install curl.']);
    end
end

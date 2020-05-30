function PrintContentLine( value, type )

switch type
    case 'id'
        fprintf('%d || ', double(value));
    case 'variable'
        fprintf('%9.15f || ', double(value));
    case 'error'
        fprintf('%9.15e ||\n', double(value));
    otherwise
        warning('Data output type format not yet defined.');
end


unit gs6_cnst;
{-----------------------------------------------------------------------------
                                 Constant Values

       gs6_cnst Copyright (c) 1998 Griffin Solutions, Inc.

       Date
          14 May 1998

       Programmer:
          Richard F. Griffin                     tel: (912) 953-2680
          Griffin Solutions, Inc.             e-mail: halcyon@grifsolu.com
          102 Molded Stone Pl
          Warner Robins, GA  31088

       -------------------------------------------------------------
       This unit handles the constant strings that are used for messages.
       They are placed here for easier internationalization.

   Changes:
------------------------------------------------------------------------------}
interface

resourcestring
   gsErrHalcyonError      = 'Halcyon Error';
   gsErrHalcyonSubCode    = 'Subcode';

   gsErrTableIsNil        = 'A table is not assigned to this object';
   gsErrTableIsActive     = 'Cannot perform this operation on an open table';
   gsErrOverwriteTable    = 'Table exists.  Do you want to overwrite?';
   gsErrInvalidFieldList  = 'Field list is invalid';
   gsErrNoTableName       = 'Table name missing';
   gsErrCannotFindFile    = 'Cannot find file %s';
   gsErrErrorGettingFile  = 'Error getting %s';
   gsErrIndexAlreadyOpen  = 'Index file %s already open';
   gsErrRecordOutOfRange  = 'Record request beyond range of table';
   gsErrDeleteRecord      = 'Cannot delete the record';
   gsErrUnDeleteRecord    = 'Cannot recall the record';
   gsErrInvalidBookmark   = 'Bookmark is invalid for table ';
   gsErrRecordLockAlready = 'Record is locked by another user';
   gsErrBusyIndexing      = 'Table is busy building an index';
   gsErrBusyCopying       = 'Table is busy copying';
   gsErrFilterExpression  = 'Filter expression must return boolean result';
   gsErrNotBrowsing       = 'Dataset is not in browse mode';
   gsErrNotEditing        = 'Dataset not in edit or insert mode';
   gsErrDataSetReadOnly   = 'Cannot modify a read-only dataset';
   gsErrRelationIndex     = 'Master/Detail relation failed, no index open for %s';
   gsErrRelationFields    = 'Master/Detail relation failed, field missmatch for %s';
   gsErrAliasAssigned     = 'Alias %s already assigned';
   
   {gsd6file}
   gsErrInvalidFileObject = 'File object class is invalid or nil';
   gsErrPathNotFound      = 'Path %s not found';
   gsErrAccessDenied      = 'File %s access denied';
   gsErrLockViolated      = 'File %s lock violated';
   gsErrFileAlreadyOpen   = 'File %s is open by another process';

   {gsd6sql}
   gsErrNoSuchFunction   = 'There is no function for %s';
   gsErrArgValueNeeded   = '%s needed for Argument %d of %s';
   gsErrMissingSide      = 'Target value missing for %s operation';
   gsErrOpConflict       = 'The two sides of an operation do not match';
   gsErrArgInvalid       = 'A %s value is required but invalid';
   gsErrFieldInvalid     = 'Field/variable %s is unknown';
   gsErrConstructBad     = 'Expression cannot be evaluated';
   gsErrNoEndParend      = 'Missing closing parentheses';
   gsErrBadEndParend     = 'Unexpected closing parentheses found';

   {Miscellaneous}
   gsErrVariantAppend    = 'Variant type is not valid for append';
   gsErrVariantTypes     = 'Variant types mismatch for compare';
   gsErrVariantSort      = 'Variant type cannot be sorted';
   gsErrSortSize         = 'Sort key length greater than 240 bytes';
   gsErrSortBegun        = 'Cannot add sort keys after beginning retrieval';
   gsErrCollectionIndex  = 'Collection index out of range';
   gsErrFieldData        = 'Field data is incorrect for %s';
   gsErrFieldDate        = 'Invalid date in field %s';
   gsErrFieldName        = 'There is no field %s';
   gsErrFieldNumber      = 'Invalid number in field %s';
   gsErrFieldPosition    = 'Invalid field number %s in %s';
   gsErrFieldType        = 'Field %s is the incorrect type';
   gsErrBadMemoRecord    = 'Memo mecord is bad in %s';
   gsErrDBFHeader        = 'Table Header for %s is invalid';
   gsErrFileSize         = 'Error %s in FileSize of %s';
   gsErrIndexKeySync     = 'Cannot find key in %s to match current record';
   gsErrIndexOpen        = 'Index file %s had errors on open';
   gsErrIndexTagMissing  = 'Cannot find index tag %s';
   gsErrIndexTagEmpty    = 'Tag field is empty';
   gsErrIndexCollate     = 'General collate is invalid';
   gsErrIndexFind        = 'No index is assigned for Find operation';
   gsErrIndexKey         = 'No index key has been created';
   gsErrFlushError       = 'Error %s in Flush of %s';
   gsErrLockError        = 'Error %s in Lock of %s';
   gsErrNoSuchFile       = 'Error %s, file %s not found';
   gsErrReadError        = 'Error %s in Read of %s';
   gsErrResetError       = 'Error %s in Reset of %s';
   gsErrRewriteError     = 'Error %s in Rewrite of %s';
   gsErrTruncateError    = 'Error %s in Truncate of %s';
   gsErrUnlockError      = 'Error %s in Unlock of %s';
   gsErrWriteError       = 'Error %s in Write of %s';
   gsErrUnExpectedPassword = 'A Password is included for unencrypted file %s';
   gsErrNoPassword       = 'No Password for encrypted file %s';
   gsErrBadPassword      = 'Invalid Password for encrypted file s%';

implementation

end.

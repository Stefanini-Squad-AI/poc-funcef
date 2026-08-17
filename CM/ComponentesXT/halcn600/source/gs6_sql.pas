unit gs6_sql;
{-----------------------------------------------------------------------------
                          Basic Expression Resolver

       gs6_sql Copyright (c) 1998 Griffin Solutions, Inc.

       Date
          4 Mar 1998

       Programmer:
          Richard F. Griffin                     tel: (912) 953-2680
          Griffin Solutions, Inc.             e-mail: halcyon@grifsolu.com
          102 Molded Stone Pl
          Warner Robins, GA  31088

       -------------------------------------------------------------
       This unit evaluates expressions and returns the result.

   Changes:

------------------------------------------------------------------------------}
interface
uses
   {$IFDEF WIN32}
   Windows,
   {$ELSE}
   WinTypes,
   WinProcs,
   {$ENDIF}
   SysUtils,
   Classes,
   gs6_cnst,
   gs6_tool,
   gs6_date,
   gs6_glbl;

type
   TgsExpressionType  = (etUnknown, etAbsorbed, etContainer, etOperator,
                           etFunction, etFieldVar, etTextLit, etNumLit,
                           etDateLit, etBlnLit, etVariable);

   TgsExpResultType   = (rtUnknown, rtEmpty, rtAny, rtText, rtFloat, rtInteger,
                           rtDate, rtDateTime, rtBoolean, rtMemo, rtPointer);

   TgsExpHandler = class;
   TgsExpFunction = class;

   TgsUserDefFunction = class(TObject)
   (*An object of TgsUserDefFunction is created for each function registered in
     the expression handler.  This class provides the actual code to handle the
     specific function calculation.*)
   public
      function FunctionName: string; virtual;
      (*Returns the function name of the owner of this object.  The result string
        is typically used in the search for the name of a function assigned in an
        expression.*)

      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                              var ExpResult: TgsExpResultType): boolean; virtual;
      (*This method is used to return the results expected for this specific
        function.  The function return value is placed in Buffer.  The resut
        type is returned in ExpResult.  A result of true is returned upon the
        successful completion of the calculation.*)
   end;

   TgsUserDefFieldVar = class(TObject)
   (*An object of TgsUserDefFieldVar is created for each variable registered in
     the expression handler.  This class provides the actual code to return the
     variable value to the expression handler.*)
   private
      FName: PChar;
      FVarLen: integer;
   public
      constructor Create(AName: PChar);
      (*Creates an instance of the class TgsUserDefFieldVar for the variable AName.*)
      destructor Destroy; override;
      (*Releases memory allocated for the variable name string and frees the class.*)

      function FieldVarName: string; virtual;
      (*Returns the variable name of the owner of this object.  The result string
        is typically used in the search for the name of a variable assigned in an
        expression.*)

      function FieldVarType: integer; virtual;
      (*Returns the variable type of the owner of this object.  The result integer
        default is 0.  Descendants will pass their own type for use in enumerating
        a list of specific variable types (for example, for database fields) of a
        variable assigned in an expression.*)

      function FieldVarResult(var BufVar: variant;
                              var ExpResult: TgsExpResultType): boolean; virtual;
      (*This method is used to return the results expected for this specific
        variable.  The variable return value is placed in Buffer.  The resut
        type is returned in ExpResult.  A result of true is returned upon the
        successful retrieval of the variable.*)

      property VarLength: integer read FVarLen write FVarLen;
      (*Property returns the fixed length for a numeric field.  This is needed
        when several numeric fields are combined to determine the size of a result
        string of the value.  Used internally for numeric fields*)
   end;

   TgsFunctionReg = class(TList)
   (*Container class for TgsUserDefFunction objects.  Used to access each of
     the objects by reference to its Index value.*)
   public
      destructor Destroy; override;
      (*Frees all TgsUserDefFunction objects contained in the list.*)

      function RegisterFunction(AFunction: TgsUserDefFunction): boolean;
      (*Adds the TgsUserDefFunction object to the end of the list.  Returns
        true if successful.*)

      function FunctionName(Index: integer): string;
      (*Returns the name of the TgsUserDefFunction object stored at Index in the
        list.  Returns an empty string if the Index is not valid.*)

      function FunctionLink(Index: integer): TgsUserDefFunction;
      (*Returns The pointer to the TgsUserDefFunction object stored at Index in
        the list.  Returns nil if the index is not valid.*)
   end;

   TgsFieldVarReg = class(TList)
   (*Container class for TgsUserDefFieldVar objects.  Used to access each of
     the objects by reference to its Index value.*)
   public
      destructor Destroy; override;
      (*Frees all TgsUserDefFieldVar objects contained in the list.*)

      function RegisterFieldVar(AFieldVar: TgsUserDefFieldVar): boolean;
      (*Adds the TgsUserDefFieldVar object to the end of the list.  Returns
        true if successful.*)

      function FieldVarName(Index: integer): string;
      (*Returns the name of the TgsUserDefFieldVar object stored at Index in the
        list.  Returns an empty string if the Index is not valid.*)

      function FieldVarType(Index: integer): integer;
      (*Returns the variable type of the TgsUserDefFieldVar object stored at
        Index in the list.  Returns zero if the Index is not valid.*)

      function FieldVarLink(Index: integer): TgsUserDefFieldVar;
      (*Returns The pointer to the TgsUserDefFieldVar object stored at Index in
        the list.  Returns nil if the index is not valid.*)
   end;

   TgsExpUserLink = class(TObject)
   (*Handler class to manage user-registered functions and variables.*)
   private
      UserFunctionRegistry: TgsFunctionReg;
      UserFieldVarRegistry: TgsFieldVarReg;
      FStrSize: integer;
   public
      constructor Create;
      (*Creates a TgsExpUserLink instance and allocates TgsFunctionReg and
        TgsFieldVar containers to hold function and variable objects.*)

      destructor Destroy; override;
      (*Frees the TgsFunctionReg and TgsFieldVar containers that were used to
        hold function and variable objects.*)

      function FindFunction(const AFunction: string): TgsUserDefFunction; virtual;
      (*Searches the TgsFunctionRef container to find a function name to match
        AFunction.  Returns the pointer to the function if found, otherwise it
        returns nil.*)

      function FindFieldVar(const AFieldVar: string): TgsUserDefFieldVar; virtual;
      (*Searches the TgsFieldVarReg container to find a variable name to match
        AFieldVar.  Returns the pointer to the variable function if found,
        otherwise it returns nil.*)

      function RegisterFunction(AFunction: TgsUserDefFunction): boolean;
      (*Registers a user function in the TgsFunctionRef container.  Returns true
        if successful.*)

      function RegisterFieldVar(AFieldVar: TgsUserDefFieldVar): boolean;
      (*Registers a user variable in the TgsFieldVarRef container.  Returns true
        if successful.*)

      function OnNoFunction(const AFunction: string): TgsUserDefFunction; virtual;

      property DefaultStrSize: integer read FStrSize write FStrSize;
      (*Returns the default string length used for Str functions when the
        length argument is not provided.  The internal default is 10 characters.*)
   end;

   TgsExpBaseObject = class(TObject)
   (*Base object class for all espression process classes.  Expression process
     classes are those such as TgsExpFunction that handles processing functions,
     TgsExpOperator that handle operator actions (+,-,*,/,and,or,not), and
     literal classes such as TgsTextLit, TgsDateLit,TgsBlnLit, and TgsNumLit
     that hold constant values.*)
   private
      FExpType     : TgsExpressionType;
      FResultType  : TgsExpResultType;
      FExpChg      : Boolean;
      FExpLen      : integer;
      FExpDec      : integer;
      FArgLeft     : TgsExpBaseObject;
      FArgRight    : TgsExpBaseObject;
   public
      constructor  Create;
                   (*Initializes internal values.*)

      destructor   Destroy; override;
      (*Frees expression process classes this object owns.*)

      function     ExpObjectContains: string; virtual;
      (*Returns the function/variable name, literal, or operator assigned to
        this object.*)

      function     ExpObjectType: integer; virtual;
      (*Returns the type of the object linked to this object.  Can be used to
        determine the kind of link (database, local, etc)*)

      function     ExpRebuildExpression: string; virtual;
      (*Reconstructs the expression by calling ExpObjectContains for all the
        FArgLeft and FArgRight expression processes and properly formating
        those strings with its own ExpObjectContains string.*)

      function     ExpEnumTypes(AType: integer): string; virtual;

      procedure    ExpParse(var BufVar: variant;
                            var ExpResult: TgsExpResultType); virtual;
     (*Retrieves the calculated values for all subordinate expression processes
       and places the final calculated result in Buffer.  The Result Type is
       placed in ExpResult.  If successful, address of Buffer is returned as the
       result, otherwise nil is returned.*)
   end;

   TgsExpContainer = Class(TgsExpBaseObject)
   (*Holder class that contains a grouped collection of expression elements
     that were enclosed in parentheses.  This object is then passed as the
     left or right argument of an operator.*)
   public
      constructor   Create(AOwner: TgsExpHandler; AValue: PChar);
      (*Creates a holder object that contains the expression elements in AValue.
        This class is allocated as the original expression is generated and part
        of the expression is contained in parends.  For example, if the
        expression 1+2*(3+4)-5 was assigned to the expression handler, it would
        send the (3+4) to a TgsExpContainer object, where it would be processed.
        Then, the expression handler would deal only with this object when it
        needed to calculate the result: 1+2*object-5.  Note that when Avalue is
        processed, it may generate TgsExpContainer or TgsExpFunction objects
        owned by this object if there are parend groups or functions inside AValue.*)

      function      ExpRebuildExpression: string; override;
      (*Reconstructs the expression by calling ExpObjectContains for the
        FArgLeft and FArgRight expression processes and properly formating those
        strings with its own ExpObjectContains string.  This string is enclosed
        in parends and returned.*)

      function     ExpEnumTypes(AType: integer): string; override;

      procedure    ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType); override;
      (*Retrieves the calculated values for all subordinate expression processes
        and places the final calculated result in Buffer.  The Result Type is
        placed in ExpResult.  If successful, address of Buffer is returned as
        the result, otherwise nil is returned.*)
   end;

   TgsExpFunction = Class(TgsExpBaseObject)
   (*Holder class for a function.  This class will link to the correct function
     and handle assembling the function argument list.*)
   private
      FOwner        : TgsExpHandler;
      FUDF          : TgsUserDefFunction;
      FArgList      : TList;
   protected
      function      FetchUser: TgsExpUserLink;
   public
      constructor   Create(AOwner: TgsExpHandler; AValue: PChar);
      (*Creates a holder object that contains the function expression in AValue.
        This class is allocated as the original expression is generated and part
        of the expression is identified as a function.  An argument list is
        allocated to hold the expression processes that constitute the arguments
        for the function.  For example, if the expression PadR('Hello',9)+'World'
        was assigned to the expression handler, it would send the PadR('Hello',9)
        to a TgsExpFunction object, where it would be processed. The function
        for PadR (a descendant of TgsUserDefFunction) would be located and saved
        in this object.  First, the system functions would be searched for a
        match with AValue. If this is unsuccessful, the UserLink of the owner
        expression handler in AOwner is searched. If the function is not found,
        an exception is raised.  The expression processes for 'Hello" and 9
        would be stored in the object's argument list. Then, the expression
        handler would deal only with this object when it needed to calculate the
        result: object+'World'.  Note that when Avalue is processed, it may
        generate TgsExpContainer or TgsExpFunction objects owned by this object
        if there are parend groups or functions inside AValue.*)

      destructor    Destroy; override;
      (*Frees the argument list created for this function.*)

      function      ExpObjectContains: string; override;
      (*Returns the name of the function linked to this object.*)

      function      ExpRebuildExpression: string; override;
      (*Reconstructs the expression by calling ExpObjectContains for each of the
        argument list expression processes and properly formating those strings
        with its own ExpObjectContains string to construct the complete function
        string.*)

      function     ExpEnumTypes(AType: integer): string; override;

      procedure    ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType); override;
      (*Calls the TgsUserDefFunction.ExpParse method of the function linked to
        this object. The final calculated result is returned in Buffer.  The
        Result Type is returned in ExpResult. If successful, address of Buffer
        is returned as the result, otherwise nil is returned.*)

     procedure      FetchArg(Index: integer; var BufVar: variant;
                       var ExpResult:  TgsExpResultType;
                       ExpResultNeeded: TgsExpResultType);
     (*Method that is called by the TgsUserDefFunction.ExpParse method of the
       function linked to this object to retrieve the argument located at Index.
       If Index is valid, the ExpParse method of the expression process in the
       argument list is called.  If the returned ExpResult result is not equal
       to ExpResultNeeded or rtAny, an exception is raised.  If successful, the
       result is returned in Buffer and the result type is returned in ExpResult.*)
   end;

   TgsExpFieldvar = Class(TgsExpBaseObject)
   (*Holder class for a variable.  A variable can be any value generated by the
     user application.  Database fields are considered variables and can be
     retrieved through this object type.*)
   private
      FOwner        : TgsExpHandler;
      FUDF          : TgsUserDefFieldVar;
   protected
      function      FetchUser: TgsExpUserLink;
   public
      constructor   Create(AOwner: TgsExpHandler; AValue: PChar);
      (*Creates a holder object that contains the variable expression in AValue.
        This class is allocated as the original expression is generated and part
        of the expression is identified as a variable.  The variable expression
        process (a descendant of TgsUserDefFieldVar) would be located and saved
        in this object by searching the UserLink of the owner expression handler
        in AOwner.  If the variable is not found, an exception is raised.*)

      function      ExpObjectContains: string; override;
      (*Returns the name of the variable linked to this object.*)

      function      ExpObjectType: integer; override;
      (*Returns the type of the variable linked to this object.  Can be used to
        determine the kind of link (database, local, etc)*)

      procedure    ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType); override;
      (*Calls the TgsUserDefFieldVar.ExpParse method of the variable linked to
        this object. The result is returned in Buffer. The Result Type is
        returned in ExpResult.*)
   end;

   TgsExpOperator = Class(TgsExpBaseObject)
   (*Holder class for an operator.  The operator can be for numeric, relational,
     or string concatenation operations*)
   private
      FOperator     : char;
      FPrecedence   : char;
      FInsensitive  : boolean;
      FWildCards    : boolean;
      FWildCharAll  : char;
      FWildCharOne  : char;
   protected
      function StrWCComp(vStr1, vStr2 : variant): Integer;
   public
      constructor   Create(AOperator, APrecedence: char);
      (*Creates the holder class for the operator identified in AOperator.
        The precedence of the operator is saved using the value of APrecedence.
        This determines the order in which operations are sequenced.*)

      function      ExpObjectContains: string; override;
      (*Returns the symbol of the operator linked to this object.*)

      procedure    ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType); override;
      (*Calls ExpParse for the FArgLeft and FArgRight expression processes and
      then acts based on the operator and places the final calculated result in
      Buffer.  The Result Type is placed in ExpResult.  If the operation cannot
      be done on the two arguments, an exception is raised*)
   end;

   TgsExpTextLit = Class(TgsExpBaseObject)
   (*Holder class for a text literal.*)
   private
      FExpValue     : PChar;
   public
      constructor   Create(AValue: PChar);
      (*Creates a holder object that contains the literal text value in AValue.
        This class is allocated as the original expression is generated and part
        of the expression is identified as a text literal.*)

      destructor    Destroy; override;
      (*Frees the memory allocated to hold the text literal value.*)

      function      ExpObjectContains: string; override;
     (*Returns the text literal.*)

      procedure    ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType); override;
     (*Returns the text literal in Buffer.  Returns rtText in ExpResult.*)
   end;

   TgsExpNumLit = Class(TgsExpBaseObject)
   (*Holder class for a numeric literal.*)
   private
      FExpFloat     : FloatNum;
   public
      constructor   Create(AValue: PChar);
      (*Creates a holder object that contains the literal numeric value stored
        in AValue. This class is allocated as the original expression is
        generated and part of the expression is identified as a numeric literal.*)

      function      ExpObjectContains: string; override;
      (*Returns the numeric literal as a string.*)

      procedure    ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType); override;
    (*Returns the numeric literal as a FloatNum type in Buffer.  Returns rtFloat
      in ExpResult.*)
   end;

   TgsExpDateLit = Class(TgsExpBaseObject)
   (*Holder class for a date literal.*)
   private
      FExpDate     : FloatNum;
   public
      constructor   Create(AValue: PChar);
      (*Creates a holder object that contains the literal date value stored
        in AValue. This class is allocated as the original expression is
        generated and part of the expression is identified as a date literal.*)

      function      ExpObjectContains: string; override;
      (*Returns the date literal as a Julian Date string.*)

      procedure    ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType); override;
    (*Returns the numeric literal as a FloatNum type in Buffer.  Returns rtDate
      in ExpResult.*)
   end;

   TgsExpBlnLit = Class(TgsExpBaseObject)
   (*Holder class for a boolean literal.*)
   private
      FExpLogic     : boolean;
   public
      constructor   Create(AValue: PChar);
      (*Creates a holder object that contains the literal boolean value stored
        in AValue. This class is allocated as the original expression is
        generated and part of the expression is identified as a boolean literal.*)

      function      ExpObjectContains: string; override;
      (*Returns the boolean literal as '.T.' or '.F.'.*)

      procedure    ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType); override;
    (*Returns the boolean literal as a boolean type in Buffer.  Returns rtBoolean
      in ExpResult.*)
   end;

   TgsExpHandler = Class(TObject)
   (*An Expression Handler class compiles and evaluates an expression that is
     assigned to it.  The expression can be any type commonly used in dBase
     index key and filter expressions.   Additionally, SQL Select..Where style
     expressions can be processed.*)
   private
      FUserLink   : TgsExpUserLink;
      FResultType  : TgsExpResultType;
      FExpChg      : Boolean;
      FExpLen      : integer;
      FExpDec      : integer;
      FParseObj    : TgsExpBaseObject;
      FArgCount    : integer;
      FInsensitive : boolean;
      FWildCards   : boolean;
      FWildCharAll : char;
      FWildCharOne : char;
      function     CompressExpression(Buffer, ExpSource: PChar): PChar;
      function     GenerateObjects(Buffer: PChar): TgsExpBaseObject;
      function     GetExpression: string; virtual;
      procedure    SetExpression(const AExpression: string);
   public
      constructor  Create(AUser: TgsExpUserLink; AExpression: PChar; IsSQL: boolean);
      (*Initializes the expression handler parameters.  Argument AUser is the
        TgsExpUserLink object that allows external variables and functions to be
        included in the expression compilation and evaluation.  AExpression is the
        expression to be compiled.  It can be nil, and the Expression passed in the
        Expression property later.  IsSQL is a boolean identifying whether dBase
        or SQL wildcard tokens will be used.*)

      destructor   Destroy; override;
      (*Frees resources allocated for the object.*)

      procedure ExpressionResult(var BufVar: variant); virtual;
      (*Requests the Expression be evaluated and the results returned in Buffer.
        The requestor will need to get the type through a call to ResultType to
        determine the type of value returned.  If successful, Result returns
        Buffer; otherwise it returns nil.*)

      procedure     ExpressionAsVariant(var AVar: TgsVariant); virtual;
      (*Requests the Expression be evaluated and the results returned in AVar as
        a TgsVariant.*)

      function     ResultType: TgsExpResultType;
      (*Returns the type of value (rtText, rtDate, rtBoolean, rtFloat, etc.) to
        which the expression evaluates.*)

      function     EnumerateType(AType: integer): string;

      property     UserLink: TgsExpUserLink read FUserLink write FUserLink;
      (*Returns the pointer to the user link attached to this object.*)

      property     Expression: string read GetExpression write SetExpression;
      (*This property sets the expression or returns the expression string.  If
        assigning a new expression, the expression processes assigned to the
        old expression are released and new ones created as the new expression is
        compiled.*)
      property     ArgCount: integer read FArgCount;
      (*Returns the number of expression processes allocated for the expression.*)

      property     DecimalCount: integer read FExpDec;
      (*Used to return the number of decimals to be used when a number (rtFloat)
        is converted to a string.  This is needed for dBase fields returned as
        variables since they specify the number of decimal places, but are handled
        as floating point numbers.*)

      property     NumberLength: integer read FExpLen;
      (*Used to return the number of digits (including decimal point) to be used
        when a number (rtFloat) is converted to a string.  This is needed for
        dBase fields returned as variables since they specify the field length,
        but are handled as floating point numbers.*)

      property     CaseInsensitive: boolean read FInsensitive write FInsensitive;
      (*Flag determines if a text comparison is case insensitive.*)

      property     UseWildCards: boolean read FWildCards write FWildCards;
      (*Flag determines if wild cards can be used in a text comparison.*)

      property     WildCardAll: char read FWildCharAll write FWildCharAll;
      (*Assigns the wild card character that is used to designate any number
        of characters is valid.  The default is '*'.  (e.g. 'SM*' would match
        any string that started with SM, for example, SMITH and SMYTHE).  If the
        expression handler was created with IsSQL true, then the '%' character
        is automatically assigned.*)

      property     WildCardOne: char read FWildCharOne write FWildCharOne;
      (*Assigns the wildcard character used to designate a single place
        wildcard.  The default is '?'.  (e.g., GRIFF?N would match GRIFFIN and
        GRIFFEN). If the expression handler was created with IsSQL true, then
        the '_' character is automatically assigned.*)
   end;

   EHalcyonExpression = class(Exception);

var
   GSFunctionRegistry: TgsFunctionReg;

implementation

const
   DefStrLen   = 10;
   EmptyDate   = 1E100;
   DateDescendMax = 5231808;
   WildCardChar1 = '*';
   WildCardChar2 = '%';
   WildCardChar3 = '?';
   WildCardChar4 = '_';

   exOpStrings = 'T@F@TRUE@FALSE@;-@;-@;-@;-@;-@AND@OR@NOT@';
   exOpStringSQL = 'T@F@TRUE@FALSE@EQ@LE@LT@GE@GT@AND@OR@NOT@LIKE@POS@';
  exOpT      = 1;
   exOpF      = 3;
   exOpTLong  = 5;
   exOpFLong  = 10;
   exOpEQ     = 16;
   exOpLE     = 19;
   exOpLT     = 22;
   exOpGE     = 25;
   exOpGT     = 28;
   exOpAND    = 31;
   exOpOR     = 35;
   exOpNOT    = 38;
   exOpLIKE   = 42;
   exopPOS    = 47;

   opTypeUnary = #$02;   {unary operators}
   opTypeMult  = #$03;   {multiplying operators}
   opTypeAdd   = #$04;   {adding operators}
   opTypeRelat = #$05;   {relational operators}
   opTypeRelNot= #$06;   {relational NOT}
   opTypeRelAnd= #$07;   {relational AND}
   opTypeRelOr = #$08;   {relational OR}
   opTypeGrpBg = #$09;   {grouped characters start}
   opTypeGrpEn = #$0A;   {grouped characters end}
   opTypeTxtBg = #$0B;   {literal text begin}
   opTypeTxtEn = #$0C;   {literal text end}
   opTypeDteBg = #$0D;   {literal date begin}
   opTypeDteEn = #$0E;   {literal date end}
   opTypeBlnLt = #$1A;   {literal boolean}
   opTypeComma = #$1B;   {comma delimiter in function args}
   opTypeSpace = #$1C;   {space character}
   opTypeFunct = #$1D;   {function}
   opTypeVarFld= #$1E;   {variable or field}
   opTypeNumLt = #$1F;   {numeric literal}

   opEQ        = #$81;   {=}
   opNE        = #$82;   {<>,!=,#}
   opGT        = #$83;   {>}
   opLT        = #$84;   {<}
   opGE        = #$85;   {>=,=>}
   opLE        = #$86;   {<=,=<}
   opPOS       = #$87;   { $}
   opExactEQ   = #$88;   {==}
   opPlus      = #$89;   {+}
   opMinus     = #$8A;   {-}
   opMultiply  = #$8B;   {*}
   opDivide    = #$8C;   {/}
   opExponent  = #$8D;   {**,^}
   opAND       = #$90;   {AND}
   opOR        = #$91;   {OR}
   opNOT       = #$92;   {NOT}
   opLike      = #$93;   {LIKE}
   opQuoteOpen = #$98;   {",',[}
   opQuoteEnd  = #$99;   {",',]}
   opGroupOpen = #$9A;   {(}
   opGroupEnd  = #$9B;   {)}
   opDateOpen  = #$9C;   {Open Brace}
   opDateEnd   = #$9D;   {Close Brace}
   opRefPtr    = #$9E;   {Reference Pointer (-> or .)}

   SingleQuote = '''';
   DoubleQuote = '"';

{---------------------------------------------------------------------------
                         User Defined Functions
----------------------------------------------------------------------------}
type
   TgsUDFAllTrim = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFAsc = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFAt = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFAtC = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFBetween = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFCeiling = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFChr = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFCTOD = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFDate = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFDescend = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFDOW = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFDTOC = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFDTOS = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFEmpty = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFFloor = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFIIF = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFInt = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFLeft = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFLen = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFLower = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFLTrim = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFMod = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFPadMain = class(TgsUserDefFunction)
      PadChar: char;
      PadSize: integer;
      PadText: string;
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

         TgsUDFPadC = class(TgsUDFPadMain)
            function FunctionName: string; override;
            function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                                    var ExpResult: TgsExpResultType): boolean; override;
         end;

         TgsUDFPadL = class(TgsUDFPadMain)
            function FunctionName: string; override;
            function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                                    var ExpResult: TgsExpResultType): boolean; override;
         end;

         TgsUDFPadR = class(TgsUDFPadMain)
            function FunctionName: string; override;
            function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                                    var ExpResult: TgsExpResultType): boolean; override;
         end;

   TgsUDFProper = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFRight = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFSoundex = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFSpace = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFStr = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

         TgsUDFStrZero = class(TgsUDFStr)
            function FunctionName: string; override;
            function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                            var ExpResult: TgsExpResultType): boolean; override;
         end;

   TgsUDFSubStr = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

   TgsUDFTrim = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

         TgsUDFRTrim = class(TgsUDFTrim)
            function FunctionName: string; override;
         end;

    TgsUDFUpper = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;

    TgsUDFVal = class(TgsUserDefFunction)
      function FunctionName: string; override;
      function FunctionResult(Caller: TgsExpFunction; var BufVar: variant;
                      var ExpResult: TgsExpResultType): boolean; override;
   end;



{---------------------------------------------------------------------------
                            Ceiling and Floor
----------------------------------------------------------------------------}

function Ceil(X: Extended): Integer;
begin
  Result := Integer(Trunc(X));
  if Frac(X) > 0 then
    Inc(Result);
end;

function Floor(X: Extended): Integer;
begin
  Result := Integer(Trunc(X));
  if Frac(X) < 0 then
    Dec(Result);
end;

{---------------------------------------------------------------------------
                             StrNumDec  (Decimal Places in Numeric String)
----------------------------------------------------------------------------}

function StrNumDec(Str1: PChar): integer;
var
   DecPos: PChar;
begin
   Result := 0;
   if Str1 <> nil then
   begin
      DecPos := StrPos(Str1,'.');
      if DecPos <> nil then
      begin
         inc(DecPos);
         Result := StrEnd(Str1)-DecPos;
      end;
   end;
end;

{---------------------------------------------------------------------------
                          TgsExpUserLink
----------------------------------------------------------------------------}

constructor TgsExpUserLink.Create;
begin
   inherited Create;
   UserFunctionRegistry := TgsFunctionReg.Create;
   UserFieldVarRegistry := TgsFieldVarReg.Create;
   FStrSize := DefStrLen;
end;

destructor TgsExpUserLink.Destroy;
begin
   UserFunctionRegistry.Free;
   UserFieldVarRegistry.Free;
   inherited Destroy;
end;

function TgsExpUserLink.FindFunction(const AFunction: string): TgsUserDefFunction;
var
   i: integer;
begin
   i := 0;
   while (i < UserFunctionRegistry.Count) and
         (UserFunctionRegistry.FunctionName(i) <> AFunction) do
      inc(i);
   if i < UserFunctionRegistry.Count then
      Result := UserFunctionRegistry.FunctionLink(i)
   else
      Result := nil;
end;

function TgsExpUserLink.FindFieldVar(const AFieldVar: string): TgsUserDefFieldVar;
var
   i: integer;
begin
   i := 0;
   while (i < UserFieldVarRegistry.Count) and
         (UserFieldVarRegistry.FieldVarName(i) <> AFieldVar) do
      inc(i);
   if i < UserFieldVarRegistry.Count then
      Result := UserFieldVarRegistry.FieldVarLink(i)
   else
      Result := nil;
end;

function TgsExpUserLink.RegisterFunction(AFunction: TgsUserDefFunction): boolean;
begin
   Result := UserFunctionRegistry.RegisterFunction(AFunction);
end;

function TgsExpUserLink.OnNoFunction(const AFunction: string): TgsUserDefFunction;
begin
   raise EHalcyonExpression.CreateFMT(gsErrNoSuchFunction,[AFunction]);
end;


function TgsExpUserLink.RegisterFieldVar(AFieldVar: TgsUserDefFieldVar): boolean;
begin
   Result := UserFieldVarRegistry.RegisterFieldVar(AFieldVar);
end;

{---------------------------------------------------------------------------
                        TgsFunctionReg
----------------------------------------------------------------------------}

destructor TgsFunctionReg.Destroy;
var
   i: integer;
begin
   for i := 0 to Count-1 do
   begin
      TgsUserDefFunction(Items[i]).Free;
   end;
   inherited Destroy;
end;

function TgsFunctionReg.RegisterFunction(AFunction: TgsUserDefFunction): boolean;
begin
   Result := true;
   if AFunction = nil then exit;
   try
      Add(AFunction);
   except
      Result := false;
   end;
end;

function TgsFunctionReg.FunctionName(Index: integer): string;
begin
   if (Index >= 0) and (Index < Count) then
      Result := TgsUserDefFunction(Items[Index]).FunctionName
   else
      Result := '';
end;

function TgsFunctionReg.FunctionLink(Index: integer): TgsUserDefFunction;
begin
   if (Index >= 0) and (Index < Count) then
      Result := TgsUserDefFunction(Items[Index])
   else
      Result := nil;
end;



{---------------------------------------------------------------------------
                        TgsFieldVarReg
----------------------------------------------------------------------------}

destructor TgsFieldVarReg.Destroy;
var
   i: integer;
begin
   for i := 0 to Count-1 do
   begin
      TgsUserDefFieldVar(Items[i]).Free;
   end;
   inherited Destroy;
end;

function TgsFieldVarReg.RegisterFieldVar(AFieldVar: TgsUserDefFieldVar): boolean;
begin
   Result := true;
   try
      Add(AFieldVar);
   except
      Result := false;
   end;
end;

function TgsFieldVarReg.FieldVarName(Index: integer): string;
begin
   if (Index >= 0) and (Index < Count) then
      Result := TgsUserDefFieldVar(Items[Index]).FieldVarName
   else
      Result := '';
end;

function TgsFieldVarReg.FieldVarType(Index: integer): integer;
begin
   if (Index >= 0) and (Index < Count) then
      Result := TgsUserDefFieldVar(Items[Index]).FieldVarType
   else
      Result := 0;
end;

function TgsFieldVarReg.FieldVarLink(Index: integer): TgsUserDefFieldVar;
begin
   if (Index >= 0) and (Index < Count) then
      Result := TgsUserDefFieldVar(Items[Index])
   else
      Result := nil;
end;


{---------------------------------------------------------------------------
                      Abstract TgsUserDefFunction
----------------------------------------------------------------------------}

function TgsUserDefFunction.FunctionName: string;
begin
   FunctionName := '';
end;

function TgsUserDefFunction.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
begin
   FunctionResult := false;
end;

{---------------------------------------------------------------------------
                            TgsUserFieldVar
----------------------------------------------------------------------------}

constructor TgsUserDefFieldVar.Create(AName: PChar);
begin
   Inherited Create;
   FVarLen := 0;
   if AName <> nil then
   begin
      FName := StrNew(AName);
      {$IFDEF WIN32}
      CharUpperBuff(FName,StrLen(FName));
      {$ELSE}
      AnsiUpperBuff(FName,StrLen(FName));
      {$ENDIF}
   end
   else
      FName := nil;
end;

destructor TgsUserDefFieldVar.Destroy;
begin
   if FName <> nil then
      StrDispose(FName);
   inherited Destroy;
end;

function TgsUserDefFieldVar.FieldVarName: string;
begin
   if FName <> nil then
      FieldVarName := StrPas(FName)
   else
      FieldVarName := '';
end;

function TgsUserDefFieldVar.FieldVarType: integer;
begin
   Result := gsSQLTypeVarStd;
end;

function TgsUserDefFieldVar.FieldVarResult(var BufVar: variant;
                            var ExpResult: TgsExpResultType): boolean;
begin
   FieldVarResult := false;
end;

{---------------------------------------------------------------------------
                             AllTrim() Function
----------------------------------------------------------------------------}

function TgsUDFAllTrim.FunctionName: string;
begin
   FunctionName := 'ALLTRIM';
end;

function TgsUDFAllTrim.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   s: string;
   r: TgsExpResultType;
begin
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtText);
   s := BufVar;
   BufVar := Trim(s);
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                              ASC() Function
----------------------------------------------------------------------------}

function TgsUDFAsc.FunctionName: string;
begin
   FunctionName := 'ASC';
end;

function TgsUDFAsc.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   s: string;
   r: TgsExpResultType;
begin
   ExpResult := rtFloat;
   Caller.FetchArg(0, BufVar, r, rtText);
   if length(s) = 0 then s := #0;
   BufVar := ord(s[1]);
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             At() Function
----------------------------------------------------------------------------}

function TgsUDFAt.FunctionName: string;
begin
   FunctionName := 'AT';
end;

function TgsUDFAt.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   d: integer;
   p: integer;
   t: integer;
   w: floatnum;
   s1: string;
   s2: string;
begin
   ExpResult := rtFloat;
   d := 1;
   t := 0;
   Caller.FetchArg(0, BufVar, r, rtText);
   s1 := BufVar;
   Caller.FetchArg(1, BufVar, r, rtText);
   s2 := BufVar;
   Caller.FetchArg(2, BufVar, r, rtAny);
   if r = rtFloat then
   begin
      w := BufVar;
      d := trunc(w);
   end;
   while d > 0 do
   begin
      p := Pos(s1,s2);
      if p > 0 then
      begin
         t := t + p;
         s2 := copy(s2,p+1,length(s2));
         dec(d);
      end
      else
      begin
         d := 0;
      end;
   end;
   BufVar := t;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             AtC() Function
----------------------------------------------------------------------------}

function TgsUDFAtC.FunctionName: string;
begin
   FunctionName := 'ATC';
end;

function TgsUDFAtC.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   d: integer;
   p: integer;
   t: integer;
   w: floatnum;
   s1: string;
   s2: string;
begin
   ExpResult := rtFloat;
   d := 1;
   t := 0;
   Caller.FetchArg(0, BufVar, r, rtText);
   s1 := BufVar;
   s1 := UpperCase(s1);
   Caller.FetchArg(1, BufVar, r, rtText);
   s2 := BufVar;
   s2 := UpperCase(s2);
   Caller.FetchArg(2, BufVar, r, rtAny);
   if r = rtFloat then
   begin
      w := BufVar;
      d := trunc(w);
   end;
   while d > 0 do
   begin
      p := Pos(s1,s2);
      if p > 0 then
      begin
         t := t + p;
         s2 := copy(s2,p+1,length(s2));
         dec(d);
      end
      else
      begin
         d := 0;
      end;
   end;
   BufVar := t;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Between() Function
----------------------------------------------------------------------------}

function TgsUDFBetween.FunctionName: string;
begin
   FunctionName := 'BETWEEN';
end;

function TgsUDFBetween.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   x: TgsExpResultType;
   v1: variant;
   v2: variant;
   v3: variant;
   b: boolean;
begin
   ExpResult := rtBoolean;
   Caller.FetchArg(0, BufVar, x, rtAny);
   v1 := BufVar;
   Caller.FetchArg(1, BufVar, r, x);
   v2 := BufVar;
   Caller.FetchArg(2, BufVar, r, x);
   v3 := BufVar;
   b := (v1 >= v2) and (v1 <= v3);
   BufVar := b;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Ceiling() Function
----------------------------------------------------------------------------}

function TgsUDFCeiling.FunctionName: string;
begin
   FunctionName := 'CEILING';
end;

function TgsUDFCeiling.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   f: FloatNum;
begin
   ExpResult := rtFloat;
   Caller.FetchArg(0, BufVar, r, rtFloat);
   f := BufVar;
   f := ceil(f);
   BufVar := f;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Chr() Function
----------------------------------------------------------------------------}

function TgsUDFChr.FunctionName: string;
begin
   FunctionName := 'CHR';
end;

function TgsUDFChr.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   d: integer;
   c: char;
begin
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtFloat);
   d := BufVar;
   if (d < 0) or (d > 255) then
      raise EHalcyonExpression.CreateFMT(gsErrArgInvalid,['Byte']);
   c := chr(d);
   BufVar := c;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             CTOD() Function
----------------------------------------------------------------------------}

function TgsUDFCTOD.FunctionName: string;
begin
   FunctionName := 'CTOD';
end;

function TgsUDFCTOD.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   f: FloatNum;
   r: TgsExpResultType;
   j: longint;
   rtneeded: TgsExpResultType;
   s: string;
begin
   ExpResult := rtDate;
   rtneeded := rtText;
   Caller.FetchArg(0, BufVar, r, rtneeded);
   s := BufVar;
   if length(s) = 0 then
      f := EmptyDate
   else
   begin
      j := DBFDate.CTOD(s);
      f := j;
   end;
   BufVar := f;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Date() Function
----------------------------------------------------------------------------}

function TgsUDFDate.FunctionName: string;
begin
   FunctionName := 'DATE';
end;

function TgsUDFDate.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   d: longint;
begin
   ExpResult := rtDate;
   d := DBFDate.Date;
   BufVar := d;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Descend() Function
----------------------------------------------------------------------------}

function TgsUDFDescend.FunctionName: string;
begin
   FunctionName := 'DESCEND';
end;

function TgsUDFDescend.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   s: string;
   i: integer;
   b: boolean;
begin
   Caller.FetchArg(0, BufVar, r, rtAny);
   ExpResult := r;
   if r in [rtDate..rtDateTime] then
   begin
      if BufVar <> EmptyDate then
         BufVar := DateDescendMax-BufVar;
   end
   else
      if r in [rtFloat..rtInteger] then
      begin
         if BufVar <> 0.0 then
            BufVar := -BufVar;
      end
      else
         if r = rtText then
         begin
            s := BufVar;
            for i := 1 to length(s) do
            begin
               s[i] := chr(-ord(s[i]));
            end;
         end
         else
            if r = rtBoolean then
            begin
               b := BufVar;
               b := not b;
               BufVar := b;
            end
            else
               BufVar := false;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                              DOW() Function
----------------------------------------------------------------------------}

function TgsUDFDOW.FunctionName: string;
begin
   FunctionName := 'DOW';
end;

function TgsUDFDOW.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   f: FloatNum;
   r: TgsExpResultType;
   j: longint;
   rtneeded: TgsExpResultType;
   d: FloatNum;
   i: integer;
begin
   ExpResult := rtFloat;
   rtneeded := rtDate;
   Caller.FetchArg(0, BufVar, r, rtneeded);
   f := BufVar;
   if f <> EmptyDate then
   begin
      j := trunc(f);
      i := DBFDate.DOW(j);
      d := i;
   end
   else
      d := 0;
   BufVar := d;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             DTOC() Function
----------------------------------------------------------------------------}

function TgsUDFDTOC.FunctionName: string;
begin
   FunctionName := 'DTOC';
end;

function TgsUDFDTOC.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   f: FloatNum;
   r: TgsExpResultType;
   j: longint;
   rtneeded: TgsExpResultType;
   s: string;
   l: integer;
begin
   ExpResult := rtText;
   rtneeded := rtDate;
   Caller.FetchArg(0, BufVar, r, rtneeded);
   f := BufVar;
   if f <> EmptyDate then
   begin
      j := trunc(f);
      Caller.FetchArg(1, BufVar, r, rtAny);
      if r = rtFloat then
      begin
         l := BufVar;
      end
      else
      begin
         l := 0;
      end;
      if l = 1 then
         s := DBFDate.DTOS(j)
      else
         s := DBFDate.DTOC(j);
   end
   else
      s := DBFDate.DTOC(0);
   BufVar := s;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             DTOS() Function
----------------------------------------------------------------------------}

function TgsUDFDTOS.FunctionName: string;
begin
   FunctionName := 'DTOS';
end;

function TgsUDFDTOS.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   f: FloatNum;
   r: TgsExpResultType;
   j: longint;
   rtneeded: TgsExpResultType;
   s: string;
begin
   ExpResult := rtText;
   rtneeded := rtDate;
   Caller.FetchArg(0, BufVar, r, rtneeded);
   f := BufVar;
   if f <> EmptyDate then
   begin
      j := trunc(f);
      s := DBFDate.DTOS(j);
   end
   else
      s := '        ';
   BufVar := s;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Empty() Function
----------------------------------------------------------------------------}

function TgsUDFEmpty.FunctionName: string;
begin
   FunctionName := 'EMPTY';
end;

function TgsUDFEmpty.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   rtneeded: TgsExpResultType;
begin
   ExpResult := rtBoolean;
   rtneeded := rtAny;
   Caller.FetchArg(0, BufVar, r, rtneeded);
   if r in [rtDate..rtDateTime] then
   begin
      if (BufVar = EmptyDate) then
         BufVar := true
      else
         BufVar := false;
   end
   else
      if r in [rtFloat..rtInteger] then
      begin
         if (BufVar = 0.0) then
            BufVar := true
         else
            BufVar := false;
      end
      else
         if r = rtText then
         begin
            if length(BufVar) = 0 then
               BufVar := true
            else
               BufVar := false;
         end
         else
            if r = rtBoolean then
            begin
               BufVar := not BufVar;
            end
            else
               BufVar := false;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Floor() Function
----------------------------------------------------------------------------}

function TgsUDFFloor.FunctionName: string;
begin
   FunctionName := 'FLOOR';
end;

function TgsUDFFloor.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   f: FloatNum;
begin
   ExpResult := rtFloat;
   Caller.FetchArg(0, BufVar, r, rtFloat);
   f := floor(BufVar);
   BufVar := f;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             IIF() Function
----------------------------------------------------------------------------}

function TgsUDFIIF.FunctionName: string;
begin
   FunctionName := 'IIF';
end;

function TgsUDFIIF.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
begin
   ExpResult := rtEmpty;
   Caller.FetchArg(0, BufVar, r, rtBoolean);
   if BufVar then
      Caller.FetchArg(1,BufVar, ExpResult, rtAny)
   else
      Caller.FetchArg(2,BufVar, ExpResult, rtAny);
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Int() Function
----------------------------------------------------------------------------}

function TgsUDFInt.FunctionName: string;
begin
   FunctionName := 'INT';
end;

function TgsUDFInt.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   f: FloatNum;
begin
   ExpResult := rtFloat;
   Caller.FetchArg(0, BufVar, r, rtFloat);
   f := BufVar;
   f := int(f);
   BufVar := f;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Left() Function
----------------------------------------------------------------------------}

function TgsUDFLeft.FunctionName: string;
begin
   FunctionName := 'LEFT';
end;

function TgsUDFLeft.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   d: Cardinal;
   s: string;
   w: floatnum;
begin
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtText);
   s := BufVar;
   Caller.FetchArg(1, BufVar, r, rtFloat);
   w := BufVar;
   if w <= 0.01 then
      d := 0
   else
      d := trunc(w);
   BufVar := Copy(s,1,d);
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Len() Function
----------------------------------------------------------------------------}

function TgsUDFLen.FunctionName: string;
begin
   FunctionName := 'LEN';
end;

function TgsUDFLen.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   i: integer;
   r: TgsExpResultType;
begin
   ExpResult := rtFloat;
   Caller.FetchArg(0, BufVar, r, rtText);
   i := Length(BufVar);
   BufVar := i;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Lower() Function
----------------------------------------------------------------------------}

function TgsUDFLower.FunctionName: string;
begin
   FunctionName := 'LOWER';
end;

function TgsUDFLower.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   p: PChar;
begin
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtText);
   p := AllocMem(Length(BufVar)+1);
   StrPCopy(p,BufVar);
   CharLowerBuff(p,StrLen(p));
   BufVar := StrPas(p);
   FreeMem(p);
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             LTrim() Function
----------------------------------------------------------------------------}

function TgsUDFLTrim.FunctionName: string;
begin
   FunctionName := 'LTRIM';
end;

function TgsUDFLTrim.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   s: string;
   r: TgsExpResultType;
begin
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtText);
   s := BufVar;
   BufVar := TrimLeft(s);
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                                Mod() Function
----------------------------------------------------------------------------}

function TgsUDFMod.FunctionName: string;
begin
   FunctionName := 'MOD';
end;

function TgsUDFMOD.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   x: FloatNum;
   y: Floatnum;
   z: Floatnum;
   i: integer;
   j: integer;
begin
   ExpResult := rtFloat;
   Caller.FetchArg(0, BufVar, r, rtFloat);
   x := BufVar;
   Caller.FetchArg(1, BufVar, r, rtFloat);
   y := BufVar;
   i := trunc(x);
   j := trunc(y);
   z := i mod j;
   BufVar := z;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             PadMain() Function
----------------------------------------------------------------------------}

function TgsUDFPadMain.FunctionName: string;
begin
   FunctionName := '';
end;

function TgsUDFPadMain.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   isvalid: boolean;
begin
   ExpResult := rtText;
   Caller.FetchArg(2, BufVar, r, rtAny);
   case r of
      rtEmpty : begin
                   PadChar := ' ';
                   isvalid := true;
                end;
      rtText  : begin
                   PadText := BufVar;
                   if Length(PadText) = 1 then
                   begin
                      PadChar := PadText[1];
                      isvalid := true;
                   end
                      else isvalid := false;
                end;
      else      isvalid := false;
   end;
   if not isvalid then
      raise EHalcyonExpression.CreateFMT(gsErrArgInvalid,['Char']);
   Caller.FetchArg(0, BufVar, r, rtText);
   PadText := BufVar;
   Caller.FetchArg(1, BufVar, r, rtFloat);
   PadSize := BufVar;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             PadC() Function
----------------------------------------------------------------------------}

function TgsUDFPadC.FunctionName: string;
begin
   FunctionName := 'PADC';
end;

function TgsUDFPadC.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   i: integer;
   v: integer;
   p: PChar;
begin
   inherited FunctionResult(Caller, BufVar, ExpResult);
   i := Length(PadText);
   if i < PadSize then
   begin
      p := AllocMem(PadSize+1);
      FillChar(p[0],PadSize,PadChar);
      v := (PadSize - i) div 2;
      Move(PadText[1],p[v], i);
      BufVar := StrPas(p);
      FreeMem(p);
   end
   else
      BufVar := PadText;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             PadL() Function
----------------------------------------------------------------------------}

function TgsUDFPadL.FunctionName: string;
begin
   FunctionName := 'PADL';
end;

function TgsUDFPadL.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   i: integer;
   v: integer;
   p: PChar;
begin
   inherited FunctionResult(Caller, BufVar, ExpResult);
   i := Length(PadText);
   if i < PadSize then
   begin
      p := AllocMem(PadSize+1);
      FillChar(p[0],PadSize,PadChar);
      v := (PadSize - i);
      Move(PadText[1],p[v], i);
      BufVar := StrPas(p);
      FreeMem(p);
   end
   else
      BufVar := PadText;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             PadR() Function
----------------------------------------------------------------------------}

function TgsUDFPadR.FunctionName: string;
begin
   FunctionName := 'PADR';
end;

function TgsUDFPadR.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   i: integer;
   p: PChar;
begin
   inherited FunctionResult(Caller, BufVar, ExpResult);
   i := Length(PadText);
   if i < PadSize then
   begin
      p := AllocMem(PadSize+1);
      FillChar(p[0],PadSize,PadChar);
      Move(PadText[1],p[0], i);
      BufVar := StrPas(p);
      FreeMem(p);
   end
   else
      BufVar := PadText;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Proper() Function
----------------------------------------------------------------------------}

function TgsUDFProper.FunctionName: string;
begin
   FunctionName := 'PROPER';
end;

function TgsUDFProper.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   s: string;
   i: integer;
   chl: char;
   chc: char;
begin
   chl := #0;
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtText);
   s := BufVar;

   for i := 1 to Length(s) do
   begin
      chc := s[i];
      if chl in [#0,#$20..#$26,#$28..#$2F,#$3A..#$40,#$5B..#$5F,#$7B..#$7F] then
         CharUpperBuff(@chc,1)
      else
         CharLowerBuff(@chc,1);
      s[i] := chc;
      chl := chc;
   end;
   BufVar := s;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Right() Function
----------------------------------------------------------------------------}

function TgsUDFRight.FunctionName: string;
begin
   FunctionName := 'RIGHT';
end;

function TgsUDFRight.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   d: integer;
   l: integer;
   v: integer;
   s: string;
begin
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtText);
   s := BufVar;
   Caller.FetchArg(1, BufVar, r, rtFloat);
   d := trunc(BufVar);
   v := Length(s);
   if d < v then
   begin
      if d < 0 then
         d := 0;
      if d > 0 then
      begin
         l := v-d;
         s := copy(s,l+1,d);
      end;
   end;
   BufVar := s;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             RTrim() Function
----------------------------------------------------------------------------}

function TgsUDFRTrim.FunctionName: string;
begin
   FunctionName := 'RTRIM';
end;

{---------------------------------------------------------------------------
                             Soundex() Function
----------------------------------------------------------------------------}

function TgsUDFSoundex.FunctionName: string;
begin
   FunctionName := 'SOUNDEX';
end;

function TgsUDFSoundex.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   len: integer;
   C1: integer;
   s: string;
   s1: string;
begin
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtText);
   s := BufVar;
   len := Length(s);
   if len > 0 then
   begin
      s := UpperCase(s);
      if len > 1 then
      begin
         s1 := s[1];
         for C1 := 2 to len do
         begin
            {Assign a numeric value to each letter, except the first}
            case s[C1] of
               'B','F','P','V'                : s1 := s1 + '1';
               'C','G','J','K','Q','S','X','Z': s1 := s1 + '2';
               'D','T'                        : s1 := s1 + '3';
               'L'                            : s1 := s1 + '4';
               'M','N'                        : s1 := s1 + '5';
               'R'                            : s1 := s1 + '6';
               {All other letters, punctuation and numbers are ignored}
            end;
         end;
         {Go through the result, and remove any consecutive numeric values
          that are duplicates}
         s := s1[1];
         for C1 := 2 to len do
         begin
            if (s1[C1] <> s1[C1-1]) then
               s := s + s1[C1];
         end;
      end;
      {Maximum Soundex Length is 4, pad if less, then truncate}
   end;
   s := s + '0000';
   s := Copy(s,1,4);
   BufVar := s;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Space() Function
----------------------------------------------------------------------------}

function TgsUDFSpace.FunctionName: string;
begin
   FunctionName := 'SPACE';
end;

function TgsUDFSPACE.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   f: FloatNum;
   l: integer;
   s: string;
begin
   ExpResult := rtText;          {27 Jul 99}
   Caller.FetchArg(0, BufVar, r, rtFloat);
   f := BufVar;
   l := trunc(f);
   SetLength(s,l);
   FillChar(s[1],l,' ');
   BufVar := s;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Str() Function
----------------------------------------------------------------------------}

function TgsUDFStr.FunctionName: string;
begin
   FunctionName := 'STR';
end;

function TgsUDFStr.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   f: FloatNum;
   r: TgsExpResultType;
   l: integer;
   d: integer;
   h: integer;
   s: string;
   t: TgsExpUserLink;
begin
   ExpResult := rtText;
   d := 0;
   Caller.FetchArg(0, BufVar, r, rtFloat);
   f := BufVar;
   Caller.FetchArg(1, BufVar, r, rtAny);
   if r = rtFloat then
   begin
      l := BufVar;
      Caller.FetchArg(2, BufVar, r, rtAny);
      if r = rtFloat then
      begin
         d := BufVar;
      end;
   end
   else
   begin
      l := DefStrLen;
      t := Caller.FetchUser;
      if t <> nil then
      begin
         h := t.DefaultStrSize;
         if h > 0 then
            l := h;
      end;
   end;
   str(f:l:d,s);
   if Length(s) > l then
   begin
      s := '';
      while length(s) < l do s := s + '*';
   end;
   BufVar := s;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             StrZero() Function
----------------------------------------------------------------------------}

function TgsUDFStrZero.FunctionName: string;
begin
   FunctionName := 'STRZERO';
end;

function TgsUDFStrZero.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   i: integer;
   s: string;
begin
   inherited FunctionResult(Caller, BufVar, ExpResult);
   i := 1;
   s := BufVar;

   while (i <= length(s)) and (s[i] = ' ') do
   begin
      s[i] := '0';
      inc(i);
   end;
   BufVar := s;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             SubStr() Function
----------------------------------------------------------------------------}

function TgsUDFSubStr.FunctionName: string;
begin
   FunctionName := 'SUBSTR';
end;

function TgsUDFSubStr.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   l: integer;
   d: integer;
   v: integer;
   s: string;
begin
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtText);
   s := BufVar;
   Caller.FetchArg(1, BufVar, r, rtFloat);
   l := trunc(BufVar);
   v := length(s);
   if (l > v) or (l = 0) then
   begin
      s := '';
   end
   else
   begin
      Caller.FetchArg(2, BufVar, r, rtAny);
      if r = rtFloat then
         d := trunc(BufVar)
      else
         d := v;
      v := (v-l) + 1;
      if d > v then d := v;
      if d = 0 then
         s := ''
      else
         s := copy(s,l,d);
   end;
   BufVar := s;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Trim() Function
----------------------------------------------------------------------------}

function TgsUDFTrim.FunctionName: string;
begin
   FunctionName := 'TRIM';
end;

function TgsUDFTrim.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   s: string;
   r: TgsExpResultType;
begin
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtText);
   s := BufVar;
   s := TrimRight(s);
   BufVar := s;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Upper() Function
----------------------------------------------------------------------------}

function TgsUDFUpper.FunctionName: string;
begin
   FunctionName := 'UPPER';
end;

function TgsUDFUpper.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   p: PChar;
begin
   ExpResult := rtText;
   Caller.FetchArg(0, BufVar, r, rtText);
   p := AllocMem(Length(BufVar)+1);
   StrPCopy(p,BufVar);
   CharUpperBuff(p,StrLen(p));
   BufVar := StrPas(p);
   FreeMem(p);
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                             Val() Function
----------------------------------------------------------------------------}

function TgsUDFVal.FunctionName: string;
begin
   FunctionName := 'VAL';
end;

function TgsUDFVal.FunctionResult(Caller: TgsExpFunction;
         var BufVar: variant; var ExpResult: TgsExpResultType): boolean;
var
   r: TgsExpResultType;
   f: FloatNum;
   s: string;
begin
   ExpResult := rtFloat;
   Caller.FetchArg(0, BufVar, r, rtText);
   s := BufVar;
   if length(BufVar) > 0 then
      try
         f := StrToFloat(s);
      except
         f := 0;
      end
   else
      f := 0;
   BufVar := f;
   FunctionResult := true;
end;

{---------------------------------------------------------------------------
                            TgsExpBaseObject
----------------------------------------------------------------------------}

constructor TgsExpBaseObject.Create;
begin
   Inherited Create;
   FResultType := rtUnknown;
   FExpType := etUnknown;
   FExpChg := false;
   FExpLen := 0;
   FExpDec := 0;
   FArgLeft := nil;
   FArgRight := nil;
end;

destructor TgsExpBaseObject.Destroy;
begin
   if FArgLeft <> nil then FArgLeft.Free;
   if FArgRight <> nil then FArgRight.Free;
   inherited Destroy;
end;

function TgsExpBaseObject.ExpObjectContains: string;
begin
   ExpObjectContains := '';
end;

function TgsExpBaseObject.ExpObjectType: integer;
begin
   Result := gsSQLTypeNA;
end;

function TgsExpBaseObject.ExpRebuildExpression: string;
var
   s: string;
begin
   s := '';
   if FArgLeft <> nil then
      s := FArgLeft.ExpRebuildExpression;
   s := s + ExpObjectContains;
   if FArgRight <> nil then
      s := s + FArgRight.ExpRebuildExpression;
   Result := s;
end;

function TgsExpBaseObject.ExpEnumTypes(AType: integer): string;
var
   s: string;
begin
   s := '';
   if FArgLeft <> nil then
      s := FArgLeft.ExpEnumTypes(AType);
   if ExpObjectType = AType then
      s := s + ExpObjectContains+';';
   if FArgRight <> nil then
      s := s + FArgRight.ExpEnumTypes(AType);
   Result := s;
end;


procedure TgsExpBaseObject.ExpParse(var BufVar: variant;
                                  var ExpResult: TgsExpResultType);
begin
   ExpResult := rtUnknown;
end;

{---------------------------------------------------------------------------
                            TgsExpContainer
----------------------------------------------------------------------------}

constructor TgsExpContainer.Create(AOwner: TgsExpHandler; AValue: PChar);
begin
   Inherited Create;
   FArgRight := AOwner.GenerateObjects(AValue);
end;

function TgsExpContainer.ExpRebuildExpression: string;
var
   s: string;
begin
   s := '(';
   if FArgRight <> nil then
      s := s + FArgRight.ExpRebuildExpression;
   s := s + ')';
   Result := s;
end;

function TgsExpContainer.ExpEnumTypes(AType: integer): string;
var
   s: string;
begin
   s := '';
   if FArgRight <> nil then
      s := s + FArgRight.ExpEnumTypes(AType);
   Result := s;
end;

procedure TgsExpContainer.ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType);
begin
   if FArgRight <> nil then
      FArgRight.ExpParse(BufVar, ExpResult)
   else
      ExpResult := rtEmpty;
end;

{---------------------------------------------------------------------------
                            TgsExpFunction
----------------------------------------------------------------------------}

constructor TgsExpFunction.Create(AOwner: TgsExpHandler; AValue: PChar);
var
   ExpStr: string;
   ExpPos: PChar;
   ExpStart: PChar;
   TotLen: PChar;
   i: integer;
   ctGroup: integer;
   atEnd: boolean;
begin
   Inherited Create;
   FOwner := AOwner;
   FExpType := etFunction;
   FArgList := TList.Create;
   FUDF := nil;
   if AValue = nil then exit;
   ExpStart := AValue;
   ExpPos := AValue;
   TotLen := StrEnd(AValue);
   while not (ExpPos[0] in ['~',#0]) do inc(ExpPos);
   ExpPos[0] := #0;
   ExpStr := StrPas(ExpStart);
   i := 0;
   while (i < GSFunctionRegistry.Count) and
         (GSFunctionRegistry.FunctionName(i) <> ExpStr) do
      inc(i);
   if i < GSFunctionRegistry.Count then
      FUDF := GSFunctionRegistry.FunctionLink(i);
   if FUDF = nil then
   begin
      if FOwner.UserLink <> nil then
      begin
         FUDF := FOwner.UserLink.FindFunction(ExpStr);
      end;
   end;
   if FUDF = nil then
   begin
      if FOwner.UserLink <> nil then
         FUDF := FOwner.UserLink.OnNoFunction(ExpStr)
      else
         raise EHalcyonExpression.CreateFMT(gsErrNoSuchFunction,[ExpStr]);
   end;      
   inc(ExpPos);
   while ExpPos < TotLen do
   begin
      ctGroup := 0;
      atEnd := false;
      ExpStart := ExpPos;
      repeat
         case ExpPos[0] of
            opTypeComma : AtEnd := ctGroup = 0;
            #0          : AtEnd := true;
            opTypeGrpBg,
            opTypeTxtBg,
            opTypeDteBg : inc(ctGroup);
            opTypeGrpEn,
            opTypeTxtEn,
            opTypeDteEn : dec(ctGroup);
         end;
         if not AtEnd then
            inc(ExpPos);
      until AtEnd;
      ExpPos[0] := #0;
      FArgList.Add(AOwner.GenerateObjects(ExpStart));
      inc(ExpPos);
   end;
end;

destructor TgsExpFunction.Destroy;
var
   i: integer;
begin
   for i := 0 to FArgList.Count-1 do
   begin
     TgsExpBaseObject(FArgList.Items[i]).Free;
   end;
   FArgList.Free;
   inherited Destroy;
end;

function TgsExpFunction.ExpObjectContains: string;
begin
   ExpObjectContains := FUDF.FunctionName;
end;

function TgsExpFunction.ExpRebuildExpression: string;
var
   s: string;
   i: integer;
begin
   s := ExpObjectContains + '(';
   for i := 0 to FArgList.Count-1 do
   begin
      s := s + TgsExpBaseObject(FArgList.Items[i]).ExpRebuildExpression;
      if i < FArgList.Count - 1 then
         s := s + ',';
   end;
   s := s + ')';
   Result := s;
end;

function TgsExpFunction.ExpEnumTypes(AType: integer): string;
var
   s: string;
   i: integer;
begin
   s := '';
   for i := 0 to FArgList.Count-1 do
   begin
      s := s + TgsExpBaseObject(FArgList.Items[i]).ExpENumTypes(AType);
   end;
   Result := s;
end;

procedure TgsExpFunction.ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType);
var
   b: boolean;
begin
   b := FUDF.FunctionResult(Self,BufVar,ExpResult);
   if not b then
   begin
      ExpResult := rtEmpty;
   end;
end;

procedure TgsExpFunction.FetchArg(Index: integer; var BufVar: variant;
                       var ExpResult: TgsExpResultType;
                       ExpResultNeeded: TgsExpResultType);
var
   s: string;
begin
   if Index < FArgList.Count then
   begin
      TgsExpBaseObject(FArgList.Items[Index]).ExpParse(BufVar, ExpResult);
   end
   else
   begin
      ExpResult := rtEmpty;
   end;
   if ((ExpResultNeeded <> rtAny) and (ExpResult <> ExpResultNeeded)) then
   begin
      if (not (ExpResultNeeded in [rtFloat..rtDateTime]) and
              (ExpResult in [rtFloat..rtDateTime])) then
      begin
         case ExpResultNeeded of
            rtDate    : s := 'Date';
            rtFloat   : s := 'Number';
            rtText    : s := 'Text';
            rtBoolean : s := 'Boolean';
            else        s := 'Unknown Value';
         end;
         raise EHalcyonExpression.CreateFmt
                 (gsErrArgValueNeeded,[s,Index+1,FUDF.FunctionName]);
      end;           
   end;
end;

function TgsExpFunction.FetchUser: TgsExpUserLink;
begin
   Result := FOwner.UserLink;
end;

{---------------------------------------------------------------------------
                            TgsExpFieldVar
----------------------------------------------------------------------------}

constructor TgsExpFieldVar.Create(AOwner: TgsExpHandler; AValue: PChar);
begin
   Inherited Create;
   FOwner := AOwner;
   FExpType := etFieldVar;
   FUDF := nil;
   if AValue <> nil then
   begin
      if FOwner.UserLink <> nil then
         FUDF := FOwner.UserLink.FindFieldVar(StrPas(AValue));
   end;
   if FUDF = nil then
   begin
      raise EHalcyonExpression.CreateFMT(gsErrNoSuchFunction,[StrPas(AValue)]);
   end;
   FExpLen := FUDF.FVarLen;
end;

function TgsExpFieldVar.ExpObjectContains: string;
begin
   ExpObjectContains := FUDF.FieldVarName;
end;

function TgsExpFieldVar.ExpObjectType: integer;
begin
   Result := FUDF.FieldVarType;
end;

procedure TgsExpFieldVar.ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType);
var
   b: boolean;
begin
   b := FUDF.FieldVarResult(BufVar,ExpResult);
   if not b then
   begin
      ExpResult := rtEmpty;
   end;
end;

function TgsExpFieldVar.FetchUser: TgsExpUserLink;
begin
   Result := FOwner.UserLink;
end;


{---------------------------------------------------------------------------
                            TgsExpOperator
----------------------------------------------------------------------------}

constructor TgsExpOperator.Create(AOperator, APrecedence: char);
begin
   Inherited Create;
   FExpType := etOperator;
   FOperator := AOperator;
   FPrecedence := APrecedence;
   FInsensitive := false;
   FWildCards := true;
   FWildCharAll := WildCardChar1;
   FWildCharOne := WildCardChar3;
end;

function TgsExpOperator.StrWCComp(vStr1, vStr2 : variant): Integer;
var
   Wrk1: PChar;
   Wrk2: PChar;
   WrkKeep: PChar;
   WrkComp: PChar;
   astrbegin: boolean;
   astrend: boolean;
   v: integer;
begin
   v := 0;
   if (vStr1 = null) or (vStr1 = '') then v := 1;
   if (vStr2 = null) or (vStr2 = '') then v := v+2;
   if v > 0 then
   begin
      case v of
         1: Result := -1;
         2: Result := 1;
         else Result := 0;
      end;
      exit;
   end;
   Wrk1 := StrAlloc(length(vStr1)+1);
   WrkKeep := StrAlloc(length(vStr2)+1);
   Wrk2 := WrkKeep;
   StrPCopy(Wrk1, vStr1);
   StrPCopy(Wrk2, vStr2);
   StrTrimR(Wrk1);
   StrTrimR(Wrk2);
   if FWildCards and (StrLen(Wrk2) > 0) and
      ((Wrk2[0] = FWildCharAll) or (Wrk2[pred(StrLen(Wrk2))] = FWildCharAll)) then
   begin
      if StrLen(Wrk2) = 1 then    {string is '*'}
      begin
         Result := 0;
         StrDispose(WrkKeep);
         StrDispose(Wrk1);
         exit;
      end;
      if FInsensitive then
      begin
         AnsiUpper(Wrk1);
         AnsiUpper(Wrk2);
      end;
      astrbegin := Wrk2[0] = FWildCharAll;
      if astrbegin then inc(Wrk2);
      astrend := Wrk2[pred(StrLen(Wrk2))] = FWildCharAll;
      if astrend then Wrk2[pred(StrLen(Wrk2))] := #0;
      Result := ComparePChar(Wrk1,Wrk2);
      if (Result <> 0) then
      begin
         WrkComp := StrPos(Wrk1, Wrk2);
         if (not astrbegin) and (WrkComp <> Wrk1) then
            WrkComp := nil;
         if WrkComp <> nil then
         begin
            if not astrend then
               if StrLen(WrkComp) > StrLen(Wrk2) then
                  WrkComp := nil;
         end;
         if WrkComp <> nil then
            Result := 0;
      end;
   end
   else
      if FInsensitive then
         Result := CompareIPChar(Wrk1,Wrk2)
      else
         Result := ComparePChar(Wrk1,Wrk2);
   StrDispose(WrkKeep);
   StrDispose(Wrk1);
end;

function TgsExpOperator.ExpObjectContains: string;
begin
   case FOperator of
      opEQ        :  ExpObjectContains := '=';
      opNE        :  ExpObjectContains := '#';
      opGT        :  ExpObjectContains := '>';
      opLT        :  ExpObjectContains := '<';
      opGE        :  ExpObjectContains := '>=';
      opLE        :  ExpObjectContains := '<=';
      opPOS       :  ExpObjectContains := 'in string';
      opExactEQ   :  ExpObjectContains := 'exactly equal';
      opPlus      :  ExpObjectContains := '+';
      opMinus     :  ExpObjectContains := '-';
      opMultiply  :  ExpObjectContains := '*';
      opDivide    :  ExpObjectContains := '/';
      opExponent  :  ExpObjectContains := '^';
      opAND       :  ExpObjectContains := '.AND.';
      opOR        :  ExpObjectContains := '.OR.';
      opNOT       :  ExpObjectContains := '.NOT.';
   end;
end;

procedure TgsExpOperator.ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType);
var
   Buf1: variant;
   Buf2: variant;
   ResultTypeLeft: TgsExpResultType;
   ResultTypeRight: TgsExpResultType;
   ExpCnt: longint;
   FloatWork: FloatNum;
   FloatAlso: FloatNum;
   bc: integer;
   s: string;
begin
   if ((FArgLeft = nil) and (FOperator <> opNOT)) or (FArgRight = nil) then
      raise EHalcyonExpression.CreateFmt(gsErrMissingSide,[ExpObjectContains]);
   try
      ResultTypeLeft := rtEmpty;
      ResultTypeRight := rtEmpty;
      if FArgLeft <> nil then
         FArgLeft.ExpParse(Buf1, ResultTypeLeft);
      if FArgRight <> nil then
         FArgRight.ExpParse(Buf2, ResultTypeRight);
      FResultType := ResultTypeRight;
      if (ResultTypeLeft <> ResultTypeRight) then
      begin
         if not ((ResultTypeLeft in [rtFloat..rtDateTime]) and
                 (ResultTypeRight in [rtFloat..rtDateTime])) then
         begin
            if FOperator <> opNOT then
              raise EHalcyonExpression.Create(gsErrOpConflict);
            if ResultTypeRight <> rtBoolean then
               raise EHalcyonExpression.CreateFmt(gsErrArgInvalid,['boolean']);
         end;
      end;
      if FResultType = rtBoolean  then
      begin
         case FOperator of
            opEQ  :  BufVar := Buf1 = Buf2;
            opNE  :  BufVar := Buf1 <> Buf2;
            opAND :  BufVar := Buf1 and Buf2;
            opOR  :  BufVar := Buf1 or Buf2;
            opNOT :  BufVar := not Buf2;
            opPlus,
            opMinus,
            opMultiply,
            opDivide,
            opExponent : raise EHalcyonExpression.CreateFmt(gsErrArgInvalid,['number']);
            else
                raise EHalcyonExpression.CreateFmt(gsErrArgInvalid,['assigned']);
         end;
      end
      else
      if FResultType in [rtFloat..rtDateTime] then
      begin
         FloatWork := Buf1 - Buf2;
         case FOperator of
            opEQ  :  BufVar := FloatWork = 0.0;
            opNE  :  BufVar := FloatWork <> 0.0;
            opLE  :  BufVar := FloatWork <= 0.0;
            opGT  :  BufVar := FloatWork > 0.0;
            opLT  :  BufVar := FloatWork < 0.0;
            opGE  :  BufVar := FloatWork >= 0.0;
            opPlus : BufVar := Buf1 + Buf2;
            opMinus: BufVar := Buf1 - Buf2;
            opMultiply  :  BufVar := Buf1 * Buf2;
            opDivide    :  BufVar := Buf1 / Buf2;
            opExponent  :  begin
                              FloatAlso := Buf1;
                              FloatWork := Buf1;
                              ExpCnt := trunc(Buf2);
                              while ExpCnt > 1 do
                              begin
                                 dec(ExpCnt);
                                 FloatAlso := FloatAlso * FloatWork;
                              end;
                              BufVar := FloatAlso;
                           end;
            else
                raise EHalcyonExpression.CreateFmt(gsErrArgInvalid,['assigned']);
         end;
      end
      else
      if FResultType = rtText  then
      begin
         case FOperator of
            opEQ,
            opNE,
            opLE,
            opGT,
            opLT,
            opGE  :  begin
                        bc := StrWCComp(Buf1,Buf2);
                        case FOperator of
                           opEQ  :  BufVar := bc = 0;
                           opNE  :  BufVar := bc <> 0;
                           opLE  :  BufVar := bc <= 0;
                           opGT  :  BufVar := bc > 0;
                           opLT  :  BufVar := bc < 0;
                           opGE  :  BufVar := bc >= 0;
                        end;
                     end;
            opPos:   begin
                        BufVar := pos(Buf1,Buf2) > 0;
                     end;
            opPlus:  begin
                        s := '';
                        if (Buf1 <> null) and (Buf1 <> '') then
                        begin
                           s := Buf1;
                        end;
                        if (Buf2 <> null) and (Buf2 <> '') then
                        begin
                           s := s + Buf2;
                        end;
                        BufVar := s;
                     end;
            opMinus: begin
                        bc := 0;
                        s := '';
                        if (Buf1 <> null) and (Buf1 <> '') then
                        begin
                           bc := length(Buf1);
                           s := TrimRight(Buf1);
                        end;
                        if (Buf2 <> null) and (Buf2 <> '') then
                        begin
                           bc := bc + length(Buf2);
                           s := s + Buf2;
                        end;
                        while length(s) < bc do s := s + ' ';
                        BufVar := s;
                     end;

            else
                raise EHalcyonExpression.CreateFmt(gsErrArgInvalid,['assigned']);
         end;
      end;
   finally
      case FOperator of
         opEQ,
         opNE,
         opGT,
         opLT,
         opGE,
         opLE,
         opPOS,
         opExactEQ,
         opAND ,
         opOR,
         opNOT      : FResultType := rtBoolean;
      end;
      ExpResult := FResultType;
   end;
end;


{---------------------------------------------------------------------------
                            TgsExpTextLit
----------------------------------------------------------------------------}

constructor TgsExpTextLit.Create(AValue: PChar);
begin
   Inherited Create;
   FResultType := rtText;
   FExpType := etTextLit;
   FExpValue := nil;
   if (AValue <> nil) and (StrLen(AValue) > 0) then
   begin
      FExpValue := StrNew(AValue);
      FExpLen := StrLen(AValue);
   end;
end;

destructor TgsExpTextLit.Destroy;
begin
   if FExpValue <> nil then
      StrDispose(FExpValue);
   inherited Destroy;
end;

function TgsExpTextLit.ExpObjectContains: string;
begin
   if FExpValue <> nil then
      ExpObjectContains := '"'+StrPas(FExpValue)+'"'
   else
      ExpObjectContains := '""';
end;

Procedure TgsExpTextLit.ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType);
begin
   ExpResult := FResultType;
   if FExpValue <> nil then
      BufVar := StrPas(FExpValue)
   else
      BufVar := '';
end;


{---------------------------------------------------------------------------
                            TgsExpNumLit
----------------------------------------------------------------------------}

constructor TgsExpNumLit.Create(AValue: PChar);
var
   r: integer;
begin
   Inherited Create;
   FResultType := rtFloat;
   FExpType := etNumLit;
   FExpFloat := 0.0;
   if AValue <> nil then
   begin
      FExpLen := StrLen(AValue);
      val(AValue, FExpFloat, r);
      if r <> 0 then
         FExpFloat := 0.0;
      FExpDec := StrNumDec(AValue);
   end;
end;

function TgsExpNumLit.ExpObjectContains: string;
var
   s: string;
begin
   str(FExpFloat:20:FExpDec,s);
   while s[1] = ' ' do delete(s,1,1);
   ExpObjectContains := s;
end;

procedure TgsExpNumLit.ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType);
begin
   ExpResult := FResultType;
   BufVar := FExpFloat;
end;

{---------------------------------------------------------------------------
                            TgsExpDateLit
----------------------------------------------------------------------------}

constructor TgsExpDateLit.Create(AValue: PChar);
begin
   Inherited Create;
   FResultType := rtDate;
   FExpType := etDateLit;
   FExpDate := 0.0;
   if AValue <> nil then
   begin
      FExpDate := DBFDate.CTOD(StrPas(AValue));
   end;
end;

function TgsExpDateLit.ExpObjectContains: string;
var
   l: longint;
begin
   l := trunc(FExpDate);
   ExpObjectContains := '{'+DBFDate.DTOC(l)+'}';
end;

procedure TgsExpDateLit.ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType);
begin
   ExpResult := FResultType;
   BufVar := FExpDate;
end;

{---------------------------------------------------------------------------
                            TgsExpBlnLit
----------------------------------------------------------------------------}

constructor TgsExpBlnLit.Create(AValue: PChar);
begin
   Inherited Create;
   FResultType := rtBoolean;
   FExpType := etBlnLit;
   if ComparePChar(AValue,'.T.') = 0 then
      FExpLogic := true
   else
      FExpLogic := false;
end;

function TgsExpBlnLit.ExpObjectContains: string;
begin
   if FExpLogic then
      ExpObjectContains := '.T.'
   else
      ExpObjectContains := '.F.';
end;

procedure TgsExpBlnLit.ExpParse(var BufVar: variant; var ExpResult: TgsExpResultType);
begin
   ExpResult := FResultType;
   BufVar := FExpLogic;
end;

{---------------------------------------------------------------------------
                            TgsExpHandler
----------------------------------------------------------------------------}

constructor TgsExpHandler.Create(AUser: TgsExpUserLink; AExpression: PChar; IsSQL: boolean);
var
   ExpString: array[0..MaxSQLSize] of char;
begin
   Inherited Create;
   FExpLen := 0;
   FExpDec := 0;
   FArgCount := 0;
   FInsensitive := false;
   FWildCards := true;
   if IsSQL then
   begin
      FWildCharAll := WildCardChar2;
      FWildCharOne := WildCardChar4;
   end
   else
   begin
      FWildCharAll := WildCardChar1;
      FWildCharOne := WildCardChar3;
   end;
   FUserLink := AUser;
   FExpChg := false;
   if (AExpression = nil) or (StrLen(AExpression) = 0) then
   begin
      FParseObj := nil;
      FResultType := rtUnknown;
   end
   else
   begin
      CompressExpression(ExpString, AExpression);
      FParseObj := GenerateObjects(ExpString);
   end;
end;

destructor TgsExpHandler.Destroy;
begin
   if FParseObj <> nil then
      FParseObj.Free;
   inherited Destroy;
end;

function TgsExpHandler.EnumerateType(AType: integer): string;
begin
   if FParseObj <> nil then
      Result := FParseObj.ExpEnumTypes(AType)
   else
      Result := '';
end;

function TgsExpHandler.GetExpression: string;
begin
   if FParseObj <> nil then
      Result := FParseObj.ExpRebuildExpression
   else
      Result := '';
end;

procedure TgsExpHandler.SetExpression(const AExpression: string);
var
   ExpString: array[0..MaxSQLSize] of char;
   Expr: array[0..MaxSQLSize] of char;
begin
   if FParseObj <> nil then
      FParseObj.Free;
   FParseObj := nil;
   FExpLen := 0;
   FExpDec := 0;
   FArgCount := 0;
   FResultType := rtUnknown;
   if (AExpression <> '') then
   begin
      StrPCopy(Expr, AExpression);
      CompressExpression(ExpString, Expr);
      FParseObj := GenerateObjects(ExpString);
   end;
end;

procedure TgsExpHandler.ExpressionResult(var BufVar: variant);
begin
   FExpChg := false;
   if FParseObj <> nil then
   begin
      FParseObj.ExpParse(BufVar, FResultType);
   end
   else
      FResultType := rtUnknown;
end;

procedure TgsExpHandler.ExpressionAsVariant(var AVar: TgsVariant);
var
   BufVar: variant;
   j: longint;
begin
   FExpChg := false;
   if FParseObj <> nil then
   begin
      FParseObj.ExpParse(BufVar, FResultType);
      if BufVar <> null then
      begin
         case FResultType of
            rtText    : begin
                           AVar.PutString(BufVar);
                         end;
            rtDate    :  begin
                            j := trunc(BufVar);
                            AVar.PutDate(j);
                         end;
            rtFloat,
            rtDateTime:  begin
                            AVar.PutFloat(BufVar);
                         end;
            rtBoolean :  begin
                            AVar.PutBoolean(BufVar);
                         end;
            else         begin
                            FResultType := rtUnknown;
                         end;
         end;
      end;
   end
   else
   begin
      AVar.PutString('');
      FResultType := rtUnknown;
   end;
end;


function TgsExpHandler.ResultType: TgsExpResultType;
begin
   Result := FResultType;
end;

function TgsExpHandler.CompressExpression(Buffer, ExpSource: PChar): PChar;
var
   ixIn : integer;
   ixOut: integer;
   bLiteral: boolean;
   cLiteral: char;
   cLast   : char;
   cWork   : char;
   cHold   : char;
   isOperator: boolean;
begin
   if (ExpSource = nil) or (StrLen(ExpSource) = 0) then
   begin
      StrCopy(Buffer,'');
      CompressExpression := Buffer;
      exit;
   end;
   bLiteral := false;
   cLiteral := #0;
   cLast := #0;
   ixOut := 0;
   for ixIn := 0 to pred(StrLen(ExpSource)) do
   begin
      isOperator := true;
      cHold := ExpSource[ixIn];
      cWork := cHold;
      if cWork in [SingleQuote,DoubleQuote,'[',']','{','}'] then
      begin
         if bLiteral and (cWork = cLiteral) then
         begin
            if cLiteral = '}' then
               cWork := opDateEnd
            else
               cWork := opQuoteEnd;
            cLiteral := #0;
            bLiteral := false;
         end
         else
         begin
            if not bLiteral then
            begin
               cLiteral := cWork;
               if cLiteral = '{' then
               begin
                  cLiteral := '}';
                  cWork := opDateOpen;
               end
               else
               begin
                  if cLiteral = '[' then cLiteral := ']';
                  cWork := opQuoteOpen;
               end;
               bLiteral := true;
            end
            else
               isOperator := false;
         end;
      end;
      if not bLiteral then
      begin
         case cWork of
            ' '          : if cLast <> opTypeSpace then
                              cWork := opTypeSpace
                           else
                              cWork := #0;
            ','          : cWork := opTypeComma;
            '!'          : cWork := opNOT;
            '='          : begin
                              cWork := opEQ;
                              case cLast of
                                 '=' : cWork := opExactEQ;
                                 '<' : cWork := opLE;
                                 '>' : cWork := opGE;
                                 '!' : cWork := opNE;
                              end;
                              if cWork <> opEQ then
                              begin
                                 dec(ixOut,2);
                              end;
                           end;
            '<'          : begin
                              cWork := opLT;
                              case cLast of
                                 '=' : cWork := opLE;
                              end;
                              if cWork <> opLT then
                              begin
                                 dec(ixOut,2);
                              end;
                           end;
            '>'          : begin
                              cWork := opGT;
                              case cLast of
                                 '=' : cWork := opGE;
                                 '<' : cWork := opNE;
                                 '-' : cWork := '.'; {opRefPtr}
                              end;
                              if cWork <> opGT then
                              begin
                                 dec(ixOut,2);
                              end;
                           end;
            '*'          : begin
                              cWork := opMultiply;
                              case cLast of
                                 '*' : cWork := opExponent;
                              end;
                              if cWork <> opMultiply then
                              begin
                                 dec(ixOut,2);
                              end;
                           end;
            '/'          : cWork := opDivide;
            '^'          : cWork := opExponent;
            '$'          : cWork := opPos;
            '#'          : cWork := opNE;
            '+'          : cWork := opPlus;
            '-'          : cWork := opMinus;
            '('          : cWork := opGroupOpen;
            ')'          : cWork := opGroupEnd;
            '{'          : cWork := opDateOpen;
            '}'          : cWork := opDateEnd;
            opDateOpen,
            opDateEnd,
            opQuoteOpen,
            opQuoteEnd   : begin end;
            else
               IsOperator := false;
         end;
      end;
      if cWork <> #0 then
      begin
         if isOperator then
         begin
            case cWork of
               opEQ,
               opNE,
               opGT,
               opLT,
               opGE,
               opLE,
               opPOS,
               opExactEQ     : begin
                                  Buffer[ixOut] := opTypeRelat;
                                  inc(ixOut);
                               end;
               opOR,
               opPlus,
               opMinus       : begin
                                  Buffer[ixOut] := opTypeAdd;
                                  inc(ixOut);
                               end;
               opAND,
               opMultiply,
               opDivide      : begin
                                  Buffer[ixOut] := opTypeMult;
                                  inc(ixOut);
                               end;
               opNOT         : begin
                                  Buffer[ixOut] := opTypeRelNot;
                                  inc(ixOut);
                               end;
               opExponent    : begin
                                  Buffer[ixOut] := opTypeUnary;
                                  inc(ixOut);
                               end;

               opQuoteOpen   : cWork := opTypeTxtBg;
               opQuoteEnd    : cWork := opTypeTxtEn;
               opDateOpen    : cWork := opTypeDteBg;
               opDateEnd     : cWork := opTypeDteEn;
               opGroupOpen   : cWork := opTypeGrpBg;
               opGroupEnd    : cWork := opTypeGrpEn;
            end;
         end;
         Buffer[ixOut] := cWork;
         inc(ixOut);
      end;
      cLast := cHold;
   end;
   Buffer[ixOut] := #0;
   CompressExpression := Buffer;
end;

function TgsExpHandler.GenerateObjects(Buffer: PChar): TgsExpBaseObject;
var
   NuString: array[0..MaxSQLSize] of char;
   NuWork: PChar;
   NuKeep: pointer;
   NuType: char;
   NuOperator: char;
   ixIn: integer;
   ixOut: integer;
   ixRef: integer;
   ExpObject: TgsExpBaseObject;
   ExpResult: TgsExpBaseObject;
   SQLList: TList;
   inOperation: boolean;
   i: integer;
   j: integer;
   t: char;
begin
   ExpObject := nil;
   GenerateObjects := nil;
   if Buffer = nil then exit;
   if StrLen(Buffer) = 0 then exit;
   SQLList := TList.Create;
 try
   ixIn := 0;
   while (Buffer[ixIn] > #0) do
   begin
      FillChar(NuString,MaxSQLSize+1,#0);
      NuType := #0;
      ixOut := 0;
      while (Buffer[ixIn] = opTypeSpace) do inc(ixIn);
      while (Buffer[ixIn] > opTypeSpace) do
      begin
         NuString[ixOut] := Buffer[ixIn]; {special for .NOT., .AND., etc.}
         if (ixOut > 0) and (NuString[ixout] = '.') and (NuString[0] = '.') then
         begin
            Buffer[ixIn] := opTypeSpace;
         end
         else
         begin
            inc(ixOut);
            inc(ixIn);
         end;
      end;
      {$IFDEF WIN32}
      CharUpperBuff(NuString,StrLen(NuString));
      {$ELSE}
      AnsiUpperBuff(NuString,StrLen(NuString));
      {$ENDIF}
      if (ixOut > 0) then
      begin
         if (Buffer[ixIn] = opTypeGrpBg) then
            NuType := opTypeFunct
         else
            if (NuString[0] in ['A'..'Z','_','.']) then
            begin
               NuType := opTypeVarFld;
               if (StrLen(NuString) > 1) then
               begin
                  GetMem(NuKeep,StrLen(NuString)+3);
                  FillChar(NuKeep^,StrLen(NuString)+3,#0);
                  NuWork := NuKeep;
                  StrCopy(NuWork,NuString);
                  if NuWork[0] = #0 then
                     NuWork[0] := '?';
                  if NuWork[0] = '.' then inc(NuWork);
                  if StrLen(NuWork) > 0 then
                  begin
                     if NuWork[StrLen(NuWork)-1] = '.' then
                        NuWork[StrLen(NuWork)-1] := #0;
                     NuWork[StrLen(NuWork)] := '@';
                     ixRef := Pos(StrPas(NuWork), exOpStrings);
                     if ixRef > 0 then
                     begin
                        dec(ixIn);
                        nuType := opTypeRelat;
                        case ixRef of
                           exOpEQ  : Buffer[ixIn] := opEQ;
                           exOpLE  : Buffer[ixIn] := opLE;
                           exOpLT  : Buffer[ixIn] := opLT;
                           exOpGE  : Buffer[ixIn] := opGE;
                           exOpGT  : Buffer[ixIn] := opGT;
                           exOpAND : begin
                                        Buffer[ixIn] := opAND;
                                        NuType := opTypeRelAnd;
                                     end;
                           exOpOR  : begin
                                        Buffer[ixIn] := opOR;
                                        NuType := opTypeRelOr;
                                     end;
                           exOpNOT : begin
                                        Buffer[ixIn] := opNOT;
                                        NuType := opTypeRelNot;
                                     end;
                           exOpT,
                           exOpTLong: begin
                                         NuType := opTypeBlnLt;
                                         StrCopy(NuString,'.T.');
                                         inc(ixIn,2);
                                      end;
                           exOpF,
                           exOpFLong: begin
                                         NuType := opTypeBlnLt;
                                         StrCopy(NuString,'.F.');
                                         inc(ixIn,2);
                                      end;
                        end;
                        dec(ixIn);
                     end;
                  end;
                  FreeMem(NuKeep,StrLen(NuString)+3);
               end;
            end
            else
               if (NuString[0] in ['0'..'9','-','+']) then
                  NuType := opTypeNumLt;
      end
      else
         NuType := Buffer[ixIn];

      case NuType of
         opTypeGrpBg : begin     {grouped characters}
                          ixRef := 1;
                          inc(ixIn);
                          repeat
                             case Buffer[ixIn] of
                                opTypeGrpBg : inc(ixRef);
                                opTypeGrpEn : dec(ixRef);
                                #0          : raise EHalcyonExpression.Create(gsErrNoEndParend);
                             end;
                             NuString[ixOut] := Buffer[ixIn];
                             if Buffer[ixIn] <> #0 then inc(ixIn);
                             if ixRef > 0 then inc(ixOut);
                          until ixRef = 0;
                          NuString[ixOut] := #0;
                          ExpObject := TgsExpContainer.Create(Self,NuString);
                          SQLList.Add(ExpObject);
                       end;
         opTypeGrpEn : begin     {End of group without begin}
                          raise EHalcyonExpression.Create(gsErrBadEndParend);
                       end;
         opTypeUnary,            {unary operators}
         opTypeMult,             {multiplying operators}
         opTypeAdd,              {adding operators}
         opTypeRelat,            {relational operators}
         opTypeRelNot,           {relational NOT}
         opTypeRelAnd,           {relational AND}
         opTypeRelOr             {relational OR}
                     : begin
                          inOperation := (ExpObject = nil) or
                          (ExpObject.FExpType = etOperator);
                          inc(ixIn);
                          NuOperator := Buffer[ixIn];
                          if inOperation and (NuOperator in [opPlus, opMinus]) then
                          begin
                             case NuOperator of
                                opPlus  : Buffer[ixIn] := '+';
                                opMinus : Buffer[ixIn] := '-';
                             end;
                          end
                          else
                          begin
                             ExpObject := TgsExpOperator.Create(NuOperator,NuType);
                             TgsExpOperator(ExpObject).FInsensitive := FInsensitive;
                             TgsExpOperator(ExpObject).FWildCards := FWildCards;
                             TgsExpOperator(ExpObject).FWildCharAll := FWildCharAll;
                             TgsExpOperator(ExpObject).FWildCharOne := FWildCharOne;
                             SQLList.Add(ExpObject);
                             if Buffer[ixIn] <> #0 then inc(ixIn);
                          end;
                       end;
         opTypeTxtBg : begin     {literal/constant}
                          ixRef := 1;
                          repeat
                             inc(ixIn);
                             case Buffer[ixIn] of
                                opTypeTxtEn : dec(ixRef);
                                #0          : ixRef := 0;
                             end;
                             NuString[ixOut] := Buffer[ixIn];
                             if ixRef > 0 then inc(ixOut);
                          until Buffer[ixIn] in [#0,opTypeTxtEn];
                          NuString[ixOut] := #0;
                          if Buffer[ixIn] <> #0 then inc(ixIn);
                          ExpObject := TgsExpTextLit.Create(NuString);
                          SQLList.Add(ExpObject);
                          inc(FArgCount);
                       end;
         opTypeDteBg : begin     {literal/constant}
                          ixRef := 1;
                          repeat
                             inc(ixIn);
                             case Buffer[ixIn] of
                                opTypeDteEn : dec(ixRef);
                                #0          : ixRef := 0;
                             end;
                             NuString[ixOut] := Buffer[ixIn];
                             if ixRef > 0 then inc(ixOut);
                          until Buffer[ixIn] in [#0,opTypeDteEn];
                          NuString[ixOut] := #0;
                          if Buffer[ixIn] <> #0 then inc(ixIn);
                          ExpObject := TgsExpDateLit.Create(NuString);
                          SQLList.Add(ExpObject);
                          inc(FArgCount);
                       end;
         opTypeSpace : begin     {space character}
                       end;
         opTypeFunct : begin     {function}
                          NuString[ixOut] := '~';
                          inc(ixOut);
                          ixRef := 1;
                          inc(ixIn);
                          repeat
                             case Buffer[ixIn] of
                                opTypeGrpBg : inc(ixRef);
                                opTypeGrpEn : dec(ixRef);
                                #0          : raise EHalcyonExpression.Create(gsErrNoEndParend);
                             end;
                             NuString[ixOut] := Buffer[ixIn];
                             if Buffer[ixIn] <> #0 then inc(ixIn);
                             if ixRef > 0 then inc(ixOut);
                          until ixRef = 0;
                          NuString[ixOut] := #0;
                          ExpObject := TgsExpFunction.Create(Self,NuString);
                          SQLList.Add(ExpObject);
                          inc(FArgCount);
                       end;
         opTypeVarFld: begin     {variable/field}
                          if FUserLink = nil then
                             ExpObject := nil
                          else
                          begin
                             ExpObject := TgsExpFieldVar.Create(Self,NuString);
                          end;
                          if ExpObject <> nil then
                             SQLList.Add(ExpObject)
                          else
                             raise EHalcyonExpression.CreateFMT
                                (gsErrFieldInvalid,[StrPas(NuString)]);
                          inc(FArgCount);
                          if ExpObject.FExpLen > FExpLen then
                             FExpLen := ExpObject.FExpLen;
                          if ExpObject.FExpDec > FExpDec then
                             FExpDec := ExpObject.FExpDec;
                       end;
         opTypeNumLt : begin     {numeric literal}
                          ExpObject := TgsExpNumLit.Create(NuString);
                          SQLList.Add(ExpObject);
                          inc(FArgCount);
                          if ExpObject.FExpLen > FExpLen then
                             FExpLen := ExpObject.FExpLen;
                          if ExpObject.FExpDec > FExpDec then
                             FExpDec := ExpObject.FExpDec;
                       end;
         opTypeBlnLt: begin     {Boolean literal}
                          ExpObject := TgsExpBlnLit.Create(NuString);
                          SQLList.Add(ExpObject);
                          inc(FArgCount);
                       end;
      end;
   end;
   t := opTypeUnary;
   while (t <= opTypeRelOr) do
   begin
      ExpResult := nil;
      i := 0;
      while (ExpResult = nil) and (i < SQLList.Count) and
            (SQLList.Count > 1) do
      begin
         ExpObject := SQLList.Items[i];
         if ExpObject <> nil then
         begin
            if ExpObject.FExpType = etOperator then
            begin
               if TgsExpOperator(ExpObject).FPrecedence = t then
               begin
                  ExpResult := ExpObject;
                  j := i+1;
                  if j < SQLList.Count then
                  begin
                     ExpResult.FArgRight := SQLList.Items[j];
                     SQLList.Delete(j);
                  end;
                  if t <> opTypeRelNot then
                  begin
                     j := i-1;
                     if j >= 0 then
                     begin
                        ExpResult.FArgLeft := SQLList.Items[j];
                        SQLList.Delete(j);
                     end;
                  end;
                  ExpResult.FExpType := etContainer;
               end;
            end;
         end;
         inc(i);
      end;
      if ExpResult = nil then inc(t);
   end;
   if SQLList.Count = 1 then
      ExpResult := SQLList.Items[0]
   else
      raise EHalcyonExpression.Create(gsErrConstructBad);
   GenerateObjects := ExpResult;
 except
   for i := 0 to SQLList.Count-1 do
      TObject(SQLList.Items[i]).Free;
   SQLList.Free;
   raise;
 end;
   SQLList.Free;
end;

{------------------------------------------------------------------------------
                           Setup and Exit Routines
------------------------------------------------------------------------------}
procedure RegisterFunctions;
begin
   GSFunctionRegistry := TgsFunctionReg.Create;
   GSFunctionRegistry.RegisterFunction(TgsUDFAllTrim.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFAsc.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFAt.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFAtC.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFBetween.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFCeiling.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFChr.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFCTOD.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFDate.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFDescend.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFDOW.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFDTOC.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFDTOS.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFEmpty.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFFloor.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFIIF.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFInt.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFLeft.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFLen.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFLower.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFLTrim.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFMod.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFPadC.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFPadL.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFPadR.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFProper.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFRight.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFRTrim.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFSoundex.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFSpace.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFStr.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFStrZero.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFSubStr.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFTrim.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFUpper.Create);
   GSFunctionRegistry.RegisterFunction(TgsUDFVal.Create);
end;


{$IFDEF WIN32}
initialization
   RegisterFunctions;

finalization
begin
   GSFunctionRegistry.Free;
end;

{$ELSE}
var
   ExitSave      : pointer;

{$F+}
procedure ExitHandler;
begin
   GSFunctionRegistry.Free;
   ExitProc := ExitSave;
end;
{$F-}

begin
   ExitSave := ExitProc;
   ExitProc := @ExitHandler;
   RegisterFunctions;
{$ENDIF}

end.




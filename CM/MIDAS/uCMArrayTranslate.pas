{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCMArrayTranslate: Classe para manipulação de       }
{   array gerados a partir de um DataSet pela função    }
{   DatasetToVarArray                                   }
{ - TCMFieldArrayTranslate: Classe para manipulação     }
{   dos 'fields' do array gerados a partir de um        }
{   DataSet pela função DatasetToVarArray               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 26/05/2001                             }
{                                                       }
{*******************************************************}

unit uCMArrayTranslate;

interface

Uses Classes, SysUtils, Db, Math;

{$I CmMsgConst.Inc}

Type
  ECMArrayTranslateError = Class(Exception);

  TCMArrayTranslate = Class;

  {Classe para manipulação dos 'fields' do array gerados a partir de um DataSet pela função DatasetToVarArray }
  TCMFieldArrayTranslate = Class
  private
    FOwner: TCMArrayTranslate;
    function GetAsDateTime: TDateTime;
    function GetAsFloat: Double;
    function GetAsInteger: Integer;
    function GetAsString: String;
    function GetIsNull: Boolean;
    function GetValue: Variant;
  protected
  public
     Constructor Create(aOwner :TCMArrayTranslate);
     Destructor Destroy; Override;

     {Verifica se a field possui dados}
     property IsNull: Boolean read GetIsNull;
     {Acessa o conteudo do fild como um string}
     property AsString :String read GetAsString;
     {Acessa o conteudo do fild como um Float}
     property AsFloat :Double read GetAsFloat;
     {Acessa o conteudo do fild como um Interi}
     property AsInteger :Integer read GetAsInteger;
     {Acessa o conteudo do fild como um DateTime}
     property AsDateTime :TDateTime read GetAsDateTime;
     {Acessa o conteudo do fild como um variant}
     property Value :Variant read GetValue;
  End;

  {Classe para manipulação de  array gerados a partir de um DataSet pela função DatasetToVarArray}
  TCMArrayTranslate = Class
  private
    _CurrCol: Integer;
    _CurrRec: Integer;
    _Field :TCMFieldArrayTranslate;
    FResultSet: OleVariant;
    FRecordCount: Integer;
    FFieldCount: Integer;
    procedure SetResultSet(const Value: OleVariant);
    function GetFields(i: integer): TCMFieldArrayTranslate;
    function GetRecNo: Integer;

  protected

  public
     Constructor Create;
     Destructor Destroy; Override;

     {Indicador de Início de arquivo}
     function Eof :Boolean;
     {Indicador de fim de arquivo}
     function Bof :Boolean;
     {Indica se o array está vazio}
     function IsEmpty :Boolean;
     {Acessa os fields do array pelo nome, similar ao FieldByName do dataset}
     function FieldByname(sFieldName:String) :TCMFieldArrayTranslate;
     {Move para o primeiro registro}
     Procedure First;
     {Move para o último registro}
     Procedure Last;
     {Move para o próximo registro}
     Procedure Next;
     {Move para o registro anterior}
     Procedure Prior;

     {oleVariant gerado pela funçao DatasetToVarArray a ser maniplado pela classe}
     property ResultSet :OleVariant read FResultSet write SetResultSet;
     {Acessa os fields do array pelo índice, similar ao tfields do dataset}
     property Fields[i :integer] :TCMFieldArrayTranslate read GetFields;
     {Nº de registros do array}
     property RecordCount :Integer read FRecordCount;
     {Nº de colunas do array}
     property FieldCount :Integer read FFieldCount;
     {Nº do registro ponterado}
     property RecNo :Integer read GetRecNo;
  End;

implementation

{ TCMFieldArrayTranslate }

constructor TCMFieldArrayTranslate.Create(aOwner: TCMArrayTranslate);
begin
  FOwner := aOwner;
end;

destructor TCMFieldArrayTranslate.Destroy;
begin
  inherited;
end;

function TCMFieldArrayTranslate.GetAsDateTime: TDateTime;
begin
  Result := FOwner.FResultSet[FOwner._CurrCol,FOwner._CurrRec];
end;

function TCMFieldArrayTranslate.GetAsFloat: Double;
begin
   Result := FOwner.FResultSet[FOwner._CurrCol,FOwner._CurrRec];
end;

function TCMFieldArrayTranslate.GetAsInteger: Integer;
begin
   Result := FOwner.FResultSet[FOwner._CurrCol,FOwner._CurrRec];
end;

function TCMFieldArrayTranslate.GetAsString: String;
begin
  Case vartype(FOwner.FResultSet[FOwner._CurrCol,FOwner._CurrRec]) of
     varEmpty, varNull : Result := '';
     varSmallint, varInteger : Result := IntToStr(FOwner.FResultSet[FOwner._CurrCol,FOwner._CurrRec]);
     varSingle, varDouble, varCurrency : Result := FloatToStr(FOwner.FResultSet[FOwner._CurrCol,FOwner._CurrRec]);
     varDate : Result := DateToStr(FOwner.FResultSet[FOwner._CurrCol,FOwner._CurrRec]);
     varOleStr, varStrArg, varString : Result := FOwner.FResultSet[FOwner._CurrCol,FOwner._CurrRec];
  Else
     Result := '';
  End;
end;

function TCMFieldArrayTranslate.GetIsNull: Boolean;
begin
  Result := (Not VarIsNull(FOwner.FResultSet)) And
            (GetAsString = '');
end;

function TCMFieldArrayTranslate.GetValue: Variant;
begin
  Result := FOwner.FResultSet[FOwner._CurrCol,FOwner._CurrRec];
end;

{ TCMArrayTranslate }

function TCMArrayTranslate.Bof: Boolean;
begin
  Result := (fRecordCount = 0) Or (_CurrRec = 1);
end;

constructor TCMArrayTranslate.Create;
begin
  _Field := TCMFieldArrayTranslate.Create(Self);

  fFieldCount := 0;
  fRecordCount := 0;
  _CurrCol := 0;
  _CurrRec := 0;
end;

destructor TCMArrayTranslate.Destroy;
begin
  _Field.Free;
  inherited;
end;

function TCMArrayTranslate.Eof: Boolean;
begin
  Result := (fRecordCount = 0) Or (_CurrRec = fRecordCount);
end;

function TCMArrayTranslate.FieldByname(sFieldName: String): TCMFieldArrayTranslate;
Var
  X, iIndiceField :Integer;

begin
 iIndiceField := -1;
 For X:=1 To FFieldCount Do
     If UpperCase(FResultSet[X,0]) = UpperCase(sFieldName) Then
     Begin
        iIndiceField := x-1;
        break;
     End;

 If iIndiceField = -1 Then
    Raise ECMArrayTranslateError.Create(CMsgFieldNameNotFound)
 Else
    Result := GetFields(iIndiceField);
end;

procedure TCMArrayTranslate.First;
begin
  _CurrRec := 1;
end;

function TCMArrayTranslate.GetRecNo: Integer;
begin
  Result := FResultSet[0,_CurrRec];
end;

function TCMArrayTranslate.GetFields(i: integer): TCMFieldArrayTranslate;
Var
  iOldCurrCol :Integer;
begin
  iOldCurrCol := _CurrCol;
  Try
    _CurrCol := i+1;
    Result := _Field;
  Except
    _CurrCol := iOldCurrCol;
    Raise ECMArrayTranslateError.Create(CMsgFieldIndexNotFound)
  End;
end;

function TCMArrayTranslate.IsEmpty: Boolean;
begin
  Result := (fRecordCount = 0);
end;

procedure TCMArrayTranslate.Last;
begin
  _CurrRec := fRecordCount;
end;

procedure TCMArrayTranslate.Next;
begin
  If _CurrRec < fRecordCount Then
     Inc(_CurrRec);
end;

procedure TCMArrayTranslate.Prior;
begin
  If _CurrRec > 1 Then Dec(_CurrRec);
end;

procedure TCMArrayTranslate.SetResultSet(const Value: OleVariant);
Var
  sDefDim :String;
begin
  FResultSet := Value;

  If Not VarIsNull(Value) Then
  Begin
    sDefDim := FResultSet[0,0];
    sDefDim := Trim(sDefDim);
    FRecordCount := StrToIntDef(Copy(sDefDim,Pos('R',sDefDim)+1,Length(sDefDim)),0);
    FFieldCount := StrToIntDef(Copy(sDefDim,2,Pos('R',sDefDim)-2),0);

    If fRecordCount > 0 Then
    Begin
      _CurrCol := 1;
      _CurrRec := 1;
    End
    Else
    Begin
      _CurrCol := 0;
      _CurrRec := 0;
    End;
  End
  Else
  Begin
    FRecordCount := 0;
    FFieldCount := 0;
  End;
end;


end.

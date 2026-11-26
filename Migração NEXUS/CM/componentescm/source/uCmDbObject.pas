{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uCmDbObject;

interface

Uses Classes, SysUtils, Db, uCmCustomCdbObject, uMensErro, uMontaSQL,
     provider, DbClient, uCMTypes, uCMMath, uCMFileUtils, DBTables, Dialogs;

{$I CmMsgConst.Inc}

Type
  TDbOperacao = (dboInsert, dboUpdate, dboDelete);

  TVarType = Word;
  
  TCmDbObject = Class;

  {Classe para implelemtação dos Objetos de persistências com as colunas dos TCmDbObject}
  TCmDbField = Class
  private
    FIsNull: Boolean;
    FRequired: Boolean;
    FKey: Boolean;
    FReadOnly: Boolean;
    FAsFloat: Double;
    FAsInteger: Integer;
    FIndex: Integer;
    FColumName: String;
    FAsString: String;
    FAsDateTime: TDateTime;
    FDataType: TFieldType;
    FValue: Variant;
    FOwner: TCmDbObject;
    FNullIfZero: Boolean;
    FDisplayName: String;
    FOldValue: Variant;
    FSaveDateTimeFormat: Boolean;
    FFloatPrecision: Integer;
    FStreamValue: TMemoryStream;
    procedure SetAsDateTime(const Value: TDateTime);
    procedure SetAsFloat(const Value: Double);
    procedure SetAsInteger(const Value: Integer);
    procedure SetAsString(const Value: String);
    procedure SetColumName(const Value: String);
    procedure SetDataType(const Value: TFieldType);
    procedure SetIndex(const Value: Integer);
    procedure SetKey(const Value: Boolean);
    procedure SetReadOnly(const Value: Boolean);
    procedure SetRequired(const Value: Boolean);
    procedure SetValue(const Value: Variant);
    function GetAsDateTime: TDateTime;
    function GetAsFloat: Double;
    function GetAsInteger: Integer;
    function GetIsNull: Boolean;
    function GetsString: String;
    function GetValue: Variant;
    procedure SetNullIfZero(const Value: Boolean);
    procedure SetDisplayName(const Value: String);
    procedure SetOldValue(const Value: Variant);
    procedure SetFloatPrecision(const Value: Integer);
    procedure SetSaveDateTimeFormat(const Value: Boolean);
    procedure SetStreamValue(const Value: TMemoryStream);
    function GetStreamValue: TMemoryStream;
  protected

  public
    Constructor Create(aOwner :TCmDbObject);
    Destructor Destroy; Override;
    procedure Clear;

    {Descrição "amigável" da coluna a ser exibida em mensagens de erro}
    property DisplayName: String read FDisplayName write SetDisplayName;
    {Referencia o DbObject owner da coluna}
    property Owner :TCmDbObject read FOwner;
    {Indica se o valor será preenchido com null caso seja zero ou ''}
    property NullIfZero :Boolean read FNullIfZero write SetNullIfZero;
    {Nome da coluna no banco de dados}
    property ColumName :String read FColumName write SetColumName;
    {Indica se a coluna é chave da tabela}
    property Key :Boolean read FKey write SetKey;
    {Indica o tipo da coluna no banco de dados}
    property DataType :TFieldType read FDataType write SetDataType;
    {Indica se a coluna é not null}
    property Required :Boolean read FRequired write SetRequired;
    {Indica se a coluna é somente para leitura}
    property ReadOnly :Boolean read FReadOnly write SetReadOnly;
    {Indica da coluna}
    property Index :Integer read FIndex write SetIndex;
    {indica se a coluna esta vazia para strings, 0 para numero ou null para data e variant}
    property IsNull: Boolean read GetIsNull;
    {manipula o valor da coluna como uma string}
    property AsString :String read GetsString write SetAsString;
    {manipula o valor da coluna como um float}
    property AsFloat :Double read GetAsFloat write SetAsFloat;
    {manipula o valor da coluna como um inteiro}
    property AsInteger :Integer read GetAsInteger write SetAsInteger;
    {manipula o valor da coluna como um DateTime}
    property AsDateTime :TDateTime read GetAsDateTime write SetAsDateTime;
    {manipula o valor da coluna como um Variant}
    property Value :Variant read GetValue write SetValue;
    {manipula o valor da coluna como um Variant}
    property OldValue: Variant read FOldValue write SetOldValue;
    {Nº de casas decimais utilizadas para formatação de valores do tipo float}
    property FloatPrecision: Integer read FFloatPrecision write SetFloatPrecision;
    {indica se a data será gravada com formatação de hora}
    property SaveDateTimeFormat: Boolean read FSaveDateTimeFormat write SetSaveDateTimeFormat;
    property StreamValue: TMemoryStream read GetStreamValue write SetStreamValue;
  End;

  {Classe para implementação dos Objetos de persistência com as tabelas do banco de dados.
   A idéia é que para cada tabela do sistema tenhamos um DbObject que realiza as funçoes
   básicas de persistência do Objeto bem como validações de negócio específicas do mesmo
   ( Ex. Atribuição de sequences, controle de campos obrigatórios, etc).}
  TCmDbObject = Class(TCmCustomCdbObject)
  private
    _DataBaseNameChanged: Boolean;
    _iNumBlobFields: Integer;
    FDataBaseName: String;
    FErrorIfNoRowsAffected: Boolean;
    FTableName: String;
    fOwner: TCmCustomCdbObject;
    procedure SetErrorIfNoRowsAffected(const Value: Boolean);
    procedure SetTableName(const Value: String);
    function GetFields(x: Integer): TCmDbField;


    Procedure SetDbFields;
    {Método para gravação de colunas do tipo "Blob" ou LONGRAW no Oracle}
    procedure ApplyLongRaw;
    procedure BuildArray(var CampoValores: variant;
      var CampoNome: array of String;
      var CampoNullIfZero: array of Boolean;
      Var aFloatPrecision :Array of Integer; Var aSaveDateTimeFormat: Array of Boolean);

  protected
    fSqlInsert: String;
    fSqlUpdate: String;
    fSqlDelete: String;

    _UpdateKeyFields: Boolean;
    _DbOperacao: TDbOperacao;

    _ListDbField :TList;
    _CdsSelect: TClientDataSet;

    procedure SetDbSessionName;

    function GetSequence(Sufixo :string) :Cardinal; Override;

    {Monta Where para frases de update e delete
     Tal procedimento é interno da aplicação e considera os parâmetros de criação do TCmDbField}
    function MontaWhere(OldValue: Boolean = False): String;
    {Executa frase SQL validando preenchimento, erro de execução, erro se não afetar registros retornado
    a string do erro para o MessageInfo
    Tal procedimento é interno da aplicação e considera os parâmetros de criação do TCmDbField}
    function ExecuteSql (Const sSql, MsgEmpty, MsgError :string; bErrorIfNoRowsAffected :boolean = false; MsgErrorRowsAffected :String = '') :Boolean;
    {Cria as instâncias das propriedades de persistência com as colunas da tabelas}
    function CreateCmDbField(ColumName: String; DataType: TFieldType; Required: Boolean = false; Key: Boolean = false; ReadOnly: Boolean = false; NullIfZero: Boolean = True; sDisplayName: String = '';
    iFloatPrecision: Integer = -1; bSaveDateTimeFormat: Boolean = false): TCmDbField;
    {Verifica antes de um Insert ou Update se os campos ditos com required estão preenchidos}
    function  ValidateNullFields :Boolean;
    {Retorna o nome dos fields do dbobject separados por vírgulas}
    function GetFieldsForSelect: String;

    function VarTypeAsText(AType: TVarType): string;

    procedure SetDataBaseName(const Value: String); Override;
    {Monta a consulta a ser executada nos métodos LOADFROMDB e BEFOREOPEN do clientDataSet
    associado a classe de persistência.
    Esse método deve ser sobrescrito quando quisermos utilizar uma consulta diferente da
    consulta padrão do Objeto}
    function GetSqlSelect: String; Virtual;

  public
    Constructor Create(Aowner: TCmCustomCdbObject); Reintroduce; Virtual;
    Destructor Destroy; Override;

    {"Limpa" todas os CMDBFields da Classe}
    procedure Clear;  Virtual;
    {Executa o SQL de Insert com os parâmetros passados nas propriedades}
    function Insert :Boolean; virtual;
    {Executa o SQL de Delete com os parâmetros passados nas propriedades}
    function Delete :Boolean; virtual;
    {Executa o SQL de Update com os parâmetros passados nas propriedades}
    function Update :Boolean; virtual;
    {Atribui para as propriedades os valores do registro no banco de dados de acordo como os campos chave}
    function LoadFromDb :Boolean; virtual;
    {Retorna o Número de CMDbField's do DbObject}
    Function FieldCount : Integer;
    {Acessa os CMDbField's do DbObject pelo nome}
    function FieldByName(const Name: string): TCmDbField;

    {Métodos utilizados para posicionamento do classe de persistência quando a query principal
     da mesma retorna mais de um registro. Isso ocorre quando sobrescrevemos o método GetSQLSelect}
    procedure First;
    Procedure Prior;
    Procedure Next;
    Procedure Last;
    function Eof: Boolean;
    function Bof: Boolean;
    function RecordCount: Integer;

    {Comando SQL de Select com parâmetro de filtro pelo ID e/ou Foreign Key no caso de Master Detail}
    property SSqlSelect :String read GetSqlSelect;
    {Comando SQL de Insert}
    property SSqlInsert :String read fSqlInsert;
    {Comando SQL de Update}
    property SSqlUpdate :String read fSqlUpdate;
    {Comando SQL de Delete}
    property SSqlDelete :String read fSqlDelete;
    {Habilita a geração de exceção qdo os comando de Delete e Update não afetar nenhum registro}
    property ErrorIfNoRowsAffected :Boolean read FErrorIfNoRowsAffected write SetErrorIfNoRowsAffected;
    {Nome da tabela a ser persistida}
    property TableName :String read FTableName write SetTableName;
    {Acessa os CMDbField's do DbObject pelo índice}
    property Fields[x:Integer]: TCmDbField Read GetFields;

    property Owner:TCmCustomCdbObject read fOwner;
  End;

implementation

Uses uCmControlObject, wwQuery;

{ TCmDbObject }

constructor TCmDbObject.Create(Aowner: TCmCustomCdbObject);
begin
  Inherited Create;
  fOwner := Aowner;
  
  _DataBaseNameChanged := True;
  _iNumBlobFields := 0;

  _CdsSelect := TClientDataSet.Create(nil);

  fSqlInsert := '';
  fSqlUpdate := '';
  fSqlDelete := '';
  fErrorIfNoRowsAffected := False;
  
  _ListDbField := TList.Create;

  _UpdateKeyFields := False; 
end;

function TCmDbObject.MontaWhere(OldValue: Boolean = False): String;
Var
  sAuxDec: Char;
  sWhere: String;
  X: Integer;
begin
  sWhere := '';

  For x := 0 To Pred(FieldCount) Do
     Begin
        Case TCmDbField(_ListDbField.Items[x]).DataType Of
            ftString:
               If TCmDbField(_ListDbField.Items[x]).Key Then
               Begin
                   If OldValue Then
                      sWhere := sWhere + ' (' + TCmDbField(_ListDbField.Items[x]).ColumName + ' = ' + QuotedStr(TCmDbField(_ListDbField.Items[x]).OldValue) + ') AND'
                   Else
                      sWhere := sWhere + ' (' + TCmDbField(_ListDbField.Items[x]).ColumName + ' = ' + QuotedStr(TCmDbField(_ListDbField.Items[x]).AsString) + ') AND';
               End;
            ftSmallint, ftInteger, ftWord:
                If TCmDbField(_ListDbField.Items[x]).Key Then
                Begin
                   If OldValue Then
                      sWhere := sWhere + ' (' + TCmDbField(_ListDbField.Items[x]).ColumName + ' = ' + FloatToStr(TCmDbField(_ListDbField.Items[x]).OldValue) + ') AND'
                   Else
                      sWhere := sWhere + ' (' + TCmDbField(_ListDbField.Items[x]).ColumName + ' = ' + FloatToStr(TCmDbField(_ListDbField.Items[x]).AsFloat) + ') AND';
                End;
            ftFloat, ftCurrency, ftBCD:
                Begin
                  sAuxDec := DecimalSeparator;
                  Try
                    DecimalSeparator := '.';

                  If TCmDbField(_ListDbField.Items[x]).Key Then
                  Begin
                     If OldValue Then
                        sWhere := sWhere + ' (' + TCmDbField(_ListDbField.Items[x]).ColumName + ' = ' + FloatToStr(TCmDbField(_ListDbField.Items[x]).OldValue) + ') AND'
                     Else
                        sWhere := sWhere + ' (' + TCmDbField(_ListDbField.Items[x]).ColumName + ' = ' + FloatToStr(TCmDbField(_ListDbField.Items[x]).AsFloat) + ') AND';
                  End;

                  finally
                    DecimalSeparator := sAuxDec;
                  End;
                End;
            ftDate, ftDateTime:
                If TCmDbField(_ListDbField.Items[x]).Key Then
                Begin
                   If OldValue Then
                      sWhere := sWhere + ' (' + TCmDbField(_ListDbField.Items[x]).ColumName + ' = TO_DATE(' + QuotedStr(TCmDbField(_ListDbField.Items[x]).OldValue) + ',''DD/MM/YYYY'')) AND'
                   Else
                      sWhere := sWhere + ' (' + TCmDbField(_ListDbField.Items[x]).ColumName + ' = TO_DATE(' + QuotedStr(TCmDbField(_ListDbField.Items[x]).AsString) + ',''DD/MM/YYYY'')) AND';
                End;
        End;
     End;

  Result := Copy(sWhere,1,Length(sWhere) - 4);
end;


function TCmDbObject.Delete: Boolean;
begin
  SetDbSessionName;

  _DbOperacao := dboDelete;

  fSqlDelete := 'DELETE FROM ' + TableName + ' WHERE ' + MontaWhere;

  Result := ExecuteSql(fSqlDelete,CMsgDeleteEmpty,CMsgErrorDelete,FErrorIfNoRowsAffected, CMsgErrorRowsAffectedDelete);
end;

destructor TCmDbObject.Destroy;
Var
  X :Integer;
begin
  // o for acima esta to ao invés de downto
  For X := (_ListDbField.Count - 1) DownTo 0 Do
    TCmDbField(_ListDbField.Items[x]).Free;

  _ListDbField.Clear;
  _ListDbField.Free;

  If _CdsSelect.Active Then _CdsSelect.Close;
  _CdsSelect.Free;

  inherited Destroy;
end;

function TCmDbObject.ExecuteSql (Const sSql, MsgEmpty,
          MsgError :string; bErrorIfNoRowsAffected :boolean = false;
          MsgErrorRowsAffected :String = '') :Boolean;
begin
  Try
      MessageInfo := '';

      If Trim(sSql) = '' Then Raise ECmDbObjectError.Create(MsgEmpty);



      if not TCmControlObject(fOwner).ExecSql(sSql, bErrorIfNoRowsAffected) then
         raise ECmDbObjectError.Create(TCmControlObject(fOwner).MessageInfo);
         


      Result := True;
  Except
      On E :Exception Do
      Begin
        Result := False;
        MessageInfo := FormatErrorMessage(Self,E,MsgError);
      End;
  End;
end;

function TCmDbObject.Insert: Boolean;

 Var
   CampoNome: Array Of String;

   CampoValores: Variant;
   CampoNullIfZero: Array of boolean;
   aFloatPrecision: Array of Integer;
   aSaveDateTimeFormat: Array of boolean;
begin
  SetDbSessionName;

  _DbOperacao := dboInsert;


  CampoValores := VarArrayCreate([0,pred(FieldCount)],varVariant);
  SetLength(CampoNome,FieldCount);
  SetLength(CampoNullIfZero,FieldCount);
  SetLength(aFloatPrecision,FieldCount);
  SetLength(aSaveDateTimeFormat,FieldCount);

  BuildArray(CampoValores, CampoNome, CampoNullIfZero, aFloatPrecision, aSaveDateTimeFormat);

  fSqlInsert := TMontaSQL.SqlInsert(CampoValores, FTableName, CampoNome, CampoNullIfZero, aFloatPrecision, aSaveDateTimeFormat);

  try
    Result := ValidateNullFields And
              ExecuteSql(fSqlInsert,CMsgInsertEmpty,CMsgErrorInsert);

    try
      If Result Then ApplyLongRaw;
    except
      on E:Exception do begin
        MessageInfo := E.Message;
        result := false
      end;
    end;
  finally



    CampoValores := null;
    SetLength(CampoNome,0);
    SetLength(CampoNullIfZero,0);
    SetLength(aFloatPrecision,0);
    SetLength(aSaveDateTimeFormat,0);
  end;
end;

procedure TCmDbObject.SetDataBaseName(const Value: String);
begin
  Inherited;
  _DataBaseNameChanged := True;
  FDataBaseName := Value;
end;

procedure TCmDbObject.SetErrorIfNoRowsAffected(const Value: Boolean);
begin
  FErrorIfNoRowsAffected := Value;
end;

function TCmDbObject.Update: Boolean;
 Var
   CampoNome: Array Of String;

   CampoValores: Variant;
   CampoNullIfZero: Array Of Boolean;
   aFloatPrecision: Array of Integer;
   aSaveDateTimeFormat: Array of boolean;
begin
  SetDbSessionName;

  _DbOperacao := dboUpdate;


  CampoValores := VarArrayCreate([0,pred(FieldCount)],varVariant);
  SetLength(CampoNome,FieldCount);
  SetLength(CampoNullIfZero,FieldCount);
  SetLength(aFloatPrecision,FieldCount);
  SetLength(aSaveDateTimeFormat,FieldCount);

  BuildArray(CampoValores, CampoNome, CampoNullIfZero, aFloatPrecision, aSaveDateTimeFormat);

  fSqlUpdate := TMontaSQL.SqlUpdate(CampoValores, ftableName, CampoNome, MontaWhere(True), CampoNullIfZero, aFloatPrecision, aSaveDateTimeFormat);

  try
    Result := ValidateNullFields And
              ExecuteSql(fSqlUpdate,CMsgUpdateEmpty,CMsgErrorUpdate,FErrorIfNoRowsAffected,CMsgErrorRowsAffectedUpdate);

    try
      If Result Then ApplyLongRaw;
    except
      on E:Exception do begin
        MessageInfo := E.Message;
        result := false;
      end;
    end;

  finally



    CampoValores := null;
    SetLength(CampoNome,0);
    SetLength(CampoNullIfZero,0);
    SetLength(aFloatPrecision,0);
    SetLength(aSaveDateTimeFormat,0);
  end;
end;

function TCmDbObject.LoadFromDb: Boolean;
begin
  SetDbSessionName;

  _CdsSelect.Data := TCMControlObject(fOwner).GetDataPacket(GetSqlSelect);

  SetDbFields;

  Result := Not _CdsSelect.IsEmpty;  
end;

function TCmDbObject.CreateCmDbField(ColumName: String; DataType: TFieldType;
          Required: Boolean = false; Key: Boolean = false; ReadOnly: Boolean = false; NullIfZero: Boolean = True; sDisplayName: String = '';
          iFloatPrecision: Integer = -1; bSaveDateTimeFormat: Boolean = false) :TCmDbField;
Var
  Indice :Integer;
begin
  Result := TCmDbField.Create(self);
  Result.Required := Required;
  Result.Key := Key;
  Result.ReadOnly := ReadOnly;
  Result.ColumName := ColumName;
  Result.DataType := DataType;
  Result.NullIfZero := NullIfZero;
  Result.DisplayName := sDisplayName;
  Result.SaveDateTimeFormat := bSaveDateTimeFormat;
  Result.FloatPrecision := iFloatPrecision;

  Indice := _ListDbField.Add(Result);

  Result.Index := Indice;

  If DataType = ftBlob Then Inc(_iNumBlobFields);
end;

function TCmDbObject.ValidateNullFields: Boolean;
Var
  X :Integer;
begin
  Result := True;
  For X:=0 To _ListDbField.Count - 1 Do
  Begin
     If TCmDbField(_ListDbField.Items[x]).Required And
        TCmDbField(_ListDbField.Items[x]).IsNull Then
     Begin
        MessageInfo := 'O Campo ' + TCmDbField(_ListDbField.Items[x]).DisplayName + ' não foi informado';
        Result := False;
        Break;
     End;
  End;
end;

procedure TCmDbObject.SetTableName(const Value: String);
begin
  FTableName := Value;
end;

function TCmDbObject.FieldCount: Integer;
begin
   Result := _ListDbField.Count;
end;

function TCmDbObject.GetFields(x: Integer): TCmDbField;
begin
   Result := TCmDbField(_ListDbField[x]);
end;

function TCmDbObject.FieldByName(const Name: string): TCmDbField;
Var
  X: Integer;
  bAchou: Boolean;
begin
  bAchou := False;
  
  For X:= 0 To FieldCount - 1 Do
     If UpperCase(TCmDbField(_ListDbField[x]).ColumName) = UpperCase(Name) Then
     Begin
        bAchou := True;
        Break;
     End;

  If bAchou Then
     Result := TCmDbField(_ListDbField[x])
  Else
     Raise Exception.Create('CMsgFieldNameNotFound');
end;

procedure TCmDbObject.BuildArray(var CampoValores: variant;
  var CampoNome: array of String; Var CampoNullIfZero :Array of Boolean;
  Var aFloatPrecision :Array of Integer; Var aSaveDateTimeFormat: Array of Boolean);
Var
  x: Integer;
begin
  For x := 0 To Pred(FieldCount) Do
     Begin
        aFloatPrecision[x] := TCmDbField(_ListDbField.Items[x]).FloatPrecision;
        aSaveDateTimeFormat[x] := TCmDbField(_ListDbField.Items[x]).SaveDateTimeFormat;
     
        If TCmDbField(_ListDbField.Items[x]).DataType <> ftBlob Then
        Begin
          If (TCmDbField(_ListDbField.Items[x]).Key) And
             (_DbOperacao = DboUpdate) And
             (Not _UpdateKeyFields) Then
          Begin
             CampoNome[x] := CMInvalidField;
             CampoNullIfZero[x] := False;
             CampoValores[x] := CMInvalidField;
          End
          Else
          Begin
             CampoNome[x] := TCmDbField(_ListDbField.Items[x]).ColumName;
             CampoNullIfZero[x] := TCmDbField(_ListDbField.Items[x]).NullIfZero;

             Case TCmDbField(_ListDbField.Items[x]).DataType Of
                 ftString    :  CampoValores[x] := TCmDbField(_ListDbField.Items[x]).AsString;
                 ftInteger,
                 ftWord      : CampoValores[x] := TCmDbField(_ListDbField.Items[x]).AsInteger;
                 ftFloat,
                 ftCurrency,
                 ftBCD       : CampoValores[x] := TCmDbField(_ListDbField.Items[x]).AsFloat;
             Else
                 CampoValores[x] := TCmDbField(_ListDbField.Items[x]).AsDateTime;
             End;
          End;
        End
        Else
        Begin
           CampoNome[x] := CMFieldBlob;
           CampoNullIfZero[x] := False;
           CampoValores[x] := CMFieldBlob;
        End;
     End;
end;

function TCmDbObject.GetFieldsForSelect: String;
Var
  X: Integer;
  sAux: String;
Begin
  sAux := '';

  For X := 0 To pred(_ListDbField.Count) Do
     If Saux = '' Then
       sAux := TCmDbField(_ListDbField.Items[x]).ColumName
     Else
       sAux := sAux + ', ' + TCmDbField(_ListDbField.Items[x]).ColumName;

  Result := sAux;
End;

function TCmDbObject.GetSqlSelect: String;
begin
   Result := 'SELECT ' +
                  GetFieldsForSelect +
             ' FROM ' +
                  fTableName +
             ' WHERE ' + MontaWhere;
end;

procedure TCmDbObject.Clear;
Var
  X: Integer;
begin
  For X := (_ListDbField.Count - 1) DownTo 0 Do
    TCmDbField(_ListDbField.Items[x]).clear;
end;

function TCmDbObject.Bof: Boolean;
begin
   Result := _CdsSelect.Bof;
end;

function TCmDbObject.Eof: Boolean;
begin
   Result := _CdsSelect.Eof;
end;

procedure TCmDbObject.First;
begin
   _CdsSelect.First;
   SetDbFields;
end;

procedure TCmDbObject.Last;
begin
   _CdsSelect.Last;
   SetDbFields;
end;

procedure TCmDbObject.Next;
begin
   _CdsSelect.Next;
   SetDbFields;
end;

procedure TCmDbObject.Prior;
begin
   _CdsSelect.Prior;
   SetDbFields;
end;

procedure TCmDbObject.SetDbFields;
Var
  x : Integer;
Begin
  If _CdsSelect.IsEmpty Then
    Clear
  Else
    for x := 0  To Pred(_ListDbField.Count) Do
       try
          If TCmDbField(_ListDbField.Items[x]).DataType = FtDateTime Then
             TCmDbField(_ListDbField.Items[x]).AsDateTime := _CdsSelect.Fields.FieldByName(TCmDbField(_ListDbField.Items[x]).ColumName).AsDateTime
          Else
             TCmDbField(_ListDbField.Items[x]).Value := _CdsSelect.Fields.FieldByName(TCmDbField(_ListDbField.Items[x]).ColumName).Value;

          If (TCmDbField(_ListDbField.Items[x]).DataType = FtDateTime) And
             (_CdsSelect.Fields.FieldByName(TCmDbField(_ListDbField.Items[x]).ColumName).IsNull) Then
             TCmDbField(_ListDbField.Items[x]).OldValue := 0
          ELse
             TCmDbField(_ListDbField.Items[x]).OldValue := _CdsSelect.Fields.FieldByName(TCmDbField(_ListDbField.Items[x]).ColumName).Value;

       Except
          //Trata a Excessão para casos onde o field não existe no ClinetDataset
       End;
End;

function TCmDbObject.RecordCount: Integer;
begin
   Result := _CdsSelect.RecordCount;
end;

procedure TCmDbObject.ApplyLongRaw;
Var
  QryImagem: TwwQuery;
  FieldName: string;
  x: Integer;
  bAllBlobIsNull: Boolean;
  BlobStream: TMemoryStream;
  BlobValue: String;
  sSQL: String;
begin
  (* Já foi convertido no Delphi 7.
     Copiar a implementação deste método para que funcione adequademente com
     ADO
  *)
  if TCmControlObject(fOwner).DbConnectionType = cntAdo then exit;

  //Rotina convertida para tratamento de BLOB para versões ORACLE.
  if _iNumBlobFields > 0 then
  begin
    SetDbSessionName;

    bAllBlobIsNull := True;
    for x := 0 To Pred(FieldCount) do
    begin
      if (TCmDbField(_ListDbField.Items[x]).DataType = ftBlob) then
      begin
        bAllBlobIsNull := (TCmDbField(_ListDbField.Items[x]).IsNull) And
                           VarIsNull(TCmDbField(_ListDbField.Items[x]).OldValue);
      end;

      if not bAllBlobIsNull then
        Break;
    end;

    if not bAllBlobIsNull then
    begin
      QryImagem := TwwQuery.Create(nil);
      try
        try
          QryImagem.DataBaseName := DataBaseName;
          QryImagem.SessionName := _SessionName;

          for x := 0 to Pred(FieldCount) do
          begin
            if TCmDbField(_ListDbField.Items[x]).DataType = ftBlob then
            begin
              FieldName := TCmDbField(_ListDbField.Items[x]).ColumName;
              BlobValue := TCmDbField(_ListDbField.Items[x]).Value;

              BlobStream := TMemoryStream.Create;
              try
                BlobStream.WriteBuffer(PChar(BlobValue)^, Length(BlobValue));
                BlobStream.Position := 0;

                sSQL := 'UPDATE ' + TableName + ' SET ' + FieldName + ' = :' + FieldName + ' WHERE ' + MontaWhere;
                QryImagem.SQL.Text := sSQL;
                QryImagem.Params.Clear;
                QryImagem.Params.CreateParam(ftBlob, FieldName, ptInput);
                QryImagem.ParamByName(FieldName).LoadFromStream(BlobStream, ftBlob);
                QryImagem.Prepare;
                QryImagem.ExecSQL;
              finally
                BlobStream.Free;
              end;
            end;
          end;
        except
          QryImagem.Free;
          raise;
        end;
      finally
        QryImagem.Free;
      end;
    end;
  end;
end;

function TCmDbObject.GetSequence(Sufixo: string): Cardinal;
begin
  SetDbSessionName;
  Result := Inherited GetSequence(Sufixo);
end;


function TCmDbObject.VarTypeAsText(AType: TVarType): string;
begin
  case AType of
    varEmpty:     Result := 'varEmpty';
    varNull:      Result := 'varNull';
    varSmallint:  Result := 'varSmallint';
    varInteger:   Result := 'varInteger';
    varSingle:    Result := 'varSingle';
    varDouble:    Result := 'varDouble';
    varCurrency:  Result := 'varCurrency';
    varDate:      Result := 'varDate';
    varOleStr:    Result := 'varOleStr';
    varDispatch:  Result := 'varDispatch';
    varError:     Result := 'varError';
    varBoolean:   Result := 'varBoolean';
    varVariant:   Result := 'varVariant';
    varUnknown:   Result := 'varUnknown';
    varByte:      Result := 'varByte';
    varString:    Result := 'varString';
    varTypeMask:  Result := 'varTypeMask';
    varArray:     Result := 'varArray';
    varByRef:     Result := 'varByRef';
  else
    Result := 'Desconhecido (' + IntToStr(AType) + ')';
  end;
end;

{ TCmDbField }

procedure TCmDbField.Clear;
begin
  fAsString := '';

  Case fDataType Of
    ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD:
    Begin
       fAsFloat := 0;
       fAsInteger := 0;
    End;
    ftDate, ftDateTime: fAsDateTime := 0;
  Else
    fValue := null;
  End;

  fOldValue := null;
end;

constructor TCmDbField.Create(aOwner: TCmDbObject);
begin
   FOwner := aOwner;                                       
   FIsNull := True;
   FRequired := False;
   FKey := False;
   FReadOnly := False;
   FIndex := 0;
   FColumName := '';
   FDataType := ftString;
   FAsFloat :=0;
   FAsInteger := 0;
   FAsString := '';
   FAsDateTime := 0;
   FValue := null;
   fOldValue := null;   
   fNullIfZero := True;
   FDisplayName := '';
   FSaveDateTimeFormat := false;
   FFloatPrecision := -1;
   FStreamValue := TMemoryStream.Create;
end;

destructor TCmDbField.Destroy;
begin
  inherited;

end;

function TCmDbField.GetAsDateTime: TDateTime;
begin
  If fDataType = ftDateTime Then
     Result := fAsDateTime
  Else
     Result := StrToDate(fAsString);
end;

function TCmDbField.GetAsFloat: Double;
begin
  Case fDataType Of
   ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency:  Result := fAsFloat
   Else
      Result := StrToFloatCM(fAsString);
  End;
end;

function TCmDbField.GetAsInteger: Integer;
begin
  Case fDataType Of
   ftSmallint, ftInteger, ftWord:  Result := fAsInteger
   Else
      Result := StrToIntDef(fAsString,0);
  End;
end;

function TCmDbField.GetIsNull: Boolean;
begin
  Case fDataType Of
    ftString: Result := (Trim(fAsString) = '');
    ftSmallint, ftInteger, ftWord: Result := (fAsInteger = 0) And NullIfZero;
    ftFloat, ftCurrency, ftBCD: Result := (fAsFloat = 0) And NullIfZero;
    ftDate, ftDateTime: Result := (fAsDateTime = 0);
  Else
    Result := (fValue = null) Or (Trim(fAsString) = '');
  End;
end;

function TCmDbField.GetsString: String;
begin
  Result := fAsString;
end;

function TCmDbField.GetStreamValue: TMemoryStream;
begin
  if FStreamValue = nil then
    FStreamValue := TMemoryStream.Create;
  Result := FStreamValue;
end;

function TCmDbField.GetValue: Variant;
begin
  Case fDataType Of
    ftString: Result := fAsString;
    ftSmallint, ftInteger, ftWord: Result := fAsInteger;
    ftFloat, ftCurrency, ftBCD: Result := fAsFloat;
    ftDate, ftDateTime: Result := fAsDateTime;
  Else
    Result := fValue;
  End;
end;

procedure TCmDbField.SetAsDateTime(const Value: TDateTime);
begin
  FAsDateTime := Value;
  fAsString := DateTimeToStr(FAsDateTime);
  
  If FOldValue = null Then FOldValue := Value;
end;

procedure TCmDbField.SetAsFloat(const Value: Double);
begin
  FAsFloat := Value;
  FAsInteger := Trunc(Value);
  fAsString := FloatToStr(FAsFloat);

  If FOldValue = null Then FOldValue := Value;
end;

procedure TCmDbField.SetAsInteger(const Value: Integer);
begin
  FAsInteger := Value;
  fAsString := FloatToStr(FAsInteger);
  fAsFloat := Value;

  If FOldValue = null Then FOldValue := Value;  
end;

procedure TCmDbField.SetAsString(const Value: String);
begin
  FAsString := Value;

  Case fDataType Of
    ftSmallint, ftInteger, ftWord: fAsInteger := StrToIntDef(FAsString,0);
    ftFloat, ftCurrency, ftBCD:
    Begin
       if Trim(Value) = '' Then
          fAsFloat := 0
       Else
          fAsFloat := StrToFloatCM(FAsString);
    End;
    ftDate, ftDateTime:
     Begin
        if Trim(Value) = '' Then
           fAsDateTime := 0
        Else
           fAsDateTime := StrToDate(FAsString);
     End
  Else
    fValue := fAsString;
  End;

  If FOldValue = null Then FOldValue := Value;
end;

procedure TCmDbField.SetColumName(const Value: String);
begin
  FColumName := Value;
end;

procedure TCmDbField.SetDataType(const Value: TFieldType);
begin
  FDataType := Value;
end;

procedure TCmDbObject.SetDbSessionName;
begin
  If _DataBaseNameChanged Then
  Begin
     if TCmControlObject(fOwner).DbConnectionType = CntBde then
     begin
       _SessionName := TCmControlObject(fOwner).DataBase.SessionName;
       fDataBaseName := TCmControlObject(fOwner).DataBase.DataBaseName;
     End;

     DbConnectionType := TCmControlObject(fOwner).DbConnectionType;
     _DataBaseNameChanged := False;
  End;
end;

procedure TCmDbField.SetDisplayName(const Value: String);
begin
  If Trim(Value) = '' Then
    FDisplayName := Owner.TableName + '.' + fColumName
  Else
    FDisplayName := Value;
end;

procedure TCmDbField.SetFloatPrecision(const Value: Integer);
begin
  FFloatPrecision := Value;
end;

procedure TCmDbField.SetIndex(const Value: Integer);
begin
  FIndex := Value;
end;

procedure TCmDbField.SetKey(const Value: Boolean);
begin
  FKey := Value;
end;

procedure TCmDbField.SetNullIfZero(const Value: Boolean);
begin
  FNullIfZero := Value;
end;

procedure TCmDbField.SetOldValue(const Value: Variant);
begin
  FOldValue := Value;
end;

procedure TCmDbField.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;
end;

procedure TCmDbField.SetRequired(const Value: Boolean);
begin
  FRequired := Value;
end;

procedure TCmDbField.SetSaveDateTimeFormat(const Value: Boolean);
begin
  FSaveDateTimeFormat := Value;
end;

procedure TCmDbField.SetStreamValue(const Value: TMemoryStream);
begin
  FStreamValue := Value;
end;

procedure TCmDbField.SetValue(const Value: Variant);
begin
  FValue := Value;
  If Value = Null Then
     SetAsString('')
  Else
     SetAsString(Value);
end;

end.

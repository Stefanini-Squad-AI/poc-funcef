{
Rotina............: Destroy
N. Sol.............: 103843
N. Kintana......: 464129
Data...............: 02/02/2009
Responsável...: Ricardo Alves
Descrição........: Modificado código para que os objetos sejam corretamente liberados
					da memória após sua utilização.
}

//início - andre tavares - pendência 17317 - criação do método TemTipoHistAtivo que verifica se há ao menos um modelo do mesmo tipo ativo 
unit uCtrlModeloHistorico;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uDbModelohistorico;

Type
  TCtrlModeloHistorico = Class(TCmControlObject)

  private
    _DbModelohistorico: TDbModelohistorico;
    _ListaHistorico: TStrings;
    _CdsModeloHistorico: TClientDataSet;

    FFieldValues: TStrings;
    FFieldNames: TStrings;
    procedure SetFieldNames(const Value: TStrings);
    procedure SetFieldValues(const Value: TStrings);
  protected
    procedure DoChangeDataBase; Override;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function ProcessaModeloHistorico(Const ovModeloHistorico: OleVariant): Boolean;

    procedure Clear;
    function GetHistorico(iIdPessoa, iIdModulo, iTipo: Integer; sHistoricoDefaul: String; iIdHistorico: Integer = 0): String;
    function TemTipoHistAtivo(iIdPessoa, iIdModulo, iTipo: integer; iIdHistorico: Integer = 0): Boolean;

    property FieldNames: TStrings read FFieldNames write SetFieldNames;
    property FieldValues: TStrings read FFieldValues write SetFieldValues;
  end;


implementation

uses uCMTypes, Db;

{ TCtrlModeloHistorico }

procedure TCtrlModeloHistorico.Clear;
begin
  FFieldValues.Clear;
  FFieldNames.Clear;
end;

constructor TCtrlModeloHistorico.Create;
begin
  // Ricardo A. SOL: 103843 KTN: 464129
  inherited;
  _ListaHistorico := TStringList.Create;
  _CdsModeloHistorico := TClientDataSet.Create(nil);

  FFieldValues := TStringList.Create;
  FFieldNames := TStringList.Create;

  _DbModelohistorico := TDbModelohistorico.Create(self);
end;

destructor TCtrlModeloHistorico.Destroy;
begin
  FreeAndNil( _DbModelohistorico );
  FreeAndNil( _ListaHistorico );
  FreeAndNil( _CdsModeloHistorico );
  FreeAndNil( FFieldValues );
  FreeAndNil( FFieldNames );
  inherited;
end;

function TCtrlModeloHistorico.GetHistorico(iIdPessoa, iIdModulo, iTipo: Integer; sHistoricoDefaul: String; iIdHistorico: Integer = 0): String;
Var
  X: Integer;
  sHistorico, sItem: String;
begin
  if Trim(sHistoricoDefaul) = '' then raise Exception.Create('Histórico Padrão Não Informado.');

  sHistorico := '';

  if iIdHistorico = 0 then
     _Cds.Data := GetDataPacket(' SELECT COMPOHISTORICO FROM MODELOHISTORICO WHERE ' +
                                ' (IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
                                ' (IDMODULO = ' + IntToStr(iIdModulo) + ') AND ' +
                                ' (TIPO = ' + IntToStr(iTipo) + ') AND ' +
                                ' (STATUS = ''A'') ')
  else
     _Cds.Data := GetDataPacket(' SELECT COMPOHISTORICO FROM MODELOHISTORICO WHERE ' +
                                ' (IDMODELOHISTORICO = ' + IntToStr(iIdHistorico) + ')');

  if Not _Cds.IsEmpty then
  begin
     _ListaHistorico.Text := _Cds.Fields[0].AsString;
     _Cds.Close;

     For X:=0 To _ListaHistorico.Count - 1 Do
     Begin
       sItem := _ListaHistorico[x];

       If sItem <> '' Then
       Begin
         If sItem[1] = '#' Then
            sHistorico := sHistorico + ' ' + Copy(sItem,2,Length(sItem))
         Else
         begin
            if FFieldNames.IndexOf(sItem) <> -1 then
               sHistorico := sHistorico + ' ' + FFieldValues[FFieldNames.IndexOf(sItem)];
         end;
       End;
     End;
  end
  else
     sHistorico := sHistoricoDefaul;

  if _Cds.Active Then _Cds.Close;

  result := Trim(sHistorico);
end;

function TCtrlModeloHistorico.ProcessaModeloHistorico(
  Const ovModeloHistorico: OleVariant): Boolean;
begin
  If ConnectionSide = CnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaModeloHistorico(ovModeloHistorico);

     If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Result := True;
     Try
        StartTransaction;

        _CdsModeloHistorico.Data := ovModeloHistorico;

        if not _CdsModeloHistorico.IsEmpty then
        begin
           (*
             No caso de Inclusão e alteração é verificado a existência de algum
             outro histórico para o mesmo tipo, módulo que esteja ativo.
             Caso exista, e seja o próprio registro que esta sendo alterado e forçada
             a alteração do seu status para ativo pois sempre tem de haver um status
             ativo para um determindado tipo e modulo.
             Caso seja um novo e seu histórico seja ativo é alterado o atual histórico
             ativo para inativo.

             Obs;: Os trechos foram alterados para ser desconsiderado o histórico padrão,
             de forma a reutiliza o código para criação do histórico já implementado
           *)
           _Cds.Data := GetDataPacket(' SELECT IDMODELOHISTORICO, STATUS FROM MODELOHISTORICO WHERE ' +
                                      ' (IDPESSOA = ' + _CdsModeloHistorico.FieldByName('IDPESSOA').AsString + ') AND ' +
                                      ' (IDMODULO = ' + _CdsModeloHistorico.FieldByName('IDMODULO').AsString + ') AND ' +
                                      ' (TIPO = ' + _CdsModeloHistorico.FieldByName('TIPO').AsString + ') AND ' +
                                      ' (STATUS = ''A'') ');

           if (Not _Cds.IsEmpty) And
              (_CdsModeloHistorico.FieldByName('STATUS').AsString = 'A') then
             if not ExecSQL('UPDATE MODELOHISTORICO SET STATUS = ''I'' WHERE IDMODELOHISTORICO = ' + _Cds.FieldByName('IDMODELOHISTORICO').AsString) then
               raise Exception.Create(MessageInfo);
        end; 

        if _Cds.Active then _Cds.Close;

        If Not ApplyCds(_CdsModeloHistorico, _DbModelohistorico, [], []) Then
           Raise Exception.Create(_DbModelohistorico.MessageInfo);

        Commit;
     Except
        On E:Exception Do
        Begin
           _CdsModeloHistorico.StatusFilter := [];
           Result := False;
           Rollback;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

procedure TCtrlModeloHistorico.SetFieldNames(const Value: TStrings);
begin
  FFieldNames := Value;
end;

procedure TCtrlModeloHistorico.SetFieldValues(const Value: TStrings);
begin
  FFieldValues := Value;
end;

procedure TCtrlModeloHistorico.DoChangeDataBase;
begin
  inherited;
  _DbModelohistorico.DataBaseName := DataBaseName;
end;

//verifica se há ao menos um modelo do mesmo tipo ativo
function TCtrlModeloHistorico.TemTipoHistAtivo(iIdPessoa, iIdModulo, iTipo: integer; iIdHistorico: Integer = 0): Boolean;
var _cds: TClientDataSet;
    sSql: string;
begin
  sSql := '';
  result := false;
  _cds := TClientDataSet.Create(nil);
  try
    sSql := ' SELECT STATUS FROM MODELOHISTORICO WHERE ' +
                               ' (IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
                               ' (IDMODULO = ' + IntToStr(iIdModulo) + ') AND ' +
                               ' (TIPO = ' + IntToStr(iTipo) + ') AND ' +
                               ' (STATUS = ''A'') ';
    if iIdHistorico <> 0 then
      sSql := sSql + ' AND (IDMODELOHISTORICO <> ' + IntToStr(iIdHistorico) + ') ';

    _Cds.Data := GetDataPacket(sSql);

    result := not _cds.IsEmpty;
  finally
    _cds.free;
  end;
end;

end.

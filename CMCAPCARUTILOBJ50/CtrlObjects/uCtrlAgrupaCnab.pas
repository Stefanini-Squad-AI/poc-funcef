unit uCtrlAgrupaCnab;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, uCMTypes,
     DbClient, Classes;

type

  TCtrlAgrupaCnab = class(TCmControlObject)
  Protected
  private

  Public
    constructor Create;  Override;
    Destructor  Destroy; Override;
    function ListDocumentos(IDCliente : Double; DataProgramada : String; PortadorForma : Integer) : OLEVariant;
    function AgrupaDocumentos(IDCliente : Double; DataProgramada : String; sDocumentos : String) : Boolean;
    function VerificaConsistencia(dados: Olevariant): boolean;
 end;

implementation

{ TCtrlAgrupaCnab }


function TCtrlAgrupaCnab.AgrupaDocumentos(IDCliente: Double;
  DataProgramada: String; sDocumentos : String): Boolean;
var sSQL : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AgrupaDocumentos(IDCliente, DataProgramada, sDocumentos);
     If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    StartTransaction;
    try
      sSQL := ' UPDATE DOCUMENTO SET CODGRUPOCNAB = ' + FloatToStr(GetSequence('GRUPOCNAB')) +
              ' WHERE DATAPROGRAMADA = TO_DATE(' + QuotedStr(DataProgramada) + ', ''DD/MM/YYYY'')' +
              ' AND CODDOCUMENTO IN ( ' + sDocumentos + ' ) ';
      if IDCliente <> 0 then
        sSQL := sSQL + ' AND IDFORCLI = ' + FloatToStr(IDCliente);

      if not ExecSQL(sSQL) then
        raise Exception.Create(MessageInfo);
      Commit;
    except
      On E:Exception Do
      Begin
        Result := False;
        MessageInfo := E.Message;
        Rollback;
      end;
    end;
  End;
end;

constructor TCtrlAgrupaCnab.Create;
begin
  inherited;
end;


destructor TCtrlAgrupaCnab.Destroy;
begin
  inherited;
end;


function TCtrlAgrupaCnab.ListDocumentos(IDCliente: Double;
  DataProgramada: String; PortadorForma : Integer): OLEVariant;
var sSQL : TStrings;
begin

  sSQL := TStringList.Create;
  with sSQL do
  begin
    Clear;
    Append('SELECT'                     );
    Append('  '' '' AS SELECIONAR,'     );
    Append('  D.IDFORCLI,'              ); // andre tavares
    Append('  D.CODDOCUMENTO,'          );
    Append('  P.RAZAOSOCIAL,'           );
    Append('  D.NODOCUMENTO,'           );
    Append('  D.DATAPROGRAMADA '        );
    Append('FROM'                       );
    Append('  DOCUMENTO D,'             );
    Append('  PESSOA P'                 );
    Append('WHERE'                      );
    Append('  P.IDPESSOA = D.IDFORCLI'  );
    Append('  AND D.DATAPROGRAMADA = TO_DATE(' + QuotedStr(DataProgramada) + ' ,''DD/MM/YYYY'')');
    Append('  AND D.CODPORTFORMA = ' + IntToStr(PortadorForma));
    Append('  AND ((D.EMISBLOQ = ''N'') OR D.EMISBLOQ IS NULL) ');
    Append('  AND D.CODGRUPOCNAB IS NULL ');
    if IDCliente <> 0 then
      Append(' AND D.IDFORCLI = ' + FloatToStr(IDCliente));
  end;
  Result := GetDataPacket(sSQL);
end;

// inicio - andre tavares
function TCtrlAgrupaCnab.VerificaConsistencia(dados: Olevariant): boolean;
var cds: TClientDataSet;
    idforcli : integer;
begin
  idforcli := -1;
  result := false;
  cds := TClientDataSet.Create(nil);
  cds.Data := dados;
  cds.First;
  while not cds.Eof do
  begin
    if cds.fieldByName('SELECIONAR').AsString = 'S' then
    begin
      if idforcli = -1 then
        idforcli := cds.fieldByName('IDFORCLI').asInteger;

      result :=  idforcli = cds.fieldByName('IDFORCLI').asInteger;

      if not result then
        break;
    end;
    cds.Next;
  end; // while

  cds.free;
end;
// fim - andre tavares

end.

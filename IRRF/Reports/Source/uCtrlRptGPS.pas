unit uCtrlRptGPS;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendência :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 13/04/2007
Autor     : André Pontes
Pendência : 22657
Descrição : Layout e lógica refeitos para permitir impressão a partir da nova definição
---------------------------------------------------------------------------------------------------}

interface

uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, uCMTypes;

type
  TCtrlRptGPS = Class(TCmControlObject)

  private
    FDataIni: TDateTime;
    FDataFim: TDateTime;
    FImpresso: Boolean;

    procedure SetDataIni(const Value: TDateTime);
    procedure SetDataFim(const Value: TDateTime);
    procedure SetImpresso(const Value: Boolean);


  protected

    procedure DoChangeDataBase; Override;


  public

    constructor Create; override;
    destructor Destroy; override;

    property DataIni  : TDateTime   read FDataIni     write SetDataIni;
    property DataFim  : TDateTime   read FDataFim     write SetDataFim;
    property Impresso : Boolean     read FImpresso    write SetImpresso;

    function ListaGPSImpressao: OleVariant;
    function ExecutarSQL(sSQL: string): Boolean;


  end;



implementation
{ TCtrlRptGPS }



constructor TCtrlRptGPS.Create;
begin
  inherited;
end;

destructor TCtrlRptGPS.Destroy;
begin
  inherited;
end;

procedure TCtrlRptGPS.DoChangeDataBase;
begin
  inherited;
end;


function TCtrlRptGPS.ListaGPSImpressao: OleVariant;
var
  sSQL      : string;
  sDataIni  : string;
  sDataFim  : string;
begin
  sDataIni  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', FDataIni)) + ', ''DD/MM/YYYY'')';
  sDataFim  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', FDataFim)) + ', ''DD/MM/YYYY'')';

  // -----------------------------------------------------------------------------------------------
  sSQL :=
  'SELECT '                                                                                         + #13 +
  '  BEN.IDPESSOA AS IDEMPRESA, BEN.RAZAOSOCIAL AS EMPRESA, BEN.NUMDOCUMENTO AS CGC, '              + #13 +

  '  EST.CODESTADO, END.IDCIDADES, RTRIM(END.BAIRRO) AS BAIRRO, RTRIM(CID.NOME) AS CIDADE, '        + #13 +
  '  RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO ||''''|| DECODE(END.COMPLEMENTO, '' '','' - '' ||''''|| RTRIM(END.COMPLEMENTO)) AS RUA, '  + #13 +
  '  RTRIM(SUBSTR(END.CEP, 1, 5)) ||''-''|| RTRIM(SUBSTR(END.CEP, 6, 3)) AS CEP, '                  + #13 +

  '  DIN.COMPETENCIA, '                                                                             + #13 +
  '  DIN.CODIGOPGTO,     DIN.CODDOCINSS,   DIN.DATAVENCTO, '                                        + #13 +
  '  DIN.IDDOCINSS, '                                                                               + #13 +
  '  DIN.VLRINSS,        DIN.VLRTOTAL, '                                                            + #13 +
  '  DIN.VLRDESCONTO, '                                                                             + #13 +
  '  DIN.VLRJUROS,       DIN.VLRMULTA,     (DIN.VLRJUROS + DIN.VLRMULTA) AS VLR_ATU '               + #13 +

  'FROM '                                                                                           + #13 +
  '  PESSOA   BEN, '                                                                                + #13 +
  '  ENDPESS  END, '                                                                                + #13 +
  '  CIDADES  CID, '                                                                                + #13 +
  '  ESTADO   EST, '                                                                                + #13 +
  '  DOCINSS  DIN  '                                                                                + #13 +

  'WHERE '                                                                                          + #13 +
  '      DIN.DATAVENCTO     BETWEEN ' + sDataIni + ' AND ' + sDataFim                               + #13;

  if FImpresso then sSQL := sSQL +
  '  AND DIN.FLGIMPRESSO    = ''S'' '                                                               + #13
  else sSQL := sSQL +
  '  AND DIN.FLGIMPRESSO    = ''N'' '                                                               + #13;

  sSQL := sSQL +
  '  AND DIN.IDBENEFINSS    = BEN.IDPESSOA '                                                        + #13 +
  '  AND BEN.IDENDCOBRANCA  = END.IDENDERECO(+) '                                                   + #13 +
  '  AND END.IDCIDADES      = CID.IDCIDADES(+) '                                                    + #13 +
  '  AND CID.IDESTADO       = EST.IDESTADO(+) ';
  // -----------------------------------------------------------------------------------------------

  Result := GetDataPacket(sSQL);
end;



function TCtrlRptGPS.ExecutarSQL(Ssql: string): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExecutarSql(Ssql);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := True;
      if not(ExecSQL(sSQL)) then
        raise Exception.Create(messageinfo)
      else
        Commit;
    except
      on E:Exception do
      begin
        Rollback;
        Result      := False;
        MessageInfo := E.message;
      end;
    end;
  end;
end;



procedure TCtrlRptGPS.SetDataIni(const Value: TDateTime);
begin
  FDataIni := Value;
end;



procedure TCtrlRptGPS.SetDataFim(const Value: TDateTime);
begin
  FDataFim := Value;
end;



procedure TCtrlRptGPS.SetImpresso(const Value: Boolean);
begin
  FImpresso := Value;
end;



end.

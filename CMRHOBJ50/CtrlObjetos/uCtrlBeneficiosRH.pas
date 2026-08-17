{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/09/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlBeneficiosRH;

interface

uses SysUtils, Classes, uSistema, uCMTypes, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH;

type
  TCtrlBeneficiosRH = class(TCtrlCustomRH)
  private
    FSQL: TStringList;
  public
    constructor Create; override;
    destructor Destroy; override;

    function ListBeneficios(ListaIdPessoa, ListaIdRubrica, MesUltBeneficio, MesRef: string;
      SelCargo: boolean = false): OleVariant;
    function ListBeneficiosPessoa(IdPessoa: double; MesUltBeneficio, MesRef: string): OleVariant;

    function GetMesUltBeneficio: string;

    property SQL: TStringList read FSQL;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlBeneficiosRH }

constructor TCtrlBeneficiosRH.Create;
begin
  inherited;
  FSQL := TStringList.Create;
end;

destructor TCtrlBeneficiosRH.Destroy;
begin
  FreeAndNil(FSQL);
  inherited;
end;

function TCtrlBeneficiosRH.ListBeneficios(ListaIdPessoa, ListaIdRubrica, MesUltBeneficio,
  MesRef: string; SelCargo: boolean): OleVariant;
begin
  FSQL.Clear;
  FSQL.Add('SELECT');
  FSQL.Add('  RI.IDPESSOA, PF.NOME, PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS,');
  FSQL.Add('  RI.NUMOCORRENCIAS, RI.FLGPERMANENTE, RI.IDREGRACALCULO,');
  FSQL.Add('  RI.VALORRUBRICA, RI.IDRUBRICA, F.MATRICULA' +IFF(SelCargo, ', C.TITULO', ''));
  FSQL.Add('FROM');
  FSQL.Add('  PESSOA PF, RUBRICAINDIV RI, PROVDESC PD, FUNCIONARIO F'+
    IFF(SelCargo, ', CARGO C', ''));
  FSQL.Add('WHERE');

  if (ListaIdRubrica <> '') then
    if (Pos(',', ListaIdRubrica) > 0) then
      FSQL.Add('  (RI.IDRUBRICA          IN (' +ListaIdRubrica+ ')) AND')
    else
      FSQL.Add('  (RI.IDRUBRICA           = ' +ListaIdRubrica+ ') AND');

  if (ListaIdPessoa <> '') then
    if (Pos(',', ListaIdPessoa) > 0) then
      FSQL.Add('  (RI.IDPESSOA           IN (' +ListaIdPessoa+ ')) AND')
    else
      FSQL.Add('  (RI.IDPESSOA            = ' +ListaIdPessoa+ ') AND');

  FSQL.Add('  (RI.ANOMESINICIO  <= ' +QuotedStr(MesRef)+ ') AND');
  FSQL.Add('  (PD.FLGCONSTAFOLHA = 0) AND');
  FSQL.Add('  (PD.IDBENEFSALAR  IS NOT NULL) AND');
  FSQL.Add('  (RI.IDPESSOA       = F.IDPESSOA) AND');

  if (SelCargo) then
    FSQL.Add('  (F.IDCARGO         = C.IDCARGO) AND');
    
  FSQL.Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
  FSQL.Add('  (RI.IDRUBRICA      = PD.IDPROVENTO) AND');
  FSQL.Add('  ((RI.FLGPERMANENTE = 1) OR');
  FSQL.Add('   (TO_NUMBER(SUBSTR(RI.ANOMESINICIO,1,4)) * 12 +');
  FSQL.Add('    TO_NUMBER(SUBSTR(RI.ANOMESINICIO,6,2)) +');
  FSQL.Add('    RI.NUMOCORRENCIAS > ' +Copy(MesRef,1,4)+ ' * 12 + '+Copy(MesRef,6,2)+ '))');
  FSQL.Add('UNION');
  FSQL.Add('SELECT');
  FSQL.Add('  H.IDPESSOA, PF.NOME, PD.DESCRICAO, H.MES AS ANOMESINICIO, 0 AS PARCELAS,');
  FSQL.Add('  0 AS NUMOCORRENCIAS, 1 AS FLGPERMANENTE, -99 AS IDREGRACALCULO,');
  FSQL.Add('  H.VALORPROVENTO AS VALORRUBRICA, H.IDRUBRICA, F.MATRICULA' +
    IFF(SelCargo, ', C.TITULO', ''));
  FSQL.Add('FROM');
  FSQL.Add('  HISTRUBSAL H, PESSOA PF, PROVDESC PD, FUNCIONARIO F' +
    IFF(SelCargo, ', CARGO C', ''));  
  FSQL.Add('WHERE');

  if (ListaIdRubrica <> '') then
    if (Pos(',', ListaIdRubrica) > 0) then
      FSQL.Add('  (H.IDRUBRICA      IN (' +ListaIdRubrica+ ')) AND')
    else
      FSQL.Add('  (H.IDRUBRICA       = ' +ListaIdRubrica+ ') AND');

  if (ListaIdPessoa <> '') then
    if (Pos(',', ListaIdPessoa) > 0) then
      FSQL.Add('  (H.IDPESSOA       IN (' +ListaIdPessoa+ ')) AND')
    else
      FSQL.Add('  (H.IDPESSOA        = ' +ListaIdPessoa+ ') AND');

  FSQL.Add('  (H.MES             = ' +QuotedStr(MesUltBeneficio)+ ') AND');
  FSQL.Add('  (PD.FLGCONSTAFOLHA = 1) AND');
  FSQL.Add('  (PD.IDBENEFSALAR  IS NOT NULL) AND');
  FSQL.Add('  (H.IDPESSOA        = F.IDPESSOA) AND');

  if (SelCargo) then
    FSQL.Add('  (F.IDCARGO         = C.IDCARGO) AND');

  FSQL.Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
  FSQL.Add('  (H.IDRUBRICA       = PD.IDPROVENTO)');
  FSQL.Add('ORDER BY');
  FSQL.Add('  ' +IFF(ListaIdRubrica <> '', 'DESCRICAO, ','')+ 'NOME');

  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlBeneficiosRH.ListBeneficiosPessoa(IdPessoa: double; MesUltBeneficio,
  MesRef: string): OleVariant;
begin
  FSQL.Clear;
  FSQL.Add('SELECT');
  FSQL.Add('  PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS, RI.NUMOCORRENCIAS,');
  FSQL.Add('  RI.FLGPERMANENTE, RI.IDREGRACALCULO, RI.VALORRUBRICA, RI.IDRUBRICA');
  FSQL.Add('FROM');
  FSQL.Add('  RUBRICAINDIV RI, PROVDESC PD');
  FSQL.Add('WHERE');
  FSQL.Add('  (RI.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND');
  FSQL.Add('  (RI.ANOMESINICIO  <= ' +QuotedStr(MesRef)+ ') AND');
  FSQL.Add('  (PD.FLGCONSTAFOLHA = 0) AND');
  FSQL.Add('  (PD.IDBENEFSALAR IS NOT NULL) AND');
  FSQL.Add('  (RI.IDRUBRICA      = PD.IDPROVENTO) AND');
  FSQL.Add('  ((RI.FLGPERMANENTE  = 1) OR');
  FSQL.Add('   (TO_NUMBER(SUBSTR(RI.ANOMESINICIO,1,4)) * 12 +');
  FSQL.Add('    TO_NUMBER(SUBSTR(RI.ANOMESINICIO,6,2)) +');
  FSQL.Add('    RI.NUMOCORRENCIAS >');
  FSQL.Add('    TO_NUMBER(SUBSTR(' +QuotedStr(MesRef)+ ',1,4)) * 12 +');
  FSQL.Add('    TO_NUMBER(SUBSTR(' +QuotedStr(MesRef)+ ',6,2))))');
  FSQL.Add('UNION');
  FSQL.Add('SELECT');
  FSQL.Add('  PD.DESCRICAO, H.MES AS ANOMESINICIO, 0 AS PARCELAS, 0 AS NUMOCORRENCIAS,');
  FSQL.Add('  1 AS FLGPERMANENTE, -99 AS IDREGRACALCULO, H.VALORPROVENTO AS VALORRUBRICA,');
  FSQL.Add('  H.IDRUBRICA');
  FSQL.Add('FROM');
  FSQL.Add('  HISTRUBSAL H, PROVDESC PD');
  FSQL.Add('WHERE');
  FSQL.Add('  (H.IDPESSOA        = ' +FloatToStr(IdPessoa)+ ') AND');
  FSQL.Add('  (H.MES             = ' +QuotedStr(MesUltBeneficio)+ ') AND');
  FSQL.Add('  (PD.FLGCONSTAFOLHA = 1) AND');
  FSQL.Add('  (PD.IDBENEFSALAR IS NOT NULL) AND');
  FSQL.Add('  (H.IDRUBRICA       = PD.IDPROVENTO)');
  FSQL.Add('ORDER BY');
  FSQL.Add('  2 DESC');

  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlBeneficiosRH.GetMesUltBeneficio: string;
begin
  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  MAX(H.MES) AS MESREF'+CR_LF+
    'FROM'+CR_LF+
    '  HISTRUBSAL H, PROVDESC PD, PARAMRH P'+CR_LF+
    'WHERE'+CR_LF+
    '  (PD.IDBENEFSALAR IS NOT NULL) AND'+CR_LF+
    '  (P.IDMOTIVO       = H.IDMOTIVO) AND'+CR_LF+
    '  (PD.IDPROVENTO    = H.IDRUBRICA)');

  Result := _Cds.FieldByName('MESREF').asString;
end;

end.

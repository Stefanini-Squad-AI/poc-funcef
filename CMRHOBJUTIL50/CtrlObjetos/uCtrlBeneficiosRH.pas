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

uses SysUtils, Classes, uCMTypes, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH;

type
  TCtrlBeneficiosRH = class(TCtrlCustomRH)
  private
    FSQL: TStringList;
  public
    constructor Create; override;
    destructor Destroy; override;

    function ListBeneficios(ListaIdPessoa, ListaIdRubrica, MesUltBeneficio, MesRef: string;
      Ordenacao: byte = 0; SelCargo: boolean = false): OleVariant;
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
  MesRef: string; Ordenacao: byte; SelCargo: boolean): OleVariant;
begin
  FSQL.Clear;
  FSQL.Add('(SELECT');
  FSQL.Add('   RI.IDPESSOA, PF.NOME, PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS,');
  FSQL.Add('   RI.NUMOCORRENCIAS, RI.FLGPERMANENTE, RI.IDREGRACALCULO,');
  FSQL.Add('   RI.VALORRUBRICA, RI.IDRUBRICA, F.MATRICULA,' +IFF(SelCargo, ' C.TITULO,', ''));
  FSQL.Add('   CC.NOME AS NOMECENTROCUSTO,');
  FSQL.Add('   AP.NOME AS NOMEATIVPROJETO');
  FSQL.Add(' FROM');
  FSQL.Add('   PESSOA PF, RUBRICAINDIV RI, PROVDESC PD, FUNCIONARIO F,');
  FSQL.Add('   UNIDNEGOCIO AP, CENTCUST CC' + IFF(SelCargo, ', CARGO C', ''));
  FSQL.Add(' WHERE');

  if (ListaIdPessoa <> '') then
    FSQL.Add(QuebrarListaFiltro(3,'(RI.IDPESSOA ',ListaIdPessoa,50) + ' AND');

  if (ListaIdRubrica <> '') then
    FSQL.Add(MontaSelSQL('RI.IDRUBRICA',ListaIdRubrica,3,4));

  FSQL.Add('   (RI.ANOMESINICIO  <= ' +QuotedStr(MesRef)+ ') AND');
  FSQL.Add('   (PD.FLGCONSTAFOLHA = 0) AND');
  FSQL.Add('   (PD.IDBENEFSALAR  IS NOT NULL) AND');
  FSQL.Add('   (RI.IDPESSOA       = F.IDPESSOA) AND');

  if (SelCargo) then
    FSQL.Add('   (F.IDCARGO         = C.IDCARGO) AND');

  FSQL.Add('   (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
  FSQL.Add('   (F.IDEMPRESA       = CC.IDEMPRESA) AND');
  FSQL.Add('   (F.IDPESSOA        = PF.IDPESSOA) AND');
  FSQL.Add('   (RI.IDRUBRICA      = PD.IDPROVENTO) AND');
  FSQL.Add('   ((RI.FLGPERMANENTE = 1) OR');
  FSQL.Add('    (TO_NUMBER(SUBSTR(RI.ANOMESINICIO,1,4)) * 12 +');
  FSQL.Add('     TO_NUMBER(SUBSTR(RI.ANOMESINICIO,6,2)) +');
  FSQL.Add('     RI.NUMOCORRENCIAS > ' +Copy(MesRef,1,4)+ ' * 12 + ' +Copy(MesRef,6,2)+ ')) AND');
  FSQL.Add('   (F.UNIDNEGOC       = AP.UNIDNEGOC(+)) AND');
  FSQL.Add('   (F.IDEMPRESA       = AP.IDPESSOA(+)))');
  FSQL.Add('UNION');
  FSQL.Add('(SELECT');
  FSQL.Add('   H.IDPESSOA, PF.NOME, PD.DESCRICAO, H.MES AS ANOMESINICIO, 0 AS PARCELAS,');
  FSQL.Add('   0 AS NUMOCORRENCIAS, 1 AS FLGPERMANENTE, -99 AS IDREGRACALCULO,');
  FSQL.Add('   H.VALORPROVENTO AS VALORRUBRICA, H.IDRUBRICA, F.MATRICULA,' + IFF(SelCargo, ' C.TITULO,', ''));
  FSQL.Add('   CC.NOME AS NOMECENTROCUSTO,');
  FSQL.Add('   AP.NOME AS NOMEATIVPROJETO');
  FSQL.Add(' FROM');
  FSQL.Add('   HISTRUBSAL H, PESSOA PF, PROVDESC PD, FUNCIONARIO F,');
  FSQL.Add('   UNIDNEGOCIO AP, CENTCUST CC' + IFF(SelCargo, ', CARGO C', ''));
  FSQL.Add(' WHERE');

  if (ListaIdPessoa <> '') then
    FSQL.Add(QuebrarListaFiltro(3,'(H.IDPESSOA ',ListaIdPessoa,50) + ' AND');

  if (ListaIdRubrica <> '') then
    FSQL.Add(MontaSelSQL('H.IDRUBRICA',ListaIdRubrica,3,5));

  FSQL.Add('   (H.MES             = ' +QuotedStr(MesUltBeneficio)+ ') AND');
  FSQL.Add('   (PD.FLGCONSTAFOLHA = 1) AND');
  FSQL.Add('   (PD.IDBENEFSALAR  IS NOT NULL) AND');
  FSQL.Add('   (H.IDPESSOA        = F.IDPESSOA) AND');

  if (SelCargo) then
    FSQL.Add('   (F.IDCARGO         = C.IDCARGO) AND');

  FSQL.Add('   (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
  FSQL.Add('   (F.IDEMPRESA       = CC.IDEMPRESA) AND');
  FSQL.Add('   (F.IDPESSOA        = PF.IDPESSOA) AND');
  FSQL.Add('   (H.IDRUBRICA       = PD.IDPROVENTO) AND');
  FSQL.Add('   (F.UNIDNEGOC       = AP.UNIDNEGOC(+)) AND');
  FSQL.Add('   (F.IDEMPRESA       = AP.IDPESSOA(+)))');
  FSQL.Add('ORDER BY');
  
  case (Ordenacao) of
    1  : FSQL.Add('   MATRICULA');
    2  : FSQL.Add('   TITULO, NOME');
    3  : FSQL.Add('   TITULO, MATRICULA');
    4  : FSQL.Add('   NOMECENTROCUSTO, NOME');
    5  : FSQL.Add('   NOMECENTROCUSTO, MATRICULA');
    6  : FSQL.Add('   NOMECENTROCUSTO, TITULO, NOME');
    7  : FSQL.Add('   NOMECENTROCUSTO, TITULO, MATRICULA');
    else FSQL.Add('   NOME');
  end;

  if (ListaIdRubrica <> '') then
    FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', DESCRICAO';

  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlBeneficiosRH.ListBeneficiosPessoa(IdPessoa: double; MesUltBeneficio,
  MesRef: string): OleVariant;
begin
  FSQL.Clear;
  FSQL.Add('(SELECT');
  FSQL.Add('   PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS, RI.NUMOCORRENCIAS,');
  FSQL.Add('   RI.FLGPERMANENTE, RI.IDREGRACALCULO, RI.VALORRUBRICA, RI.IDRUBRICA');
  FSQL.Add(' FROM');
  FSQL.Add('   RUBRICAINDIV RI, PROVDESC PD');
  FSQL.Add(' WHERE');
  FSQL.Add('   (RI.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND');
  FSQL.Add('   (RI.ANOMESINICIO  <= ' +QuotedStr(MesRef)+ ') AND');
  FSQL.Add('   (PD.FLGCONSTAFOLHA = 0) AND');
  FSQL.Add('   (PD.IDBENEFSALAR  IS NOT NULL) AND');
  FSQL.Add('   (RI.IDRUBRICA      = PD.IDPROVENTO) AND');
  FSQL.Add('   ((RI.FLGPERMANENTE = 1) OR');
  FSQL.Add('    (TO_NUMBER(SUBSTR(RI.ANOMESINICIO,1,4)) * 12 +');
  FSQL.Add('     TO_NUMBER(SUBSTR(RI.ANOMESINICIO,6,2)) +');
  FSQL.Add('     RI.NUMOCORRENCIAS > ' +Copy(MesRef,1,4)+ ' * 12 + '+Copy(MesRef,6,2)+ ')))');
  FSQL.Add('UNION');
  FSQL.Add('(SELECT');
  FSQL.Add('   PD.DESCRICAO, H.MES AS ANOMESINICIO, 0 AS PARCELAS, 0 AS NUMOCORRENCIAS,');
  FSQL.Add('   1 AS FLGPERMANENTE, -99 AS IDREGRACALCULO, H.VALORPROVENTO AS VALORRUBRICA,');
  FSQL.Add('   H.IDRUBRICA');
  FSQL.Add(' FROM');
  FSQL.Add('   HISTRUBSAL H, PROVDESC PD');
  FSQL.Add(' WHERE');
  FSQL.Add('   (H.IDPESSOA        = ' +FloatToStr(IdPessoa)+ ') AND');
  FSQL.Add('   (H.MES             = ' +QuotedStr(MesUltBeneficio)+ ') AND');
  FSQL.Add('   (PD.FLGCONSTAFOLHA = 1) AND');
  FSQL.Add('   (PD.IDBENEFSALAR  IS NOT NULL) AND');
  FSQL.Add('   (H.IDRUBRICA       = PD.IDPROVENTO))');
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

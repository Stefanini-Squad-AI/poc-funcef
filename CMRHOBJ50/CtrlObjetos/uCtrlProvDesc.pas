{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
Nº SOL: 229874.16590 e 258754.17869 -
Nº PPM: 1136600
Data da Alteração: 08/12/2015
Alteração Form: ajustes de campos novos e alteração de outros campos
Responsável: Michelle Suellyn Mota
Descrição: Adequação do cadastro de rubricas ao manual 2.1 do eSocial
--------------------------------------------------------------------------------
Autor(a)   : Felipe Azevedo dos Santos
Data       : 14/11/20134
Pendência  : SOL 229874/16590 PPM 544597
Descricao  : incluido aba eSocial para cadastro de rubricas.
--------------------------------------------------------------------------------
Rotina......: ListProvDesc
N. Sol......: 229353-16212
N. Kintana..: 434275
Data........: 18-09-2014
Responsável.: Higor Nayde
Descrição...: ajuste referente ao e-social
--------------------------------------------------------------------------------
Nº SOL....:        191668
Nº KINTANA:        1820235
Data da Alteração: 25/11/2014
Alteração:         remover os campos referentes a parametrização de incidência
                   de ventos e regras de cálculo (FLGSALFAMILIA,
                   FLGDECIMOTERCEIRO,FLGBENEFICIOS, FLGRESCISAO, FLGFERIAS,
                   FLGCEDIDOS, IDREGRA13,IDREGRABENEFICIOS,IDREGRARESCISAO,
                   IDREGRAFERIAS, IDREGRACEDIDOS
Responsável:       Edilaine
Descrição:         Trocar o tipo de cadastro de radio group para grid na aba
                   "Incidência de Eventos" do cadastro de rubricas salariais
--------------------------------------------------------------------------------
Autor(a)    : Felipe A. Santos
Data        : 17/12/2013
Pendência   : SOL 201660 KTN 1963920
Descricao   : inclusão do flgdesconto na rotina lista rubrica empresa.
--------------------------------------------------------------------------------
Autor(a)    : Monica Gonzaga
Data        : 28/01/2013
Pendência   : SOL 188078 kintana 1772223
Descricao   : Inclusao da Aba Seleção de Rubricas e Empregados.
--------------------------------------------------------------------------------
Nº SOL......: 170594
Nº KINTANA..: 1521425
Data........: 06/07/2012
Responsável.: Douglas.Siqueira
Descrição...: Descrição...: Relatório Recibo/Aviso de Férias
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 134951/135037
Nº KINTANA..: 800471/801484
Data........: 26/11/2010
Responsável.: Thaise Amaral Martins
Descrição...: Função ListRubricaEmpresa foi alterada para trazer na query as
              rubricas com débito em conta e as somente com excesso de débito.
--------------------------------------------------------------------------------
Autor(a)   : Douglas Siqueira
Data       : 21/12/2012
Pendência  : SOL 108804 KTN 494141
Descricao  : Retirar visualização na Folha de Pagamento de dados de outros
             módulos, tais como: layout de arquivos TXT, tabelas genéricas,
             rubricas, formas de cálculo etc.
             Menus: * Cadastro / Tabelas Auxiliares / Tabela REGRA/Forma de
             Cálculo - Forma de Cálculo e Tabela Genérica * Sistema /
             Utilitários / Layout de Arquivos TXT * Cadastros / Rubricas por
             Empresa * Cadastros / Rubricas Salariais * Cadastros / Motivos e
             Ações Impedir o mesmo acesso aos dados da folha por outros módulos.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlProvDesc;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlFuncoesRH,
  uCtrlCustomRH, uDbProvDesc, uDbRubXSit, uDbRubXRub,
  uDbRubxEvento;  // edilaine - SOL 191668 / KTN 1820235

type
  TCtrlProvDesc = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbProvDesc;
    FDbRubSit: TDbRubXSit;
    FDbRubxRub: TDbRubXRub;
    FDbRubxEvento : TDbRubxEvento;   // edilaine - SOL 191668 / KTN 1820235
    FCds: TCMClientDataSet;
    FCdsRubSit: TCMClientDataSet;
    FCdsRubxRubEm: TCMClientDataSet;
    FCdsRubxRubDe: TCMClientDataSet;
    FCdsRubxEvento: TCMClientDataSet;   // edilaine - SOL 191668 / KTN 1820235

    function GetDescricaoRubricaCopia(DescricaoProxima: string): integer;
  public
    bUsaDBC, bUsaDBCEx, bUsaferias: Boolean;//SOL170594 DOUGLAS.SIQUEIRA
    constructor Create;  override;
    destructor  Destroy; override;

    function ListRubricasIncidEvento(IdProvento: double): OleVariant;       // edilaine - SOL 191668 / KTN 1820235
    function GetNumeroLinhaRubxEvento(IdProvento: double) : integer;        // edilaine - SOL 191668 / KTN 1820235

    function ListProvDesc(IdProvento: double): OleVariant;
    function ListRubXSit(IdProvento: double; ComSituacao: boolean = true): OleVariant;
    function ListRubrica(IdProvento: double): OleVariant;
    function ListRubricasIncidEm(IdProvento: double): OleVariant;
    function ListRubricasIncidDe(IdProvento: double): OleVariant;
    function ListRubricasRH: OleVariant;
    function ListRubricaEmpresa(ListaIdEmpresa: string; ConstaFolha: integer = -1;
      Campos: string = ''; SelBeneficio: integer = -1;  //Monica Gonzaga SOL 188078 kintana 1772223
      ListaIdRubrica: string = ''; //Monica Gonzaga SOL 188078 kintana 1772223
      flgDesconto : integer = -1 // Felipe A. Santos SOL 201660 KTN 1963920
      ): OleVariant;

    function ListRubricaEmpresaFerias(ListaIdEmpresa,Listaidpessoa,AnoMes,ListaMotivo: string; ConstaFolha: integer = -1;
      Campos: string = ''; SelBeneficio: integer = -1): OleVariant;//SOL170594 DOUGLAS.SIQUEIRA

    function ListRubSel(IdEmpresa: double): OleVariant;
    function ListRubNaoSel(IdEmpresa: double): OleVariant;
    function ListProvento(IdRubrica, IdEmpresa: double; ConstaFolha: integer = -1;
      Campos: string = ''): OleVariant;

    function GetDescricaoRubrica(IdRubrica, IdEmpresa: double): string;

    function CopiarRubrica: boolean;
    function GravarProvento: boolean;
    function GravarProvDesc(ovProvento, ovRubSit, ovRubxRubEm, ovRubxRubDe, ovRubxEvento: OleVariant): boolean;  // edilaine - SOL 191668 / KTN 1820235
    function ExcluirProvDesc: boolean;

    function GravarRubricaEmpresa(Operacao: TOperacaoDataSet; IdProvento, IdEmpresa: double;
      TipoRubrica, CodProvDesc, DescrProvDesc: string): boolean;
    function AlterarTipoRubricaEmpresa(Visivel: boolean; IdEmpresa: double): boolean;

    function ListProcessosRubrica(pIdProvDesc : Double) : OleVariant; // Felipe A. Santos SOL 229874.16590 PPM 544597

    property Cds: TCMClientDataSet read FCds write FCds;
    property CdsRubSit: TCMClientDataSet read FCdsRubSit write FCdsRubSit;
    property CdsRubxRubEm: TCMClientDataSet read FCdsRubxRubEm write FCdsRubxRubEm;
    property CdsRubxRubDe: TCMClientDataSet read FCdsRubxRubDe write FCdsRubxRubDe;
    property CdsRubxEvento : TCMClientDataSet read FCdsRubxEvento write FCdsRubxEvento;   // edilaine - SOL 191668 / KTN 1820235
  end;

implementation

uses uCMTypes;

{ TCtrlProvDesc }

constructor TCtrlProvDesc.Create;
begin
  inherited;
  FDb := TDbProvDesc.Create(Self);
  FDbRubSit := TDbRubXSit.Create(Self);
  FDbRubXRub := TDbRubXRub.Create(Self);
  FDbRubxEvento := TDbRubxEvento.Create(self);   // edilaine - SOL 191668 / KTN 1820235
  bUsaDBC:= False;
  bUsaDBCEx:= False;
  bUsaferias:= False;

end;

destructor TCtrlProvDesc.Destroy;
begin
  FDbRubxEvento.Free;      // edilaine - SOL 191668 / KTN 1820235
  FDbRubXRub.Free;
  FDbRubSit.Free;
  FDb.Free;
  if (IsAppServer) then
  begin
    FCdsRubxEvento.free;     // edilaine - SOL 191668 / KTN 1820235
    FCdsRubxRubEm.Free;
    FCdsRubxRubDe.Free;
    FCdsRubSit.Free;
    FCds.Free;
  end;
  inherited;
end;

procedure TCtrlProvDesc.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsRubSit := TCMClientDataSet.Create(nil);
  FCdsRubxRubEm := TCMClientDataSet.Create(nil);
  FCdsRubxRubDe := TCMClientDataSet.Create(nil);
  FCdsRubxEvento := TCMClientDataSet.Create(nil);   // edilaine - SOL 191668 / KTN 1820235
end;

procedure TCtrlProvDesc.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
  FDbRubSit.DatabaseName := DataBaseName;
  FDbRubXRub.DatabaseName := DataBaseName;
  FDbRubxEvento.DatabaseName := DataBaseName;   // edilaine - SOL 191668 / KTN 1820235
end;

function TCtrlProvDesc.ListProvDesc(IdProvento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT P.*,(SELECT NOME_NAT FROM RUBRICAXESOCIAL R WHERE R.IDRUBRICAXESOCIAL = P.IDRUBRICAXESOCIAL) AS NOME_NAT '+CR_LF+
    ' ,(SELECT CODNATESOCIAL FROM RUBRICAXESOCIAL R WHERE R.IDRUBRICAXESOCIAL = P.IDRUBRICAXESOCIAL) AS CODNATESOCIAL '+CR_LF+  // Higor SOL 229353-16212 / PPM 434275
    'FROM   PROVDESC P'+CR_LF+
    'WHERE (P.IDPROVENTO      =  '+FloatToStr(IdProvento)+') AND'+CR_LF+
    '      (P.FLGTPRUBRICA LIKE ''%F%'')');
end;

function TCtrlProvDesc.ListRubrica(IdProvento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  RP.CODPROVDESC, RP.DESCRPROVDESC, PD.FLGDESCONTO, PD.IDPROVENTO'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (PD.IDPROVENTO = '+FloatToStr(IdProvento)+') AND'+CR_LF+
    '  (PD.IDPROVENTO = RP.IDRUBRICA)');
end;

function TCtrlProvDesc.ListRubXSit(IdProvento: double; ComSituacao: boolean): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  R.IDPROVENTO, R.IDSITFUNC'+
      IFF(ComSituacao, ', RTRIM(ST.DESCRICAO) AS DESCRICAO', '') +CR_LF+
    'FROM' +CR_LF+
    '  RUBXSIT R'+ IFF(ComSituacao, ', SITFUNC ST', '') +CR_LF+
    'WHERE' +CR_LF+ IFF(ComSituacao, '  (ST.TIPOSIT   = ''F'') AND'+CR_LF, '')+
    '  (R.IDPROVENTO = ' +FloatToStr(IdProvento)+ ')'+
    IFF(ComSituacao, ' AND' +CR_LF+ '  (ST.IDSITFUNC = R.IDSITFUNC)', ''));
end;

function TCtrlProvDesc.ListRubricasIncidEm(IdProvento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  R.IDRUBPRINC, R.IDRUBSECUND, R.FLGBASECALC,'+CR_LF+
    '  R.FLGTIPOFOLHA, R.INDPERIODO, R.FLGACAOINCIDE,'+CR_LF+
    '  SUBSTR(RTRIM(P.DESCRICAO),1,40) AS DESCRICAO,'+CR_LF+
    '  P.NUMPRIORIDADE'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC P, RUBXRUB R'+CR_LF+
    'WHERE'+CR_LF+
    '  (R.IDRUBPRINC  = '+FloatToStr(IdProvento)+') AND'+CR_LF+
    '  (R.IDRUBSECUND = P.IDPROVENTO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlProvDesc.ListRubricasIncidDe(IdProvento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  R.IDRUBPRINC, R.IDRUBSECUND, R.FLGBASECALC,'+CR_LF+
    '  R.FLGTIPOFOLHA, R.INDPERIODO, R.FLGACAOINCIDE,'+CR_LF+
    '  SUBSTR(RTRIM(P.DESCRICAO),1,40) AS DESCRICAO,'+CR_LF+
    '  P.NUMPRIORIDADE'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC P, RUBXRUB R'+CR_LF+
    'WHERE'+CR_LF+
    '  (R.IDRUBSECUND = '+FloatToStr(IdProvento)+') AND'+CR_LF+
    '  (R.IDRUBPRINC  = P.IDPROVENTO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlProvDesc.ListRubricasRH: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPROVENTO, RTRIM(DESCRICAO) AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC'+CR_LF+
    'WHERE'+CR_LF+
    '  (FLGTPRUBRICA LIKE ''%F%'')');
end;




function TCtrlProvDesc.ListRubricaEmpresaFerias(ListaIdEmpresa,Listaidpessoa,AnoMes,ListaMotivo: string; ConstaFolha: integer;//SOL170594 DOUGLAS.SIQUEIRA
  Campos: string; SelBeneficio: integer): OleVariant;
var
  sSQL, sSQLDBC: string;
begin          
sSQL:='SELECT DISTINCT PD.DESCRICAO as DESCRPROVDESC, PD.IDPROVENTO as CODPROVDESC';
sSQL:=sSQL+' FROM HISTRUBSAL HS ';
sSQL:=sSQL+' JOIN ELEGPATRO EL ON EL.IDPESSOA = HS.IDPESSOA ';
sSQL:=sSQL+' JOIN MOTIVO MT ON MT.IDMOTIVO = HS.IDMOTIVO ';
sSQL:=sSQL+' JOIN PESSOA P ON P.IDPESSOA = HS.IDPESSOA ';
//sSQL:=sSQL+' JOIN PROVDESC PD ON PD.IDPROVENTO = HS.CODPROVDESC ';
sSQL:=sSQL+' JOIN PROVDESC PD   ON TO_CHAR(PD.IDPROVENTO) = HS.CODPROVDESC ';
sSQL:=sSQL+' WHERE ';
sSQL:=sSQL+' HS.MES ='+#39+AnoMes+#39;
if  trim(Listaidpessoa)<>'' then
   sSQL:=sSQL+' AND HS.IDPESSOA in ('+Listaidpessoa+' )';

if trim(ListaMotivo)<>'' then
   sSQL:=sSQL+'  AND  HS.IDMOTIVO in '+#39+ListaMotivo+#39;

Result := GetDataPacket(sSQL);
end;

function TCtrlProvDesc.ListRubricaEmpresa(ListaIdEmpresa: string; ConstaFolha: integer;
  Campos: string; SelBeneficio: integer;
  ListaIdRubrica: string; //Monica Gonzaga SOL 188078 kintana 1772223
  flgDesconto : integer // Felipe A. Santos SOL 201660 KTN 1963920
  ): OleVariant;
var
  sSQL, sSQLDBC, sSQLRub: string;     //Monica Gonzaga SOL 188078 kintana 1772223
begin

  sSQLDBC:= '  (PD.IDPROVENTO = RP.IDRUBRICA) ';

  //Monica Gonzaga SOL 188078 kintana 1772223
  sSQLRub := '';
  if ListaIdRubrica <> '' then
  begin
    if Pos(',', ListaIdRubrica) > 0 then
      sSQLRub := '  (PD.IDPROVENTO  IN (' +ListaIdRubrica+ ')) AND'+CR_LF
    else
      sSQLRub := '  (PD.IDPROVENTO   = ' +ListaIdRubrica+ ') AND'+CR_LF;
  end;
  //Monica Gonzaga SOL 188078 kintana 1772223
  
  if (ConstaFolha > -1) then
    sSQL := '  (PD.FLGCONSTAFOLHA = '+IntToStr(ConstaFolha)+') AND'+CR_LF
  else
    sSQL := '';

  case (SelBeneficio) of
    0 : sSQL := sSQL + '  (PD.IDBENEFSALAR  IS NULL) AND'+CR_LF;
    1 : sSQL := sSQL + '  (PD.IDBENEFSALAR  IS NOT NULL) AND'+CR_LF;
  end;

  // Felipe A. Santos SOL 201660 KTN 1963920
  if (flgDesconto > -1) then
     sSQL := sSQL + '  (PD.FLGDESCONTO  = '+ IntToStr(flgDesconto) +') AND'+CR_LF;
  // Felipe A. Santos SOL 201660 KTN 1963920 - fim

  if bUsaDBCEx then
    sSQLDBC:= ' (PD.IDPROVENTOEXCESSODEB = RP.IDRUBRICA)'+CR_LF+
              '  AND( PD.FLGEXCESSODEB = 1) ';

  if bUsaDBC then
    sSQLDBC:= '  (PD.IDPROVENTOEXCESSODEB = RP.IDRUBRICA)'+CR_LF+
              '  AND( PD.FLGEXCESSODEB = 1)'+CR_LF+
              '  AND( PD.FLGDEBCONTA = 1) ';

// inicio - edilaine - SOL 191668 / KTN 1820235 - comentado pq não é utilizado
//SOL170594 DOUGLAS.SIQUEIRA
{  if bUsaferias then
    sSQLDBC:= ' ( PD.FLGFERIAS = 1)'+CR_LF+
              ' AND (RP.IDRUBRICA   = PD.IDPROVENTO)';
}
//SOL170594 DOUGLAS.SIQUEIRA
// fim - edilaine - SOL 191668 / KTN 1820235 - comentado

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    IFF(Campos <> '', Campos, '  RP.*, PD.*')+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    sSQL+
    '  (PD.FLGTPRUBRICA LIKE ''%F%'') AND'+CR_LF+
    IFF(Pos(',', ListaIdEmpresa) > 0,
      '  (RP.IDPESSOA  IN (' +ListaIdEmpresa+ ')) AND',
      '  (RP.IDPESSOA   = ' +ListaIdEmpresa+ ') AND')+CR_LF+
      //'  (PD.IDPROVENTO = RP.IDRUBRICA)'+CR_LF+
    sSQLRub +   //Monica Gonzaga SOL 188078 kintana 1772223
    sSQLDBC +
    ' ORDER BY'+CR_LF+
    '   RP.DESCRPROVDESC');
end;

function TCtrlProvDesc.ListProvento(IdRubrica, IdEmpresa: double; ConstaFolha: integer;
  Campos: string): OleVariant;
var
  sSQL: string;
begin
  if (ConstaFolha > -1) then
    sSQL := '  (PD.FLGCONSTAFOLHA = '+IntToStr(ConstaFolha)+') AND'+CR_LF
  else
    sSQL := '';

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    IFF(Campos <> '', Campos,
      '  RP.IDRUBRICA, (''  '' || RTRIM(LTRIM(RP.DESCRPROVDESC))) AS DESCRPROVDESC')+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (RP.IDRUBRICA = ' +FloatToStr(IdRubrica)+ ') AND'+CR_LF+
    '  (RP.IDPESSOA  = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    sSQL+
    '  (RP.IDRUBRICA = PD.IDPROVENTO) AND'+CR_LF+
    '  (PD.FLGTPRUBRICA LIKE ''%F%'')');
end;

function TCtrlProvDesc.GetDescricaoRubrica(IdRubrica, IdEmpresa: double): string;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  (''  '' || RTRIM(LTRIM(RP.DESCRPROVDESC))) AS DESCRPROVDESC'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (RP.IDRUBRICA = ' +FloatToStr(IdRubrica)+ ') AND'+CR_LF+
    '  (RP.IDPESSOA  = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (RP.IDRUBRICA = PD.IDPROVENTO) AND'+CR_LF+
    '  (PD.FLGTPRUBRICA LIKE ''%F%'')');

  Result := _Cds.FieldByName('DESCRPROVDESC').asString;

  FreeAndNil(_Cds);
end;

function TCtrlProvDesc.GetDescricaoRubricaCopia(DescricaoProxima: string): integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  MAX(NVL(TO_NUMBER(SUBSTR(DESCRICAO,'+IntToStr(Length(DescricaoProxima)+1)+
      ',2)),0)) AS NUM'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC'+CR_LF+
    'WHERE'+CR_LF+
    '  (DESCRICAO LIKE ' +QuotedStr(DescricaoProxima +'%')+ ')');

  if (_Cds.IsEmpty) then
    Result := 0
  else
    Result := _Cds.FieldByName('NUM').asInteger;

  FreeAndNil(_Cds);
end;

function TCtrlProvDesc.CopiarRubrica: boolean;
var
  _Cds, _CdsRubSit, _CdsRubxRubEm, _CdsRubxRubDe, _cdsRubxEvento: TCMClientDataSet;    // edilaine - SOL 191668 / KTN 1820235

{-->}procedure GerarProxDescricaoRubricaCopia;
     var
       iNumCopiaRub: integer;
       sDecricaoRubAtual: string;
     begin
       sDecricaoRubAtual := 'Cópia - ' + Trim(FCds.FieldByName('DESCRICAO').asString) +' - ';
       iNumCopiaRub := GetDescricaoRubricaCopia(sDecricaoRubAtual) + 1;
       _Cds.Edit;
       _Cds.FieldByName('DESCRICAO').asString := sDecricaoRubAtual + IntToStr(iNumCopiaRub);
       _Cds.Post;
{-->}end;
begin
  Result := true;
  try
    _Cds := TCMClientDataSet.Create(nil);
    _CdsRubSit := TCMClientDataSet.Create(nil);
    _CdsRubxRubEm := TCMClientDataSet.Create(nil);
    _CdsRubxRubDe := TCMClientDataSet.Create(nil);
    _cdsRubxEvento := TCMClientDataSet.create(nil);   // edilaine - SOL 191668 / KTN 1820235
    try
      FCds.DisableControls;
      FCdsRubSit.DisableControls;
      FCdsRubxRubEm.DisableControls;
      FCdsRubxRubDe.DisableControls;
      FCdsRubxEvento.DisableControls;   // edilaine - SOL 191668 / KTN 1820235

      _Cds.Data := FCds.Data;
      _CdsRubSit.Data := FCdsRubSit.Data;
      _CdsRubxRubEm.Data := FCdsRubxRubEm.Data;
      _CdsRubxRubDe.Data := FCdsRubxRubDe.Data;
      _cdsRubxEvento.Data := FCdsRubxEvento.Data;   // edilaine - SOL 191668 / KTN 1820235

      if not(AssociarDadosCds(FCds, _Cds)) then
        raise Exception.Create('Erro ao tentar inserir dados na tabela '+ FDb.TableName);
      GerarProxDescricaoRubricaCopia;
      if not(AssociarDadosCds(FCdsRubSit, _CdsRubSit)) then
        raise Exception.Create('Erro ao tentar inserir dados na tabela '+ FDbRubSit.TableName);
      if not(AssociarDadosCds(FCdsRubxRubEm, _CdsRubxRubEm)) or
         not(AssociarDadosCds(FCdsRubxRubDe, _CdsRubxRubDe)) then
        raise Exception.Create('Erro ao tentar inserir dados na tabela '+ FDbRubxRub.TableName);

      // inicio - edilaine - SOL 191668 / KTN 1820235
      if not(AssociarDadosCds(FCdsRubxEvento, _cdsRubxEvento)) then
        raise Exception.Create('Erro ao tentar inserir dados na tabela '+ FDbRubxEvento.TableName);
      // fim - edilaine - SOL 191668 / KTN 1820235

      if (GravarProvDesc(_Cds.Data, _CdsRubSit.Data, _CdsRubxRubEm.Data, _CdsRubxRubDe.Data, _cdsRubxEvento.data)) then   // edilaine - SOL 191668 / KTN 1820235
        MessageInfo := 'Replicação Concluída com sucesso.'
      else
        raise Exception.Create(MessageInfo);

      FCds.EnableControls;
      FCdsRubSit.EnableControls;
      FCdsRubxRubEm.EnableControls;
      FCdsRubxRubDe.EnableControls;
      FCdsRubxEvento.EnableControls;         // edilaine - SOL 191668 / KTN 1820235

      Result := true;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(_Cds);
    FreeAndNil(_CdsRubSit);
    FreeAndNil(_CdsRubxRubEm);
    FreeAndNil(_CdsRubxRubDe);
    FreeAndNil(_cdsRubxEvento);         // edilaine - SOL 191668 / KTN 1820235
  end;
end;

function TCtrlProvDesc.GravarProvento: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarProvento(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
        Commit
      else
      begin
        Rollback;
        MessageInfo := FDb.MessageInfo;
      end;          
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlProvDesc.GravarProvDesc(ovProvento, ovRubSit, ovRubxRubEm,
  ovRubxRubDe, ovRubxEvento : OleVariant): boolean;        // edilaine - SOL 191668 / KTN 1820235
var
  _Cds, _CdsRubSit, _CdsRubxRubEm, _CdsRubxRubDe, _cdsRubxEvento: TCMClientDataSet;   // edilaine - SOL 191668 / KTN 1820235
begin
  try
    _Cds := TCMClientDataSet.Create(nil);
    _CdsRubSit := TCMClientDataSet.Create(nil);
    _CdsRubxRubEm := TCMClientDataSet.Create(nil);
    _CdsRubxRubDe := TCMClientDataSet.Create(nil);
    _cdsRubxEvento := TCMClientDataSet.Create(nil);  // edilaine - SOL 191668 / KTN 1820235

    _Cds.Data := ovProvento;
    _CdsRubSit.Data := ovRubSit;
    _CdsRubxRubEm.Data := ovRubxRubEm;
    _CdsRubxRubDe.Data := ovRubxRubDe;
    _cdsRubxEvento.Data := ovRubxEvento;    // edilaine - SOL 191668 / KTN 1820235

    if (ConnectionSide = cnsClient) then
    begin
      Result := Connection.AppServer.GravarProvDesc(_Cds.Data, _CdsRubSit.Data,
        _CdsRubxRubEm.Data, _CdsRubxRubDe.Data, _cdsRubxEvento.data);   // edilaine - SOL 191668 / KTN 1820235
      if not(Result) then
        MessageInfo := Connection.AppServer.MessageInfo;
    end
    else
    begin
      try
        StartTransaction;

        Result := ApplyCds(_Cds, FDb, [], []);
        if (Result) then
        begin
          Result := ApplyCds(_CdsRubSit, FDbRubSit, [FDb.IdProvento], [FDbRubSit.IdProvento]);
          if (Result) then
          begin
            Result := ApplyCds(_CdsRubxRubEm, FDbRubxRub, [FDb.IdProvento], [FDbRubxRub.IdRubPrinc]);
            if (Result) then
            begin
              Result := ApplyCds(_CdsRubxRubDe, FDbRubxRub, [FDb.IdProvento], [FDbRubxRub.IdRubSecund]);
              if (Result) then
              begin
                // inicio - edilaine - SOL 191668 / KTN 1820235
                Result := ApplyCds(_cdsRubxEvento, FDbRubxEvento, [FDb.IdProvento], [FDbRubxEvento.IdProvento,FDbRubxEvento.IdMotivo]);
                if not(Result) then
                   raise Exception.Create(FDbRubxEvento.MessageInfo);
              end
              // fim - edilaine - SOL 191668 / KTN 1820235
              else
                raise Exception.Create(FDbRubxRub.MessageInfo);
            end
            else
              raise Exception.Create(FDbRubxRub.MessageInfo);
          end
          else
            raise Exception.Create(FDbRubSit.MessageInfo);
        end
        else
          raise Exception.Create(FDb.MessageInfo);

        Commit;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
    end;
  finally
    FreeAndNil(_Cds);
    FreeAndNil(_CdsRubSit);
    FreeAndNil(_CdsRubxRubEm);
    FreeAndNil(_CdsRubxRubDe);
    FreeAndNil(_CdsRubxEvento);    // edilaine - SOL 191668 / KTN 1820235
  end;
end;

function TCtrlProvDesc.ExcluirProvDesc: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirProvDesc(FCds.Data, FCdsRubSit.Data,
      FCdsRubxRubEm.Data, FCdsRubxRubDe.Data, FCdsRubxEvento.data);             // edilaine - SOL 191668 / KTN 1820235
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      // inicio - edilaine - SOL 191668 / KTN 1820235
      FCdsRubxEvento.First;
      while not (FCdsRubxEvento.eof) do
         FCdsRubxEvento.Delete;
         
      Result := ApplyCds(FCdsRubxEvento, FDbRubxEvento, [], []);

      if (Result) then
      begin
        FCdsRubxRubDe.First;
        while not(FCdsRubxRubDe.EOF) do
          FCdsRubxRubDe.Delete;

        Result := ApplyCds(FCdsRubxRubDe, FDbRubxRub, [], []);
        if (Result) then
        begin
          FCdsRubxRubEm.First;
          while not(FCdsRubxRubEm.EOF) do
            FCdsRubxRubEm.Delete;

          Result := ApplyCds(FCdsRubxRubEm, FDbRubxRub, [], []);
          if (Result) then
          begin
            FCdsRubSit.First;
            while not(FCdsRubSit.EOF) do
              FCdsRubSit.Delete;

            Result := ApplyCds(FCdsRubSit, FDbRubSit, [], []);
            if (Result) then
            begin
              Result := ApplyCds(FCds, FDb, [], []);
              if not(Result) then
                raise Exception.Create(FDb.MessageInfo);
            end
            else
              raise Exception.Create(FDbRubSit.MessageInfo);
          end
          else
            raise Exception.Create(FDbRubxRub.MessageInfo);
        end
        else
          raise Exception.Create(FDbRubxRub.MessageInfo);
      end
      else
          raise Exception.Create(FDbRubxEvento.MessageInfo);
      // fim - edilaine - SOL 191668 / KTN 1820235

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlProvDesc.GravarRubricaEmpresa(Operacao: TOperacaoDataSet; IdProvento,
  IdEmpresa: double; TipoRubrica, CodProvDesc, DescrProvDesc: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(IdProvento, IdEmpresa, TipoRubrica, CodProvDesc,
      DescrProvDesc);

    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      // Atualizar a visibilidade
      if (TipoRubrica <> '') then
        Result := ExecSQL('UPDATE PROVDESC SET FLGTPRUBRICA = '+QuotedStr(Trim(TipoRubrica))+
          ' WHERE (IDPROVENTO = '+FloatToStr(IdProvento)+')')
      else
        Result := true;

      // Atualizar a RubricaXPess
      if (Result) then
        case (Operacao) of
          toInserir : Result :=
            ExecSQL('INSERT INTO RUBRICAXPESS (IDRUBRICA,IDPESSOA,CODPROVDESC,DESCRPROVDESC) '+
              'VALUES ('+FloatToStr(IdProvento)+','+FloatToStr(IdEmpresa)+','+
              QuotedStr(CodProvDesc)+','+QuotedStr(DescrProvDesc)+')');
          toAlterar : Result :=
            ExecSQL('UPDATE RUBRICAXPESS SET CODPROVDESC='+QuotedStr(CodProvDesc)+
              ',DESCRPROVDESC='+QuotedStr(DescrProvDesc)+' WHERE (IDRUBRICA = '+
              FloatToStr(IdProvento)+') AND '+'(IDPESSOA = '+FloatToStr(IdEmpresa)+')');
          toExcluir : Result :=
            ExecSQL('DELETE RUBRICAXPESS WHERE (IDRUBRICA = '+
              FloatToStr(IdProvento)+') AND '+'(IDPESSOA = '+FloatToStr(IdEmpresa)+')');
        end;

      if not(Result) then
        Rollback
      else
        Commit;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
        Rollback;
      end;
    end;
  end;
end;

function TCtrlProvDesc.AlterarTipoRubricaEmpresa(Visivel: boolean;
  IdEmpresa: double): boolean;
var
  sSQL: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarAltTipRub(Visivel, IdEmpresa);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      if (Visivel) then
      begin // Para Tornar todas VISÍVEIS
        sSQL :=
          'FLGTPRUBRICA = DECODE(RTRIM(LTRIM(FLGTPRUBRICA)), '''', ''F'','+CR_LF+
          '  DECODE(INSTR(RTRIM(LTRIM(FLGTPRUBRICA)),''F''), 0,'+CR_LF+
          '  RTRIM(LTRIM(FLGTPRUBRICA)) || ''F'', RTRIM(LTRIM(FLGTPRUBRICA))))'+CR_LF;
      end
      else
      begin // Para Tornar todas INVISÍVEIS
        sSQL :=
          'FLGTPRUBRICA = DECODE(RTRIM(LTRIM(FLGTPRUBRICA)), '''', '''','+CR_LF+
          '  DECODE(INSTR(RTRIM(LTRIM(FLGTPRUBRICA)),''F''), 0,'+CR_LF+
          '  RTRIM(LTRIM(FLGTPRUBRICA)), RTRIM(LTRIM(REPLACE(FLGTPRUBRICA,''F'','''')))))'+CR_LF;
      end;

      Result := ExecSQL('UPDATE PROVDESC SET' +CR_LF+ sSQL + 'WHERE'+CR_LF+
        '  (IDPROVENTO IN (SELECT IDRUBRICA FROM RUBRICAXPESS WHERE IDPESSOA = ' +
        FloatToStr(IdEmpresa)+'))');

      if not(Result) then
        Rollback
      else
        Commit;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
        Rollback;
      end;
    end;
  end;
end;

function TCtrlProvDesc.ListRubSel(IdEmpresa: double): OleVariant;
begin
  if MODFOL = 21 then
     begin
     Result := GetDataPacket(
     'SELECT'+CR_LF+
     '  RP.IDRUBRICA, RP.IDPESSOA, RP.CODPROVDESC,'+CR_LF+
     '  RTRIM(RP.DESCRPROVDESC) AS DESCRPROVDESC,'+CR_LF+
     '  RTRIM(LTRIM(PD.FLGTPRUBRICA)) AS FLGTPRUBRICA,'+CR_LF+
     '  RTRIM(PD.DESCRICAO) AS DESCRICAO'+CR_LF+
     'FROM'+CR_LF+
     '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
     'WHERE'+CR_LF+
     ' (PD.IDMODULO = ' +IntToStr(MODFOL)+ ')'+CR_LF+///DOUGLAS.SIQUEIRA SOL 108804
     'AND  (RP.IDPESSOA  = '+FloatToStr(IdEmpresa)+') AND'+CR_LF+///DOUGLAS.SIQUEIRA SOL 108804
     '  (RP.IDRUBRICA = PD.IDPROVENTO)');
     end
  else
      begin
      Result := GetDataPacket(
      'SELECT'+CR_LF+
      '  RP.IDRUBRICA, RP.IDPESSOA, RP.CODPROVDESC,'+CR_LF+
      '  RTRIM(RP.DESCRPROVDESC) AS DESCRPROVDESC,'+CR_LF+
      '  RTRIM(LTRIM(PD.FLGTPRUBRICA)) AS FLGTPRUBRICA,'+CR_LF+
      '  RTRIM(PD.DESCRICAO) AS DESCRICAO'+CR_LF+
      'FROM'+CR_LF+
      '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
      'WHERE'+CR_LF+
//      ' (PD.IDMODULO = ' +IntToStr(MODFOL)+ ')'+CR_LF+///DOUGLAS.SIQUEIRA SOL 108804
      ' (RP.IDPESSOA  = '+FloatToStr(IdEmpresa)+') AND'+CR_LF+///DOUGLAS.SIQUEIRA SOL 108804
      '  (RP.IDRUBRICA = PD.IDPROVENTO)');
      end;

end;

function TCtrlProvDesc.ListRubNaoSel(IdEmpresa: double): OleVariant;
begin
  if MODFOL = 21 then
     begin
     Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPROVENTO, P.FLGTPRUBRICA, RTRIM(P.DESCRICAO) AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC P'+CR_LF+
    'WHERE'+CR_LF+
    '  (NOT EXISTS(SELECT RP.IDRUBRICA'+CR_LF+
    '              FROM   RUBRICAXPESS RP'+CR_LF+
    '              WHERE  (RP.IDPESSOA  = '+FloatToStr(IdEmpresa)+') AND'+CR_LF+
    '                     (RP.IDRUBRICA = P.IDPROVENTO))) AND'+CR_LF+
    '  (RTRIM(P.DESCRICAO) IS NOT NULL)'+CR_LF+
    ' AND (IDMODULO = ' +IntToStr(MODFOL)+ ')'///DOUGLAS.SIQUEIRA SOL 108804
    )
    end
  else
      begin
     Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPROVENTO, P.FLGTPRUBRICA, RTRIM(P.DESCRICAO) AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC P'+CR_LF+
    'WHERE'+CR_LF+
    '  (NOT EXISTS(SELECT RP.IDRUBRICA'+CR_LF+
    '              FROM   RUBRICAXPESS RP'+CR_LF+
    '              WHERE  (RP.IDPESSOA  = '+FloatToStr(IdEmpresa)+') AND'+CR_LF+
    '                     (RP.IDRUBRICA = P.IDPROVENTO))) AND'+CR_LF+
    '  (RTRIM(P.DESCRICAO) IS NOT NULL)'//+CR_LF+
  //  ' AND (IDMODULO = ' +IntToStr(MODFOL)+ ')'///DOUGLAS.SIQUEIRA SOL 108804
    );
    end;
end;


function TCtrlProvDesc.ListRubricasIncidEvento(IdProvento: double): OleVariant;
begin
  result := GetDataPacket(
   'SELECT M.DESCRICAO AS MOTIVO,  '+
   '       RG.NOMEREGRA AS REGRA,  '+
   '       RE.IDPROVENTO, RE.IDMOTIVO, RE.IDREGRACALC, '+
   '       rownum as linha '+    // rownum serve para controlar a alteração (nao repetir motivo)
   '  FROM RUBXEVENTO RE, MOTIVO M, REGRA RG  '+
   ' WHERE M.IDMOTIVO = RE.IDMOTIVO           '+
   '   AND RE.IDREGRACALC = RG.IDREGRA(+)     '+
   '   AND RE.IDPROVENTO = '+FloatToStr(IdProvento)
   );

end;


function TCtrlProvDesc.GetNumeroLinhaRubxEvento(IdProvento: double) : integer;
begin
  // retorna qtde de linhas inserida para um provento (controle temporário)
  _cds.data := GetDataPacket(
                'SELECT count(RE.IDMOTIVO) as linha '+    // rownum serve para controlar a alteração (nao repetir motivo)
                '  FROM RUBXEVENTO RE '+
                ' WHERE RE.IDPROVENTO = '+FloatToStr(IdProvento)
               );
  result := _cds.fields[0].AsInteger;
  
end;

// Felipe A. Santos SOL 229874.16590 PPM 544597 -início
function TCtrlProvDesc.ListProcessosRubrica(
  pIdProvDesc: Double): OleVariant;
var
   sSQL : string;
begin
  sSQL := 'SELECT PD.IDPROVENTO, ' +
          '       PROCCP.NUMERO AS NUMPROCP, ' +
          '       DECODE(PROCCP.TIPO, ''A'', ''Administrativo'', ' +
          '                          ''J'', ''Judicial'') AS TIPOPROCP, ' +
          '       DECODE(PROCCP.EXTENDECISAO, 1, ''Contrib. Patronais'', ' +
          '                                   2, ''Contrib. Patronais + Segurados'') AS EXTENDECISAO, ' +
          '       PROCIR.NUMERO AS NUMPROIR, ' +
          '       DECODE(PROCIR.TIPO, ''A'', ''Administrativo'', ' +
          '                           ''J'', ''Judicial'') AS TIPOPROIR, ' +
          '       PROCFGTS.NUMERO AS NUMPROFGTS, ' +
          '       DECODE(PROCFGTS.TIPO, ''A'', ''Administrativo'', ' +
          '                             ''J'', ''Judicial'')  AS TIPOPROFGTS ' +
          //Everson Cunha - SIG38475 - Ini
          //'       PROCCS.NUMERO AS NUMPROCS, ' +
          //'       DECODE(PROCCS.TIPO, ''A'', ''Administrativo'', ' +
          //'                           ''J'', ''Judicial'')  AS TIPOPROCS ' +
          //' FROM PROVDESC PD, PROCESSOS PROCCP, PROCESSOS PROCIR, PROCESSOS PROCFGTS,PROCESSOS PROCCS ' +
          ' FROM PROVDESC PD, PROCESSOS PROCCP, PROCESSOS PROCIR, PROCESSOS PROCFGTS ' +
          //Everson Cunha - SIG38475 - Fim
          ' WHERE PD.IDPROVENTO = ' + FloatToStr(pIdProvDesc) +
          '   AND PD.IDPROCESSOCP = PROCCP.IDPROCESSO(+) ' +
          '   AND PD.IDPROCESSOIR = PROCIR.IDPROCESSO(+) ' +
          '   AND PD.IDPROCESSOFGTS = PROCFGTS.IDPROCESSO(+) ';
          //'   AND PD.IDPROCESSOCS = PROCCS.IDPROCESSO(+)'; //Everson Cunha - SIG38475 - Ini
  Result := GetDataPacket(sSQL)
end;
// Felipe A. Santos SOL 229874.16590 PPM 544597 - fim

end.

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/06/2002                                 }
{                                                       }
{*******************************************************}
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit uCtrlParamRH;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbParamRH;

type
  TCtrlParamRH = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbParamRH: TDbParamRH;
    FCdsParamRH: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function GravarParamRH: boolean;

    function ListParamRH: OleVariant;
    function ListMoeda: OleVariant;
    function ListMotivo: OleVariant;
    function ListRubrica(IdEmpresa: integer): OleVariant;

    procedure ExecInsert;

    property CdsParamRH: TCMClientDataSet read FCdsParamRH write FCdsParamRH;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlParamRH }

constructor TCtrlParamRH.Create;
begin
  inherited;
  FDbParamRH := TDbParamRH.Create(Self);
end;

destructor TCtrlParamRH.Destroy;
begin
  FDbParamRH.Free;
  if (IsAppServer) then
    FCdsParamRH.Free;
  inherited;
end;

procedure TCtrlParamRH.OnCreateAppServer;
begin
  inherited;
  FCdsParamRH := TCMClientDataSet.Create(nil);
end;

procedure TCtrlParamRH.DoChangeDataBase;
begin
  inherited;
  FDbParamRH.DataBaseName := DataBaseName;
end;

function TCtrlParamRH.ListParamRH: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  PARAMRH');
end;

function TCtrlParamRH.ListMoeda: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  MOECODIGO, MOEDESC, MOESIGLA'+CR_LF+
    'FROM'+CR_LF+
    '  MOEDA');
end;

function TCtrlParamRH.ListRubrica(IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PD.IDPROVENTO, RP.DESCRPROVDESC AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (RP.IDPESSOA   = '+IntToStr(IdEmpresa)+') AND'+CR_LF+
    '  (PD.FLGTPRUBRICA LIKE ''%F%'') AND'+CR_LF+
    '  (PD.IDPROVENTO = RP.IDRUBRICA)');
end;

function TCtrlParamRH.ListMotivo: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDMOTIVO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  MOTIVO'+CR_LF+
    'WHERE'+CR_LF+
    '  (GRUPOMOTIVO = ''F'')');
end;

procedure TCtrlParamRH.ExecInsert;
begin
  FCdsParamRH.Insert;
  FCdsParamRH.FieldByName('IDPARAMRH').asInteger := 1;
  //Geral
  FCdsParamRH.FieldByName('NORMALINI').asDateTime := Date;
  FCdsParamRH.FieldByName('NORMALFIM').asDateTime := Date;
  FCdsParamRH.FieldByName('FERIASINI').asDateTime := Date;
  FCdsParamRH.FieldByName('FERIASFIM').asDateTime := Date;
  FCdsParamRH.FieldByName('PGTO13INI').asDateTime := Date;
  FCdsParamRH.FieldByName('PGTO13FIM').asDateTime := Date;
  FCdsParamRH.FieldByName('NUMSTEPS').asInteger := 9;
  FCdsParamRH.FieldByName('TITSTEP1').asString := 'Step 1';
  FCdsParamRH.FieldByName('TITSTEP2').asString := 'Step 2';
  FCdsParamRH.FieldByName('TITSTEP3').asString := 'Step 3';
  FCdsParamRH.FieldByName('TITSTEP4').asString := 'Step 4';
  FCdsParamRH.FieldByName('TITSTEP5').asString := 'Step 5';
  FCdsParamRH.FieldByName('TITSTEP6').asString := 'Step 6';
  FCdsParamRH.FieldByName('TITSTEP7').asString := 'Step 7';
  FCdsParamRH.FieldByName('TITSTEP8').asString := 'Step 8';
  FCdsParamRH.FieldByName('TITSTEP9').asString := 'Step 9';
  FCdsParamRH.FieldByName('IDMOTIVO').asFloat := 0;
  FCdsParamRH.FieldByName('IDRUBFALTA').asFloat := 0;
  FCdsParamRH.FieldByName('LIMADM').asInteger := 0;
  FCdsParamRH.FieldByName('LIMDEM').asInteger := 0;
  FCdsParamRH.FieldByName('INDPOLITICA').asInteger := 0;
  FCdsParamRH.FieldByName('FLGDOISCARGOS').asInteger := 0;
  FCdsParamRH.FieldByName('FLGNIVELINDIV').asInteger := 0;
  FCdsParamRH.FieldByName('FLGNUMERAMATRIC').asInteger := 0;
  FCdsParamRH.FieldByName('TAMANHOMATRIC').asInteger := 0;
  FCdsParamRH.FieldByName('INDDURACAOCONTR').asInteger := 3;
  FCdsParamRH.FieldByName('FLGSENHAUSOPES').asInteger := 2;
  FCdsParamRH.FieldByName('FLGENDERINS').asInteger := 0;
  FCdsParamRH.FieldByName('FLGENDERALT').asInteger := 0;
  FCdsParamRH.FieldByName('FLGENDEREXC').asInteger := 0;
  FCdsParamRH.FieldByName('FLGTELEFINS').asInteger := 0;
  FCdsParamRH.FieldByName('FLGTELEFALT').asInteger := 0;
  FCdsParamRH.FieldByName('FLGTELEFEXC').asInteger := 0;
  FCdsParamRH.FieldByName('FLGCONTTINS').asInteger := 0;
  FCdsParamRH.FieldByName('FLGCONTTALT').asInteger := 0;
  FCdsParamRH.FieldByName('FLGCONTTEXC').asInteger := 0;
  FCdsParamRH.FieldByName('FLGCURSOINS').asInteger := 0;
  FCdsParamRH.FieldByName('FLGCURSOALT').asInteger := 0;
  FCdsParamRH.FieldByName('FLGCURSOEXC').asInteger := 0;
  FCdsParamRH.FieldByName('FLGFERIAINS').asInteger := 0;
  FCdsParamRH.FieldByName('FLGFERIAALT').asInteger := 0;
  FCdsParamRH.FieldByName('FLGFERIAEXC').asInteger := 0;
  FCdsParamRH.FieldByName('FLGEMPRGINS').asInteger := 0;
  FCdsParamRH.FieldByName('FLGEMPRGALT').asInteger := 0;
  FCdsParamRH.FieldByName('FLGEMPRGEXC').asInteger := 0;
  FCdsParamRH.FieldByName('FLGLINHAINS').asInteger := 0;
  FCdsParamRH.FieldByName('FLGLINHAALT').asInteger := 0;
  FCdsParamRH.FieldByName('FLGLINHAEXC').asInteger := 0;
  FCdsParamRH.FieldByName('FLGCTSALALT').asInteger := 0;
  FCdsParamRH.FieldByName('FLGFILTRAFATOR').asInteger := 0;
  FCdsParamRH.FieldByName('FLGAVALALUNO').asInteger := 0;
  FCdsParamRH.FieldByName('FLGCURSOXAVAL').asInteger := 0;
  FCdsParamRH.FieldByName('VALMAXAVALTRN').asInteger := 100;
  FCdsParamRH.FieldByName('FLGSENHAUSOPES').asInteger := 0;
  // Jurídico
  FCdsParamRH.FieldByName('FLGINTEGRACONT').asInteger := 0;
  FCdsParamRH.FieldByName('FLGCRIASUBCONTA').asInteger := 0;
  FCdsParamRH.FieldByName('MOEDAPROCTRAB').asInteger := 0;
  FCdsParamRH.FieldByName('FLGINTEGRACAP').asInteger := 0;
  FCdsParamRH.FieldByName('FLGPERCPROB').asInteger := 0;
  FCdsParamRH.FieldByName('INDCONTABJUR').asInteger := 0;
  // Ponto e Banco de Horas
  FCdsParamRH.FieldByName('FLGBANCOHORAS').asInteger := 0;
  FCdsParamRH.FieldByName('PERBANCOHORAS').asInteger := 12;
  FCdsParamRH.FieldByName('LIMBANCOHORAS').asInteger := 2;
  FCdsParamRH.FieldByName('DSRBANCOHORAS').asInteger := 1;
  FCdsParamRH.FieldByName('NORBANCOHORAS').asInteger := 1;
  FCdsParamRH.FieldByName('INDPERBCHORAS').asInteger := 1;
  FCdsParamRH.FieldByName('PONTOINI').asDateTime := Date;
  FCdsParamRH.FieldByName('PONTOFIM').asDateTime := Date;
  //FCdsParamRH.FieldByName('DIRCONFIG').asString := 'C:\';
  FCdsParamRH.FieldByName('DIRCONFIG').asString := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  FCdsParamRH.FieldByName('FLGMARCAAFAST').asInteger := 0;
  FCdsParamRH.FieldByName('FLGMARCAFERIAS').asInteger := 0;
  FCdsParamRH.FieldByName('FLGALTERAPONTO').asInteger := 0;
  // Indicador da Verificação do Orçamento de Pessoal na Inclusão de novo Empregado
  FCdsParamRH.FieldByName('INDORCAMPES').asInteger := 0;
  // Indicador da Verificação do Bloqueio de Candidatos Já Associados a uma Requisição
  FCdsParamRH.FieldByName('FLGBLOQCAND').asInteger := 0;
  FCdsParamRH.Post;
end;

function TCtrlParamRH.GravarParamRH: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarParamRH(FCdsParamRH.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsParamRH, FDbParamRH, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbParamRH.MessageInfo);
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

end.

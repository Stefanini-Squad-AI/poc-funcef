(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 14/09/2000
*******************************************************************************)

unit FParamRelHistAtend;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics, Controls, Forms   , Dialogs,
  FOkCancelar, IvDictio, IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons , wwdblook,
  TB97Tlbr   , TB97    , ExtCtrls, Db      , DBTables, MontaSelect,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker, usistema;

type
  TfrmParamRelHistAtend = class(TfrmOkCancelar)
    Label1      : TLabel;
    lkpcmbpatro : TwwDBLookupCombo;
    Label29     : TLabel;
    grpboxPart  : TGroupBox;
    btnProc     : TBitBtn;
    edNome      : TEdit;
    qryPatro    : TwwQuery;
    qryPlano    : TwwQuery;
    MontaSelect: TMontaSelect;
    lkpcmbPlano: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    dataini: TCMDateTimePicker;
    datafin: TCMDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Fzqry;
    procedure btnProcClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure HabilitaBuscaParticipante(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelHistAtend : TfrmParamRelHistAtend;
  sSql                 : String;

implementation

uses uDataBase, UMensErro, dRelCentralAP, FPrincipal;

{$R *.DFM}

procedure TfrmParamRelHistAtend.FormShow(Sender: TObject);
begin
  inherited;
  // Abre Querys
  qryPatro.Open;
  qryPlano.Open;
end;

procedure TfrmParamRelHistAtend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Fecha Querys
  qryPlano.Close;
  qryPlano.Close;
  // Destrói o Form
  Action := caFree;
end;

procedure TfrmParamRelHistAtend.Fzqry;
begin
   // Monta Query  !!!!!
   ssql:= 'SELECT DISTINCT                       '+
          '                AT.IDATEND          , '+
          '                AT.CODATEND         , '+
          '                PJ.NOME PATRO       , '+
          '                PL.NOME PLANO       , '+
          '                P.NOME TITULAR      , '+
          '                EL.MATRICULA        , '+
          '                P.NUMDOCUMENTO CPF  , '+
          '                PREV.INSCRICAONUMERO, '+
          '                AT.NOMESOLICITANTE  , '+
          '                TELSOLICITANTE      , '+
          '                AT.CODATENDENTE     , '+
          '                AT.STATUS           , '+
          '                TP.NOME TIPO        , '+
          '                AT.DATAINICIO       , '+
          '                AT.DATA             , '+
          '                US.NOMEUSUARIO      , '+
          '                AT.OBSERVACAO         '+
          'FROM PESSOA P, PESSOA    PJ, PARTPREVPLAN PREV, ELEGPATRO EL, '+
          '     ATEND AT, TIPOATEND TP, PLANPREV  PL, '+
          '     USUARIOSISTEMA US '+
          'WHERE ';
   // filtro data inicial
   if DataIni.text <> '' then
      sSql := sSql + 'AT.DATA >= to_date('''+DataIni.Text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') AND ';

   // filtro data final
   if DataFin.text <> '' then
       sSql := sSql + 'AT.DATA <= to_date('''+DataFin.Text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') AND ';

   // filtro patrocinadora
   if lkpcmbPatro.Text <> '' then
      sSql := sSql + 'EL.IDPESSJUR = '+lkpcmbPatro.LookUpValue+' AND ';

   // filtro plano
   if lkpcmbPlano.text <> '' then
      ssql := ssql + 'PREV.IDPLANOPREV = '+lkpcmbPlano.LookUpvalue+' AND ';

   // Filtro Nome
   if edNome.Text <> '' then
      sSql := sSql + 'AT.IDTITULAR = '+MontaSelect.ValoresChave[0]+' AND ';

   sSql := sSql + 'AT.IDTITULAR          = P.IDPESSOA                 '+
                  'AND EL.IDPESSJUR      = PJ.IDPESSOA                '+
                  'AND EL.IDPESSOA       = AT.IDTITULAR               '+
                  'AND TP.IDTIPOATEND    = AT.IDTIPOATEND             '+
                  'AND AT.IDPESSJUR      = EL.IDPESSJUR               '+
                  'AND US.IDUSUARIO      = TO_NUMBER(AT.CODATENDENTE) '+
                  'AND PREV.IDPESSOA(+)  = EL.IDPESSOA                '+
                  'AND PREV.IDPESSJUR(+) = EL.IDPESSJUR               '+
                  'AND PL.IDPLANOPREV    = PREV.IDPLANOPREV ';
             
end;

procedure TfrmParamRelHistAtend.btnProcClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('ELEGPATRO.IDPESSJUR = '+lkpcmbpatro.LookupValue);
  MontaSelect.Filtro.Add('PLANPREV.IDPLANOPREV = '+lkpcmbPlano.LookupValue);
  MontaSelect.Filtro.Add('ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA');
  MontaSelect.Filtro.Add('ELEGPATRO.IDPESSJUR = PJ.IDPESSOA');
  MontaSelect.Filtro.Add('PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA');
  MontaSelect.Filtro.Add('PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR');
  MontaSelect.Filtro.Add('PLANPREV.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV');

  MontaSelect.Executar;
  if MontaSelect.RetornouValor then
     edNome.Text := MontaSelect.ValoresChave[1];

end;

procedure TfrmParamRelHistAtend.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  try
    Sistema.GravaLogOperacoes('Operação de Consulta do Rel. de Hist de Atend.');
  except
  end;

  FzQry;
  Fazquery(dtmRelCentralAP.qryHistAtend,ssql);
  If dtmRelCentralAP.QryAssuntoxAtend.Active Then dtmRelCentralAP.QryAssuntoxAtend.Close;
  dtmRelCentralAP.QryAssuntoxAtend.DataSource := dtmRelCentralAP.dsHistAtend;
  dtmRelCentralAP.QryAssuntoxAtend.Open;
end;

procedure TfrmParamRelHistAtend.HabilitaBuscaParticipante(Sender: TObject);
begin
  inherited;
   if (lkpcmbpatro.Text <> '') and (lkpcmbPlano.Text <> '') then
      grpboxPart.Enabled := True
   else
      grpboxPart.Enabled := False;
end;


procedure TfrmParamRelHistAtend.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dataini.Text:='';
  datafin.Text:='';
  lkpcmbpatro.Text:='';
  lkpcmbPlano.Text:='';
  edNome.Text:='';
end;

end.

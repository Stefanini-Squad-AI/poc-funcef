unit FCadExcessoesIR;

{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}


//--------------------------------------------------------------------------------
//Alteração   : (.dfm) QryPessoaFisica
//Pendência   : SIG119725
//Responsável : Andre Imakawa
//Data        : 30/09/2021
//Descrição   : CacheUpdate = True
//--------------------------------------------------------------------------------
//Alteração   : (.dfm) sbtnProcurarClick, sbtnAlterarClick, bbtnCancelarClick,
//              bbtnOkDetClick
//Pendência   : SIG84329
//Responsável : Andre Imakawa
//Data        : 13/07/2021
//Descrição   : Alteração do campos FLGINSETOIRRF, FLGMOLESTIAGRAVE, FLGSOMASUPINSS,
//              FLGTIPOSENCAO e Historico de Molestia Grave
//--------------------------------------------------------------------------------
//Alteração   : (.dfm) sbtnProcurarClick, sbtnAlterarClick, ConfiguraBotoes, sbtnAltDetClick
//              bbtnOkDetClick, bbtnVoltarDetClick, FormClose
//Pendência   : SIG49800-60759
//Responsável : Andre Imakawa
//Data        : 22/08/2018
//Descrição   : Isenção de IRRF por Beneficio.
//--------------------------------------------------------------------------------
//Pendência   : SOL 156180 Kintana 1228486
//Responsável : Renato Visoni
//Descrição   : Falta de COMMIT.
//--------------------------------------------------------------------------------
//Pendência   : SOL 132369 KINTANA 762230
//Responsável : BRUNO AZEVEDO
//Data        : 15/03/2010
//Descrição   : Correção no update das informações da tela.
//--------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,UMensErro,
  DBCtrls, Mask, wwdbedit, wwdbdatetimepicker, CMDateTimePicker, MskEdDlg,
  TREdit, uSistema, uDataBase, dBaseDados,
  uCmDbObject, DBClient, uCMClientDataSet, Provider, Wwdotdot, Wwdbcomb,
  fHistMolestiaGrave,
  dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib, wwdblook,
  CMDBLookupCombo; // Andre Imakawa - SIG 49800-60759

type
  TOperacao = (opIdle, opAlterar, opInserir);   //Andre Imakawa - SIG 49800-60759
  TFrmCadExcessoesIR = class(TfrmCadastroCS)
    edNome: TEdit;
    Label2: TLabel;
    edPatro: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    edPlano: TEdit;
    Bevel1: TBevel;
    qryAux: TwwQuery;
    rdgdestino: TRadioGroup;
    GroupBox1: TGroupBox;
    chkirtotal: TCheckBox;
    edtnumdepirrf: TEdit;
    Label10: TLabel;
    qryIDPLANOPREV: TFloatField;
    qryIDPESSJUR: TFloatField;
    qryIDPESSOA: TFloatField;
    qryBENEFICIO: TStringField;
    qryFLGDESCIRMES: TFloatField;
    qryIDBENEFICIO: TFloatField;
    qryIDSITBENEFICIO: TFloatField;
    dbcIsento: TDBCheckBox;
    dsAux: TwwDataSource;
    qryESPECIE: TStringField;
    qryMOLESTIAGRAVE: TStringField;
    qrySITPROCESSO: TStringField;
    updDet: TUpdateSQL;
    dsDet: TwwDataSource;
    qryDet: TwwQuery;
    qryDetIDHISTISENCAOIRRFBENF: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryNUMEROPROCESSO: TFloatField;
    qryIDTITULAR: TFloatField;
    qryIDPLANOORIGEM: TFloatField;
    qrySEQPROPOSTA: TFloatField;
    qryDetOBSERVACAO: TMemoField;
    qryDetIDBENEFICIO: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    bvlTop: TBevel;
    plnCalculoIRRF: TPanel;
    Label1: TLabel;
    dbgBeneficio: TwwDBGrid;
    plnHstIsencaoIRRF: TPanel;
    Pnlisencabenef: TPanel;
    dbgrdDet: TwwDBGrid;
    PnlisencabenefDet: TPanel;
    lblObservacao: TLabel;
    dbrgocorrencia: TDBRadioGroup;
    gbPeriodo: TGroupBox;
    lblInicio: TLabel;
    lblFim: TLabel;
    dbDtini: TDBEdit;
    dbDtfim: TDBEdit;
    DBMemoObs: TDBMemo;
    pnlBotoes: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    Dock973: TDock97;
    lblTituloHstIsencao: TLabel;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    wwDBGrid1: TwwDBGrid;
    qryEXISTEISENCAO: TStringField;
    qryDetDESCOCORRENCIA: TStringField;
    qryDetOBS_GRID: TStringField;
    qryValida: TwwQuery;
    dbrgrpIsentoIR: TDBRadioGroup;
    dsPessoaFisica: TwwDataSource;
    qryPessoaFisica: TwwQuery;
    qryPessoaFisicaVLRINSS: TFloatField;
    qryPessoaFisicaVLRPENSAO: TFloatField;
    qryPessoaFisicaIDCIDADES: TFloatField;
    qryPessoaFisicaPERCIRRFJUD: TFloatField;
    qryPessoaFisicaSTATUSPROCJUD: TFloatField;
    qryPessoaFisicaDATACONCLIMINAR: TDateTimeField;
    qryPessoaFisicaDATACONCJULG: TDateTimeField;
    qryPessoaFisicaVLRTOTCOMPIR: TFloatField;
    qryPessoaFisicaVLRPARCCOMPIR: TFloatField;
    qryPessoaFisicaINICIOCOMPIR: TStringField;
    qryPessoaFisicaVLRENQUADRAMENTO: TFloatField;
    qryPessoaFisicaINICIOINVALIDEZ: TDateTimeField;
    qryPessoaFisicaFIMINVALIDEZ: TDateTimeField;
    qryPessoaFisicaFLGDESTCC: TFloatField;
    qryPessoaFisicaIDSINDICATO: TFloatField;
    qryPessoaFisicaIDPESSOA: TFloatField;
    qryPessoaFisicaCODESTADO: TStringField;
    qryPessoaFisicaIDPAIS: TFloatField;
    qryPessoaFisicaIDFONTRECR: TFloatField;
    qryPessoaFisicaIDGRINSTR: TFloatField;
    qryPessoaFisicaIDPROFISS: TFloatField;
    qryPessoaFisicaNOMEPAI: TStringField;
    qryPessoaFisicaNOMEMAE: TStringField;
    qryPessoaFisicaDATAMORTE: TDateTimeField;
    qryPessoaFisicaDATANASC: TDateTimeField;
    qryPessoaFisicaSEXO: TStringField;
    qryPessoaFisicaTIPOSANG: TStringField;
    qryPessoaFisicaESTCIVIL: TStringField;
    qryPessoaFisicaNUMDEPIRRF: TFloatField;
    qryPessoaFisicaNUMDEPSALF: TFloatField;
    qryPessoaFisicaNUMDEPTOT: TFloatField;
    qryPessoaFisicaFLGISENTOIRRF: TFloatField;
    qryPessoaFisicaIDESTADO: TFloatField;
    qryPessoaFisicaCORPESSOA: TFloatField;
    qryPessoaFisicaFLGDEFICIENTE: TFloatField;
    qryPessoaFisicaFLGMOLESTIAGRAVE: TFloatField;
    qryPessoaFisicaDATAMOLESTIAGRAVE: TDateTimeField;
    qryPessoaFisicaFLGSOMAIRSUPINSS: TFloatField;
    qryPessoaFisicaDATAFIMMOLESTIA: TDateTimeField;
    qryPessoaFisicaFLGSOLICITACONTASALARIO: TFloatField;
    qryPessoaFisicaFLGCONTASALARIOPROCESSADA: TFloatField;
    dtmfldPessoaFisicaDTSOLICITACONTASALARIO: TDateTimeField;
    dtmfldPessoaFisicaDTCONTASALARIOPROCESSADA: TDateTimeField;
    qryPessoaFisicaEMAILFUNCEF: TStringField;
    qryPessoaFisicaTIPOISENCAOIRRF: TFloatField;
    qryPessoaFisicaTPISENCAOIRRF: TStringField;
    qryPessoaFisicaNOMECONJUGE: TStringField;
    updPessoaFisica: TUpdateSQL;
    DbcheckSomaSUP: TDBCheckBox;
    dxDBSpinNumDep: TdxDBSpinEdit;
    dbrgrpMolestiaGrave: TGroupBox;
    Label22: TLabel;
    Label45: TLabel;
    dbdtMolestiaGrave: TCMDateTimePicker;
    dbdtFimMolestia: TCMDateTimePicker;
    queryMolestiaGrave: TwwQuery;
    dbrgrpTpIsencao: TGroupBox;
    BitBtnHistorico: TButton;
    wwDBCBIsentoIrrf: TwwDBComboBox;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LimpaEdts;
    procedure MostraBox;
    procedure ConfiguraBotoes;
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbrgocorrenciaChange(Sender: TObject);
    procedure dbDtfimExit(Sender: TObject);
    procedure qryDetAfterPost(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnHistoricoClick(Sender: TObject);
    procedure dbrgrpIsentoIRClick(Sender: TObject);
    procedure wwDBCBIsentoIrrfCloseUp(Sender: TwwDBComboBox;
      Select: Boolean);
  private
    { Private declarations }
    iIdPessoa, iIdtitular, lIdPessJur,lIdPlanoPrev : integer; // identificadores do participante
    sIdBeneficio, sIdIsencao, sDtInicio, sDtFim: string; //Andre Imakawa - SIG 49800-60759
    opOperacao      : TOperacao;  //Andre Imakawa - SIG 49800-60759
    opOperacaoDet   : TOperacao;  //Andre Imakawa - SIG 49800-60759
    bPermissaoAlt   : boolean;    //Andre Imakawa - SIG 49800-60759
    sValida         : TStringList;//Andre Imakawa - SIG 49800-60759
    procedure AtualizaTela; //BRUNO AZEVEDO SOL 132369 KINTANA 762230
    procedure LimpaCampos; //BRUNO AZEVEDO SOL 132369 KINTANA 762230
    // Andre Imakawa - SIG 49800-60759 - Inicio
    function VerificaRegistroPrevia(pIdPessoa, pIdTitular: Integer; pCompIni, pCompFim: String):Boolean;
    function VerificaRegistroIsencaoBenef(pIdisencao: Integer; pCompFim: String):Boolean;
    function GetSequence(Sufixo : string):integer;
    procedure FiltraDet;
    procedure ExtraiStringList( svalida: string);
    // Andre Imakawa - SIG 49800-60759 - Fim

    procedure PreencheDataMolestiaGrave;

  public
    { Public declarations }
  end;
// Andre Imakawa - SIG 49800-60759 - Inicio
Const
  sMSG01 = 'Não é possível inserir registro, pois já existe prévia processada.';
  sMSG02 = 'Não é possível alterar o registro, pois já existe prévia processada.';
  sMSG03 = 'Não é possível excluir o registro, pois já existe prévia processada.';
  sMSG04 = 'Deseja realmente excluir o registro?';
  sMSG05 = 'Incompatibilidade entre as datas, verifique!';
  sMSG06 = 'O campo Data Início é obrigatório.';
  sMSG07 = 'O campo Observação é obrigatório.';
  sMSG08 = 'Tipo de Ocorrência não selecionado.';
  sMSG09 = 'Benefício já possui isenção.';
  sMSG10 = 'Competência fim menor que a competência atual.';
  sMSG11 = 'Competência inválidá.';

// Andre Imakawa - SIG 49800-60759 - Fim

var
  FrmCadExcessoesIR: TFrmCadExcessoesIR;
  frmHistMolestiaGrave : TfrmHistMolestiaGrave;

implementation

uses uAdmPrevFB, uObjFolha, dfolha, UFuncoesUteis, uCtrlPadroes;

{$R *.DFM}

procedure TFrmCadExcessoesIR.sbtnProcurarClick(Sender: TObject);
var
     sIdParticipante,
     sIdPatrocin,
     sIdPlanoPrev,
     sIdTitular, sSQL: String; // Andre Imakawa - SIG 49800-60759
     i: integer; // Andre Imakawa - SIG 49800-60759
begin
//  inherited;
  LimpaEdts;
  dtmfolha.MSBenef.Executar;
  if (dtmfolha.MSBenef.ValoresChave.Count > 0) and
     (dtmfolha.MSBenef.ValoresChave[0] <> '') then
  begin

    edNome.Text      := dtmfolha.MSBenef.ValoresChave[6];
    edPlano.Text     := dtmfolha.MSBenef.ValoresChave[15];
    edPatro.Text     := dtmfolha.MSBenef.ValoresChave[16];
    sIdParticipante  := dtmfolha.MSBenef.ValoresChave[0];
    sIdPatrocin      := dtmfolha.MSBenef.ValoresChave[9];
    iIdPessoa           := StrToInt(sIdParticipante);
    lIdPessJur          := StrToInt(sIdPatrocin);
    sbtnAlterar.Enabled := true;
    sbtnAlterar.Visible := true;
    // Andre Imakawa - SIG 49800-60759 - Inicio
    sIdTitular       := dtmfolha.MSBenef.ValoresChave[5];
    iIdtitular       := strtoInt(sIdTitular);
    // Andre Imakawa - SIG 49800-60759 - Fim

    qry.close;
    qry.parambyname('PIDPESSJUR').value   := lIdPessJur;
    qry.parambyname('PIDPESSOA').value    := iIdPessoa;
    qry.open;

    // Andre Imakawa - SIG 49800-60759 - Inicio
    qryDet.close;
    qryDet.ParamByName('IDPESSJUR').AsInteger      := lIdPessJur;
    qryDet.ParamByName('IDTITULAR').AsInteger      := iIdtitular;
    qryDet.ParamByName('IDPESSOA').AsInteger       := iIdPessoa;
    qryDet.Open;


    qryValida.close;
    qryValida.ParamByName('IDPESSJUR').AsInteger      := lIdPessJur;
    qryValida.ParamByName('IDTITULAR').AsInteger      := iIdtitular;
    qryValida.ParamByName('IDPESSOA').AsInteger       := iIdPessoa;
    qryValida.Open;

    sValida.Clear;

    while not qryValida.eof do
    begin
      svalida.Add(qryValida.fieldbyname('IDBENEFICIO').asString + '|' +
                qryValida.FieldByName('IDHISTISENCAOIRRFBENF').AsString + '|' +
                qryValida.fieldbyname('DTINICIO').asString + '|' +
                qryValida.fieldbyname('DTFIM').AsString +'|');

      qryValida.next;
    end;


    if not(qryDet.IsEmpty) then
      FiltraDet;

    // Alterado por FHBS - 24/08/2018 - SIG49800-60759
    TField(dbgBeneficio.Fields[1]).Alignment := taCenter;
    TField(dbgBeneficio.Fields[2]).Alignment := taCenter;
    TField(dbgBeneficio.Fields[3]).Alignment := taCenter;
    // Fim - Alterado por FHBS - 24/08/2018 - SIG49800-60759
    // Andre Imakawa - SIG 49800-60759 - Fim

    // Andre Imakawa - SIG 84329 - Inicio
    qryPessoaFisica.close;
    qryPessoaFisica.ParamByName('IdPessoa').AsString := inttostr(iIdPessoa);
    qryPessoaFisica.Open;

    dbrgrpTpIsencao.visible := dbrgrpIsentoIR.ItemIndex = 0;
    wwDBCBIsentoIrrf.Enabled := dbrgrpIsentoIR.ItemIndex = 0;


    if (wwDBCBIsentoIrrf.ItemIndex <> 2)then
    begin
      dbrgrpMolestiaGrave.Visible := False;
      BitBtnHistorico.Enabled := False;
    end
    else
    begin
      dbrgrpMolestiaGrave.Visible := True;
      BitBtnHistorico.Enabled := True;
    end;

    {

    qryaux.close;
    qryaux.sql.clear;
    qryaux.sql.add('SELECT ' +
                   'NVL(FLGDESTCC,0) AS FLGDESTCC   , '+
                   'NVL(NUMDEPIRRF,0) AS NUMDEPIRRF , '+
                   'NVL(NUMDEPSALF,0) AS NUMDEPSALF , '+ 
                   'NVL(FLGISENTOIRRF,0) AS FLGISENTOIRRF, '+
                   'NVL(FLGSOMAIRSUPINSS,0) AS FLGSOMAIRSUPINSS ' +
                   'FROM ' +
                   'PESSOAFISICA '+
                   'WHERE IDPESSOA = '+ inttostr(iIdPessoa));
    qryaux.Open;
    If not qryaux.Isempty then
       MostraBox;
    }

    SBTNPROCURAR.down := false;
    // Andre Imakawa - SIG 84329 - Fim
  end;

  // Andre Imakawa - SIG 49800-60759 - Inicio
  pnlfundo.enabled := True;
  GroupBox1.Enabled := False;
  rdgdestino.Enabled := False;
  // Andre Imakawa - SIG 49800-60759 - Fim
end;

procedure TFrmCadExcessoesIR.MostraBox;
begin
    // Andre Imakawa - SIG 84329 - Inicio
    {
    edtnumdepirrf.text   := Inttostr(qryPessoaFisica.fieldbyname('NUMDEPIRRF').asInteger);

    If qryaux.fieldbyname('FLGSOMAIRSUPINSS').asInteger = 0 then
        chkirtotal.state := cbUnchecked
    else
        chkirtotal.state := cbchecked;

    rdgdestino.enabled   := true;
    rdgdestino.itemindex := qryaux.fieldbyname('FLGDESTCC').asInteger;
    }
    // Andre Imakawa - SIG 84329 - Fim
end;

procedure TFrmCadExcessoesIR.bbtnConfirmarClick(Sender: TObject);
var
    nvaltotal : integer;
begin
  // Andre Imakawa - SIG 84329 - Inicio
  {
  If qry.State in [dsInsert] Then Begin
    ShowMessage('Não será possível alterar, pois não há benefício para esse beneficiário.');
    bbtnCancelarClick(Self);
    Exit;
  End;
  }
  // Andre Imakawa - SIG 84329 - Inicio
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  // Andre Imakawa - SIG 49800-60759 - Inicio
  try

    qryPessoaFisica.ApplyUpdates;      // Andre Imakawa - SIG 84329
    qryPessoaFisica.CancelUpdates;     // Andre Imakawa - SIG 84329
    qryPessoaFisica.Cancel;            // Andre Imakawa - SIG 84329
    qryPessoaFisica.close;             // Andre Imakawa - SIG 84329
    dbrgrpTpIsencao.visible := False;  // Andre Imakawa - SIG 84329
    dbrgrpMolestiaGrave.Visible := False; // Andre Imakawa - SIG 84329


    qrydet.DisableControls;
    qrydet.Filtered := False;
    qrydet.ApplyUpdates;
    qrydet.CancelUpdates;
  finally
    qrydet.EnableControls;
  end;
  // Andre Imakawa - SIG 49800-60759 - Fim

  if not Sistema.GravaLogOperacoes('Cadastro de informações individuais do assistido.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  //BRUNO AZEVEDO SOL 132369 KINTANA 762230
  //inherited;
  qry.DisableControls; // Andre Imakawa - SIG 49800-60759
  qry.First;
  while not qry.Eof do begin
    qryaux.close;
    qryaux.sql.clear;
    qryaux.SQL.add(' update BENEFBFCIARIO');
    qryaux.SQL.add(' set');
    qryaux.SQL.add('   FLGDESCIRMES = :FLGDESCIRMES');
    qryaux.SQL.add(' where');
    qryaux.SQL.add('   IDPLANOPREV = :OLD_IDPLANOPREV and');
    qryaux.SQL.add('   IDPESSJUR = :OLD_IDPESSJUR and');
    qryaux.SQL.add('   IDPESSOA = :OLD_IDPESSOA and');
    qryaux.SQL.add('   IDBENEFICIO = :OLD_IDBENEFICIO');
    qryaux.ParamByName('FLGDESCIRMES').AsString    := qry.FieldByName('FLGDESCIRMES').AsString;
    qryaux.ParamByName('OLD_IDPLANOPREV').AsString := qry.FieldByName('IDPLANOPREV').AsString;
    qryaux.ParamByName('OLD_IDPESSJUR').AsString   := qry.FieldByName('IDPESSJUR').AsString;
    qryaux.ParamByName('OLD_IDPESSOA').AsString    := qry.FieldByName('IDPESSOA').AsString;
    qryaux.ParamByName('OLD_IDBENEFICIO').AsString := qry.FieldByName('IDBENEFICIO').AsString;
    qryaux.ExecSql;

    qry.Next;
  end;
  //BRUNO AZEVEDO SOL 132369 KINTANA 762230
  qry.EnableControls;// Andre Imakawa - SIG 49800-60759


  // Andre Imakawa - SIG 84329 - Inicio
  {
  If chkirtotal.state = cbUnchecked
  then nvaltotal := 0
  else
        nvaltotal := 1;


  qryaux.close;
  qryaux.sql.clear;
  qryaux.SQL.add(' UPDATE PESSOAFISICA SET '+
                 ' NUMDEPIRRF = '+EDTNUMDEPIRRF.TEXT  +
                 ', FLGSOMAIRSUPINSS = '+ Inttostr(nvaltotal) +
                 ', FLGDESTCC = '+ IntToStr(rdgdestino.ItemIndex) +
                 ' WHERE IDPESSOA = '+ inttostr(iIdPessoa));

  qryaux.execsql;
  }
  // Andre Imakawa - SIG 84329 - Fim

  //BRUNO AZEVEDO SOL 132369 KINTANA 762230
  AtualizaTela;
  LimpaCampos;

  //Renato Visoni SOL 156180 Kintana 1228486
  if not dtmBaseDados.dbBaseDados.InTransaction then
  dtmBaseDados.dbBaseDados.StartTransaction;

  dtmBaseDados.dbBaseDados.Commit;
  //Renato Visoni SOL 156180 Kintana 1228486

  //BRUNO AZEVEDO SOL 132369 KINTANA 762230
  MsgDlg('Alteração efetuada.','Atenção',mtinformation,[mbOk,mbHelp],0);

  bbtnCancelarClick(nil); // Andre Imakawa - SIG 49800-60759
end;

procedure TFrmCadExcessoesIR.sbtnAlterarClick(Sender: TObject);
begin
  // Andre Imakawa - SIG 49800-60759 - Inicio
  if opOperacao = opAlterar then
  begin
    sbtnAlterar.Down := true;
    Exit;
  end;
  // Andre Imakawa - SIG 49800-60759 - Fim
  inherited;


  dbgBeneficio.Fields[0].ReadOnly:=True;
  dbgBeneficio.Fields[1].ReadOnly:=True;
  dbgBeneficio.Fields[2].ReadOnly:=True; // Alterado por FHBS - 24/08/2018 - SIG49800-60759
  dbgBeneficio.Fields[3].ReadOnly:=True;
  dbgBeneficio.Fields[4].ReadOnly:=True;

  // Andre Imakawa - SIG 49800-60759 - Fim

  SBTNPROCURAR.enabled := false;

  If SistemaFolha.FlgNumDepIRNumDepSalFam = 1 Then
    edtnumdepirrf.Enabled   := False
  Else
    edtnumdepirrf.Enabled   := True;

  //Andre Imakawa - SIG 49800-60759 - Inicio
  if opOperacao <> opIdle then
  begin
     bbtnCancelarClick(nil);
     sbtnAlterar.Down := false;
     exit;
  end;
  qryPessoaFisica.Edit;
  opOperacao := opAlterar;
  GroupBox1.Enabled := True;
  rdgdestino.Enabled := True;
  //Andre Imakawa - SIG 49800-60759 - Fim

  ConfiguraBotoes; // Alterado por FHBS - 17/08/2018 - SIG49800-60759

end;

procedure TFrmCadExcessoesIR.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  QRY.CLOSE;
  SBTNPROCURAR.ENABLED := TRUE;
  SBTNALTERAR.ENABLED  := FALSE;
  LimpaEdts;


  sValida.Clear;            //Andre Imakawa - SIG 49800-60759
  qryDet.Cancel;            //Andre Imakawa - SIG 49800-60759
  qryDet.close;             //Andre Imakawa - SIG 49800-60759
  opOperacao := opIdle;     //Andre Imakawa - SIG 49800-60759
  opOperacaodet := opIdle;  //Andre Imakawa - SIG 49800-60759
  ConfiguraBotoes;          //Andre Imakawa - SIG 49800-60759
  GroupBox1.Enabled := False; //Andre Imakawa - SIG 49800-60759
  rdgdestino.Enabled := False;//Andre Imakawa - SIG 49800-60759

  // Andre Imakawa - SIG 84329 - Inicio
  qryPessoaFisica.Cancel;
  qryPessoaFisica.close;
  dbrgrpTpIsencao.visible := False;
  dbrgrpMolestiaGrave.Visible := False;
  // Andre Imakawa - SIG 84329 - Fim



end;

procedure TFrmCadExcessoesIR.FormCreate(Sender: TObject);
begin
  inherited;
  Limpaedts;
  sValida := TStringList.Create;//Andre Imakawa - SIG 49800-60759
  //qryvalida.sql := qrydet.sql;//Andre Imakawa - SIG 49800-60759
end;

procedure TFrmCadExcessoesIR.LimpaEdts;
begin
  edtnumdepirrf.text   := '';
  chkirtotal.state     := cbUnchecked;
  rdgdestino.ItemIndex := -1;
  rdgdestino.enabled   := false;
  ednome.text          := '';
  edpatro.text         := '';
  edplano.text         := '';
end;

//BRUNO AZEVEDO SOL 132369 KINTANA 762230
procedure TFrmCadExcessoesIR.AtualizaTela;
begin
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  sbtnInserir.Down      := False;
  sbtnAlterar.Down      := False;
  sbtnApagar.Down       := False;
  sbtnInserir.Enabled   := True;
  sbtnAlterar.Enabled   := False;
  sbtnApagar.Enabled    := False;
  sbtnProcurar.Enabled  := True;
  qry.Close;

  //Andre Imakawa - SIG 49800-60759 - Inicio
  sbtnInsDet.Enabled    := False;
  sbtnAltDet.Enabled    := False;
  sbtnExcluiDet.Enabled    := False;
  //tb97Detalhe.visible := False;
  qryDet.close;
  //Andre Imakawa - SIG 49800-60759 - Fim
end;

procedure TFrmCadExcessoesIR.LimpaCampos;
begin
  edNome.Clear;
  edPatro.Clear;
  edPlano.Clear;
  edtnumdepirrf.clear;
  chkirtotal.Checked := false;
  rdgdestino.Enabled := false;
end;
//BRUNO AZEVEDO SOL 132369 KINTANA 762230

//Andre Imakawa - SIG 49800-60759 - Inicio
procedure TFrmCadExcessoesIR.ConfiguraBotoes;
begin

  if (opOperacaoDet <> opIdle) and (qry.recordcount > 0) then
  begin
    pnlBotoes.Visible := True;
    dbgrdDet.SendToBack;
    DBMemoObs.SetFocus;
    if opOperacaoDet = opInserir then
    begin
      sbtnAltDet.Enabled := False;
    end
    else
    begin
      sbtnInsDet.Enabled := False;
    end;
    sbtnExcluiDet.Enabled := False;
  end
  else
  begin
    pnlBotoes.Visible := false;

    dbgrdDet.BringToFront;
    sbtnInsDet.down  := false;
    sbtnAltDet.down  := false;
    sbtnExcluiDet.down  := false;
    sbtnInsDet.Enabled := not(bPermissaoAlt) and (opOperacao <> opIdle) and (qry.recordcount > 0);
    sbtnAltDet.Enabled := not(bPermissaoAlt) and (not qryDet.IsEmpty) and (opOperacao <> opIdle) and (qry.recordcount > 0);
    sbtnExcluiDet.Enabled := not(bPermissaoAlt) and (not qryDet.IsEmpty) and (opOperacao <> opIdle) and (qry.recordcount > 0);
  end;

  plnCalculoIRRF.Visible := (opOperacaoDet = opIdle); // Alterado por FHBS - 24/08/2018 - SIG49800-60759

end;

procedure TFrmCadExcessoesIR.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  //Andre Imakawa - SIG 49800-60759 - Inicio
  if opOperacaoDet = opInserir then
  begin
    sbtnInsDet.Down := True;
    Exit;
  end;    
  opOperacaoDet := opInserir;
  ConfiguraBotoes;
  qryDet.Insert;
  
  qryDet.fieldbyname('IDPLANOPREV').AsInteger    := qry.fieldbyname('IDPLANOPREV').asInteger;
  qryDet.fieldbyname('IDBENEFICIO').AsInteger    := qry.fieldbyname('IDBENEFICIO').asInteger;
  qryDet.fieldbyname('NUMEROPROCESSO').AsInteger := qry.fieldbyname('NUMEROPROCESSO').asInteger;
  qryDet.fieldbyname('IDPESSJUR').AsInteger      := qry.fieldbyname('IDPESSJUR').asInteger;
  qryDet.fieldbyname('IDTITULAR').AsInteger      := qry.fieldbyname('IDTITULAR').asInteger;
  qryDet.fieldbyname('IDPLANOORIGEM').AsInteger  := qry.fieldbyname('IDPLANOORIGEM').asInteger;
  qryDet.fieldbyname('IDPESSOA').AsInteger       := qry.fieldbyname('IDPESSOA').asInteger;
  qryDet.fieldbyname('SEQPROPOSTA').AsInteger    := qry.fieldbyname('SEQPROPOSTA').asInteger;

  //Andre Imakawa - SIG 49800-60759 - Fim
end;

procedure TFrmCadExcessoesIR.sbtnAltDetClick(Sender: TObject);
begin
  if opOperacaoDet = opAlterar then
  begin
    sbtnAltDet.down  := True;
    Exit;
  end;

  inherited;
  qryDet.Edit; // Alterado por FHBS - 22/08/2018 - SIG49800-60759
  //Andre Imakawa - SIG 49800-60759 - Fim
  opOperacaoDet := opAlterar;
  ConfiguraBotoes;
  //Andre Imakawa - SIG 49800-60759 - Fim
end;

procedure TFrmCadExcessoesIR.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  //Andre Imakawa - SIG 49800-60759 - Inicio
  qryDet.Cancel;
  opOperacaoDet := opIdle;
  ConfiguraBotoes;
  //Andre Imakawa - SIG 49800-60759 - Fim
end;

procedure TFrmCadExcessoesIR.FormShow(Sender: TObject);
begin
  inherited;
  //Andre Imakawa - SIG 49800-60759 - Inicio
  opOperacao := opIdle;
  opOperacaoDet := opIdle;
  bPermissaoAlt := sbtnAlterar.enabled;
  sbtnAlterar.Enabled := false;
  ConfiguraBotoes;
  //Andre Imakawa - SIG 49800-60759 - Fim
end;

procedure TFrmCadExcessoesIR.bbtnOkDetClick(Sender: TObject);
begin
  inherited;

  // Alterado por FHBS - 17/08/2018 - SIG49800-60759
  if qryDet.fieldbyname('FLGINDOCORRENCIA').IsNull then
  begin
    ShowMessage(sMSG08);
    dbrgocorrencia.SetFocus;
    Exit;
  end;

  if qryDet.fieldbyname('OBSERVACAO').IsNull then
  begin
    ShowMessage(sMSG07);
    DBMemoObs.SetFocus;
    Exit;
  end;

  if (qryDet.fieldbyname('DTINICIO').IsNull) or (Trim(qryDet.fieldbyname('DTINICIO').asString) = '/') then
  begin
    ShowMessage(sMSG06);
    dbDtini.SetFocus;
    Exit;
  end;

  if ((Trim(qryDet.fieldbyname('DTINICIO').asString) <> '/') and (Trim(qryDet.fieldbyname('DTFIM').AsString) <> '')) then
  begin
    if length(Trim(qryDet.fieldbyname('DTINICIO').asString)) < 7 then
    begin
      ShowMessage(sMSG11);
      if dbrgocorrencia.itemindex = 1 then
        dbDtini.SetFocus;
      Exit;
    end;
    if length(Trim(qryDet.fieldbyname('DTFIM').AsString)) < 7 then
    begin
      ShowMessage(sMSG11);
      if dbrgocorrencia.itemindex = 1 then
        dbDtfim.SetFocus;
      Exit;
    end;
    if (StrToInt(Copy(qryDet.fieldbyname('DTINICIO').asString,6,2)) > 12) then
    begin
      ShowMessage(sMSG11);
      if dbrgocorrencia.itemindex = 1 then
        dbDtini.SetFocus;
      Exit;
    end;
    if (StrToInt(Copy(qryDet.fieldbyname('DTFIM').asString,6,2)) > 12) then
    begin
      ShowMessage(sMSG11);
      if dbrgocorrencia.itemindex = 1 then
        dbDtfim.SetFocus;
      Exit;
    end;
    if (qryDet.fieldbyname('DTINICIO').AsString > qryDet.fieldbyname('DTFIM').AsString) then
    begin
      ShowMessage(sMSG05);
      if dbrgocorrencia.itemindex = 1 then
        dbDtini.SetFocus;
      Exit;
    end;
    if Trim(qryDet.fieldbyname('DTFIM').AsString) < (Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', Date),4,2)) then
    begin
      ShowMessage(sMSG10);
      if dbrgocorrencia.itemindex = 1 then
        dbDtfim.SetFocus;
      Exit;
    end;
  end;

  //Andre Imakawa - SIG 49800-60759 - Inicio
  if VerificaRegistroPrevia(qry.fieldbyname('IDPESSOA').asInteger, qry.fieldbyname('IDTITULAR').asInteger,
     qryDet.fieldbyname('DTINICIO').AsString, TRIM(qryDet.fieldbyname('DTFIM').AsString)) then
  begin
    case opOperacaoDet of
      opInserir : ShowMessage(sMSG01);
      opAlterar : ShowMessage(sMSG02);
    end;
    Exit;
  end;

  if VerificaRegistroIsencaoBenef(qryDet.fieldbyname('IDHISTISENCAOIRRFBENF').AsInteger,
     TRIM(qryDet.fieldbyname('DTFIM').AsString)) then
  begin
    ShowMessage(sMSG09);
    if  dbrgocorrencia.itemindex = 1 then
      dbDtini.SetFocus;
    Exit;
  end;
  if qrydet.state = dsInsert then
  begin
    qrydet.FieldByName('IDHISTISENCAOIRRFBENF').asInteger := GetSequence('HISTISENCAOIRRFBENF'); 
  end;
  qryDet.Post;

  opOperacaoDet := opIdle;
  ConfiguraBotoes;
  //Andre Imakawa - SIG 49800-60759 - Fim
end;

procedure TFrmCadExcessoesIR.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  //Andre Imakawa - SIG 49800-60759 - Inicio
  qryDet.Cancel;
  opOperacaoDet := opIdle;
  ConfiguraBotoes;
  //Andre Imakawa - SIG 49800-60759 - Fim
end;

procedure TFrmCadExcessoesIR.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if not(qry.isempty) and not(qry.ControlsDisabled) then
  begin
    if qry.recordcount > 0 then
      FiltraDet;
    {
    qryDet.close;
    qryDet.ParamByName('IDPLANOPREV').AsInteger    := qry.fieldbyname('IDPLANOPREV').asInteger;
    qryDet.ParamByName('IDBENEFICIO').AsInteger    := qry.fieldbyname('IDBENEFICIO').asInteger;
    qryDet.ParamByName('NUMEROPROCESSO').AsInteger := qry.fieldbyname('NUMEROPROCESSO').asInteger;
    qryDet.ParamByName('IDPESSJUR').AsInteger      := qry.fieldbyname('IDPESSJUR').asInteger;
    qryDet.ParamByName('IDTITULAR').AsInteger      := qry.fieldbyname('IDTITULAR').asInteger;
    qryDet.ParamByName('IDPLANOORIGEM').AsInteger  := qry.fieldbyname('IDPLANOORIGEM').asInteger;
    qryDet.ParamByName('IDPESSOA').AsInteger       := qry.fieldbyname('IDPESSOA').asInteger;
    qryDet.ParamByName('SEQPROPOSTA').AsInteger    := qry.fieldbyname('SEQPROPOSTA').asInteger;
    qryDet.Open;

    qryValida.close;
    qryValida.ParamByName('IDPLANOPREV').AsInteger    := qry.fieldbyname('IDPLANOPREV').asInteger;
    qryValida.ParamByName('IDBENEFICIO').AsInteger    := qry.fieldbyname('IDBENEFICIO').asInteger;
    qryValida.ParamByName('NUMEROPROCESSO').AsInteger := qry.fieldbyname('NUMEROPROCESSO').asInteger;
    qryValida.ParamByName('IDPESSJUR').AsInteger      := qry.fieldbyname('IDPESSJUR').asInteger;
    qryValida.ParamByName('IDTITULAR').AsInteger      := qry.fieldbyname('IDTITULAR').asInteger;
    qryValida.ParamByName('IDPLANOORIGEM').AsInteger  := qry.fieldbyname('IDPLANOORIGEM').asInteger;
    qryValida.ParamByName('IDPESSOA').AsInteger       := qry.fieldbyname('IDPESSOA').asInteger;
    qryValida.ParamByName('SEQPROPOSTA').AsInteger    := qry.fieldbyname('SEQPROPOSTA').asInteger;
    qryValida.Open;
    }


  end;
end;

procedure TFrmCadExcessoesIR.sbtnExcluiDetClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if not(qryDet.isempty) then
  begin
    if VerificaRegistroPrevia(qryDet.fieldbyname('IDPESSOA').asInteger, qryDet.fieldbyname('IDTITULAR').asInteger,
     qryDet.fieldbyname('DTINICIO').AsString, TRIM(qryDet.fieldbyname('DTFIM').AsString)) then
    begin
      ShowMessage(sMSG03);
      Exit;
    end;
    if (MessageDlg(sMSG04, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      for i:=0 to sValida.Count-1 do
      begin
        ExtraiStringList(svalida[i]);

        if sIdIsencao = qryDet.fieldbyname('IDHISTISENCAOIRRFBENF').asString then
        begin
          svalida.Delete(i);
        end;

      end;
      qryDet.Delete;
      ConfiguraBotoes;
    end
    else
      Exit;

  end;
end;

function TFrmCadExcessoesIR.VerificaRegistroPrevia(pIdPessoa, pIdTitular: Integer; pCompIni, pCompFim: String):Boolean;
var
  query:TwwQuery;
  sSql: string;
Begin

  query := TwwQuery.Create(nil);
  query.DataBaseName := 'BaseDados';

  sSQL := 'SELECT COUNT(1) AS QTD' +#13+
          '  FROM PREVIA P' +#13+
          ' WHERE P.IDPESSOA = '+IntToStr(pIdPessoa)+#13+
          '   AND P.IDTITULAR = '+IntToStr(pIdTitular) ;

   if pCompFim <> '' then
     sSQL := sSQL + '   AND (P.MESCOBRANCA BETWEEN '+ quotedstr(pCompIni) +' AND ' + quotedstr(pCompFim) + ' )'
   else
     sSQL := sSQL + '   AND (P.MESCOBRANCA >= '+ quotedstr(pCompIni) + ' )';

  query.close;
  query.SQL.Clear;
  query.SQL.Text := sSQL;
  query.Open;

  if query.isempty then
    Result := False
  else
    begin
      if query.FieldByName('QTD').AsInteger = 0 then
        Result := False
      else
        Result := True;
    end;

  FreeAndNil(query);
end;

//function TFrmCadExcessoesIR.3(pIdPessoa, pIdTitular, pIdplanoprev, pIdbeneficio, pNumeroprocesso,
//  pIdpessjur,pIdplanoorigem, pSeqproposta : Integer; pCompIni, pCompFim: String):Boolean;
function TFrmCadExcessoesIR.VerificaRegistroIsencaoBenef(pIdisencao: Integer; pCompFim: String):Boolean;
var
  query:TwwQuery;
  sSql, sfiltro: string;
  bookmark: tbookmark;
  i: Integer;
  sValidaTemp: TStringList;
  idatainicio, idatafim: integer;
Begin
  Result := False;
  sfiltro := '';
  if svalida.Count > 0 then
  begin
    try


      qryDet.DisableControls;
      for i:= 0 to svalida.count-1 do
      begin
        ExtraiStringList( svalida[i]);

        idatainicio :=  strtoint(stringreplace(sDtInicio,'/',emptystr,[]));

        if sDtFim <> '' then
          idatafim := strtoint(stringreplace(sDtFim,'/',emptystr,[]))
        else
          idatafim    :=  0;

        if (qrydet.fieldbyname('IDBENEFICIO').asString = sIdBeneficio) and
           ((qrydet.state = dsInsert) or
           ((qrydet.state = dsEdit) and
           (qrydet.fieldbyname('IDHISTISENCAOIRRFBENF').asString <> sIdIsencao))) then
        begin
          if (qrydet.fieldbyname('DTFIM').asString = '') then
          begin
            if (sDtFim = '') then
            begin
              Result:= True;
              Exit;
            end
            else
            begin
              if (strtoint(stringreplace(qrydet.fieldbyname('DTINICIO').asString,'/',emptystr,[])) in [idatainicio..idatafim] ) or
                  (strtoint(stringreplace(qrydet.fieldbyname('DTINICIO').asString,'/',emptystr,[])) <= idatainicio) then
              begin
                Result:= True;
                Exit;
              end;
            end;

          end
          else
          begin
            if (sDtFim = '') then
            begin
              if (qrydet.fieldbyname('DTINICIO').asString <= sDtInicio) or
                (qrydet.fieldbyname('DTFIM').asString >= sDtInicio)  then
              begin
                Result:= True;
                Exit;
              end;
            end
            else
            begin
              if (((qrydet.fieldbyname('DTINICIO').asString >= sDtInicio) and
              (qrydet.fieldbyname('DTINICIO').asString <= sDtFim))or
              ((qrydet.fieldbyname('DTFIM').asString >= sDtInicio) and
              (qrydet.fieldbyname('DTFIM').asString <= sDtFim)) or
              ((qrydet.fieldbyname('DTINICIO').asString >= sDtInicio) and (qrydet.fieldbyname('DTFIM').asString <= sDtFim)) or
              ((qrydet.fieldbyname('DTINICIO').asString <= sDtFim) and (qrydet.fieldbyname('DTFIM').asString >= sDtInicio))
              ) then
              begin
                Result:= True;
                Exit;
              end;
            end;
          end;
        end;

      end;
    finally
      qryDet.EnableControls;

    end;
//  if qryvalida.recordcount > 0 then
//  begin
//    try
//
//      qryDet.DisableControls;
//      bookmark :=  qryvalida.getbookmark;
//      qryvalida.First;
//      while not qryvalida.eof do
//      begin
//        if (qrydet.state = dsInsert) or
//          ((qrydet.state = dsEdit) and
//          (qrydet.fieldbyname('IDHISTISENCAOIRRFBENF').asString <> qryvalida.fieldbyname('IDHISTISENCAOIRRFBENF').asString)) then
//        begin
//          if (qrydet.fieldbyname('DTFIM').asString = '') then
//          begin
//            if (qryvalida.fieldbyname('DTFIM').asString = '') then
//            begin
//              if (qrydet.fieldbyname('DTINICIO').asString >= qryvalida.fieldbyname('DTINICIO').asString) then
//              begin
//                Result:= True;
//                Exit;
//              end;
//            end
//            else
//            begin
//              if ((qrydet.fieldbyname('DTINICIO').asString <= qryvalida.fieldbyname('DTINICIO').asString) and
//              (qrydet.fieldbyname('DTINICIO').asString >= qryvalida.fieldbyname('DTFIM').asString)) then
//              begin
//                Result:= True;
//                Exit;
//              end;
//            end;
//
//          end
//          else
//          begin
//            if (qryvalida.fieldbyname('DTFIM').asString = '') then
//            begin
//              if (qrydet.fieldbyname('DTINICIO').asString <= qryvalida.fieldbyname('DTINICIO').asString) or
//                (qrydet.fieldbyname('DTFIM').asString >= qryvalida.fieldbyname('DTINICIO').asString)  then
//              begin
//                Result:= True;
//                Exit;
//              end;
//            end
//            else
//            begin
//              if ((qrydet.fieldbyname('DTINICIO').asString <= qryvalida.fieldbyname('DTINICIO').asString) and
//              (qrydet.fieldbyname('DTINICIO').asString >= qryvalida.fieldbyname('DTFIM').asString)and
//              (qrydet.fieldbyname('DTFIM').asString <= qryvalida.fieldbyname('DTINICIO').asString) and
//              (qrydet.fieldbyname('DTFIM').asString >= qryvalida.fieldbyname('DTFIM').asString)
//              ) then
//              begin
//                Result:= True;
//                Exit;
//              end;
//            end;
//          end;
//        end;
//        qryvalida.Next;
//      end;
//      qryvalida.gotoBookmark(bookmark);
//      qryvalida.FreeBookmark(bookmark);
//    finally
//      qryDet.EnableControls;
//    end;
    {
    qryvalida.Filtered := False;
    sfiltro := qryvalida.Filter;                   
    
    if qrydet.state = dsInsert then
      qryvalida.Filter   := qryvalida.Filter + ' AND ((DTFIM = '''') OR(DTFIM >= '+ quotedstr(qrydet.fieldbyname('DTFIM').asString) +')) '
    else
      qryvalida.Filter   := qryvalida.Filter + ' AND ((DTFIM = '''') OR(DTFIM >= '+ quotedstr(qrydet.fieldbyname('DTFIM').asString) +')) AND (IDHISTISENCAOIRRFBENF <> ' + IntToStr(pIdisencao)+')';

    if qrydet.state = dsInsert then
    begin
      qryvalida.Filter   := qryvalida.Filter + ' AND (('+quotedstr(qrydet.fieldbyname('DTINICIO').asString)  + ' >= DTINICIO AND '+ quotedstr(qrydet.fieldbyname('DTINICIO').asString) +' <= DTFIM) OR '+
                                                IFF(qrydet.fieldbyname('DTFIM').asString='','('+quotedstr(qrydet.fieldbyname('DTINICIO').asString)  + ' >= DTINICIO) OR ', '('+quotedstr(qrydet.fieldbyname('DTFIM').asString)  + ' >= DTINICIO AND '+ quotedstr(qrydet.fieldbyname('DTFIM').asString) +' <= DTFIM) OR ' ) +
                                               '      ('+quotedstr(qrydet.fieldbyname('DTINICIO').asString)  + ' >= DTINICIO AND DTFIM = '''')) ';
    end
    else
    begin
            qryvalida.Filter   := qryvalida.Filter + ' AND (('+quotedstr(qrydet.fieldbyname('DTINICIO').asString)  + ' >= DTINICIO AND '+ quotedstr(qrydet.fieldbyname('DTINICIO').asString) +' <= DTFIM) OR '+
                                                IFF(qrydet.fieldbyname('DTFIM').asString='','('+quotedstr(qrydet.fieldbyname('DTINICIO').asString)  + ' >= DTINICIO) OR ', '('+quotedstr(qrydet.fieldbyname('DTFIM').asString)  + ' >= DTINICIO AND '+ quotedstr(qrydet.fieldbyname('DTFIM').asString) +' <= DTFIM) OR ' ) +
                                               '      ('+quotedstr(qrydet.fieldbyname('DTINICIO').asString)  + ' >= DTINICIO AND DTFIM = '''')) AND '+
                                               '      ( IDHISTISENCAOIRRFBENF <> ' + IntToStr(pIdisencao)+')';
    end;
    qryvalida.Filtered := True;

    Result := not(qryvalida.isempty);

    qryvalida.Filtered := False;
    qryvalida.Filter   := sfiltro;
    }
  end;

end;


procedure TFrmCadExcessoesIR.dbrgocorrenciaChange(Sender: TObject);
begin
  inherited;
  if  dbrgocorrencia.itemindex = -1 then
    Exit;
  if qrydet.state in[dsInsert, dsEdit] then
  begin
    if opOperacaoDet <> opIdle then
    begin
      if  dbrgocorrencia.itemindex = 0 then
      begin
        //dbDtini.text := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);
        //dbDtfim.Text := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);
        qryDet.fieldbyname('DTINICIO').AsString  := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);
        qryDet.fieldbyname('DTFIM').AsString     := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);
        dbDtini.Enabled := False;
        dbDtfim.Enabled := False;
      end
      else
      begin
        dbDtini.Enabled := True;
        dbDtfim.Enabled := True;
      end;
    end;
  end;

end;

procedure TFrmCadExcessoesIR.dbDtfimExit(Sender: TObject);
begin
  inherited;
  if (Trim(qryDet.fieldbyname('DTFIM').AsString) = '/') then
    qryDet.fieldbyname('DTFIM').Clear;
end;

procedure TFrmCadExcessoesIR.FiltraDet;
begin
  qryDet.filtered := False;
  qryDet.filter := ' (IDPLANOPREV = '+ qry.fieldbyname('IDPLANOPREV').AsString +
                   ' ) AND (IDBENEFICIO = ' + qry.fieldbyname('IDBENEFICIO').asString +
                   ' ) AND (NUMEROPROCESSO = ' + qry.fieldbyname('NUMEROPROCESSO').asString +
                   ' ) AND (IDPLANOORIGEM = ' +  qry.fieldbyname('IDPLANOORIGEM').asString +
                   ' ) AND (SEQPROPOSTA = '  + qry.fieldbyname('SEQPROPOSTA').asString+')';

  qryDet.filtered  := True;

//  qryValida.filtered := False;
//  qryValida.filter := ' (IDPLANOPREV = '+ qry.fieldbyname('IDPLANOPREV').AsString +
//                   ' ) AND (IDBENEFICIO = ' + qry.fieldbyname('IDBENEFICIO').asString +
//                   ' ) AND (NUMEROPROCESSO = ' + qry.fieldbyname('NUMEROPROCESSO').asString +
//                   ' ) AND (IDPLANOORIGEM = ' +  qry.fieldbyname('IDPLANOORIGEM').asString +
//                   ' ) AND (SEQPROPOSTA = '  + qry.fieldbyname('SEQPROPOSTA').asString +')';
//
//  qryValida.filtered  := True;

  ConfiguraBotoes;
end;

function TFrmCadExcessoesIR.GetSequence(Sufixo : string):integer;
Var
  query:TwwQuery;
  sSql: string;
begin

  query := TwwQuery.Create(nil);
  query.DataBaseName := 'BaseDados';

  sSQL := 'SELECT SEQ' + Sufixo + '.NEXTVAL AS SEQ FROM DUAL';

  query.close;
  query.SQL.Clear;
  query.SQL.Text := sSQL;
  query.Open;

  Result := query.fieldbyname('SEQ').AsInteger;

  FreeAndNil(query);
end;

procedure TFrmCadExcessoesIR.qryDetAfterPost(DataSet: TDataSet);
var
  i: Integer;
begin
  inherited;
  if opOperacaoDet = opInserir then
  begin
    svalida.Add(qryDet.fieldbyname('IDBENEFICIO').asString + '|' +
                qryDet.FieldByName('IDHISTISENCAOIRRFBENF').AsString + '|' +
                qryDet.fieldbyname('DTINICIO').asString + '|' +
                qryDet.fieldbyname('DTFIM').AsString +'|');
    //qryvalida.insert;
//    qryvalida.FieldByName('IDHISTISENCAOIRRFBENF').asInteger := qryDet.FieldByName('IDHISTISENCAOIRRFBENF').asInteger;
//    qryvalida.FieldByName('DTINICIO').AsString := qryDet.fieldbyname('DTINICIO').asString;
//    qryvalida.FieldByName('DTFIM').AsString := qryDet.fieldbyname('DTFIM').AsString;
//    qryvalida.Post;
//    qryvalida.recordcount;

  end
  else
  begin
      for i:=0 to sValida.Count-1 do
      begin
        ExtraiStringList(svalida[i]);

        if sIdIsencao = qryDet.fieldbyname('IDHISTISENCAOIRRFBENF').asString then
        begin
          svalida[i] :=  (qryDet.fieldbyname('IDBENEFICIO').asString + '|' +
                          qryDet.FieldByName('IDHISTISENCAOIRRFBENF').AsString + '|' +
                          qryDet.fieldbyname('DTINICIO').asString + '|' +
                          qryDet.fieldbyname('DTFIM').AsString +'|');
        end;

      end;


//    if qryvalida.Locate('IDHISTISENCAOIRRFBENF',qryDet.fieldbyname('IDHISTISENCAOIRRFBENF').AsInteger,[loCaseInsensitive]) then;
//    begin
//      qryvalida.Edit;
//      qryvalida.FieldByName('DTINICIO').AsString := qryDet.fieldbyname('DTINICIO').asString;
//      qryvalida.FieldByName('DTFIM').AsString := qryDet.fieldbyname('DTFIM').AsString;
//      qryvalida.Post;
//    end;

  end;
end;
//Andre Imakawa - SIG 49800-60759 - Fim
procedure TFrmCadExcessoesIR.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dbrgocorrencia.itemindex = 1 then
    qryDet.FieldByName('DESCOCORRENCIA').AsString := 'Periódico'
  else
    qryDet.FieldByName('DESCOCORRENCIA').AsString := 'Lançamento único';
  if not(qryDet.fieldbyname('OBSERVACAO').IsNull) then
    qryDet.FieldByName('OBS_GRID').AsString := Copy(qryDet.fieldbyname('OBSERVACAO').AsString,1,100);
end;

procedure TFrmCadExcessoesIR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(sValida); //Andre Imakawa - SIG 49800-60759
  inherited;
end;

procedure TFrmCadExcessoesIR.ExtraiStringList(svalida: string);
Var
  sValidaTemp: TStringList;

begin
  try
    sValidaTemp := TStringList.Create;
    ExtractStrings(['|'], [], pchar(sValida), sValidaTemp);

    sIdBeneficio := sValidaTemp[0];
    sIdIsencao := sValidaTemp[1];
    sDtInicio  := sValidaTemp[2];
    if (sValidaTemp.count = 3) then
      sDtFim     := EmptyStr
    else
      sDtFim     := sValidaTemp[3];
  finally
    FreeAndNil(sValidaTemp);
  end;
end;
procedure TFrmCadExcessoesIR.BitBtnHistoricoClick(Sender: TObject);
begin
  if qryPessoaFisica.State in [dsEdit] then
  begin
    if not(dtmBaseDados.dbBaseDados.InTransaction) then
       dtmBaseDados.dbBaseDados.StartTransaction;

     frmHistMolestiaGrave := TfrmHistMolestiaGrave.Create(Self,iIdPessoa,sbtnAlterar.Down);
    try
      frmHistMolestiaGrave.ShowModal;
      PreencheDataMolestiaGrave;
    finally
      FreeAndNil(frmHistMolestiaGrave);
    end;
  end;

end;

procedure TFrmCadExcessoesIR.PreencheDataMolestiaGrave;
begin
  queryMolestiaGrave.Close;
  queryMolestiaGrave.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
  queryMolestiaGrave.Open;
  if not queryMolestiaGrave.eof then
  begin
    if qryPessoaFisica.State in [dsEdit] then
    begin
      qryPessoaFisica.FieldByName('DATAMOLESTIAGRAVE').AsString := queryMolestiaGrave.FieldByName('DTINICIO').AsString;
      qryPessoaFisica.FieldByName('DATAFIMMOLESTIA').AsString   := queryMolestiaGrave.FieldByName('DTFINAL').AsString;
    end;
  end
  else
  begin
    if qryPessoaFisica.State in [dsEdit] then
      begin
        qryPessoaFisica.FieldByName('DATAMOLESTIAGRAVE').AsString := '';
        qryPessoaFisica.FieldByName('DATAFIMMOLESTIA').AsString := '';
      end;
  end;
end;

procedure TFrmCadExcessoesIR.dbrgrpIsentoIRClick(Sender: TObject);
begin
  inherited;
  if (dsPessoaFisica.state IN [dsEdit]) then
  begin
    if dbrgrpIsentoIR.ItemIndex = 0 then
    begin
      qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger := 1;
      dbrgrpTpIsencao.visible := true;
      wwDBCBIsentoIrrf.Enabled := true;
      wwDBCBIsentoIrrf.SetFocus;
      BitBtnHistorico.Enabled     := False;
      dbrgrpMolestiaGrave.Visible := False;
      dbrgrpMolestiaGrave.Enabled := False;
    end
    else
    begin
      dbrgrpTpIsencao.visible := false;
      wwDBCBIsentoIrrf.ItemIndex  := -1;
      wwDBCBIsentoIrrf.Enabled    := false;
      qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger    := 0;
      qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsInteger  := -1;
      qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
      //edilaine - SIG33979 - inicio
      BitBtnHistorico.Enabled     := False;
      dbrgrpMolestiaGrave.Visible := False;
      //edilaine - SIG33979 - fim
    end;
  end;
end;

procedure TFrmCadExcessoesIR.wwDBCBIsentoIrrfCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin

  if (dsPessoaFisica.state IN [dsEdit]) then
  begin
    if wwDBCBIsentoIrrf.ItemIndex = -1  then
    begin
      If qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger = 1 then
      begin
        dbrgrpIsentoIR.ItemIndex := 1;
        qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsInteger := -1;
        qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger    := 0;
        qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
        BitBtnHistorico.Enabled     := False;
        dbrgrpMolestiaGrave.Visible := False;//higor
        dbrgrpMolestiaGrave.Enabled := False;
      end;
    end
    else
    begin
      // Se for selecionado algum tipo de isenção, aciona o flag de Isenção de IRRF.
      if (wwDBCBIsentoIrrf.ItemIndex >= 0 ) and (wwDBCBIsentoIrrf.ItemIndex < 2) then
      begin
        {
        if wwDBCBIsentoIrrf.ItemIndex = 0 then
          qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsInteger := 0
        else
          qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsInteger := 1;
        }
        //dbrgrpIsentoIR.Value                                      := '1';
        //qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger    := 1;
        qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
        BitBtnHistorico.Enabled     := False;
        dbrgrpMolestiaGrave.Visible := False;  //higor
        dbrgrpMolestiaGrave.Enabled := False;
      end;
      // Testa se foi selecionado "molestia grave"
      if wwDBCBIsentoIrrf.ItemIndex = 2 then
      begin
        //qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger := 1;
        //qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsInteger := 2;
        qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 1;
        BitBtnHistorico.Enabled     := true;
        dbrgrpMolestiaGrave.Visible := true;
        //dbrgrpMolestiaGrave.Enabled := true;    //edilaine - SIG33979
      end;
    end;
  end;
end;

end.

{==============================================================================|
| UNIT: FCADEXCESSOESIR                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/09/2002 A 09/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Permitir procurar pelo dependente (pensionistas).                        |
|   - Controle do parâmetro FlgNumDepIRNumDepSalFam para deixar ou não as      |
|   ComboBoxes de Número de Dependentes de IR e de Salário Família.            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/12/2002 A 23/12/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendência 10745).                                        |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Incluido a visualização do Flag Moléstia Grave,  |
|   indicação se possui Ação Judicial e Espécie do Benefício no grid.          |
|   - Alteração da query "qry".                                                                           |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/05/2003 A 05/05/2003                         |
| PENDÊNCIA: 13837                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05a                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DO MENU DE ACESSO AO CADASTRO DE INFORMAÇÕES INDIVIDUAIS DO      |
| ASSISTIDO PARA INFORMAÇÕES PARA BENEFÍCIO EM MANUTENÇÃO.                     |
|                                                                              |
|------------------------------------------------------------------------------}

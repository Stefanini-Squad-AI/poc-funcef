unit fCadBemPendente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, Mask, wwdbedit,
  Grids, Wwdbigrd, Wwdbgrid, DBCtrls, ComCtrls, MontaSelect, Db, Wwdatsrc,
  DBTables, Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadBemPendente = class(TfrmOkCancelar)
    qrySelConjunto: TwwQuery;
    qrySelConjuntoDESCCONJUNTO: TStringField;
    qrySelConjuntoIDCONJUNTO: TFloatField;
    qrySelConjuntoIDLOCALIZACAO: TFloatField;
    qrySelConjuntoIDRESPONSAVEL: TFloatField;
    qrySelConjuntoDESCLOCALIZACAO: TStringField;
    qrySelConjuntoDESCRESPONSAVEL: TStringField;
    qrySelConjuntoIDPESSOA: TFloatField;
    qrySelConjuntoDISPONIVEL: TFloatField;
    qrySelConjuntoALUGADO: TFloatField;
    dsSelConjunto: TwwDataSource;
    MSConjunto: TMontaSelect;
    qryRateio: TwwQuery;
    qryRateioCODCENTROCUSTO: TStringField;
    qryRateioDESCCCUSTO: TStringField;
    qryRateioPARTICIPACAO: TFloatField;
    dsRateio: TwwDataSource;
    pgctlBem: TPageControl;
    TabConjunto: TTabSheet;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbeDescConjunto: TDBMemo;
    dbgRateio: TwwDBGrid;
    dbeDescLocalizacao: TwwDBEdit;
    dbeNomeResponsavel: TwwDBEdit;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInserir: TSpeedButton;
    sbtnPesquisar: TSpeedButton;
    TabIdent: TTabSheet;
    Label1: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    edDescBem: TMemo;
    bbtnSelClasse: TBitBtn;
    cmbControle: TComboBox;
    edDescClasse: TwwDBEdit;
    TabDocAquis: TTabSheet;
    Label49: TLabel;
    Label44: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label9: TLabel;
    Label48: TLabel;
    edValHistorico: TRealEdit;
    edDataNota: TCMDateTimePicker;
    edComplNota: TEdit;
    edDataInclusao: TCMDateTimePicker;
    bbtnSelTerceiro: TBitBtn;
    edFornec: TwwDBEdit;
    edTerceiro: TwwDBEdit;
    TabContab: TTabSheet;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    bbtnSelGrupo: TBitBtn;
    edTaxaDep: TRealEdit;
    edDataInicioDep: TCMDateTimePicker;
    bbtnSelAtivProjeto: TBitBtn;
    bbtnSelSubConta: TBitBtn;
    edDescGrupo: TwwDBEdit;
    edDescSubConta: TwwDBEdit;
    edAtivProjeto: TwwDBEdit;
    bbtnSelFornec: TBitBtn;
    MSFornec: TMontaSelect;
    MSTerceiros: TMontaSelect;
    MSAtivProjeto: TMontaSelect;
    MSSubConta: TMontaSelect;
    MSClasse: TMontaSelect;
    MSGrupos: TMontaSelect;
    qrySelClasse: TwwQuery;
    qrySelClasseIDCLASSEBEM: TFloatField;
    qrySelClasseCODHIERARQ: TStringField;
    qrySelClasseDESCRICAO: TStringField;
    qrySelClasseANASINT: TStringField;
    qrySelSituacao: TwwQuery;
    qrySelSituacaoDESCSITUACAO: TStringField;
    qrySelSituacaoIDSITUACAO: TFloatField;
    qrySelFornec: TwwQuery;
    qrySelFornecNOME: TStringField;
    qrySelFornecIDPESSOA: TFloatField;
    qrySelFornecRAZAOSOCIAL: TStringField;
    qrySelFornecIDFORCLI: TFloatField;
    qrySelFornecCODSUBCONTA: TFloatField;
    qrySelTerceiro: TwwQuery;
    qrySelTerceiroNOME: TStringField;
    qrySelTerceiroIDPESSOA: TFloatField;
    qrySelGrupo: TwwQuery;
    qrySelGrupoNOME: TStringField;
    qrySelGrupoIDGRUPO: TFloatField;
    qrySelGrupoDEPRECIACAO: TFloatField;
    qrySelGrupoULTIDBEM: TFloatField;
    qrySelGrupoCLASSE: TStringField;
    qrySelSubConta: TwwQuery;
    qrySelSubContaNOMESUBCONTA: TStringField;
    qrySelSubContaIDPESSOA: TFloatField;
    qrySelSubContaCODSUBCONTA: TFloatField;
    qrySelAtivProj: TwwQuery;
    qrySelAtivProjNOME: TStringField;
    qrySelAtivProjUNECODIGO: TStringField;
    qrySelAtivProjUNIDNEGOC: TFloatField;
    qrySelAtivProjIDPESSOA: TFloatField;
    qryParamCaf: TwwQuery;
    qryParamCafALUGUELINTERNO: TFloatField;
    qryParamCafSEQBEMEMP: TFloatField;
    qryParamCafEDITACODBEM: TFloatField;
    qryParamCafMOEDAFISCAL: TFloatField;
    qryParamCafMOEDAGERENCIAL: TFloatField;
    qryParamCafMOEDAOFICIAL: TFloatField;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafSISTEMAS: TStringField;
    qryParamCafINTEGRACONTAB: TStringField;
    qryParamCafINTEGRACAP: TStringField;
    qryParamCafINTEGRACAR: TStringField;
    qryParamCafFLGCLSDESBEM: TFloatField;
    dsAtivProj: TwwDataSource;
    dsSubConta: TwwDataSource;
    dsGrupo: TwwDataSource;
    dsTerceiro: TwwDataSource;
    dsFornec: TwwDataSource;
    dsClasse: TwwDataSource;
    edNota: TEdit;
    cmbSituacao: TDBLookupComboBox;
    dsSituacao: TwwDataSource;
    pnlLivros: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Ano: TLabel;
    bbtnRetornaPlaca: TBitBtn;
    edPubAutor: TEdit;
    edPubAno: TRealEdit;
    pnlPlaca: TPanel;
    Label43: TLabel;
    Label2: TLabel;
    Label28: TLabel;
    edPlaca: TMaskEdit;
    bbtnGeraPlaca: TBitBtn;
    edNumSerie: TEdit;
    edIdOpcional: TEdit;
    bbtnLivros: TBitBtn;
    edPubEditora: TEdit;
    Label50: TLabel;
    edProcesso: TEdit;
    Label51: TLabel;
    edEmpenho: TEdit;
    qryBuscaGrupo: TwwQuery;
    qryBuscaGrupoIDGRUPO: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelClasseClick(Sender: TObject);
    procedure bbtnSelFornecClick(Sender: TObject);
    procedure bbtnSelTerceiroClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnSelSubContaClick(Sender: TObject);
    procedure bbtnSelAtivProjetoClick(Sender: TObject);
    procedure qrySelGrupoAfterOpen(DataSet: TDataSet);
    procedure qrySelFornecAfterOpen(DataSet: TDataSet);
    procedure edDataInclusaoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbSituacaoDropDown(Sender: TObject);
    procedure bbtnLivrosClick(Sender: TObject);
    procedure bbtnRetornaPlacaClick(Sender: TObject);
    procedure pgctlBemChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sMascaraEmpresa, sMascaraGrupo,
    sCodPlaca, sRegistro            : String;
    bEdPlaca, bIntegraContab        : Boolean;
    //------------------------------------------------------------------------------------
    procedure AtualizaCampos;
    function  VerificaEntrada : Boolean;
  end;

var
  frmCadBemPendente: TfrmCadBemPendente;

implementation

{$R *.DFM}

uses uSistema, dBasedados, uDatabase, fCadConjunto, uMensErro, uIntegraBack, uAtivoFixo,
     uVerificaPreenchimento, fMovBensPendentes;

//========================================================================================
procedure TfrmCadBemPendente.FormCreate(Sender: TObject);
var
   iAux : Integer;

begin
   Screen.Cursor := crSQLWait;
   inherited;
   qrySelConjunto.Prepare;
   qryRateio.Prepare;
   qrySelClasse.Prepare;
   qrySelSituacao.Prepare;
   qrySelFornec.Prepare;
   qrySelTerceiro.Prepare;
   qrySelGrupo.Prepare;
   qrySelSubConta.Prepare;
   qrySelAtivProj.Prepare;
   qryParamCaf.Prepare;
   //-------------------------------------------------------------------------------------
   qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
   qryParamCaf.Open;
   qrySelSituacao.Open;
   //-------------------------------------------------------------------------------------
   sMascaraEmpresa := '';
   for iAux := 1 to length(trim(inttostr(Sistema.IdEmpresa))) do
   begin
      sMascaraEmpresa := sMascaraEmpresa + '9';
   end;
   //-------------------------------------------------------------------------------------
   sMascaraGrupo := qryParamCafMASCCODGRUPO.AsString;
   while pos('.',sMascaraGrupo) <> 0 do
   begin
      sMascaraGrupo := AtivoFixo.TiraCaracter(sMascaraGrupo,'.');
   end;
   //-------------------------------------------------------------------------------------
   // Seta Forma de geração de código da Placa do Bem
   //-------------------------------------------------------------------------------------
   bEdPlaca := (qryParamCafEDITACODBEM.AsFloat = 1);
   //-------------------------------------------------------------------------------------
   if (qryParamCAFSEQBEMEMP.AsFloat = 0) then {sequencial por empresa}
   begin
      sCodPlaca := 'E';
   end else
   if (qryParamCAFSEQBEMEMP.AsFloat = 1) then {sequencial por grupo}
   begin
      sCodPlaca := 'G';
   end else
   if (qryParamCAFSEQBEMEMP.AsFloat = 2) then {sequencial por classe}
   begin
      sCodPlaca := 'C';
   end else
   if (qryParamCAFSEQBEMEMP.AsFloat = 3) then {sequencial}
   begin
      sCodPlaca := 'S';
   end;
   //-------------------------------------------------------------------------------------
   edPlaca.EditMask := '999999999;0; ';
   if bEdPlaca then
   begin
      if (sCodPlaca = 'G') or (sCodPlaca = 'C') then
         edPlaca.EditMask := sMascaraGrupo + '.9999999;0; '
      else
      if (sCodPlaca = 'E') then
         edPlaca.EditMask := sMascaraEmpresa + '.999999999;0; ';
   end;
   //-------------------------------------------------------------------------------------
   bIntegraContab := qryParamCafINTEGRACONTAB.AsString = 'S';
   //-------------------------------------------------------------------------------------
   pgctlBem.ActivePage := TabIdent;
   AtualizaCampos;
   //-------------------------------------------------------------------------------------
   pgctlBem.ActivePage := TabConjunto;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBemPendente.AtualizaCampos;
begin
   with frmMovBensPendentes.qryBensPend do
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := FieldByName('IDCONJUNTO').AsInteger;
      qrySelConjunto.Open;
      qryRateio.Close;
      qryRateio.ParamByName('PIDPESSOA').AsInteger   := FieldByName('IDPESSOA').AsInteger;
      qryRateio.ParamByName('PIDCONJUNTO').AsInteger := FieldByName('IDCONJUNTO').AsInteger;
      qryRateio.Open;
      //----------------------------------------------------------------------------------
      qrySelClasse.Close;
      qrySelClasse.ParamByName('PIDCLASSEBEM').AsInteger := FieldByName('IDCLASSEBEM').AsInteger;
      qrySelClasse.Open;
      //----------------------------------------------------------------------------------
      if FieldByName('CONTROLE').AsString = 'T' then
         cmbControle.Text  := cmbControle.Items[0];
      if FieldByName('CONTROLE').AsString = 'F' then
         cmbControle.Text  := cmbControle.Items[1];
      //----------------------------------------------------------------------------------
      edDescBem.Text    := FieldByName('DESBEM').AsString;
      edPlaca.Text      := FieldByName('PLACA').AsString;
      edNumSerie.Text   := FieldByName('NUMSERIE').AsString;
      edIdOpcional.Text := FieldByName('IDOPCIONAL').AsString;
      edProcesso.Text   := '';
      edEmpenho.Text    := '';
      edPubAutor.Text   := '';
      edPubEditora.Text := '';
      edPubAno.Text     := '';
      //----------------------------------------------------------------------------------
      edDataInclusao.Date := FieldByName('DTAINCLUSAO').AsDateTime;
      edNota.Text         := FieldByName('IDNOTA').AsString;
      edComplNota.Text    := FieldByName('COMPLNOTA').AsString;
      edDataNota.Date     := FieldByName('DTANOTA').AsDateTime;
      //----------------------------------------------------------------------------------
      sRegistro := 'I';
      //----------------------------------------------------------------------------------
      qrySelFornec.Close;
      qrySelFornec.ParamByName('PIDPESSOA').AsInteger := FieldByName('IDFORNSERV').AsInteger;
      qrySelFornec.Open;
      //----------------------------------------------------------------------------------
      edValHistorico.Value := FieldByName('VALORG').AsCurrency;
      //----------------------------------------------------------------------------------
      if (qrySelConjuntoALUGADO.AsInteger = 1) then
      begin
         bbtnSelTerceiro.Enabled := True;
         qrySelTerceiro.Close;
         qrySelTerceiro.ParamByName('PIDPESSOA').AsInteger := FieldByName('IDTERCEIRO').AsInteger;
         qrySelTerceiro.Open;
      end else
      begin
         bbtnSelTerceiro.Enabled := False;
         qrySelTerceiro.Close;
      end;
      //----------------------------------------------------------------------------------
      qrySelGrupo.Close;
      qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := FieldByName('IDPESSOA').AsInteger;
      qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := FieldByName('IDGRUPO').AsInteger;
      qrySelGrupo.Open;
      //----------------------------------------------------------------------------------
      edTaxaDep.Value      := qrySelGrupoDEPRECIACAO.AsFloat;
      edDataInicioDep.Date := FieldByName('DATAINICIODEP').AsDateTime;
      //----------------------------------------------------------------------------------
      qrySelSubConta.Close;
      qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := qrySelFornecCODSUBCONTA.AsInteger;
      qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := FieldByName('IDPESSOA').AsInteger;
      qrySelSubConta.Open;
      //----------------------------------------------------------------------------------
      qrySelAtivProj.Close;
      qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := FieldByName('IDPESSOA').AsInteger;
      qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := FieldByName('UNIDNEGOC').AsInteger;
      qrySelAtivProj.Open;
      //----------------------------------------------------------------------------------
      if qrySelSituacao.Locate('IDSITUACAO',FieldByName('IDSITUACAO').AsInteger,[]) then
      begin
         cmbSituacao.KeyValue := FieldByName('IDSITUACAO').AsString;
      end else
      begin
         cmbSituacao.KeyValue := qrySelSituacaoIDSITUACAO.AsString;
      end;
   end;
end;
//========================================================================================
procedure TfrmCadBemPendente.sbtnInserirClick(Sender: TObject);
var
   iIdConjunto : Integer;

begin
   Application.CreateForm(TfrmCadConjunto,frmCadConjunto);
   frmCadConjunto.FormStyle := FsNormal;
   frmCadConjunto.Visible   := False;
   frmCadConjunto.Top       := 76;
   frmCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   iIdConjunto := frmCadConjunto.qryUltConj.Fieldbyname('IDCONJUNTO').asInteger;
   frmCadConjunto.qryUltConj.Close;
   frmCadConjunto.qryUltConj.UnPrepare;
   frmCadConjunto.Release;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Close;
   qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := iIdConjunto;
   qrySelConjunto.Open;
   qryRateio.Close;
   qryRateio.ParamByName('PIDPESSOA').AsInteger   := Sistema.IdEmpresa;
   qryRateio.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
   qryRateio.Open;
   //-------------------------------------------------------------------------------------
   if (qrySelConjuntoALUGADO.AsInteger = 1) then
   begin
      bbtnSelTerceiro.Enabled := True;
      qrySelTerceiro.Close;
      qrySelTerceiro.ParamByName('PIDPESSOA').AsInteger := frmMovBensPendentes.qryBensPendIDTERCEIRO.AsInteger;
      qrySelTerceiro.Open;
   end else
   begin
      bbtnSelTerceiro.Enabled := False;
      qrySelTerceiro.Close;
   end;
end;
//========================================================================================
procedure TfrmCadBemPendente.sbtnPesquisarClick(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   MSConjunto.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBemPendente.Invalidate;
   frmCadBemPendente.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSConjunto.ValoresChave.Count > 0) and (MSConjunto.ValoresChave[0] <> '') then
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := StrToInt(MSConjunto.ValoresChave[0]);
      qrySelConjunto.Open;
      qryRateio.Close;
      qryRateio.ParamByName('PIDPESSOA').AsInteger   := qrySelConjuntoIDPESSOA.AsInteger;
      qryRateio.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
      qryRateio.Open;
      //----------------------------------------------------------------------------------
      if (qrySelConjuntoALUGADO.AsInteger = 1) then
      begin
         bbtnSelTerceiro.Enabled := True;
         qrySelTerceiro.Close;
         qrySelTerceiro.ParamByName('PIDPESSOA').AsInteger := frmMovBensPendentes.qryBensPendIDTERCEIRO.AsInteger;
         qrySelTerceiro.Open;
      end else
      begin
         bbtnSelTerceiro.Enabled := False;
         qrySelTerceiro.Close;
      end;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
function TfrmCadBemPendente.VerificaEntrada : Boolean;
begin
	 Result := False;
   try
      // Conjunto
      if (qrySelConjuntoIDCONJUNTO.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar o Conjunto do Bem!', Dock973);
      // Classe
      if (qrySelClasseIDCLASSEBEM.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar a Classe do Bem!', bbtnSelClasse);
      // Controle
      if (cmbControle.Text = '') then
         Raise EValidacao.CreateVal('É necessário selecionar a Forma de Controle do Bem!', cmbControle);
      // Situacao
      if (qrySelSituacaoIDSITUACAO.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar a Situação do Bem!', cmbSituacao);
      // Descrição do Bem
      if (edDescBem.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar a Descrição do Bem!', edDescBem);
      // Numero de Tombamento Patrimonial
      if (edPlaca.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar o Número de Tombamento Patrimonial do Bem!', edPlaca);
      // Data de Inclusao
      if (edDataInclusao.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar a Data de Entrada do Bem no patrimonio', edDataInclusao);
      // Valor Historico de Aquisição
      if (edValHistorico.Value = 0) then
         Raise EValidacao.CreateVal('É necessário informar o valor histórico de aquisição dos bens', edValHistorico);
      // Grupo
      if (qrySelGrupoIDGRUPO.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar a Grupo do Bem!', bbtnSelGrupo);
      // Data de Inicio da Depreciação
      if (edDataInicioDep.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar a data de inicio da depreciação do bem!', edDataInicioDep);
   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then
            MsgDlg(ev.message, 'Atenção', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then
            ev.Control.SetFocus;
         exit;
      end;
   end;
   Result := True;
end;
//========================================================================================
procedure TfrmCadBemPendente.bbtnSelClasseClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSClasse.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBemPendente.Invalidate;
   frmCadBemPendente.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSClasse.ValoresChave.Count > 0) and (MSClasse.ValoresChave[0] <> '') then
   begin
      qrySelClasse.Close;
      qrySelClasse.ParamByName('PIDCLASSEBEM').AsInteger := StrToInt(MSClasse.ValoresChave[0]);
      qrySelClasse.Open;
   end;
   //-------------------------------------------------------------------------------------
   // Seleciona o Grupo Contábil
   //-------------------------------------------------------------------------------------
   qryBuscaGrupo.Close;
   qryBuscaGrupo.ParamByName('PIDLOCAL').AsInteger  := qrySelConjuntoIDLOCALIZACAO.AsInteger;
   qryBuscaGrupo.ParamByName('PIDCLASSE').AsInteger := qrySelClasseIDCLASSEBEM.AsInteger;
   qryBuscaGrupo.Open;
   if (not qryBuscaGrupo.IsEmpty) then
   begin
      qrySelGrupo.Close;
      qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := qryBuscaGrupoIDGRUPO.AsInteger;
      qrySelGrupo.Open;
   end else
   begin
      qrySelGrupo.Close;
   end;
   //-------------------------------------------------------------------------------------
   // Se for inclusão e o parâmetro estiver setado, incluir na descricao
   //-------------------------------------------------------------------------------------
   if not qryParamCAF.Active then
   begin
      qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
      qryParamCaf.Open;
   end;
   if (qryParamCafFLGCLSDESBEM.AsInteger = 1) and (edDescBem.Text = '') then
   begin
      edDescBem.Text := qrySelClasseDESCRICAO.AsString;
   end;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBemPendente.edDataInclusaoExit(Sender: TObject);
begin
   inherited;
   if (edDataInicioDep.Text = '') then
   begin
      edDataInicioDep.Date := edDataInclusao.Date;
   end;
end;
//========================================================================================
procedure TfrmCadBemPendente.bbtnSelFornecClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSFornec.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBemPendente.Invalidate;
   frmCadBemPendente.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSFornec.ValoresChave.Count > 0) and (MSFornec.ValoresChave[0] <> '') then
   begin
      qrySelFornec.Close;
      qrySelFornec.ParamByName('PIDPESSOA').AsInteger := StrToInt(MSFornec.ValoresChave[0]);
      qrySelFornec.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBemPendente.bbtnSelTerceiroClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSTerceiros.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBemPendente.Invalidate;
   frmCadBemPendente.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSTerceiros.ValoresChave.Count > 0) and (MSTerceiros.ValoresChave[0] <> '') then
   begin
      qrySelTerceiro.Close;
      qrySelTerceiro.ParamByName('PIDPESSOA').AsInteger := StrToInt(MSTerceiros.ValoresChave[0]);
      qrySelTerceiro.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBemPendente.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSGrupos.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBemPendente.Invalidate;
   frmCadBemPendente.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSGrupos.ValoresChave.Count > 0) and (MSGrupos.ValoresChave[0] <> '') then
   begin
      qrySelGrupo.Close;
      qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := StrToInt(MSGrupos.ValoresChave[0]);
      qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelGrupo.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBemPendente.bbtnSelSubContaClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSSubConta.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBemPendente.Invalidate;
   frmCadBemPendente.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSSubConta.ValoresChave.Count > 0) and (MSSubConta.ValoresChave[0] <> '') then
   begin
      qrySelSubConta.Close;
      qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := StrToInt(MSSubConta.ValoresChave[0]);
      qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelSubConta.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBemPendente.bbtnSelAtivProjetoClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSAtivProjeto.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBemPendente.Invalidate;
   frmCadBemPendente.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSAtivProjeto.ValoresChave.Count > 0) and (MSAtivProjeto.ValoresChave[0] <> '') then
   begin
      qrySelAtivProj.Close;
      qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := StrToInt(MSAtivProjeto.ValoresChave[0]);
      qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
      qrySelAtivProj.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBemPendente.qrySelGrupoAfterOpen(DataSet: TDataSet);
begin
   inherited;
   if (not qrySelGrupo.IsEmpty) and (edTaxaDep.Value = 0) then
   begin
      edTaxaDep.Value := qrySelGrupoDEPRECIACAO.AsFloat;
   end;
end;
//========================================================================================
procedure TfrmCadBemPendente.qrySelFornecAfterOpen(DataSet: TDataSet);
begin
   inherited;
   if (not qrySelFornec.IsEmpty) then
   begin
      qrySelSubConta.Close;
      qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := qrySelFornecCODSUBCONTA.AsInteger;
      qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelSubConta.Open;
   end;
end;
//========================================================================================
procedure TfrmCadBemPendente.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   with frmMovBensPendentes.qryBensPend do
   begin
      Edit;
      FieldByName('PLACA').AsFloat            := strtofloat(edPlaca.Text);
      FieldByName('DESBEM').AsString          := edDescBem.Text;
      FieldByName('VALORG').AsCurrency        := edValHistorico.Value;
      FieldByName('IDGRUPO').AsInteger        := qrySelGrupoIDGRUPO.AsInteger;
      FieldByName('IDCLASSEBEM').AsInteger    := qrySelClasseIDCLASSEBEM.AsInteger;
      FieldByName('IDCONJUNTO').AsInteger     := qrySelConjuntoIDCONJUNTO.AsInteger;
      FieldByName('IDSITUACAO').AsInteger     := qrySelSituacaoIDSITUACAO.AsInteger;
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Físico' then
      begin
         FieldByName('CONTROLE').AsString := 'F';
      end else
      begin
         if cmbControle.Text = 'Total' then
         begin
            FieldByName('CONTROLE').AsString := 'T';
         end;
      end;
      //----------------------------------------------------------------------------------
      FieldByName('COMPLNOTA').AsString       := edComplNota.Text;
      FieldByName('DTAINCLUSAO').AsDateTime   := edDataInclusao.Date;
      FieldByName('NUMSERIE').AsString        := edNumSerie.Text;
      //----------------------------------------------------------------------------------
      if qrySelTerceiro.IsEmpty then
         FieldByName('IDTERCEIRO').Clear
      else
         FieldByName('IDTERCEIRO').AsInteger := qrySelTerceiroIDPESSOA.AsInteger;
      //----------------------------------------------------------------------------------
      if qrySelAtivProj.IsEmpty then
         FieldByName('UNIDNEGOC').Clear
      else
         FieldByName('UNIDNEGOC').AsInteger := qrySelAtivProjUNIDNEGOC.AsInteger;
      //----------------------------------------------------------------------------------
      if qrySelSubConta.IsEmpty then
         FieldByName('CODSUBCONTA').Clear
      else
         FieldByName('CODSUBCONTA').AsInteger := qrySelSubContaCODSUBCONTA.AsInteger;
      //----------------------------------------------------------------------------------
      FieldByName('PROCESSOAQUIS').AsString   := edProcesso.Text;
      FieldByName('EMPENHOAQUIS').AsString    := edEmpenho.Text;
      FieldByName('PUBAUTOR').AsString        := edPubAutor.Text;
      FieldByName('PUBEDITORA').AsString      := edPubEditora.Text;
      FieldByName('PUBANO').AsString          := edPubAno.Text;
      FieldByName('IDOPCIONAL').AsString      := edIdOpcional.Text;
      //----------------------------------------------------------------------------------
      FieldByName('REGISTRO').AsString        := sRegistro;
      FieldByName('VALHISTORICO').AsCurrency  := edValHistorico.Value;
      FieldByName('TAXADEP').AsFloat          := edTaxaDep.Value;
      FieldByName('DATAINICIODEP').AsDateTime := edDataInicioDep.Date;
      FieldByName('DATAULTDEP').AsDateTime    := edDataInicioDep.Date;
      FieldByName('ALTERADO').AsInteger       := 1;
      Post;
   end;
   //-------------------------------------------------------------------------------------
   bbtnSair.OnClick(Self);
end;
//========================================================================================
procedure TfrmCadBemPendente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelConjunto.Close;
   qryRateio.Close;
   qrySelClasse.Close;
   qrySelSituacao.Close;
   qrySelFornec.Close;
   qrySelTerceiro.Close;
   qrySelGrupo.Close;
   qrySelSubConta.Close;
   qrySelAtivProj.Close;
   qryParamCaf.Close;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.UnPrepare;
   qryRateio.UnPrepare;
   qrySelClasse.UnPrepare;
   qrySelSituacao.UnPrepare;
   qrySelFornec.UnPrepare;
   qrySelTerceiro.UnPrepare;
   qrySelGrupo.UnPrepare;
   qrySelSubConta.UnPrepare;
   qrySelAtivProj.UnPrepare;
   qryParamCaf.UnPrepare;
end;
//========================================================================================
procedure TfrmCadBemPendente.cmbSituacaoDropDown(Sender: TObject);
begin
  inherited;
  if (qrySelSituacao.RecordCount < cmbSituacao.DropDownRows) then
     cmbSituacao.DropDownRows := qrySelSituacao.RecordCount;
end;
//========================================================================================
procedure TfrmCadBemPendente.bbtnLivrosClick(Sender: TObject);
begin
   inherited;
   pnlPlaca.SendToBack;
end;
//========================================================================================
procedure TfrmCadBemPendente.bbtnRetornaPlacaClick(Sender: TObject);
begin
   inherited;
   pnlLivros.SendToBack;
end;
//========================================================================================
procedure TfrmCadBemPendente.pgctlBemChange(Sender: TObject);
begin
   inherited;
   pnlPlaca.BringToFront;
end;

end.


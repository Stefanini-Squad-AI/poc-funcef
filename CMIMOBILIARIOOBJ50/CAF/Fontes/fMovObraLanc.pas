unit fMovObraLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery,
  TREdit, TEdNum, wwdbdatetimepicker, CMDateTimePicker, TB97Ctls, Mask,
  wwdbedit, DBCtrls, wwdblook, Wwdatsrc;

type
  TfrmMovObraLanc = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    Data: TLabel;
    edDtaLanc: TCMDateTimePicker;
    qryObraEtapa: TwwQuery;
    cmbObraEtapa: TwwDBLookupCombo;
    Label3: TLabel;
    qryObraEtapaIDOBRATIPOETAPA: TFloatField;
    qryObraEtapaDESCOBRATIPOETAPA: TStringField;
    edValofi: TRealEdit;
    Label44: TLabel;
    edNumNota: TEdit;
    Label14: TLabel;
    edComplNota: TEdit;
    Label16: TLabel;
    edDtaNota: TCMDateTimePicker;
    qryCafObra: TwwQuery;
    dsCafObra: TwwDataSource;
    Label1: TLabel;
    dbeDescObra: TDBMemo;
    Label2: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    MontaSelect: TMontaSelect;
    qryCafObraIDCAFOBRA: TFloatField;
    qryCafObraIDPESSOA: TFloatField;
    qryCafObraIDGRUPO: TFloatField;
    qryCafObraCODSUBCONTA: TFloatField;
    qryCafObraUNIDNEGOC: TFloatField;
    qryCafObraDESCCAFOBRA: TStringField;
    qryCafObraDTAINICIOOBRA: TDateTimeField;
    qryCafObraDTAENCERRAOBRA: TDateTimeField;
    qryCafObraFLGOBRA: TFloatField;
    qryCafObraDESCGRUPO: TStringField;
    qryCafObraDESCATIVPROJ: TStringField;
    qryCafObraNOMESUBCONTA: TStringField;
    bbtnProcurar: TBitBtn;
    qryCafObraIDMODULO: TFloatField;
    MSGrupos: TMontaSelect;
    dsGrupo: TwwDataSource;
    qrySelGrupo: TwwQuery;
    qrySelGrupoNOME: TStringField;
    qrySelGrupoIDGRUPO: TFloatField;
    qrySelGrupoDEPRECIACAO: TFloatField;
    qrySelGrupoULTIDBEM: TFloatField;
    qrySelGrupoCLASSE: TStringField;
    qrySelGrupoFLGSEMPLACA: TFloatField;
    qrySelSubConta: TwwQuery;
    qrySelSubContaNOMESUBCONTA: TStringField;
    qrySelSubContaIDPESSOA: TFloatField;
    qrySelSubContaCODSUBCONTA: TFloatField;
    dsSubConta: TwwDataSource;
    MSSubConta: TMontaSelect;
    MSAtivProjeto: TMontaSelect;
    dsAtivProj: TwwDataSource;
    qrySelAtivProj: TwwQuery;
    qrySelAtivProjNOME: TStringField;
    qrySelAtivProjUNECODIGO: TStringField;
    qrySelAtivProjUNIDNEGOC: TFloatField;
    qrySelAtivProjIDPESSOA: TFloatField;
    Label8: TLabel;
    edDescGrupo: TwwDBEdit;
    bbtnSelGrupo: TBitBtn;
    Label18: TLabel;
    edDescSubConta: TwwDBEdit;
    bbtnSelSubConta: TBitBtn;
    bbtnSelAtivProjeto: TBitBtn;
    Label17: TLabel;
    edAtivProjeto: TwwDBEdit;
    MSFornec: TMontaSelect;
    qrySelFornec: TwwQuery;
    qrySelFornecNOME: TStringField;
    qrySelFornecIDPESSOA: TFloatField;
    qrySelFornecRAZAOSOCIAL: TStringField;
    qrySelFornecIDFORCLI: TFloatField;
    qrySelFornecCODSUBCONTA: TFloatField;
    dsFornec: TwwDataSource;
    Label49: TLabel;
    edFornec: TwwDBEdit;
    bbtnSelFornec: TBitBtn;
    Label4: TLabel;
    edDescLancObra: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure edDtaLancExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnSelSubContaClick(Sender: TObject);
    procedure bbtnSelAtivProjetoClick(Sender: TObject);
    procedure bbtnSelFornecClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCampos(sTipo : String);
    procedure SelObra(iObra, iEmpresaProp : Integer);
  public
    { Public declarations }
  end;

var
  frmMovObraLanc: TfrmMovObraLanc;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, dAtivoFixo;

{$R *.DFM}

procedure TfrmMovObraLanc.FormCreate(Sender: TObject);
begin
   inherited;
   qryCafObra.Prepare;
   qryObraEtapa.Prepare;
   qrySelGrupo.Prepare;
   qrySelSubConta.Prepare;
   qrySelAtivProj.Prepare;
   qryObraEtapa.Open;
end;
//========================================================================================
procedure TfrmMovObraLanc.FormShow(Sender: TObject);
begin
   inherited;
   bbtnProcurar.Setfocus;
end;
//========================================================================================
procedure TfrmMovObraLanc.LimpaCampos(sTipo : String);
begin
   if sTipo = 'T' then
   begin
      SelObra(-1,Sistema.IdEmpresa);
      edDtaLanc.Date := Date;
      qryObraEtapa.Close;
      qryObraEtapa.Open;
   end;
   qrySelFornec.Close;
   qrySelGrupo.Close;
   qrySelSubConta.Close;
   qrySelAtivProj.Close;
   edDescLancObra.Text := '';
   edNumNota.Text      := '';
   edComplNota.Text    := '';
   edDtaNota.Text      := '';
   edValOfi.Value      := 0;
end;
//========================================================================================
procedure TfrmMovObraLanc.SelObra(iObra, iEmpresaProp : Integer);
begin
   qryCafObra.Close;
   qryCafObra.ParamByName('PIDCAFOBRA').AsInteger := iObra;
   qryCafObra.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
   qryCafObra.Open;
end;
//========================================================================================
procedure TfrmMovObraLanc.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   MontaSelect.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryCafObra.Close;
   if MontaSelect.RetornouValor then
   begin
      SelObra(StrToInt(MontaSelect.ValoresChave[0]),StrToInt(MontaSelect.ValoresChave[1]));
      //----------------------------------------------------------------------------------
      edDtaLanc.SetFocus;
   end else
   begin
      LimpaCampos('T');
      bbtnProcurar.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovObraLanc.edDtaLancExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if edDtaLanc.Text = '' then
   begin
      MsgDlg('Preencha o campo Data de Lançamento','Erro',mtError,[mbOk],0);
      edDtaLanc.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovObraLanc.bbtnSelFornecClick(Sender: TObject);
begin
   inherited;
   MSFornec.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelFornec.Close;
   if MSFornec.RetornouValor then
   begin
      qrySelFornec.ParamByName('PIDPESSOA').AsInteger := StrToInt(MSFornec.ValoresChave[0]);
      qrySelFornec.Open;
   end;
end;
//========================================================================================
procedure TfrmMovObraLanc.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupos.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelGrupo.Close;
   if MSGrupos.RetornouValor then
   begin
      qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := StrToInt(MSGrupos.ValoresChave[0]);
      qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelGrupo.Open;
   end;
end;
//========================================================================================
procedure TfrmMovObraLanc.bbtnSelSubContaClick(Sender: TObject);
begin
   inherited;
   MSSubConta.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelSubConta.Close;
   if MSSubConta.RetornouValor then
   begin
      qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := StrToInt(MSSubConta.ValoresChave[0]);
      qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelSubConta.Open;
   end;
end;
//========================================================================================
procedure TfrmMovObraLanc.bbtnSelAtivProjetoClick(Sender: TObject);
begin
   inherited;
   MSAtivProjeto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelAtivProj.Close;
   if MSAtivProjeto.RetornouValor then
   begin
      qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := StrToInt(MSAtivProjeto.ValoresChave[0]);
      qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
      qrySelAtivProj.Open;
   end;
end;
//========================================================================================
procedure TfrmMovObraLanc.bbtnConfirmarClick(Sender: TObject);
var
   iResult  : Integer;
   dDtaNota : tDate;
   
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   // Criticas aos campos detalhe
   //-------------------------------------------------------------------------------------
   if edDtaLanc.Text = '' then
   begin
      MsgDlg('Data do Lançamento não pode estar vazia!','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edDtaLanc.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if cmbObraEtapa.Text = '' then
   begin
      MsgDlg('Selecione a etapa da obra!','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      cmbObraEtapa.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edValOfi.Value = 0 then
   begin
      MsgDlg('Informe a Valor do Lançamento!','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edValOfi.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edDtaNota.Text = '' then
      dDtaNota := -1
   else
      dDtaNota := strtodate(edDtaNota.Text);
   //-------------------------------------------------------------------------------------
   iResult := AtivoFixo.ExecutaLancObra(Sistema.IdModulo,
                                        Sistema.IdEmpresa,
                                        qryCafObra.FieldByName('IDCAFOBRA').asInteger,
                                        qryObraEtapa.FieldByName('IDOBRATIPOETAPA').AsInteger,
                                        qrySelGrupo.FieldByName('IDGRUPO').AsInteger,
                                        qrySelSubConta.FieldByName('CODSUBCONTA').AsInteger,
                                        qrySelAtivProj.FieldByName('UNIDNEGOC').AsInteger,
                                        edDtaLanc.Date,
                                        edValOfi.Value,
                                        edNumNota.Text,
                                        edComplNota.Text,
                                        dDtaNota,
                                        qrySelFornec.FieldByname('IDPESSOA').AsInteger,
                                        edDescLancObra.Text,
                                        True);
   //-------------------------------------------------------------------------------------
   if iResult > 0 then
   begin
      MsgDlg('Lançamento Realizado!','Atenção',mtInformation,[mbOk],0);
   end else
   begin
      MsgDlg('Lançamento não Realizado!','Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   LimpaCampos('P');
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovObraLanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryCafObra.Close;
   qryObraEtapa.Close;
   qrySelGrupo.Close;
   qrySelSubConta.Close;
   qrySelAtivProj.Close;
   qrySelFornec.Close;
   qryCafObra.UnPrepare;
   qryObraEtapa.UnPrepare;
   qrySelGrupo.UnPrepare;
   qrySelSubConta.UnPrepare;
   qrySelAtivProj.UnPrepare;
   qrySelFornec.UnPrepare;
end;
//========================================================================================
procedure TfrmMovObraLanc.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos('T');
   bbtnProcurar.SetFocus;
end;

end.

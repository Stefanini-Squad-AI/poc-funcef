unit fMTObraLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery,
  TREdit, TEdNum, wwdbdatetimepicker, CMDateTimePicker, TB97Ctls, Mask,
  wwdbedit, DBCtrls, wwdblook, Wwdatsrc, uCmSqlParams, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes, uCtrlCafObra, uCtrlObraTipoEtapa,
  uCtrlDomBem, uCtrlGrupoContab, uCtrlSubConta, uCtrlUnidNegocio, IvEMulti;

type
  TfrmMTObraLanc = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    Data: TLabel;
    edDtaLanc: TCMDateTimePicker;
    cmbObraEtapa: TwwDBLookupCombo;
    Label3: TLabel;
    edValofi: TRealEdit;
    Label44: TLabel;
    edNumNota: TEdit;
    Label14: TLabel;
    edComplNota: TEdit;
    Label16: TLabel;
    edDtaNota: TCMDateTimePicker;
    dsCafObra: TwwDataSource;
    Label1: TLabel;
    dbeDescObra: TDBMemo;
    Label2: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    MontaSelect: TMontaSelect;
    bbtnProcurar: TBitBtn;
    MSGrupo: TMontaSelect;
    dsGrupo: TwwDataSource;
    dsSubConta: TwwDataSource;
    MSSubConta: TMontaSelect;
    MSAtivProjeto: TMontaSelect;
    dsAtivProj: TwwDataSource;
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
    dsFornec: TwwDataSource;
    Label49: TLabel;
    edFornec: TwwDBEdit;
    bbtnSelFornec: TBitBtn;
    Label4: TLabel;
    edDescLancObra: TMemo;
    cdsCafObra: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsSubConta: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    cdsFornec: TCMClientDataSet;
    cdsObraEtapa: TCMClientDataSet;
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
    Obra        : TCtrlCafObra;
    ObraEtapa   : TCtrlObraTipoEtapa;
    Bem         : TCtrlDomBem;
    GrupoContab : TCtrlGrupoContab;
    SubConta    : TCtrlSubConta;
    AtivProjeto : TCtrlUnidNegocio;
    procedure SelObra(fIdPessoa, fIdCafObra : Extended);
    procedure LimpaCampos(sTipo : String);
  public
    { Public declarations }
  end;

var
  frmMTObraLanc: TfrmMTObraLanc;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

procedure TfrmMTObraLanc.FormCreate(Sender: TObject);
begin
   inherited;
   Obra := TCtrlCafObra.Create;
   Obra.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ObraEtapa := TCtrlObraTipoEtapa.Create;
   ObraEtapa.InitializeAs(Padroes);
   cdsObraEtapa.Data := ObraEtapa.ListaObraTipoEtapa;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   SubConta := TCtrlSubConta.Create;
   SubConta.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   AtivProjeto := TCtrlUnidNegocio.Create;
   AtivProjeto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('CAFOBRA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSFornec.Filtro.Add('EMPRESAFORN.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupo.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSAtivProjeto.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
end;
//========================================================================================
procedure TfrmMTObraLanc.FormShow(Sender: TObject);
begin
   inherited;
   bbtnProcurar.Setfocus;
end;
//========================================================================================
procedure TfrmMTObraLanc.LimpaCampos(sTipo : String);
begin
   if sTipo = 'T' then
   begin
      SelObra(Sistema.IdEmpresa, 0);
      edDtaLanc.Date := Date;
      cdsObraEtapa.Data := ObraEtapa.ListaObraTipoEtapa;
   end;
   edDescLancObra.Text := '';
   edNumNota.Text      := '';
   edComplNota.Text    := '';
   edDtaNota.Text      := '';
   edValOfi.Value      := 0;
   cdsFornec.Close;
   cdsGrupo.Close;
   cdsSubConta.Close;
   cdsAtivProj.Close;
end;
//========================================================================================
procedure TfrmMTObraLanc.SelObra(fIdPessoa, fIdCafObra : Extended);
begin
   cdsCafObra.Data := Obra.ListaCafObra(fIdPessoa, fIdCafObra);
end;
//========================================================================================
procedure TfrmMTObraLanc.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   MontaSelect.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MontaSelect.RetornouValor then
   begin
      SelObra(StrToInt(MontaSelect.ValoresChave[1]),StrToInt(MontaSelect.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      edDtaLanc.SetFocus;
   end else
   begin
      LimpaCampos('T');
      bbtnProcurar.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTObraLanc.edDtaLancExit(Sender: TObject);
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
procedure TfrmMTObraLanc.bbtnSelFornecClick(Sender: TObject);
begin
   inherited;
   MSFornec.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   cdsFornec.Close;
   if MSFornec.RetornouValor then
      cdsFornec.Data := Bem.ListaFornecedor(strtofloat(MSFornec.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTObraLanc.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   cdsGrupo.Close;
   if MSGrupo.RetornouValor then
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                    StrToFloat(MSGrupo.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTObraLanc.bbtnSelSubContaClick(Sender: TObject);
begin
   inherited;
   MSSubConta.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSSubConta.RetornouValor then
      cdsSubConta.Data := SubConta.ListSubConta(strtofloat(MSSubConta.ValoresChave[1]),
                                                strtofloat(MSSubConta.ValoresChave[0]))
   else
      cdsSubConta.Data := SubConta.ListSubConta(Sistema.IdEmpresa,-1);
end;
//========================================================================================
procedure TfrmMTObraLanc.bbtnSelAtivProjetoClick(Sender: TObject);
begin
   inherited;
   MSAtivProjeto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSAtivProjeto.RetornouValor then
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(strtofloat(MSAtivProjeto.ValoresChave[1]),
                                                          strtofloat(MSAtivProjeto.ValoresChave[0]))
   else
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa,-2);
end;
//========================================================================================
procedure TfrmMTObraLanc.bbtnConfirmarClick(Sender: TObject);
var
   dDtaNota     : TDateTime;
   fFornec,
   fSubConta,
   fAtivProjeto : Extended;

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
   if cdsFornec.IsEmpty then
      fFornec := -1
   else
      fFornec := cdsFornec.FieldByName('IDPESSOA').AsFloat;
   //-------------------------------------------------------------------------------------
   if cdsSubConta.IsEmpty then
      fSubConta := -1
   else
      fSubConta := cdsSubConta.FieldByName('CODSUBCONTA').AsFloat;
   //-------------------------------------------------------------------------------------
   if cdsAtivProj.IsEmpty then
      fAtivProjeto := -1
   else
      fAtivProjeto := cdsAtivProj.FieldByName('UNIDNEGOC').AsFloat;
   //-------------------------------------------------------------------------------------
   if Obra.ExecutaLancObra(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                           cdsCafObra.FieldByName('IDCAFOBRA').AsFloat,
                           cdsObraEtapa.FieldByName('IDOBRATIPOETAPA').AsFloat,
                           cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                           fSubConta, fAtivProjeto,
                           edDtaLanc.Date, edValOfi.Value,
                           cdsGrupo.FieldByName('NOME').AsString,
                           edNumNota.Text, edComplNota.Text, dDtaNota, fFornec,
                           edDescLancObra.Text) > 0 then
   begin
      MsgDlg('Lançamento Realizado!','Atenção',mtInformation,[mbOk],0);
   end else
   begin
      MsgDlg('Lançamento não Realizado!' + #13 +
             'Causa : '+ Obra.MessageInfo,
             'Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   LimpaCampos('P');
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTObraLanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Obra.Free;
   ObraEtapa.Free;
   Bem.Free;
   GrupoContab.Free;
   SubConta.Free;
   AtivProjeto.Free;
end;
//========================================================================================
procedure TfrmMTObraLanc.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos('T');
   bbtnProcurar.SetFocus;
end;

end.

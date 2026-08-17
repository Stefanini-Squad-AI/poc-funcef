unit fMTObraLancAltera;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, MontaSelect, Db, DBTables, Wwquery, TREdit, TEdNum, wwdbdatetimepicker,
  CMDateTimePicker, TB97Ctls, Mask, wwdbedit, DBCtrls, wwdblook, Wwdatsrc, uCmSqlParams,
  DBClient, uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid,
  uCMTypes, uCtrlPadroes, uCtrlCafObra, uCtrlObraTipoEtapa, uCtrlDomBem, uCtrlGrupoContab,
  uCtrlSubConta, uCtrlUnidNegocio, IvEMulti;

type
  TfrmMTObraLancAltera = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
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
    MSFornec: TMontaSelect;
    dsFornec: TwwDataSource;
    cdsCafObra: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsSubConta: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    cdsFornec: TCMClientDataSet;
    cdsObraEtapa: TCMClientDataSet;
    pnlLancamentos: TPanel;
    pnlLancamento: TPanel;
    Data: TLabel;
    Label3: TLabel;
    Label44: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label8: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label49: TLabel;
    Label4: TLabel;
    edDtaLanc: TCMDateTimePicker;
    cmbObraEtapa: TwwDBLookupCombo;
    edValofi: TRealEdit;
    edNumNota: TEdit;
    edComplNota: TEdit;
    edDtaNota: TCMDateTimePicker;
    edDescGrupo: TwwDBEdit;
    bbtnSelGrupo: TBitBtn;
    edDescSubConta: TwwDBEdit;
    bbtnSelSubConta: TBitBtn;
    bbtnSelAtivProjeto: TBitBtn;
    edAtivProjeto: TwwDBEdit;
    edFornec: TwwDBEdit;
    bbtnSelFornec: TBitBtn;
    edDescLancObra: TMemo;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnAltDet: TToolbarButton97;
    sbtnBuscaDet: TToolbarButton97;
    dsLancObra: TwwDataSource;
    cdsLancObra: TCMClientDataSet;
    sqlLancObra: TCMSqlParams;
    dbgLancObra: TwwDBGrid;
    MSLancObra: TMontaSelect;
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
    procedure cdsLancObraAfterScroll(DataSet: TDataSet);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnBuscaDetClick(Sender: TObject);
  private
    { Private declarations }
    Obra        : TCtrlCafObra;
    ObraEtapa   : TCtrlObraTipoEtapa;
    Bem         : TCtrlDomBem;
    GrupoContab : TCtrlGrupoContab;
    SubConta    : TCtrlSubConta;
    AtivProjeto : TCtrlUnidNegocio;
    procedure SelObra(fIdPessoa, fIdCafObra : Extended);
  public
    { Public declarations }
  end;

var
  frmMTObraLancAltera: TfrmMTObraLancAltera;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

procedure TfrmMTObraLancAltera.FormCreate(Sender: TObject);
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
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;
   sbtnAltDet.Enabled := False;
   sbtnBuscaDet.Enabled := False;
   dbgLancObra.BringToFront;
   //-------------------------------------------------------------------------------------
   SelObra(0,0);
end;
//========================================================================================
procedure TfrmMTObraLancAltera.FormShow(Sender: TObject);
begin
   inherited;
   bbtnProcurar.Setfocus;
end;
//========================================================================================
procedure TfrmMTObraLancAltera.SelObra(fIdPessoa, fIdCafObra : Extended);
begin
   cdsCafObra.Data := Obra.ListaCafObra(fIdPessoa, fIdCafObra);
   if not cdsCafObra.IsEmpty then
   begin
      cdsLancObra.Data := Obra.ListaCafObraLanc(fIdPessoa, fIdCafObra);
   end else
   begin
      cdsLancObra.Data := Obra.ListaCafObraLanc(Sistema.IdEmpresa, 0);
   end;
   //-------------------------------------------------------------------------------------
   if cdsLancObra.IsEmpty then
   begin
      sbtnAltDet.Enabled := False;
      sbtnBuscaDet.Enabled := False;
   end else
   begin
      sbtnAltDet.Enabled := True;
      sbtnBuscaDet.Enabled := True;
   end;
   //-------------------------------------------------------------------------------------
   MSLancObra.Filtro.Strings[0] := 'L.IDCAFOBRA = ' + FloatToStr(fIdCafObra);
   MSLancObra.Filtro.Strings[1] := 'L.IDPESSOA = ' + FloatToStr(fIdPessoa);
   //-------------------------------------------------------------------------------------
   TFloatField(cdsLancObra.FieldByName('VALOFI')).DisplayFormat := '#,##0.00;(#,##0.00); ';
end;
//========================================================================================
procedure TfrmMTObraLancAltera.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   MontaSelect.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MontaSelect.RetornouValor then
      SelObra(StrToInt(MontaSelect.ValoresChave[1]),StrToInt(MontaSelect.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTObraLancAltera.cdsLancObraAfterScroll(DataSet: TDataSet);
begin
   inherited;
   edDtaLanc.Date := cdsLancObra.FieldByName('DTALANCAMENTO').AsDateTime;
   edDescLancObra.Text := cdsLancObra.FieldByName('DESCLANCOBRA').AsString;
   edNumNota.Text := cdsLancObra.FieldByName('NUMNOTA').AsString;
   edComplNota.Text := cdsLancObra.FieldByName('COMPLNOTA').AsString;
   edDtaNota.Date := cdsLancObra.FieldByName('DTANOTA').AsDateTime;
   edValOfi.Value := cdsLancObra.FieldByName('VALOFI').AsCurrency;
   //-------------------------------------------------------------------------------------
   cdsFornec.Data := Bem.ListaFornecedor(cdsLancObra.FieldByName('IDFORNECEDOR').AsFloat);
   cdsGrupo.Data := GrupoContab.ListaGrupoContab(cdsLancObra.FieldByName('IDPESSOA').AsFloat,
                                                 cdsLancObra.FieldByName('IDGRUPO').AsFloat);
   cdsSubConta.Data := SubConta.ListSubConta(cdsLancObra.FieldByName('IDPESSOA').AsFloat,
                                             cdsLancObra.FieldByName('CODSUBCONTA').AsFloat);
   cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(cdsLancObra.FieldByName('IDPESSOA').AsFloat,
                                                    cdsLancObra.FieldByName('UNIDNEGOC').AsFloat);
end;
//========================================================================================
procedure TfrmMTObraLancAltera.sbtnBuscaDetClick(Sender: TObject);
begin
   inherited;
   MSLancObra.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSLancObra.RetornouValor then
      cdsLancObra.Locate('IDOBRALANC',strtofloat(MontaSelect.ValoresChave[0]),[]);
   //-------------------------------------------------------------------------------------
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTObraLancAltera.sbtnAltDetClick(Sender: TObject);
begin
   inherited;
   sbtnAltDet.Enabled := False;
   sbtnBuscaDet.Enabled := False;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
   dbgLancObra.SendToBack;
   cdsLancObra.Edit;
end;
//========================================================================================
procedure TfrmMTObraLancAltera.edDtaLancExit(Sender: TObject);
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
procedure TfrmMTObraLancAltera.bbtnSelFornecClick(Sender: TObject);
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
procedure TfrmMTObraLancAltera.bbtnSelGrupoClick(Sender: TObject);
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
procedure TfrmMTObraLancAltera.bbtnSelSubContaClick(Sender: TObject);
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
procedure TfrmMTObraLancAltera.bbtnSelAtivProjetoClick(Sender: TObject);
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
procedure TfrmMTObraLancAltera.bbtnConfirmarClick(Sender: TObject);
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
   if not Obra.EstornaLancObra(cdsCafObra.FieldByName('IDMODULO').AsFloat,
                               cdsCafObra.FieldByName('IDPESSOA').AsFloat,
                               Sistema.IdUsuario,
                               cdsCafObra.FieldByName('IDCAFOBRA').AsFloat,
                               cdsLancObra.FieldByName('DTALANCAMENTO').AsDateTime,
                               cdsLancObra.FieldByName('DTALANCAMENTO').AsDateTime,
                               cdsLancObra.FieldByName('IDOBRALANC').AsFloat) then
      MsgDlg('Lançamento não Alterado!'+#13+#13+
             'Causa : ' + Obra.MessageInfo,
             'Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   if Obra.ExecutaLancObra(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                           cdsCafObra.FieldByName('IDCAFOBRA').AsFloat,
                           cdsObraEtapa.FieldByName('IDOBRATIPOETAPA').AsFloat,
                           cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                           fSubConta, fAtivProjeto,
                           edDtaLanc.Date, edValOfi.Value,
                           cdsGrupo.FieldByName('NOME').AsString,
                           edNumNota.Text, edComplNota.Text, dDtaNota, fFornec,
                           edDescLancObra.Text,
                           cdsLancObra.FieldByName('IDOBRALANC').AsFloat) > 0 then
   begin
      MsgDlg('Lançamento Alterado!', 'Atenção', mtInformation, [mbOk], 0);
   end else
   begin
      MsgDlg('Lançamento não Alterado!' + #13 +
             'Causa : '+ Obra.MessageInfo,
             'Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   dbgLancObra.BringToFront;
   sbtnAltDet.Enabled := True;
   sbtnBuscaDet.Enabled := True;
   sbtnAltDet.Down := False;
   sbtnBuscaDet.Down := False;
   //-------------------------------------------------------------------------------------
   SelObra(cdsCafObra.FieldByName('IDPESSOA').AsInteger,
           cdsCafObra.FieldByName('IDCAFOBRA').AsInteger);
end;
//========================================================================================
procedure TfrmMTObraLancAltera.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;
   dbgLancObra.BringToFront;
   sbtnAltDet.Enabled := True;
   sbtnBuscaDet.Enabled := True;
   sbtnAltDet.Down := False;
   sbtnBuscaDet.Down := False;
   //-------------------------------------------------------------------------------------
   SelObra(cdsCafObra.FieldByName('IDPESSOA').AsFloat,
           cdsCafObra.FieldByName('IDCAFOBRA').AsFloat);
end;
//========================================================================================
procedure TfrmMTObraLancAltera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Obra.Free;
   ObraEtapa.Free;
   Bem.Free;
   GrupoContab.Free;
   SubConta.Free;
   AtivProjeto.Free;
end;

end.

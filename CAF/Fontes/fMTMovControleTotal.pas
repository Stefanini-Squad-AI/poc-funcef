unit fMTMovControleTotal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Mask, wwdbedit, Db,
  DBTables, Wwquery, Wwdatsrc, MontaSelect, wwdbdatetimepicker,
  CMDateTimePicker, DBClient, uCMClientDataSet, TREdit, fcLabel,
  uCMTypes, uCtrlPadroes, uCtrlBem, uCtrlGrupoContab, uCtrlSubConta, uCtrlUnidNegocio,
  IvEMulti;

type
  TfrmMTMovControleTotal = class(TfrmOkCancelar)
    dsSelBem: TwwDataSource;
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    MSBem: TMontaSelect;
    cdsSelBem: TCMClientDataSet;
    Data: TLabel;
    edData: TCMDateTimePicker;
    Label26: TLabel;
    edPlaca: TEdit;
    bbtnSelBem: TBitBtn;
    dbeDesBem: TDBMemo;
    Label22: TLabel;
    dbeNomeResp: TwwDBEdit;
    dbeDescLocalizacao: TwwDBEdit;
    dbeConjunto: TwwDBEdit;
    Label1: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    dsGrupo: TwwDataSource;
    cdsGrupo: TCMClientDataSet;
    MSGrupos: TMontaSelect;
    dsSubConta: TwwDataSource;
    cdsSubConta: TCMClientDataSet;
    MSSubConta: TMontaSelect;
    dsAtivProj: TwwDataSource;
    cdsAtivProj: TCMClientDataSet;
    MSAtivProj: TMontaSelect;
    Label8: TLabel;
    edDescGrupo: TwwDBEdit;
    bbtnSelGrupo: TBitBtn;
    Label2: TLabel;
    edAtivProjeto: TwwDBEdit;
    bbtnSelAtivProjeto: TBitBtn;
    Label18: TLabel;
    edDescSubConta: TwwDBEdit;
    bbtnSelSubConta: TBitBtn;
    fcLabel2: TfcLabel;
    edDataInicioDep: TCMDateTimePicker;
    Label4: TLabel;
    edValHistorico: TRealEdit;
    pnlIntegraContab: TPanel;
    Label54: TLabel;
    edDtaContab: TCMDateTimePicker;
    ckbFlgBemIntContab: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnSelSubContaClick(Sender: TObject);
    procedure bbtnSelAtivProjetoClick(Sender: TObject);
  private
    { Private declarations }
    Bem         : TCtrlBem;
    GrupoContab : TCtrlGrupoContab;
    AtivProjeto : TCtrlUnidNegocio;
    SubConta    : TCtrlSubConta;
    //------------------------------------------------------------------------------------
    Procedure LimpaTela;
  public
    { Public declarations }
  end;

var
  frmMTMovControleTotal: TfrmMTMovControleTotal;

implementation

{$R *.DFM}

uses uSistema, uMensErro;

procedure TfrmMTMovControleTotal.FormCreate(Sender: TObject);
begin
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   AtivProjeto := TCtrlUnidNegocio.Create;
   AtivProjeto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   SubConta := TCtrlSubConta.Create;
   SubConta.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   //-------------------------------------------------------------------------------------
   MSGrupos.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   edData.Text := '';
end;
//========================================================================================
procedure TfrmMTMovControleTotal.edDataExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Preencha o campo Data da Movimentação','Erro',mtError,[mbOk],0);
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTMovControleTotal.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      edPlaca.Text := MSBem.ValoresChave[2];
      //----------------------------------------------------------------------------------
      if cdsSelBem.FieldByName('CONTROLE').AsString = 'T' then
      begin
         MsgDlg('Bem já em Controle Total!','Erro',mtError,[mbOk],0);
         LimpaTela;
         edData.SetFocus;
      end else
      if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
      begin
         MsgDlg('Bem já baixado!','Erro',mtError,[mbOk],0);
         LimpaTela;
         edData.SetFocus;
      end else
      if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
      begin
         MsgDlg('Bem em Saída Temporária.','Erro',mtError,[mbOk],0);
         LimpaTela;
         edData.SetFocus;
      end else
      begin
         cdsGrupo.Data    := GrupoContab.ListaGrupoContab(cdsSelBem.FieldByName('IDPESSOA').AsFloat,cdsSelBem.FieldByName('IDGRUPO').AsFloat);
         cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(cdsSelBem.FieldByName('IDPESSOA').AsFloat,cdsSelBem.FieldByName('UNIDNEGOC').AsFloat);
         cdsSubConta.Data := SubConta.ListSubConta(cdsSelBem.FieldByName('IDPESSOA').AsFloat,cdsSelBem.FieldByName('CODSUBCONTA').AsFloat);
         edDataInicioDep.Date := cdsSelBem.FieldByName('DTAINCLUSAO').AsDateTime;
         edValHistorico.Value := cdsSelBem.FieldByName('VALHISTORICO').AsFloat;
      end;
   end else
      LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovControleTotal.edPlacaExit(Sender: TObject);
var
   fIdBem : Extended;

begin
   inherited;
   if bbtnSair.Focused then Exit;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text <> '' then
   begin
      fIdBem := Bem.PlacaIdBem(Sistema.IdEmpresa, edPlaca.Text);
      if fIdBem <= 0 then
      begin
         MsgDlg('Placa Inexistente','Erro', mtError, [mbOk], 0);
         LimpaTela;
      end else
      begin
         cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa,fIdBem);
         if cdsSelBem.FieldByName('CONTROLE').AsString = 'T' then
         begin
            MsgDlg('Bem já em Controle Total!','Erro',mtError,[mbOk],0);
            LimpaTela;
            edData.SetFocus;
         end else
         if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MsgDlg('Bem já baixado!','Erro',mtError,[mbOk], 0);
            LimpaTela;
            edData.SetFocus;
         end else
         if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MsgDlg('Bem em Saída Temporária.','Erro',mtError,[mbOk],0);
            LimpaTela;
            edData.SetFocus;
         end else
         begin
            cdsGrupo.Data    := GrupoContab.ListaGrupoContab(cdsSelBem.FieldByName('IDPESSOA').AsFloat,cdsSelBem.FieldByName('IDGRUPO').AsFloat);
            cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(cdsSelBem.FieldByName('IDPESSOA').AsFloat,cdsSelBem.FieldByName('UNIDNEGOC').AsFloat);
            cdsSubConta.Data := SubConta.ListSubConta(cdsSelBem.FieldByName('IDPESSOA').AsFloat,cdsSelBem.FieldByName('CODSUBCONTA').AsFloat);
            edDataInicioDep.Date := cdsSelBem.FieldByName('DTAINCLUSAO').AsDateTime;
            edValHistorico.Value := cdsSelBem.FieldByName('VALHISTORICO').AsFloat;
         end;   
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovControleTotal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Bem.Free;
   GrupoContab.Free;
   AtivProjeto.Free;
   SubConta.Free;
end;
//========================================================================================
procedure TfrmMTMovControleTotal.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Data de Movimentação não pode estar vazia! ','Erro', mtError, [mbOk], 0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text = '' then
   begin
      MsgDlg('Selecione um Bem!', 'Erro', mtError, [mbOk], 0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edPlaca.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edDescGrupo.Text = '' then
   begin
      MsgDlg('Selecione um Grupo Contábil!', 'Erro', mtError, [mbOk], 0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      bbtnSelGrupo.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edDataInicioDep.Text = '' then
   begin
      MsgDlg('Informe a Data de Inicio da Depreciação!', 'Erro', mtError, [mbOk], 0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edDataInicioDep.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edValHistorico.Value <= 0 then
   begin
      MsgDlg('Informe o Valor Histórico de Aquisição!', 'Erro', mtError, [mbOk], 0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edValHistorico.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if Bem.ExecutaControleTotal(Sistema.IdModulo,
                               cdsSelBem.FieldByName('IDPESSOA').asFloat,
                               Sistema.IdUsuario,
                               cdsSelBem.FieldByName('IDBEM').asFloat,
                               edData.Date,
                               cdsGrupo.Fieldbyname('IDGRUPO').AsFloat,
                               cdsSubConta.Fieldbyname('CODSUBCONTA').AsFloat,
                               cdsAtivProj.Fieldbyname('UNIDNEGOC').AsFloat,
                               edDataInicioDep.Date,
                               edValHistorico.Value,
                               ckbFlgBemIntContab.Checked,
                               edDtaContab.Date) then
   begin
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
   end else
   begin
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + Bem.MessageInfo + #13 + #13 +
             'na Transferencia para Controle Total do Bem ' + cdsSelBem.FieldByName('PLACA').AsString,
             'Erro', mtError, [mbOk], 0);
   end;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovControleTotal.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTMovControleTotal.LimpaTela;
begin
   edPlaca.Text := '';
   cdsSelBem.Data := Bem.ListaBem(0, 0);
   //-------------------------------------------------------------------------------------
   cdsGrupo.Data    := GrupoContab.ListaGrupoContab(0, 0);
   cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(0,-3);
   cdsSubConta.Data := SubConta.ListSubConta(0,-3);
   edDataInicioDep.Text := '';
   edValHistorico.Value := 0;
   //-------------------------------------------------------------------------------------
   edData.SetFocus;
end;
//========================================================================================
procedure TfrmMTMovControleTotal.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupos.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupos.RetornouValor then
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                    StrToFloat(MSGrupos.ValoresChave[0]))
   else
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTMovControleTotal.bbtnSelSubContaClick(Sender: TObject);
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
procedure TfrmMTMovControleTotal.bbtnSelAtivProjetoClick(Sender: TObject);
begin
   inherited;
   MSAtivProj.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSAtivProj.RetornouValor then
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(strtofloat(MSAtivProj.ValoresChave[1]),
                                                       strtofloat(MSAtivProj.ValoresChave[0]))
   else
      cdsAtivProj.Data := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa,-2);
end;

end.

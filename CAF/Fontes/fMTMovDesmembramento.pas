unit fMTMovDesmembramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, IvEMulti,
  Dialogs, FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Grids, Wwdbigrd, Wwdbgrid, fcLabel,
  Mask, wwdbedit, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, DB,
  Wwdatsrc, uCmSqlParams, MontaSelect, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes, uCtrlBem, uCtrlMovDesmembramento,
  uCtrlConjunto, uCtrlGrupoContab;

type
  TfrmMTMovDesmembramento = class(TfrmOkCancelar)
    dsGerBens: TwwDataSource;
    pnlMestre: TPanel;
    Data: TLabel;
    Label22: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    edData: TCMDateTimePicker;
    spdPesquisa: TBitBtn;
    edPlaca: TEdit;
    dbeDesBem: TDBMemo;
    dbeDescConjunto: TwwDBEdit;
    dbeDescLocal: TwwDBEdit;
    dbeNomeResp: TwwDBEdit;
    PnlDetalhe: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    fcLabel4: TfcLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbgGerBens: TwwDBGrid;
    edPlacaNova: TEdit;
    edDescricaoNova: TMemo;
    Dock973: TDock97;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInserir: TSpeedButton;
    sbtnApagar: TSpeedButton;
    sbtnAlterar: TSpeedButton;
    edSomaPerc: TRealEdit;
    edNumBens: TRealEdit;
    edProporcao: TRealEdit;
    dbeConjunto: TwwDBEdit;
    bbtnSelConjunto: TBitBtn;
    bbtnGeraConjunto: TBitBtn;
    dbeGrupo: TwwDBEdit;
    bbtnSelGrupo: TBitBtn;
    dsConjunto: TwwDataSource;
    cdsConjunto: TCMClientDataSet;
    MSConjunto: TMontaSelect;
    dsGrupo: TwwDataSource;
    cdsGrupo: TCMClientDataSet;
    MSGrupo: TMontaSelect;
    cdsGerBens: TCMClientDataSet;
    sqlGerBens: TCMSqlParams;
    dsSelBem: TwwDataSource;
    cdsSelBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure spdPesquisaClick(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure cdsGerBensAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Bem               : TCtrlBem;
    MovDesmembramento : TCtrlMovDesmembramento;
    GrupoContab       : TCtrlGrupoContab;
    Conjunto          : TCtrlConjunto;
    //------------------------------------------------------------------------------------
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmMTMovDesmembramento: TfrmMTMovDesmembramento;

implementation

{$R *.dfm}

uses uSistema, uMensErro, fMTCadConjunto;


procedure TfrmMTMovDesmembramento.FormCreate(Sender: TObject);
begin
   inherited;
   MovDesmembramento := TCtrlMovDesmembramento.Create;
   MovDesmembramento.InitializeAs(Padroes);
   MovDesmembramento.cdsGerBens := cdsGerBens;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   //-------------------------------------------------------------------------------------
   MSGrupo.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupo.Filtro.Add('GRUPO.INATIVO = 0');
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.INATIVO = 0');
   //-------------------------------------------------------------------------------------
   edData.Text := '';
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.LimpaCampos;
begin
   cdsSelBem.Close;
   edPlaca.Text := '';
   //-------------------------------------------------------------------------------------
   cdsConjunto.Close;
   cdsGrupo.Close;
   edPlacaNova.Text := '';
   edProporcao.Value := 0;
   edDescricaoNova.Text := '';
   cdsGerBens.Close;
   sqlGerBens.Open;
   edNumBens.Value  := 0;
   edSomaPerc.Value := 0;
   pnlDetalhe.Enabled  := False;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.edDataExit(Sender: TObject);
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
procedure TfrmMTMovDesmembramento.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      LimpaCampos;
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      if cdsSelBem.IsEmpty then
      begin
         MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end else
      begin
         if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end else
         if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MsgDlg('Bem em Saída Temporária.','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end else
         begin
            edPlaca.Text := MSBem.ValoresChave[2];
            //----------------------------------------------------------------------------
            edDescricaoNova.Text := cdsSelBem.FieldByName('DESBEM').AsString;
            pnlDetalhe.Enabled   := True;
            cdsConjunto.Data     := Conjunto.ListaConjunto(Sistema.IdEmpresa, cdsSelBem.FieldByName('IDCONJUNTO').AsFloat);
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, cdsSelBem.FieldByName('IDGRUPO').AsFloat);
            edPlacaNova.SetFocus;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.edPlacaExit(Sender: TObject);
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
         LimpaCampos;
      end else
      begin
         LimpaCampos;
         cdsSelBem.Data := Bem.ListaBem(Sistema.IdEmpresa,fIdBem);
         if cdsSelBem.IsEmpty then
         begin
            MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end else
         begin
            if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
            begin
               MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
               LimpaCampos;
               edData.SetFocus;
            end else
            if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
            begin
               MsgDlg('Bem em Saída Temporária.','Erro',mtError,[mbOk],0);
               LimpaCampos;
               edData.SetFocus;
            end else
            begin
               edPlaca.Text := cdsSelBem.FieldByName('PLACA').AsString;
               //-------------------------------------------------------------------------
               edDescricaoNova.Text := cdsSelBem.FieldByName('DESBEM').AsString;
               pnlDetalhe.Enabled   := True;
               cdsConjunto.Data     := Conjunto.ListaConjunto(Sistema.IdEmpresa, cdsSelBem.FieldByName('IDCONJUNTO').AsFloat);
               cdsGrupo.Data        := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa, cdsSelBem.FieldByName('IDGRUPO').AsFloat);
               edPlacaNova.SetFocus;
            end;
         end;   
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if (edPlacaNova.Text <> '') and (edDescricaoNova.Text <> '') and
      ((edProporcao.Value > 0) and (edProporcao.Value < 100)) then
   begin
      cdsGerBens.Append;
      cdsGerBens.FieldByName('PLACA').AsString        := edPlacaNova.Text;
      cdsGerBens.FieldByName('DESBEM').AsString       := edDescricaoNova.Text;
      cdsGerBens.FieldByName('PROPORCAO').AsFloat     := edProporcao.Value;
      cdsGerBens.FieldByName('IDCONJUNTO').AsInteger  := cdsConjunto.FieldByName('IDCONJUNTO').AsInteger;
      cdsGerBens.FieldByName('DESCCONJUNTO').AsString := cdsConjunto.FieldByName('DESCCONJUNTO').AsString;
      cdsGerBens.FieldByName('IDGRUPO').AsInteger     := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
      cdsGerBens.FieldByName('CLASSE').AsString       := cdsGrupo.FieldByName('CLASSE').AsString;
      cdsGerBens.FieldByName('NOME').AsString         := cdsGrupo.FieldByName('NOME').AsString;
      cdsGerBens.Post;
      Application.ProcessMessages; 
      //----------------------------------------------------------------------------------
      edNumBens.Value  := edNumBens.Value + 1;
      edSomaPerc.Value := edSomaPerc.Value + edProporcao.Value;
   end;
   //-------------------------------------------------------------------------------------
   sbtnInserir.Down := False;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if (edPlacaNova.Text <> '') and (edDescricaoNova.Text <> '') and
      ((edProporcao.Value > 0) and (edProporcao.Value < 100)) then
   begin
      edSomaPerc.Value := edSomaPerc.Value - cdsGerBens.FieldByName('PROPORCAO').AsFloat;
      //----------------------------------------------------------------------------------
      cdsGerBens.Edit;
      cdsGerBens.FieldByName('PLACA').AsString        := edPlacaNova.Text;
      cdsGerBens.FieldByName('DESBEM').AsString       := edDescricaoNova.Text;
      cdsGerBens.FieldByName('PROPORCAO').AsFloat     := edProporcao.Value;
      cdsGerBens.FieldByName('IDCONJUNTO').AsInteger  := cdsConjunto.FieldByName('IDCONJUNTO').AsInteger;
      cdsGerBens.FieldByName('DESCCONJUNTO').AsString := cdsConjunto.FieldByName('DESCCONJUNTO').AsString;
      cdsGerBens.FieldByName('IDGRUPO').AsInteger     := cdsGrupo.FieldByName('IDGRUPO').AsInteger;
      cdsGerBens.FieldByName('CLASSE').AsString       := cdsGrupo.FieldByName('CLASSE').AsString;
      cdsGerBens.FieldByName('NOME').AsString         := cdsGrupo.FieldByName('NOME').AsString;
      cdsGerBens.Post;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      edSomaPerc.Value := edSomaPerc.Value + edProporcao.Value;
   end;
   //-------------------------------------------------------------------------------------
   sbtnAlterar.Down := False;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.sbtnApagarClick(Sender: TObject);
begin
   inherited;
   if not cdsGerBens.EOF then
   begin
      edNumBens.Value  := edNumBens.Value - 1;
      edSomaPerc.Value := edSomaPerc.Value - cdsGerBens.FieldByName('PROPORCAO').AsFloat;
      //----------------------------------------------------------------------------------
      cdsGerBens.Delete;
   end;
   //-------------------------------------------------------------------------------------
   sbtnApagar.Down := False;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                 StrToFloat(MSConjunto.ValoresChave[0]));
   end;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.bbtnGeraConjuntoClick(Sender: TObject);
var
   fIdConjunto, fIdPessoa : Extended;

begin
   Application.CreateForm(TfrmMTCadConjunto,frmMTCadConjunto);
   frmMTCadConjunto.FormStyle := FsNormal;
   frmMTCadConjunto.Visible   := False;
   frmMTCadConjunto.Top       := 76;
   frmMTCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   fIdConjunto := frmMTCadConjunto.fUltIdConjunto;
   fIdPessoa   := frmMTCadConjunto.fUltIdPessoa;
   frmMTCadConjunto.Release;
   //-------------------------------------------------------------------------------------
   cdsConjunto.Data := Conjunto.ListaConjunto(fIdPessoa, fIdConjunto);
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupo.RetornouValor then
   begin
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                    StrToFloat(MSGrupo.ValoresChave[0]));
   end;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.cdsGerBensAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if not cdsGerBens.FieldbyName('IDCONJUNTO').IsNull then
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                 cdsGerBens.FieldByName('IDCONJUNTO').AsFloat);
   end;
   //-------------------------------------------------------------------------------------
   if not cdsGerBens.FieldbyName('IDGRUPO').IsNull then
   begin
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                    cdsGerBens.FieldByName('IDGRUPO').AsFloat);
   end;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if edNumBens.Value = 0 then
   begin
      MsgDlg('Devem existir bens resultantes! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edSomaPerc.Value <> 100 then
   begin
      MsgDlg('A soma das proporções devem totalizar 100% ! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   cdsGerBens.DisableControls;
   Screen.Cursor := crSQLWait;
   if MovDesmembramento.ExecutaDesmembramento(cdsSelBem.FieldByName('IDMODULO').AsFloat,
                                              cdsSelBem.FieldByName('IDPESSOA').AsFloat,
                                              Sistema.IdUsuario,
                                              cdsSelBem.FieldByName('IDBEM').AsFloat,
                                              edData.Date) then
   begin
      Screen.Cursor := crDefault;
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
      LimpaCampos;
   end else
   begin
      Screen.Cursor := crDefault;
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + MovDesmembramento.MessageInfo,
             'Erro', mtError, [mbOk], 0);
   end;
   cdsGerBens.EnableControls;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   edData.SetFocus;
end;
//========================================================================================
procedure TfrmMTMovDesmembramento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Bem.Free;
   MovDesmembramento.Free;
   GrupoContab.Free;
   Conjunto.Free;
end;

end.

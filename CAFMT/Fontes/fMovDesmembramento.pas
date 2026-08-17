unit fMovDesmembramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, MontaSelect, Db,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker, Grids,
  fcLabel, Mask, wwdbedit, Wwdatsrc, DBCtrls, Wwdbigrd, Wwdbgrid;

type
  TfrmMovDesmembramento = class(TfrmOkCancelar)
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    qrySelBem: TwwQuery;
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
    PnlDetalhe: TPanel;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemPLACA: TFloatField;
    qrySelBemDESCCONJUNTO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDESCLOCALIZACAO: TStringField;
    qrySelBemNOMERESPONSAVEL: TStringField;
    edPlacaNova: TEdit;
    edDescricaoNova: TMemo;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInserir: TSpeedButton;
    sbtnApagar: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    edProporcao: TRealEdit;
    Label4: TLabel;
    edSomaPerc: TRealEdit;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    edNumBens: TRealEdit;
    dbeDesBem: TDBMemo;
    dsSelBem: TwwDataSource;
    dbeDescConjunto: TwwDBEdit;
    dbeDescLocal: TwwDBEdit;
    dbeNomeResp: TwwDBEdit;
    sbtnAlterar: TSpeedButton;
    fcLabel4: TfcLabel;
    qryGerBens: TwwQuery;
    dsGerBens: TwwDataSource;
    updGerBens: TUpdateSQL;
    dbgGerBens: TwwDBGrid;
    qryGerBensPLACA: TFloatField;
    qryGerBensDESBEM: TStringField;
    qryGerBensPROPORCAO: TFloatField;
    dsSelConjunto: TwwDataSource;
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
    MSConjunto: TMontaSelect;
    dbeConjunto: TwwDBEdit;
    bbtnSelConjunto: TBitBtn;
    bbtnGeraConjunto: TBitBtn;
    Label5: TLabel;
    qryGerBensIDCONJUNTO: TFloatField;
    qryGerBensDESCCONJUNTO: TStringField;
    Label6: TLabel;
    dbeGrupo: TwwDBEdit;
    bbtnSelGrupo: TBitBtn;
    MSGrupo: TMontaSelect;
    qryGrupo: TwwQuery;
    qryGrupoNOME: TStringField;
    qryGrupoIDGRUPO: TFloatField;
    qryGrupoDEPRECIACAO: TFloatField;
    qryGrupoULTIDBEM: TFloatField;
    qryGrupoCLASSE: TStringField;
    dsGrupo: TwwDataSource;
    qrySelBemIDGRUPO: TFloatField;
    qryGerBensIDGRUPO: TFloatField;
    qryGerBensCLASSE: TStringField;
    qryGerBensNOME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure spdPesquisaClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
    procedure qryGerBensAfterScroll(DataSet: TDataSet);
    procedure bbtnSelGrupoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
  end;

var
  frmMovDesmembramento: TfrmMovDesmembramento;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, dAtivoFixo,
     FCadConjunto;

{$R *.DFM}

procedure TfrmMovDesmembramento.FormCreate(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Prepare;
   qryGrupo.Prepare;
   qrySelBem.Prepare;
   qryPlaca.Prepare;
   qryGerBens.Open;
   //-------------------------------------------------------------------------------------
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupo.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMovDesmembramento.LimpaCampos;
begin
   edPlaca.Text := '';
   qrySelBem.Close;
   //-------------------------------------------------------------------------------------
   edPlacaNova.Text := '';
   edDescricaoNova.Text := '';
   edProporcao.Value := 0;
   qryGerBens.Close;
   qryGerBens.Open;
   edNumBens.Value  := 0;
   edSomaPerc.Value := 0;
   pnlDetalhe.Enabled  := False;
   qrySelConjunto.Close;
   qryGrupo.Close;
end;
//========================================================================================
procedure TfrmMovDesmembramento.edDataExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Preencha o campo Data','Erro',mtError,[mbOk],0);
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovDesmembramento.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.ParamByName('PIDBEM').AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qrySelBem.Open;
      if qrySelBem.IsEmpty then
      begin
         MsgDlg('Bem já totalmente baixado ou inexistente','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end else
      begin
         edPlaca.Text         := qrySelBem.FieldByName('PLACA').AsString;
         edDescricaoNova.Text := qrySelBem.FieldByName('DESBEM').AsString;
         pnlDetalhe.Enabled   := True;
         qrySelConjunto.Close;
         qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qrySelBem.FieldByName('IDCONJUNTO').AsInteger;
         qrySelConjunto.Open;
         qryGrupo.Close;
         qryGrupo.ParamByName('PIDGRUPO').AsInteger  := qrySelBem.FieldByName('IDGRUPO').AsInteger;
         qryGrupo.ParamByName('PIDPESSOA').AsInteger := qrySelBem.FieldByName('IDPESSOA').AsInteger;
         qryGrupo.Open;
         edPlacaNova.SetFocus;
      end;
   end else
   begin
      LimpaCampos;
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovDesmembramento.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMovDesmembramento.edPlacaExit(Sender: TObject);
begin
   inherited;
   if edPlaca.Text <> '' then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := StrToFloat(edPlaca.Text);
      qryPlaca.Open;
      if not qryPlaca.isEmpty then
      begin
         qrySelBem.Close;
         qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelBem.ParamByName('PIDBEM').AsInteger    := qryPlacaIDBEM.AsInteger;
         qrySelBem.Open;
         //-------------------------------------------------------------------------------
         if not qrySelBem.IsEmpty then
         begin
            edPlaca.Text         := qrySelBem.FieldByName('PLACA').AsString;
            edDescricaoNova.Text := qrySelBem.FieldByName('DESBEM').AsString;
            pnlDetalhe.Enabled   := True;
            qrySelConjunto.Close;
            qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qrySelBem.FieldByName('IDCONJUNTO').AsInteger;
            qrySelConjunto.Open;
            qryGrupo.Close;
            qryGrupo.ParamByName('PIDGRUPO').AsInteger  := qrySelBem.FieldByName('IDGRUPO').AsInteger;
            qryGrupo.ParamByName('PIDPESSOA').AsInteger := qrySelBem.FieldByName('IDPESSOA').AsInteger;
            qryGrupo.Open;
            edPlacaNova.SetFocus;
         end else
         begin
            MsgDlg('Bem já totalmente baixado ou inexistente.','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end;
      end else
      begin
         LimpaCampos;
         edData.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovDesmembramento.bbtnConfirmarClick(Sender: TObject);
var
   iResult, iAux, iQtdBens : Integer;
   aConjunto               : Array of Integer;
   aGrupo                  : Array of Integer;
   aPlaca                  : Array of Extended;
   aDesBem                 : Array of String;
   aProporcoes             : Array of Currency;
   aIdBemResult            : Array of Integer;
   aSaldoContab            : Array of Currency;

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
   iQtdBens := trunc(edNumBens.Value);
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
   if (not qrySelConjunto.Active) or (qrySelConjuntoIDCONJUNTO.IsNull) then
   begin
      MsgDlg('Selecione o conjunto do novo bem ! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   SetLength(aConjunto,iQtdBens);
   SetLength(aGrupo,iQtdBens);
   SetLength(aPlaca,iQtdBens);
   SetLength(aDesBem,iQtdBens);
   SetLength(aProporcoes,iQtdBens);
   SetLength(aIdBemResult,iQtdBens);
   SetLength(aSaldoContab,iQtdBens);
   qryGerBens.First;
   for iAux := 0 to (iQtdBens - 1) do
   begin
      aConjunto[iAux]    := qryGerBens.FieldByName('IDCONJUNTO').AsInteger;
      aGrupo[iAux]       := qryGerBens.FieldByName('IDGRUPO').AsInteger;
      aPlaca[iAux]       := qryGerBens.FieldByName('PLACA').AsFloat;
      aDesBem[iAux]      := qryGerBens.FieldByName('DESBEM').AsString;
      aProporcoes[iAux]  := qryGerBens.FieldByName('PROPORCAO').AsFloat;
      aSaldoContab[iAux] := 0;
      qryGerBens.Next;
   end;
   //-------------------------------------------------------------------------------------
   iResult := AtivoFixo.ExecutaDesmembramento(Sistema.IdModulo,
                                              Sistema.IdEmpresa,
                                              qrySelBem.FieldByName('IDBEM').AsInteger,
                                              edData.Date,
                                              iQtdBens,
                                              aGrupo,
                                              aConjunto,
                                              aPlaca,
                                              aDesBem,
                                              aProporcoes,
                                              aIdBemResult,
                                              aSaldoContab,
                                              True);
   //-------------------------------------------------------------------------------------
   if iResult > 0 then
   begin
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
      LimpaCampos;
      edData.SetFocus;
   end else
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + AtivoFixo.MensagemErro,
             'Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovDesmembramento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelBem.Close;
   qryPlaca.Close;
   qryGerBens.Close;
   qrySelConjunto.Close;
   qryGrupo.Close;
   //-------------------------------------------------------------------------------------
   qrySelBem.UnPrepare;
   qryPlaca.UnPrepare;
   qryGerBens.UnPrepare;
   qrySelConjunto.UnPrepare;
   qryGrupo.UnPrepare;
end;
//========================================================================================
procedure TfrmMovDesmembramento.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   edData.SetFocus;
end;
//========================================================================================
procedure TfrmMovDesmembramento.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if (edPlacaNova.Text <> '') and (edDescricaoNova.Text <> '') and
      ((edProporcao.Value > 0) and (edProporcao.Value < 100)) then
   begin
      qryGerBens.Append;
      qryGerBens.FieldByName('PLACA').AsString        := edPlacaNova.Text;
      qryGerBens.FieldByName('DESBEM').AsString       := edDescricaoNova.Text;
      qryGerBens.FieldByName('PROPORCAO').AsFloat     := edProporcao.Value;
      qryGerBens.FieldByName('IDCONJUNTO').AsInteger  := qrySelConjunto.FieldByName('IDCONJUNTO').AsInteger;
      qryGerBens.FieldByName('DESCCONJUNTO').AsString := qrySelConjunto.FieldByName('DESCCONJUNTO').AsString;
      qryGerBens.FieldByName('IDGRUPO').AsInteger     := qryGrupo.FieldByName('IDGRUPO').AsInteger;
      qryGerBens.FieldByName('CLASSE').AsString       := qryGrupo.FieldByName('CLASSE').AsString;
      qryGerBens.FieldByName('NOME').AsString         := qryGrupo.FieldByName('NOME').AsString;
      qryGerBens.Post;
      //----------------------------------------------------------------------------------
      qryGerBens.Last;
      qryGerBens.Prior;
      //----------------------------------------------------------------------------------
      edNumBens.Value  := edNumBens.Value + 1;
      edSomaPerc.Value := edSomaPerc.Value + edProporcao.Value;
   end;
   //-------------------------------------------------------------------------------------
   sbtnInserir.Down := False;
end;
//========================================================================================
procedure TfrmMovDesmembramento.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if (edPlacaNova.Text <> '') and (edDescricaoNova.Text <> '') and
      ((edProporcao.Value > 0) and (edProporcao.Value < 100)) then
   begin
      edSomaPerc.Value := edSomaPerc.Value - qryGerBens.FieldByName('PROPORCAO').AsFloat;
      qryGerBens.Edit;
      qryGerBens.FieldByName('PLACA').AsString        := edPlacaNova.Text;
      qryGerBens.FieldByName('DESBEM').AsString       := edDescricaoNova.Text;
      qryGerBens.FieldByName('PROPORCAO').AsFloat     := edProporcao.Value;
      qryGerBens.FieldByName('IDCONJUNTO').AsInteger  := qrySelConjunto.FieldByName('IDCONJUNTO').AsInteger;
      qryGerBens.FieldByName('DESCCONJUNTO').AsString := qrySelConjunto.FieldByName('DESCCONJUNTO').AsString;
      qryGerBens.FieldByName('IDGRUPO').AsInteger     := qryGrupo.FieldByName('IDGRUPO').AsInteger;
      qryGerBens.FieldByName('CLASSE').AsString       := qryGrupo.FieldByName('CLASSE').AsString;
      qryGerBens.FieldByName('NOME').AsString         := qryGrupo.FieldByName('NOME').AsString;
      qryGerBens.Post;
      edSomaPerc.Value := edSomaPerc.Value + edProporcao.Value;
   end;
   //-------------------------------------------------------------------------------------
   sbtnAlterar.Down := False;
end;
//========================================================================================
procedure TfrmMovDesmembramento.sbtnApagarClick(Sender: TObject);
begin
   inherited;
   if not qryGerBens.EOF then
   begin
      edNumBens.Value  := edNumBens.Value - 1;
      edSomaPerc.Value := edSomaPerc.Value - qryGerBens.FieldByName('PROPORCAO').AsFloat;
      //----------------------------------------------------------------------------------
      qryGerBens.Delete;
   end;
   //-------------------------------------------------------------------------------------
   sbtnApagar.Down := False;
end;
//========================================================================================
procedure TfrmMovDesmembramento.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := StrToInt(MSConjunto.ValoresChave[0]);
      qrySelConjunto.Open;
      //----------------------------------------------------------------------------------
      bbtnConfirmar.SetFocus;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovDesmembramento.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupo.RetornouValor then
   begin
      qryGrupo.Close;
      qryGrupo.ParamByName('PIDGRUPO').AsInteger := StrToInt(MSGrupo.ValoresChave[0]);
      qryGrupo.ParamByName('PIDPESSOA').AsInteger := StrToInt(MSGrupo.ValoresChave[1]);
      qryGrupo.Open;
      //----------------------------------------------------------------------------------
      bbtnConfirmar.SetFocus;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovDesmembramento.bbtnGeraConjuntoClick(Sender: TObject);
var
   iSelConjunto : Integer;

begin
   inherited;
   Application.CreateForm(TfrmCadConjunto,frmCadConjunto);
   frmCadConjunto.FormStyle := FsNormal;
   frmCadConjunto.Visible   := False;
   frmCadConjunto.Top       := 76;
   frmCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   iSelConjunto := frmCadConjunto.qryUltConj.Fieldbyname('IDCONJUNTO').asInteger;
   frmCadConjunto.qryUltConj.Close;
   frmCadConjunto.qryUltConj.UnPrepare;
   frmCadConjunto.Release;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Close;
   qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := iSelConjunto;
   qrySelConjunto.Open;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.SetFocus;
end;
//========================================================================================
procedure TfrmMovDesmembramento.qryGerBensAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if not qryGerBens.FieldbyName('IDCONJUNTO').IsNull then
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qryGerBens.FieldByName('IDCONJUNTO').AsInteger;
      qrySelConjunto.Open;
   end;
   //-------------------------------------------------------------------------------------
   if not qryGerBens.FieldbyName('IDGRUPO').IsNull then
   begin
      qryGrupo.Close;
      qryGrupo.ParamByName('PIDGRUPO').AsInteger  := qryGerBens.FieldByName('IDGRUPO').AsInteger;
      qryGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryGrupo.Open;
   end;
end;

end.


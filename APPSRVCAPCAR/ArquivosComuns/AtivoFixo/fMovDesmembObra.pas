unit fMovDesmembObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, MontaSelect, Db,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker, Grids,
  fcLabel, Mask, wwdbedit, Wwdatsrc, DBCtrls, Wwdbigrd, Wwdbgrid;

type
  TfrmMovDesmembObra = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    Data: TLabel;
    edData: TCMDateTimePicker;
    PnlDetalhe: TPanel;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInserir: TSpeedButton;
    sbtnApagar: TSpeedButton;
    edSomaPercLancObra: TRealEdit;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    sbtnAlterar: TSpeedButton;
    qryObraFilhos: TwwQuery;
    dsObraFilhos: TwwDataSource;
    updObraFilhos: TUpdateSQL;
    dbgObrasFilho: TwwDBGrid;
    qryObra: TwwQuery;
    qryObraLanc: TwwQuery;
    MSObra: TMontaSelect;
    Label1: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    dbeDescObra: TDBMemo;
    Label7: TLabel;
    rdgTipoCalcProp: TRadioGroup;
    grbProporcao: TGroupBox;
    lblPercentual: TLabel;
    lblValor: TLabel;
    edProporcao: TRealEdit;
    edDescricaoNova: TMemo;
    Label2: TLabel;
    fcLabel3: TfcLabel;
    edSomaLancObra: TRealEdit;
    fcLabel4: TfcLabel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    bbtnProcurar: TBitBtn;
    dsObra: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure rdgTipoCalcPropClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryObraFilhosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    iQtdObras : Integer;
    fPerc    : Extended;
  public
    { Public declarations }
    procedure LimpaCampos;
    procedure RecalculaSomaProp(sTipo : String);
  end;

var
  frmMovDesmembObra: TfrmMovDesmembObra;

implementation

uses uAutorizacao, uSistema, uAtivoFixo, dAtivoFixo, uMensErro;

{$R *.DFM}

procedure TfrmMovDesmembObra.FormCreate(Sender: TObject);
begin
   inherited;
   qryObra.Prepare;
   qryObraLanc.Prepare;
   qryObraFilhos.Open;
end;
//========================================================================================
procedure TfrmMovDesmembObra.FormActivate(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMovDesmembObra.LimpaCampos;
begin
   iQtdObras := 0;
   qryObra.Close;
   qryObra.ParamByName('IDPESSOA').AsInteger  := -1;
   qryObra.ParamByName('IDCAFOBRA').AsInteger := -1;
   qryObra.Open;
   qryObraFilhos.Close;
   qryObraFilhos.Open;
   TFloatField(qryObraFilhos.FieldByName('PROPORCAO')).DisplayFormat := '#,##0.00;(#,##0.00); ';
   edData.Text              := '';
   edDescricaoNova.Text     := '';
   edProporcao.Value        := 0;
   edSomaLancObra.Value     := 0;
   edSomaPercLancObra.Value := 0;
   pnlDetalhe.Enabled       := False;
   bbtnProcurar.SetFocus;
end;
//========================================================================================
procedure TfrmMovDesmembObra.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   MSObra.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSObra.RetornouValor then
   begin
      qryObra.Close;
      qryObra.ParamByName('IDCAFOBRA').AsInteger := StrToInt(MSObra.ValoresChave[0]);
      qryObra.ParamByName('IDPESSOA').AsInteger  := StrToInt(MSObra.ValoresChave[1]);
      qryObra.Open;
      if qryObra.IsEmpty then
      begin
         MsgDlg('Erro ao acessar o cadastro da obra', 'Erro', mtError, [mbOk], 0);
         LimpaCampos;
         bbtnProcurar.SetFocus;
      end else
      begin
         qryObraLanc.Close;
         qryObraLanc.ParamByName('IDCAFOBRA').AsInteger := StrToInt(MSObra.ValoresChave[0]);
         qryObraLanc.ParamByName('IDPESSOA').AsInteger  := StrToInt(MSObra.ValoresChave[1]);
         qryObraLanc.Open;
         edSomaLancObra.Value := qryObraLanc.FieldByName('SOMAVALOFI').AsCurrency;
         //-------------------------------------------------------------------------------
         pnlDetalhe.Enabled := True;
         rdgTipoCalcProp.SetFocus;
      end;
   end else
   begin
      LimpaCampos;
      bbtnProcurar.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovDesmembObra.edDataExit(Sender: TObject);
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
Procedure TfrmMovDesmembObra.RecalculaSomaProp(sTipo : String);
var
   iPos : TBookMark;

begin
   if sTipo = 'I' then
   begin
      if qryObraFilhos.FieldbyName('TIPOPROPORCAO').AsString = '%' then
         fPerc := qryObraFilhos.FieldByName('PROPORCAO').AsFloat
      else
         fPerc := (qryObraFilhos.FieldByName('PROPORCAO').AsFloat / edSomaLancObra.Value) * 100;
      //----------------------------------------------------------------------------------
      edSomaPercLancObra.Value := edSomaPercLancObra.Value + fPerc;
   end else
   begin
      iPos := qryObraFilhos.GetBookMark;
      qryObraFilhos.DisableControls;
      qryObraFilhos.First;
      //----------------------------------------------------------------------------------
      edSomaPercLancObra.Value := 0;
      while not qryObraFilhos.EOF do
      begin
         if qryObraFilhos.FieldbyName('TIPOPROPORCAO').AsString = '%' then
            fPerc := qryObraFilhos.FieldbyName('PROPORCAO').AsFloat
         else
            fPerc := (qryObraFilhos.FieldbyName('PROPORCAO').AsFloat / edSomaLancObra.Value) * 100;
         //-------------------------------------------------------------------------------
         edSomaPercLancObra.Value := edSomaPercLancObra.Value + fPerc;
         qryObraFilhos.Next;
      end;
      //----------------------------------------------------------------------------------
      qryObraFilhos.GotoBookmark(iPos);
      qryObraFilhos.FreeBookmark(iPos);
      qryObraFilhos.EnableControls;
   end;
end;
//========================================================================================
procedure TfrmMovDesmembObra.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if (edDescricaoNova.Text <> '') and (edProporcao.Value <> 0) then
   begin
      qryObraFilhos.Append;
      if rdgTipoCalcProp.ItemIndex = 0 then
         qryObraFilhos.FieldByName('TIPOPROPORCAO').AsString := '%'
      else
         qryObraFilhos.FieldByName('TIPOPROPORCAO').AsString := '$';
      qryObraFilhos.FieldByName('DESCCAFOBRA').AsString := edDescricaoNova.Text;
      qryObraFilhos.FieldByName('PROPORCAO').AsFloat    := edProporcao.Value;
      qryObraFilhos.Post;
      //----------------------------------------------------------------------------------
      RecalculaSomaProp('I');
      iQtdObras := iQtdObras + 1;
   end;
   //-------------------------------------------------------------------------------------
   sbtnInserir.Down := False;
end;
//========================================================================================
procedure TfrmMovDesmembObra.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if (edDescricaoNova.Text <> '') and (edProporcao.Value <> 0) then
   begin
      qryObraFilhos.Edit;
      if rdgTipoCalcProp.ItemIndex = 0 then
         qryObraFilhos.FieldByName('TIPOPROPORCAO').AsString := '%'
      else
         qryObraFilhos.FieldByName('TIPOPROPORCAO').AsString := '$';
      qryObraFilhos.FieldByName('DESCCAFOBRA').AsString := edDescricaoNova.Text;
      qryObraFilhos.FieldByName('PROPORCAO').AsFloat    := edProporcao.Value;
      qryObraFilhos.Post;
      //----------------------------------------------------------------------------------
      RecalculaSomaProp('O');
   end;
   //-------------------------------------------------------------------------------------
   sbtnAlterar.Down := False;
end;
//========================================================================================
procedure TfrmMovDesmembObra.sbtnApagarClick(Sender: TObject);
begin
   inherited;
   if not qryObraFilhos.EOF then
   begin
      qryObraFilhos.Delete;
      RecalculaSomaProp('O');
      iQtdObras := iQtdObras - 1;
   end;
   //-------------------------------------------------------------------------------------
   sbtnApagar.Down := False;
end;
//========================================================================================
procedure TfrmMovDesmembObra.rdgTipoCalcPropClick(Sender: TObject);
begin
   inherited;
   if rdgTipoCalcProp.ItemIndex = 0 then
   begin
      lblPercentual.Visible := True;
      lblValor.Visible := False;
      grbProporcao.Caption := ' Percentual sobre Lançamentos ';
      edProporcao.Value := 100;
   end else
   if rdgTipoCalcProp.ItemIndex = 1 then
   begin
      lblPercentual.Visible := False;
      lblValor.Visible := True;
      grbProporcao.Caption := ' Valor sobre Lançamentos ';
      edProporcao.Value := 0;
   end;
end;
//========================================================================================
procedure TfrmMovDesmembObra.bbtnConfirmarClick(Sender: TObject);
var
   iAux                    : Integer;
   aTipoProporcao,
   aIdObraResult           : Array of Integer;
   aProporcoes             : Array of Currency;
   aDescObras              : Array of String;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Informe a Data do Desmembramento! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edSomaPercLancObra.Value <> 100 then
   begin
      MsgDlg('A soma das proporções devem totalizar 100% ! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   SetLength(aTipoProporcao,iQtdObras);
   SetLength(aProporcoes,iQtdObras);
   SetLength(aDescObras,iQtdObras);
   SetLength(aIdObraResult,iQtdObras);
   qryObraFilhos.First;
   for iAux := 0 to (iQtdObras - 1) do
   begin
      if qryObraFilhos.FieldByName('TIPOPROPORCAO').AsString = '%' then
         aTipoProporcao[iAux] := 0
      else
         aTipoProporcao[iAux] := 1;
      //----------------------------------------------------------------------------------
      aProporcoes[iAux]    := qryObraFilhos.FieldByName('PROPORCAO').AsFloat;
      aDescObras[iAux]     := qryObraFilhos.FieldByName('DESCCAFOBRA').AsString;
      aIdObraResult[iAux]  := 0;
      qryObraFilhos.Next;
   end;
   //-------------------------------------------------------------------------------------
   if AtivoFixo.ExecutaDesmembraObra(Sistema.IdModulo,
                                     qryObra.FieldByName('IDPESSOA').AsInteger,
                                     qryObra.FieldByName('IDCAFOBRA').AsInteger,
                                     edData.Date,
                                     edSomaLancObra.Value,
                                     iQtdObras,
                                     aTipoProporcao,
                                     aProporcoes,
                                     aDescObras,
                                     aIdObraResult) then
   begin
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
      LimpaCampos;
      bbtnProcurar.SetFocus;
   end else
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + AtivoFixo.MensagemErro,
             'Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovDesmembObra.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  bbtnProcurar.SetFocus;
end;
//========================================================================================
procedure TfrmMovDesmembObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryObra.Close;
   qryObraLanc.Close;
   qryObraFilhos.Close;
   //-------------------------------------------------------------------------------------
   qryObra.UnPrepare;
   qryObraLanc.UnPrepare;
   qryObraFilhos.UnPrepare;
end;
//========================================================================================
procedure TfrmMovDesmembObra.qryObraFilhosAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if not qryObraFilhos.FieldbyName('TIPOPROPORCAO').IsNull then
   begin
      if qryObraFilhos.FieldbyName('TIPOPROPORCAO').AsString = '%' then
         rdgTipoCalcProp.ItemIndex := 0
      else
         rdgTipoCalcProp.ItemIndex := 1;
      //----------------------------------------------------------------------------------
      edProporcao.Value := qryObraFilhos.FieldbyName('PROPORCAO').AsFloat;
      edDescricaoNova.Text := qryObraFilhos.FieldbyName('DESCCAFOBRA').AsString;
   end;
end;

end.


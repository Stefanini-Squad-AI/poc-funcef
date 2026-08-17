unit fMTObraDesmemb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, MontaSelect, Db,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker, Grids,
  fcLabel, Mask, wwdbedit, Wwdatsrc, DBCtrls, Wwdbigrd, Wwdbgrid, DBClient,
  uCMClientDataSet, uCmSqlParams, uCMTypes, uCtrlPadroes, uCtrlCafObra,
  IvEMulti;

type
  TfrmMTObraDesmemb = class(TfrmOkCancelar)
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
    dsDet: TwwDataSource;
    dbgObrasFilho: TwwDBGrid;
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
    dsCafObra: TwwDataSource;
    cdsCafObra: TCMClientDataSet;
    MSObra: TMontaSelect;
    sqlDet: TCMSqlParams;
    cdsObraLanc: TCMClientDataSet;
    sqlObraLanc: TCMSqlParams;
    cdsDet: TCMClientDataSet;
    cdsObraFilhos: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure rdgTipoCalcPropClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryObraFilhosAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Obra      : TCtrlCafObra;
    iQtdObras : Integer;
    fPerc     : Extended;
    //------------------------------------------------------------------------------------
    procedure SelObra(fIdPessoa, fIdCafObra : Extended);
    procedure RecalculaSomaProp(sTipo : String);
  public
    { Public declarations }
  end;

var
  frmMTObraDesmemb: TfrmMTObraDesmemb;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

procedure TfrmMTObraDesmemb.FormCreate(Sender: TObject);
begin
   inherited;
   Obra := TCtrlCafObra.Create;
   Obra.InitializeAs(Padroes);
   Obra.cds := cdsCafObra;
   Obra.cdsObraFilhos := cdsObraFilhos;
   //-------------------------------------------------------------------------------------
   MSObra.Filtro.Add('CAFOBRA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
end;
//========================================================================================
procedure TfrmMTObraDesmemb.FormShow(Sender: TObject);
begin
   inherited;
   SelObra(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTObraDesmemb.SelObra(fIdPessoa, fIdCafObra : Extended);
begin
   //-------------------------------------------------------------------------------------
   // Inicializa a tela
   //-------------------------------------------------------------------------------------
   iQtdObras := 0;
   cdsDet.Close;
   sqlDet.Open;
   TFloatField(cdsDet.FieldByName('PROPORCAO')).DisplayFormat := '#,##0.00;(#,##0.00); ';
   edData.Text              := '';
   edDescricaoNova.Text     := '';
   edProporcao.Value        := 0;
   edSomaLancObra.Value     := 0;
   edSomaPercLancObra.Value := 0;
   pnlDetalhe.Enabled       := False;
   //-------------------------------------------------------------------------------------
   cdsCafObra.Data := Obra.ListaCafObra(fIdPessoa, fIdCafObra);
   if not cdsCafObra.IsEmpty then
   begin
      cdsObraLanc.Close;
      sqlObraLanc.Prepare;
      sqlObraLanc.ParamByName('IDCAFOBRA').AsFloat := fIdCafObra;
      sqlObraLanc.ParamByName('IDPESSOA').AsFloat  := fIdPessoa;
      sqlObraLanc.Open;
      edSomaLancObra.Value := cdsObraLanc.FieldByName('SOMAVALOFI').AsCurrency;
      //----------------------------------------------------------------------------------
      pnlDetalhe.Enabled := True;
      rdgTipoCalcProp.SetFocus;
   end else
   begin
      if fIdCafObra > 0 then
         MsgDlg('Erro ao acessar o cadastro da obra', 'Erro', mtError, [mbOk], 0);
      bbtnProcurar.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTObraDesmemb.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   MSObra.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSObra.RetornouValor then
      SelObra(StrToFloat(MSObra.ValoresChave[1]), StrToFloat(MSObra.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTObraDesmemb.edDataExit(Sender: TObject);
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
Procedure TfrmMTObraDesmemb.RecalculaSomaProp(sTipo : String);
var
   iPos : TBookMark;

begin
   if sTipo = 'I' then
   begin
      if cdsDet.FieldbyName('TIPOPROPORCAO').AsString = '%' then
         fPerc := cdsDet.FieldByName('PROPORCAO').AsFloat
      else
         fPerc := (cdsDet.FieldByName('PROPORCAO').AsFloat / edSomaLancObra.Value) * 100;
      //----------------------------------------------------------------------------------
      edSomaPercLancObra.Value := edSomaPercLancObra.Value + fPerc;
   end else
   begin
      iPos := cdsDet.GetBookMark;
      cdsDet.DisableControls;
      cdsDet.First;
      //----------------------------------------------------------------------------------
      edSomaPercLancObra.Value := 0;
      while not cdsDet.EOF do
      begin
         if cdsDet.FieldbyName('TIPOPROPORCAO').AsString = '%' then
            fPerc := cdsDet.FieldbyName('PROPORCAO').AsFloat
         else
            fPerc := (cdsDet.FieldbyName('PROPORCAO').AsFloat / edSomaLancObra.Value) * 100;
         //-------------------------------------------------------------------------------
         edSomaPercLancObra.Value := edSomaPercLancObra.Value + fPerc;
         cdsDet.Next;
      end;
      //----------------------------------------------------------------------------------
      cdsDet.GotoBookmark(iPos);
      cdsDet.FreeBookmark(iPos);
      cdsDet.EnableControls;
   end;
end;
//========================================================================================
procedure TfrmMTObraDesmemb.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if (edDescricaoNova.Text <> '') and (edProporcao.Value <> 0) then
   begin
      cdsDet.Append;
      if rdgTipoCalcProp.ItemIndex = 0 then
         cdsDet.FieldByName('TIPOPROPORCAO').AsString := '%'
      else
         cdsDet.FieldByName('TIPOPROPORCAO').AsString := '$';
      cdsDet.FieldByName('DESCCAFOBRA').AsString := edDescricaoNova.Text;
      cdsDet.FieldByName('PROPORCAO').AsFloat    := edProporcao.Value;
      cdsDet.Post;
      //----------------------------------------------------------------------------------
      RecalculaSomaProp('I');
      iQtdObras := iQtdObras + 1;
   end;
   //-------------------------------------------------------------------------------------
   sbtnInserir.Down := False;
end;
//========================================================================================
procedure TfrmMTObraDesmemb.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if (edDescricaoNova.Text <> '') and (edProporcao.Value <> 0) then
   begin
      cdsDet.Edit;
      if rdgTipoCalcProp.ItemIndex = 0 then
         cdsDet.FieldByName('TIPOPROPORCAO').AsString := '%'
      else
         cdsDet.FieldByName('TIPOPROPORCAO').AsString := '$';
      cdsDet.FieldByName('DESCCAFOBRA').AsString := edDescricaoNova.Text;
      cdsDet.FieldByName('PROPORCAO').AsFloat    := edProporcao.Value;
      cdsDet.Post;
      //----------------------------------------------------------------------------------
      RecalculaSomaProp('O');
   end;
   //-------------------------------------------------------------------------------------
   sbtnAlterar.Down := False;
end;
//========================================================================================
procedure TfrmMTObraDesmemb.sbtnApagarClick(Sender: TObject);
begin
   inherited;
   if not cdsDet.EOF then
   begin
      cdsDet.Delete;
      RecalculaSomaProp('O');
      iQtdObras := iQtdObras - 1;
   end;
   //-------------------------------------------------------------------------------------
   sbtnApagar.Down := False;
end;
//========================================================================================
procedure TfrmMTObraDesmemb.rdgTipoCalcPropClick(Sender: TObject);
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
procedure TfrmMTObraDesmemb.bbtnConfirmarClick(Sender: TObject);
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
   cdsObraFilhos.Data := Obra.ListaObraFilhos;
   cdsDet.First;
   while not cdsDet.Eof do
   begin
      cdsObraFilhos.Append;
      if cdsDet.FieldByName('TIPOPROPORCAO').AsString = '%' then
         cdsObraFilhos.FieldByName('TIPOPROPORCAO').AsInteger := 0
      else
         cdsObraFilhos.FieldByName('TIPOPROPORCAO').AsInteger := 1;
      //----------------------------------------------------------------------------------
      cdsObraFilhos.FieldByName('PROPORCAO').AsFloat      := cdsDet.FieldByName('PROPORCAO').AsFloat;
      cdsObraFilhos.FieldByName('DESCCAFOBRA').AsString   := cdsDet.FieldByName('DESCCAFOBRA').AsString;
      cdsObraFilhos.FieldByName('IDOBRARESULT').AsInteger := 0;
      cdsObraFilhos.Post;
      //----------------------------------------------------------------------------------
      cdsDet.Next;
   end;
   //-------------------------------------------------------------------------------------
   if Obra.ExecutaDesmembraObra(Sistema.IdModulo,
                                cdsCafObra.FieldByName('IDPESSOA').AsFloat,
                                cdsCafObra.FieldByName('IDCAFOBRA').AsFloat,
                                edData.Date,
                                edSomaLancObra.Value) then
   begin
      MsgDlg('Movimentação Realizada!','Informação',mtInformation,[mbOk],0);
      SelObra(Sistema.IdEmpresa, 0);
   end else
      MsgDlg('Movimentação não Realizada!' + #13 + #13 +
             'Causa : ' + Obra.MessageInfo,
             'Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTObraDesmemb.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SelObra(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTObraDesmemb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsDet.Close;
   cdsObraLanc.Close;
   Obra.Free;
end;
//========================================================================================
procedure TfrmMTObraDesmemb.qryObraFilhosAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if not cdsObraFilhos.FieldbyName('TIPOPROPORCAO').IsNull then
   begin
      if cdsObraFilhos.FieldbyName('TIPOPROPORCAO').AsString = '%' then
         rdgTipoCalcProp.ItemIndex := 0
      else
         rdgTipoCalcProp.ItemIndex := 1;
      //----------------------------------------------------------------------------------
      edProporcao.Value := cdsObraFilhos.FieldbyName('PROPORCAO').AsFloat;
      edDescricaoNova.Text := cdsObraFilhos.FieldbyName('DESCCAFOBRA').AsString;
   end;
end;

end.


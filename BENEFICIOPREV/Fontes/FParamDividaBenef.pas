{
--------------------------------------------------------------------------------

      TELA PARA PARAMETRIZAÇÃO DE PARCELAMENTO DE DÍVIDA DE BENEFÍCIOS

              Módulo          :  BeneficioPrev
              Autor           :  Helio Lima Custodio
              Data de Término :  31/07/2014

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}
unit FParamDividaBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls, ComCtrls,
  TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker, TREdit, ppDB,
  ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCache, ppCtrls, ppPrnabl, uVerificaPreenchimento, uMensErro, uSistema,
  ppVar;

type
  TFrmParamDividaBenef = class(TfrmCadastroCS)
    lblFuncionalidade: TLabel;
    DBcboFuncionalidade: TComboBox;
    lblFontePagadora: TLabel;
    DBcboFontePagadora: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    tbcPercentualBenef: TTabControlDetalhe;
    Label3: TLabel;
    Label4: TLabel;
    dbedtVlrInicioFaixa: TDBEdit;
    dbedtVlrFimFaixa: TDBEdit;
    qryIDPARAMPARCDIVIDABENEFICIO: TFloatField;
    qryIDFUNCIONALIDADE: TFloatField;
    qryFONTEPAGADORA: TFloatField;
    qryVLRINICIOFAIXA: TFloatField;
    qryVLRFIMFAIXA: TFloatField;
    qryPERCENTUAL: TFloatField;
    qryQTDEPARCINICIAL: TFloatField;
    qryQTDEPARCFINAL: TFloatField;
    qryDTINICIOVIGENCIA: TDateTimeField;
    qryDTFIMVIGENCIA: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERALTERACAO: TStringField;
    qryTRGDTALTERACAO: TDateTimeField;
    tbcPercentualCalculo: TTabControlDetalhe;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbedtQtDeParcInicial: TDBEdit;
    dbedtQtDeParcFinal: TDBEdit;
    tbcVigencia: TTabControlDetalhe;
    Label9: TLabel;
    Label10: TLabel;
    edtDateDTInicioVigencia: TCMDateTimePicker;
    edtDateDTFimVigencia: TCMDateTimePicker;
    dbedtPercentual: TDBEdit;
    btnFaixasVigentes: TBitBtn;
    rpRelFaixaVigente: TppReport;
    ppRelFaixaVigente: TppBDEPipeline;
    dsRelFaixaVigente: TwwDataSource;
    qryRelFaixaVigente: TwwQuery;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    dsRelFundacao: TwwDataSource;
    qryRelFundacao: TwwQuery;
    ppRelFundacao: TppBDEPipeline;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine2: TppLine;
    ppLabel11: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine1: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppImage1: TppImage;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure btnFaixasVigentesClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure LimpaNaoFloatTDBEditOnChange(Sender: TObject);
  private
    { Private declarations }

    procedure CarregaDados(PIdParamParcDividaBeneficio : Integer);

    function VerificaPreenchimento:Boolean;
    function VerificaParametrizacaoJaCadastrada : Boolean;
    function DataMaiorQueAtual(pData : TDate) : Boolean;
  public
    { Public declarations }
  end;

var
  FrmParamDividaBenef: TFrmParamDividaBenef;

implementation

uses dBaseDados;
{$R *.DFM}

procedure TFrmParamDividaBenef.FormShow(Sender: TObject);
begin
  inherited;
  qry.Open;
end;

procedure TFrmParamDividaBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qry.Close;
  qryRelFaixaVigente.Close;
  qryRelFundacao.Close;
end;

procedure TFrmParamDividaBenef.bbtnConfirmarClick(Sender: TObject);
begin
  qry.FieldByName('IDFUNCIONALIDADE').AsInteger := (DBcboFuncionalidade.ItemIndex + 1);
  qry.FieldByName('FONTEPAGADORA').AsInteger    := (DBcboFontePagadora.ItemIndex + 1);

  if (VerificaPreenchimento) and
     (VerificaParametrizacaoJaCadastrada) then
     inherited;
end;

procedure TFrmParamDividaBenef.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;

  DBcboFuncionalidade.Enabled := False;
  DBcboFontePagadora.Enabled  := False;
  btnFaixasVigentes.Enabled   := True;
  bbtnSair.Enabled            := True;
  bbtnAjuda.Enabled           := True;

  if sbtnInserir.Down then
  begin
     DBcboFuncionalidade.Enabled := True;
     DBcboFontePagadora.Enabled  := True;
     btnFaixasVigentes.Enabled   := False;
  end;

  if sbtnAlterar.Down then
  begin
     DBcboFuncionalidade.Enabled := True;
     DBcboFontePagadora.Enabled  := True;
     bbtnSair.Enabled            := False;
     bbtnAjuda.Enabled           := False;
     sbtnAlterar.Enabled         := False;
  end;

end;

procedure TFrmParamDividaBenef.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
      CarregaDados(StrToInt(MontaSelect.ValoresChave[0]));
  end;
end;


procedure TFrmParamDividaBenef.btnFaixasVigentesClick(Sender: TObject);
begin
  inherited;
  qryRelFaixaVigente.Close;
  qryRelFaixaVigente.Open;
  rpRelFaixaVigente.Print;
end;

function TFrmParamDividaBenef.VerificaPreenchimento:Boolean;
var
  INSSSelecionado,
  FuncefSelecionado,
  CalculoSelecionado,
  DesdobramentoSelecionado  : Boolean;
begin

   Result := False;

   INSSSelecionado          := (DBcboFontePagadora.ItemIndex = 1);
   FuncefSelecionado        := (DBcboFontePagadora.ItemIndex = 0);
   CalculoSelecionado       := (DBcboFuncionalidade.ItemIndex = 0);
   DesdobramentoSelecionado := (DBcboFuncionalidade.ItemIndex = 1);

   try
      if DBcboFuncionalidade.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário selecionar a funcionalidade.', DBcboFuncionalidade);
         
      if DBcboFontePagadora.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário selecionar a fonte pagadora.', DBcboFontePagadora);

      if FuncefSelecionado or CalculoSelecionado then
      if length(trim(dbedtVlrInicioFaixa.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário informar o início da faixa redução de benefício.', dbedtVlrInicioFaixa);

      if FuncefSelecionado or CalculoSelecionado then
      if length(trim(dbedtVlrFimFaixa.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário informar o fim da faixa redução de benefício.', dbedtVlrFimFaixa);

      if length(trim(dbedtPercentual.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário informar o percentual.', dbedtPercentual);

      if FuncefSelecionado or CalculoSelecionado then
      if length(trim(dbedtQtDeParcInicial.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário informar a quantidade inicial de meses.', dbedtQtDeParcInicial);

      if FuncefSelecionado or CalculoSelecionado then
      if length(trim(dbedtQtDeParcFinal.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário informar a quantidade final de meses.', dbedtQtDeParcFinal);

      if (length(trim(dbedtQtDeParcFinal.Text)) > 0) and (length(trim(dbedtQtDeParcInicial.Text)) > 0)  then
      if StrToInt(dbedtQtDeParcFinal.Text) < StrToInt(dbedtQtDeParcInicial.Text) then
         raise EValidacao.CreateVal('O campo "quantidade de meses até" deverá ser maior que o campo "quantidade de meses de".', dbedtQtDeParcFinal);

      if length(trim(edtDateDTInicioVigencia.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário informar o início vigência.', edtDateDTInicioVigencia);

      {if INSSSelecionado then
      if length(trim(edtDateDTFimVigencia.Text)) = 0 then
         raise EValidacao.CreateVal('É obrigatório informar a data final da vigência.', edtDateDTFimVigencia);
      }
      if (((length(trim(edtDateDTFimVigencia.Text)) > 0) and (length(trim(edtDateDTInicioVigencia.Text)) > 0)) and
         ( (StrToDate(edtDateDTFimVigencia.Text)) < (StrToDate(edtDateDTInicioVigencia.Text)) )) then
         raise EValidacao.CreateVal('A data final da vigência deverá ser maior que a data inicial da vigência.', edtDateDTFimVigencia);
 
      if (length(trim(edtDateDTFimVigencia.Text)) > 0) and
         (DataMaiorQueAtual(edtDateDTFimVigencia.Date)) then
         raise EValidacao.CreateVal('A data final da vigência deverá ser maior que a data atual.', edtDateDTFimVigencia);
   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;

procedure TFrmParamDividaBenef.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if qry.RecordCount > 0 then
  begin
    DBcboFuncionalidade.ItemIndex := qry.FieldByName('IDFUNCIONALIDADE').AsInteger -1;
    DBcboFontePagadora.ItemIndex := qry.FieldByName('FONTEPAGADORA').AsInteger -1;
  end
  else
  begin
    DBcboFuncionalidade.ItemIndex := -1;
    DBcboFontePagadora.ItemIndex  := -1;
  end;
end;

procedure TFrmParamDividaBenef.sbtnInserirClick(Sender: TObject);
begin
  CarregaDados(-1);
  inherited;
  DBcboFuncionalidade.SetFocus;
end;

procedure TFrmParamDividaBenef.CarregaDados(PIdParamParcDividaBeneficio : Integer);
begin
      qry.Close;
      qry.ParamByName('IDPARAMPARCDIVIDABENEFICIO').AsInteger := PIdParamParcDividaBeneficio;
      qry.Open;

      DBcboFuncionalidade.ItemIndex := qry.FieldByName('IDFUNCIONALIDADE').AsInteger -1;
      DBcboFontePagadora.ItemIndex := qry.FieldByName('FONTEPAGADORA').AsInteger -1;

      if PIdParamParcDividaBeneficio > 0 then
      begin
        sbtnApagar.Down   := False;
        sbtnAlterar.Down  := False;
        sbtnInserir.Down  := False;
        sbtnProcurar.Down := False;

        sbtnApagar.Enabled    := True;
        sbtnAlterar.Enabled   := True;
        sbtnInserir.Enabled   := True;
        sbtnProcurar.Enabled  := True;
      end;
end;

procedure TFrmParamDividaBenef.sbtnApagarClick(Sender: TObject);
begin
  sbtnInserir.Enabled   := False;
  sbtnAlterar.Enabled   := False;
  sbtnApagar.Enabled    := False;
  sbtnProcurar.Enabled  := False;
  bbtnSair.Enabled      := False;
  bbtnAjuda.Enabled     := False;

  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;

  inherited;

  if not sbtnApagar.Enabled then
      CarregaDados(-1);
end;

function TFrmParamDividaBenef.VerificaParametrizacaoJaCadastrada : Boolean;
begin
  inherited;
  Result := True;
  with TwwQuery.Create(dtmBaseDados) do
  begin
  DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

    SQL.Clear;

    SQL.Text := 'SELECT * FROM PARAMPARCDIVIDABENEFICIO ' +#13+
                ' WHERE IDFUNCIONALIDADE = ' + qryIDFUNCIONALIDADE.AsString +#13+
                ' AND FONTEPAGADORA = ' + qryFONTEPAGADORA.AsString +#13+
                ' AND VLRINICIOFAIXA = ' + StringReplace(qryVLRINICIOFAIXA.AsString, ',', '.', [rfIgnoreCase, rfReplaceAll]) +#13+
                ' AND VLRFIMFAIXA = ' + StringReplace(qryVLRFIMFAIXA.AsString, ',', '.', [rfIgnoreCase, rfReplaceAll]) +#13+
                ' AND PERCENTUAL =  ' + StringReplace(qryPERCENTUAL.AsString, ',', '.', [rfIgnoreCase, rfReplaceAll]) +#13+
                ' AND QTDEPARCINICIAL = ' + StringReplace(qryQTDEPARCINICIAL.AsString, ',', '.', [rfIgnoreCase, rfReplaceAll]) +#13+
                ' AND QTDEPARCFINAL = ' + StringReplace(qryQTDEPARCFINAL.AsString, ',', '.', [rfIgnoreCase, rfReplaceAll]) +#13+
                ' AND DTINICIOVIGENCIA =  TO_DATE(' + QuotedStr(qryDTINICIOVIGENCIA.AsString) + ', ''DD/MM/YYYY'')' +#13;

    if qryDTFIMVIGENCIA.AsString = '' then
       SQL.Text := SQL.Text + ' AND DTFIMVIGENCIA IS NULL'
    else
       SQL.Text := SQL.Text + ' AND DTFIMVIGENCIA = TO_DATE(' + QuotedStr(qryDTFIMVIGENCIA.AsString) + ', ''DD/MM/YYYY'') ';

    if qry.State in [dsEdit] then
        SQL.Text := SQL.Text + ' AND IDPARAMPARCDIVIDABENEFICIO <> ' + qryIDPARAMPARCDIVIDABENEFICIO.AsString;

    Open;

    if Not IsEmpty then
    begin
      Result := False;
      MsgDlg('Não é possível fazer um novo cadastro pois já existe um cadastro ativo com as mesmas informações.',Sistema.NomeModulo, mtInformation,[mbOk],0);
    end;

    Close;
    Free;
  end;
end;

function TFrmParamDividaBenef.DataMaiorQueAtual(pData : TDate) : Boolean;
var
    strData : String;
begin
  inherited;

  Result := False;
  strData := FormatDateTime('dd/mm/yyyy', pData);

  with TwwQuery.Create(dtmBaseDados) do
  begin
  DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

    SQL.Clear;

    SQL.Text := 'SELECT SYSDATE FROM DUAL WHERE TO_DATE(' + QuotedStr(strData) + ', ''DD/MM/YYYY'') > SYSDATE';

    Open;

    if IsEmpty then
      Result := True;

    Close;
    Free;
  end;
end;

procedure TFrmParamDividaBenef.LimpaNaoFloatTDBEditOnChange(Sender: TObject);
begin
  inherited;
  try
     StrToFloat((Sender As TDBEdit).Text);
  except
     (Sender As TDBEdit).Text := '';
  end;
end;

end.

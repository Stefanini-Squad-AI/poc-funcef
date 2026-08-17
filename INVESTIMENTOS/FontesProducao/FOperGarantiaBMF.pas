unit FOperGarantiaBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, Wwdotdot, Wwdbcomb, Mask, wwdbedit,
  wwdblook, DBCtrls;

type
  TTipoOper = set of (Aplicacao,Resgate);

  TfrmOperGarantiaBMF = class(TfrmCadastroCSInv)
    lblTipoInvest: TLabel;
    lblOperacao: TLabel;
    dtOperacao: TCMDateTimePicker;
    lblValor: TLabel;
    lblInvestimento: TLabel;
    lblTipoOper: TLabel;
    lblQuantidade: TLabel;
    dbreQuantidade: TDBRealEdit;
    QryTipoOperacao: TwwQuery;
    QryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    QryTipoOperacaoNATUREZAOPERACAO: TStringField;
    dblkTipoInvest: TwwDBLookupCombo;
    dblkTipoOper: TwwDBLookupCombo;
    dblkInvestimento: TwwDBLookupCombo;
    QryTipoInvest: TwwQuery;
    QryTipoInvestIDTIPOINVEST: TFloatField;
    QryTipoInvestDESCTIPOINVEST: TStringField;
    QryInvestimento: TwwQuery;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    sbtnBuscaSaldos: TToolbarButton97;
    MSBuscaSaldos: TMontaSelect;
    Label1: TLabel;
    lblSldQuantidade: TLabel;
    dbreSldValor: TDBRealEdit;
    dbreSldQtd: TDBRealEdit;
    dblkFundoInvest: TwwDBLookupCombo;
    QryFundoInvest: TwwQuery;
    QryFundoInvestIDFUNDOINVEST: TFloatField;
    QryFundoInvestDESCFUNDOINVEST: TStringField;
    dblkCartaFianca: TwwDBLookupCombo;
    QryCartaFianca: TwwQuery;
    QryCartaFiancaIDCARTAFIANCA: TFloatField;
    QryCartaFiancaDESCCARTAFIANCA: TStringField;
    dblkOperRenfix: TwwDBLookupCombo;
    QryOperRenFix: TwwQuery;
    QryOperRenFixIDOPERRENFIX: TFloatField;
    QryOperRenFixVLROPERACAO: TFloatField;
    QryOperRenFixQTDEOPERACAO: TFloatField;
    QryOperRenFixDESCINVESTIMENTO: TStringField;
    qryAux: TwwQuery;
    QrySaldoCartaFianca: TwwQuery;
    QryBuscaIdGarantia: TwwQuery;
    qryIDOPERGARANTIABMF: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    qryIDOPERRENFIX: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDCARTAFIANCA: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDGARANTIA: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryVLROPERACAO: TFloatField;
    qryQTDOPERACAO: TFloatField;
    qrySLDVLROPERACAO: TFloatField;
    qrySLDQTDOPERACAO: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    dbreValor: TDBRealEdit;
    QrySaldoCartaFiancaSALDOCHAMADA: TFloatField;
    QrySaldoCartaFiancaSALDODEVOLUCAO: TFloatField;
    dbmObservacao: TDBMemo;
    Label2: TLabel;
    qryOBSERVACAO: TStringField;
    procedure dblkTipoInvestExit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnBuscaSaldosClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblkCartaFiancaExit(Sender: TObject);
  private
    { Private declarations }
     procedure Sel(N : Longint);
     procedure TipoInvestChange(iIdTipoInvest:integer);
     procedure ClearInvestimento;
     procedure ClearOperRenfix;
     procedure ClearFundoInvest;
     procedure ClearCartaFianca;
     procedure LimpaInvestimentos;
     function ExcluiOperGarantiaBMF(sDataRef:string;iIdGarantia:integer):boolean;
     function VerificaDados:boolean;
     function BuscaIdGarantia(iIdTipoInvest:integer):integer;
  public
    { Public declarations }
  end;

var
  frmOperGarantiaBMF: TfrmOperGarantiaBMF;
  sTipoOper : TTipoOper;
  iIdOperGarantia : LongInt;

implementation

uses UMensErro, UDataBase,UOperComum,uBibliotecaInvest,dBaseDados;

{$R *.DFM}

procedure TfrmOperGarantiaBMF.dblkTipoInvestExit(Sender: TObject);
begin
  inherited;
   TipoInvestChange(QryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger);
end;

procedure TfrmOperGarantiaBMF.ClearInvestimento;
begin
   dblkInvestimento.Visible := False;
   OperComum.LimpaParametros(QryInvestimento);
   QryInvestimento.Open;

   lblSldQuantidade.Visible := True;
   dbreSldQtd.Visible       := True;
   lblQuantidade.Visible    := True;
   dbreQuantidade.Visible   := True;
   if QryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = -1 then // Carta de Fianca
   begin
      lblSldQuantidade.Visible := False;
      dbreSldQtd.Visible       := False;
      lblQuantidade.Visible    := False;
      dbreQuantidade.Visible   := False;
   end;
end;

procedure TfrmOperGarantiaBMF.ClearOperRenfix;
begin
   dblkOperRenfix.Visible   := False;
   OperComum.LimpaParametros(QryOperRenFix);
   QryOperRenFix.Open;
end;

procedure TfrmOperGarantiaBMF.ClearFundoInvest;
begin
   dblkFundoInvest.Visible  := False;
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.Open;
end;

procedure TfrmOperGarantiaBMF.ClearCartaFianca;
begin
   dblkCartaFianca.Visible  := False;
   OperComum.LimpaParametros(QryCartaFianca);
   QryCartaFianca.Open;
end;

procedure TfrmOperGarantiaBMF.TipoInvestChange(iIdTipoInvest:integer);
begin
   if iIdTipoInvest = -1 then //Carta de Fiança
   begin
      dblkCartaFianca.Visible  := True;
      lblInvestimento.Caption := 'Investimento : Carta de Fiança';
      ClearInvestimento;
      ClearOperRenFix;
      ClearFundoInvest;
      OperComum.LimpaParametros(QryCartaFianca);
      QryCartaFianca.ParamByName('DATAVENCTO').AsString := dtOperacao.Text;
      QryCartaFianca.Open;
      if dblkCartaFianca.CanFocus then
         dblkCartaFianca.SetFocus;
   end
   else if iIdTipoInvest = 1 then // Renda Fixa
   begin
      dblkOperRenfix.Visible := True;
      lblInvestimento.Caption := 'Investimento : Renda Fixa';
      ClearInvestimento;
      ClearFundoInvest;
      ClearCartaFianca;
      OperComum.LimpaParametros(QryOperRenFix);
      QryOperRenFix.Open;
      if dblkOperRenfix.CanFocus then
         dblkOperRenfix.SetFocus;
   end
   else if iIdTipoInvest = 2 then // Renda Variavel
   begin
      dblkInvestimento.Visible := True;
      lblInvestimento.Caption := 'Investimento : Renda Variável';
      ClearFundoInvest;
      ClearOperRenFix;
      ClearCartaFianca;
      OperComum.LimpaParametros(QryInvestimento);
      QryInvestimento.ParamByName('IDTIPOINVEST').AsInteger := QryTipoInvestIDTIPOINVEST.AsInteger;
      QryInvestimento.Open;
      if dblkInvestimento.CanFocus then
         dblkInvestimento.SetFocus;
   end
   else if iIdTipoInvest = 5 then    // Fundo de Renda Fixa
   begin
      dblkFundoInvest.Visible := True;
      lblInvestimento.Caption := 'Investimento : Fundos de Renda Fixa';
      ClearOperRenFix;
      ClearCartaFianca;
      ClearInvestimento;
      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.Open;
      if dblkFundoInvest.CanFocus then
         dblkFundoInvest.SetFocus;
   end
   else if iIdTipoInvest = 6 then    // Fundo de Renda Variavel
   begin
      dblkFundoInvest.Visible := True;
      lblInvestimento.Caption := 'Investimento : Fundos de Renda Variável';
      ClearOperRenFix;
      ClearCartaFianca;
      ClearInvestimento;
      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.Open;
      if dblkFundoInvest.CanFocus then
         dblkFundoInvest.SetFocus;
   end
   else if iIdTipoInvest = 7 then  // Fundo Imobiliario
   begin
      dblkFundoInvest.Visible := True;
      lblInvestimento.Caption := 'Investimento : Fundos de Renda Imobiliário';
      ClearOperRenFix;
      ClearCartaFianca;
      ClearInvestimento;
      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.Open;
      if dblkFundoInvest.CanFocus then
         dblkFundoInvest.SetFocus;
   end;
end;

procedure TfrmOperGarantiaBMF.Sel(N : Longint);
begin
  qry.Close;
  qry.ParamByName('IDOPERGARANTIABMF').AsInteger := N;
  qry.Open;
end;

procedure TfrmOperGarantiaBMF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmOperGarantiaBMF.sbtnBuscaSaldosClick(Sender: TObject);
begin
  inherited;
   msBuscaSaldos.Executar;
   if msBuscaSaldos.RetornouValor then
   begin
      sbtnAlterar.Enabled   := False;
      sbtnInserir.Enabled   := False;
      sbtnApagar.Enabled    := False;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;

      qry.Close;
      qry.Open;
      qry.Edit;
      pnlFundo.Enabled := True;

      sTipoOper := [Resgate];
      OperComum.LimpaParametros(QryTipoOperacao);
      qryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := -62;
      qryTipoOperacao.Open;
      dblkTipoOper.Enabled := False;

      TipoInvestChange(StrToInt(msBuscaSaldos.ValoresChave[4]));

      if msBuscaSaldos.ValoresChave[1] <> '' then
      begin
        QryFundoInvest.Locate('IDFUNDOINVEST', StrToInt(msBuscaSaldos.ValoresChave[1]), []);
        dblkFundoInvest.Text := QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString;
        dblkFundoInvest.Enabled := False;
        qryIDFUNDOINVEST.AsInteger := StrToInt(msBuscaSaldos.ValoresChave[1]);
      end;

      if msBuscaSaldos.ValoresChave[2] <> '' then
      begin
         QryInvestimento.Locate('IDINVESTIMENTO', StrToInt(msBuscaSaldos.ValoresChave[2]), []);
         dblkInvestimento.Text := QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
         dblkInvestimento.Enabled := False;
         qryIDINVESTIMENTO.AsInteger := StrToInt(msBuscaSaldos.ValoresChave[2]);
      end;

      if msBuscaSaldos.ValoresChave[3] <> '' then
      begin
         OperComum.LimpaParametros(QryCartaFianca);
         QryCartaFianca.ParamByName('DATAVENCTO').AsString := msBuscaSaldos.ValoresChave[6];
         QryCartaFianca.Open;
         QryCartaFianca.Locate('IDCARTAFIANCA', StrToInt(msBuscaSaldos.ValoresChave[3]), []);
         dblkCartaFianca.Text := QryCartaFianca.FieldByName('DESCCARTAFIANCA').AsString;
         dblkCartaFianca.Enabled := False;
         qryIDCARTAFIANCA.AsInteger := StrToInt(msBuscaSaldos.ValoresChave[3]);
      end;

      if msBuscaSaldos.ValoresChave[4] <> '' then
      begin
         QryTipoInvest.Locate('IDTIPOINVEST', StrToInt(msBuscaSaldos.ValoresChave[4]), []);
         dblkTipoInvest.Text := QryTipoInvest.FieldByName('DESCTIPOINVEST').AsString;
         dblkTipoInvest.Enabled := False;
      end;

      qryDATAOPERACAO.AsDateTime  := StrToDate(msBuscaSaldos.ValoresChave[6]);
      qryIDTIPOINVEST.AsInteger   := -1;
      qryIDTIPOOPERACAO.AsInteger := -62;
      qryIDGARANTIA.AsInteger     := StrToInt(msBuscaSaldos.ValoresChave[7]);
      qryVLROPERACAO.AsFloat      := qrySLDVLROPERACAO.AsFloat;
      qryQTDOPERACAO.AsFloat      := StrToFloat(msBuscaSaldos.ValoresChave[9]);
      qrySLDQTDOPERACAO.AsFloat   := StrToFloat(msBuscaSaldos.ValoresChave[9]);
   end;
end;

procedure TfrmOperGarantiaBMF.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   LimpaInvestimentos;
   sTipoOper := [Aplicacao];

   dblkTipoOper.Enabled     := True;
   dblkFundoInvest.Enabled  := True;
   dblkInvestimento.Enabled := True;
   dblkCartaFianca.Enabled  := True;
   dblkTipoInvest.Enabled   := True;

   qryDATAOPERACAO.AsDateTime := pRPI.DATAULTFECHBMF;

   OperComum.LimpaParametros(QryTipoOperacao);
   qryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := -61;
   qryTipoOperacao.Open;
   dblkTipoOper.Text := QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;

   qryIDTIPOOPERACAO.AsInteger := -61;

   if dtOperacao.CanFocus then
      dtOperacao.SetFocus;
end;

procedure TfrmOperGarantiaBMF.FormShow(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryTipoOperacao);
   QryTipoOperacao.Open;
   OperComum.LimpaParametros(QryInvestimento);
   QryInvestimento.Open;
   QryTipoInvest.Open;
   LimpaInvestimentos;

   MSBuscaSaldos.Filtro.Add('OPERGARANTIABMF.IDOPERGARANTIABMF IN (SELECT MAX(IDOPERGARANTIABMF) '+
                            'FROM OPERGARANTIABMF WHERE SLDVLROPERACAO > 0 GROUP BY IDGARANTIA)');
end;

procedure TfrmOperGarantiaBMF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryTipoOperacao.Close;
   QryInvestimento.Close;
   QryTipoInvest.Close;
   QryFundoInvest.Close;
   QryOperRenFix.Close;
   QryCartaFianca.Close;
   QryBuscaIdGarantia.Close;
   QrySaldoCartaFianca.Close;
end;

procedure TfrmOperGarantiaBMF.FormCreate(Sender: TObject);
begin
  inherited;
   Sel(-1);
end;

procedure TfrmOperGarantiaBMF.bbtnConfirmarClick(Sender: TObject);
begin

   if not VerificaDados then
      Exit;

   iIdOperGarantia := LeUltRegistro(nil, 'OPERGARANTIABMF');
   qryIDOPERGARANTIABMF.AsInteger := iIdOperGarantia;

   if qryIDTIPOINVEST.AsInteger = -1 then //Carta de Fiança
      qryDESCINVESTIMENTO.AsString := QryCartaFiancaDESCCARTAFIANCA.AsString
   else if qryIDTIPOINVEST.AsInteger = 2 then // Renda Variavel
      qryDESCINVESTIMENTO.AsString := QryInvestimentoDESCINVESTIMENTO.AsString
   else if (qryIDTIPOINVEST.AsInteger = 5) or    // Fundo de Renda Fixa
           (qryIDTIPOINVEST.AsInteger = 6) or    // Fundo de Renda Variavel
           (qryIDTIPOINVEST.AsInteger = 7) then  // Fundo Imobiliario
      qryDESCINVESTIMENTO.AsString := QryFundoInvestDESCFUNDOINVEST.AsString;

   if sTipoOper = [Aplicacao] then
   begin
      qryIDGARANTIA.AsInteger  := BuscaIdGarantia(qryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger);
      if qryIDGARANTIA.AsInteger = 0 then
         qryIDGARANTIA.AsInteger := iIdOperGarantia;

      qrySLDVLROPERACAO.AsFloat      := qrySLDVLROPERACAO.AsFloat - qryVLROPERACAO.AsFloat;

   end
   else if sTipoOper = [Resgate] then
   begin
      qrySLDVLROPERACAO.AsFloat  := StrToFloat(msBuscaSaldos.ValoresChave[8]) + qryVLROPERACAO.AsFloat;

   end;


   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

      qry.Post;
      qry.ApplyUpdates;
      qry.CommitUpdates;

      DtmBaseDados.dbBaseDados.Commit;
      Sel(-1);
      MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema',mtInformation,[mbOk],0);
   except
      on E:Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi Possível Efetuar Esta Operação. ' + #13 +
                 E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
      end;
   end;

   bbtnCancelarClick(self);
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmOperGarantiaBMF.LimpaInvestimentos;
begin
   lblInvestimento.Caption := 'Investimento';
   ClearInvestimento;
   ClearOperRenFix;
   ClearFundoInvest;
   ClearCartaFianca;
   dblkInvestimento.Visible := True;
   dblkInvestimento.Enabled := False;
end;

procedure TfrmOperGarantiaBMF.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      sbtnAlterar.Enabled := False;
      sbtnInserir.Enabled := False;
      OperComum.LimpaParametros(QryTipoOperacao);
      qryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(MontaSelect.ValoresChave[5]);
      qryTipoOperacao.Open;

      TipoInvestChange(StrToInt(MontaSelect.ValoresChave[4]));
   end;
end;

procedure TfrmOperGarantiaBMF.sbtnApagarClick(Sender: TObject);
begin
   if not ExcluiOperGarantiaBMF(MontaSelect.ValoresChave[6],StrToInt(MontaSelect.ValoresChave[7])) then
      Exit;
  inherited;
end;

function TfrmOperGarantiaBMF.ExcluiOperGarantiaBMF(sDataRef:string;iIdGarantia:integer):boolean;
begin
  inherited;
   Result := True;
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE FROM OPERGARANTIABMF ' +
                     'WHERE IDGARANTIA = ' + IntToStr(iIdGarantia) +' AND ' +
                     'DATAOPERACAO > TO_DATE(' + QuotedStr(sDataRef) + ',''DD/MM/YYYY'')');
      qryAux.ExecSql;

      DtmBaseDados.dbBaseDados.Commit;
   except
      on E:Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         Result := False;
         MsgDlg('Não foi Possível excluir Esta Operação. ' + #13 +
                 E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
      end;
   end;
end;

procedure TfrmOperGarantiaBMF.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   sbtnAlterar.Enabled := False;
   Sel(-1);
end;

procedure TfrmOperGarantiaBMF.dblkCartaFiancaExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QrySaldoCartaFianca);
   QrySaldoCartaFianca.ParamByName('IDCARTAFIANCA').AsInteger := QryCartaFianca.FieldByName('IDCARTAFIANCA').AsInteger;
   QrySaldoCartaFianca.Open;
   if sTipoOper = [Aplicacao] then
      qrySLDVLROPERACAO.AsFloat := QrySaldoCartaFianca.FieldByName('SALDOCHAMADA').AsFloat
   else
      qrySLDVLROPERACAO.AsFloat := QrySaldoCartaFianca.FieldByName('SALDODEVOLUCAO').AsFloat
end;

function TfrmOperGarantiaBMF.VerificaDados:boolean;
begin
   Result := False;
   if Trim(dblkTipoOper.Text) = '' then
   begin
     MsgDlg('Falta o Tipo de Operação.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dblkTipoOper.CanFocus then
        dblkTipoOper.SetFocus;
     Exit;
   end
   else if Trim(dblkTipoInvest.Text) = '' then
   begin
     MsgDlg('Falta o Tipo de Investimento.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dblkTipoInvest.CanFocus then
        dblkTipoInvest.SetFocus;
     Exit;
   end
   else if Trim(dtOperacao.Text) = '' then
   begin
     MsgDlg('Falta a data da Operação.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dtOperacao.CanFocus then
        dtOperacao.SetFocus;
     Exit;
   end
   else if dbreValor.Value = 0 then
   begin
      MsgDlg('Falta o valor da Operação.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreValor.CanFocus then
         dbreValor.SetFocus;
      Exit;
   end
   else if (dbreQuantidade.Value = 0) and (QryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger <> -1) then
   begin
     MsgDlg('Falta a Quantidade da Operação.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbreQuantidade.CanFocus then
        dbreQuantidade.SetFocus;
     Exit;
   end
   else
      Result := True;
   if sTipoOper = [Resgate] then
   begin
      Result := False;
      if qryVLROPERACAO.AsFloat > qrySLDVLROPERACAO.AsFloat then // Vlr. Operação maior que o saldo
      begin
         MsgDlg('Valor da Operação maior que o Saldo Disponível.','Mensagem do Sistema',mtWarning,[mbOk],0);
         qryVLROPERACAO.AsFloat := qrySLDVLROPERACAO.AsFloat;
         Exit;
      end
      else if qryQTDOPERACAO.AsFloat > StrToFloat(msBuscaSaldos.ValoresChave[9]) then // Qtd. Operação maior que o saldo
      begin
         MsgDlg('Quantidade da Operação maior que o Saldo Disponível.','Mensagem do Sistema',mtWarning,[mbOk],0);
         qryQTDOPERACAO.AsFloat := StrToFloat(msBuscaSaldos.ValoresChave[9]);
         Exit;
      end
      else
         Result := True;
   end;
end;

function TfrmOperGarantiaBMF.BuscaIdGarantia(iIdTipoInvest:integer):integer;
begin
   Result := 0;
   if iIdTipoInvest = -1 then //Carta de Fiança
   begin
     QryBuscaIdGarantia.Close;
     QryBuscaIdGarantia.SQL.Clear;
     QryBuscaIdGarantia.SQL.Add('SELECT IDGARANTIA FROM OPERGARANTIABMF ' +
                                'WHERE IDCARTAFIANCA = ' + IntToStr(qryCartaFianca.FieldByName('IDCARTAFIANCA').AsInteger) +'');
     QryBuscaIdGarantia.Open;
     if not QryBuscaIdGarantia.IsEmpty then
        Result := QryBuscaIdGarantia.FieldByName('IDGARANTIA').AsInteger;
   end;
end;

end.

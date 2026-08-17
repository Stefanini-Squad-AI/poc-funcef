//******************************************************************************
// Data     : 12/12/2005
// Código   : AL_1
// Motivo   : Nâo deve voltar a data do Parâmetro
//********************************************************************************************************

unit FCadOperEmpAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, TREdit, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  DBCtrls, URegra, FPreview;

type
  TTipoOper = set of (Aplicacao,Resgate);

  TfrmCadOperEmpAcoes = class(TfrmCadastroCSInv)
    Label8: TLabel;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryIDOPEREMPACOES: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryDATAVENCOPER: TDateTimeField;
    qryVLROPERACAO: TFloatField;
    qryQTDOPERACAO: TFloatField;
    qryPUOPERACAO: TFloatField;
    qryTAXAOPERACAO: TFloatField;
    qryVLRIR: TFloatField;
    qryFLGREVERSAO: TStringField;
    qryFLGPRECO: TStringField;
    qryIDOPEREMPACOESAP: TFloatField;
    qrySaldoCustodia: TwwQuery;
    qryAux: TwwQuery;
    QryBuscaCotacao: TwwQuery;
    QryBuscaCotacaoDATACOTAACAO: TDateTimeField;
    QryBuscaCotacaoVLRMEDIA: TFloatField;
    QryBuscaCotacaoQTDELOTE: TFloatField;
    qryVLRRESGATE: TFloatField;
    Label3: TLabel;
    qryVLRJUROS: TFloatField;
    qryVLRRESGATEATU: TFloatField;
    qryVALOREMPRESTIMO: TFloatField;
    PnlGeral: TPanel;
    qryDESCINVESTIMENTO: TStringField;
    qryDESCTIPOOPERACAO: TStringField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryTIPOCONFIRMADO: TStringField;
    PnlInvestimento: TPanel;
    lblInvestimento: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    PnlDetalhe: TPanel;
    lblVencimento: TLabel;
    lblFlgPreco: TLabel;
    lblPreco: TLabel;
    dbrePreco: TDBRealEdit;
    dbcFlgPreco: TwwDBComboBox;
    dtVencimento: TCMDateTimePicker;
    lblQuantidade: TLabel;
    dbreQuantidade: TDBRealEdit;
    dbreValor: TDBRealEdit;
    lblValor: TLabel;
    dbreTaxa: TDBRealEdit;
    lblTaxa: TLabel;
    dbreVlrEmprestimo: TDBRealEdit;
    Label5: TLabel;
    PnlData: TPanel;
    lblDataOper: TLabel;
    dtOperacao: TCMDateTimePicker;
    PnlReversao: TPanel;
    dbcFlgEmpAcoes: TDBCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure HabDesabOperEmprestimo;
    function  VerificaCampos: boolean;
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure Sel(iChave: Integer);
    procedure sbtnApagarClick(Sender: TObject);
    procedure BuscaCotacaoEmpAcoes(dDataRef:TDateTime);
    procedure dbrePrecoExit(Sender: TObject);
    procedure dbreQuantidadeExit(Sender: TObject);
    procedure CalculaValor;
    procedure dbcFlgPrecoExit(Sender: TObject);
    procedure dbreTaxaExit(Sender: TObject);
    procedure dbreValorExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure HabilitaComponentes;
    procedure dsStateChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadOperEmpAcoes: TfrmCadOperEmpAcoes;
  fSldHist,fSldQtdHist,fSdoLiberado,fSdoBloqueado : Double;
  iPlanilha,iDocumento : integer;
  sTipoOper : TTipoOper;
  fSaldo,fSaldoJuros,fVlrIr : Double;
  iOperEmpAcoes,iIdHistEmpAcoes,iForCli : integer;
  sHistorico  : string;

implementation

uses UMensErro,dBaseDados, UDataBase, USistema, UBibliotecaInvest, UOperacaoInvest,
     dOperacaoInvest,UOperComum,UDiasUteisInv, dEmprestAcoes,uEmprestAcoes,uImpostos,FTelaAut,
     FCadTransfCarteira, FDmRelBoletaEmpAcoes;

{$R *.DFM}

procedure TfrmCadOperEmpAcoes.HabDesabOperEmprestimo;
begin
   dbcFlgEmpAcoes.Enabled := True;
   dbreTaxa.Enabled       := True;
end;

procedure TfrmCadOperEmpAcoes.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;
   if not VerificaCampos then
      Exit;

   If EmprestAcoes.VerExisteOperEmprestimo(qryDATAOPERACAO.AsDateTime,0) Then
   begin
      MsgDlg('Existe operações já lançadas. Essa operação será cancelada.','Mensagem do Sistema',mtInformation,[mbOk],0);
      bbtnCancelarClick(Sender);      
      Exit;
   end;

   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

      qryIDOPEREMPACOES.AsInteger   := LeUltRegistro(nil, 'OPEREMPACOES');
      qryIDOPEREMPACOESAP.AsInteger := qryIDOPEREMPACOES.AsInteger;
      qry.Post;
      qry.ApplyUpdates;
      qry.CommitUpdates;

      DtmBaseDados.dbBaseDados.Commit;

      Sel(-1);
   except
      on E:Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível efetuar esta operação.' + #13 +
                 E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
      end;
   end;
   sTipoOper := [Aplicacao];
   sbtnInserirClick(self);
end;

function TfrmCadOperEmpAcoes.VerificaCampos: boolean;
begin
   Result := False;

   if Trim(dblInvestimento.Text) = '' then
   begin
      MsgDlg('Investimento não selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblInvestimento.CanFocus then
         dblInvestimento.SetFocus;
      Exit;
   end;

   if Trim(dbcFlgPreco.Text) = '' then
   begin
      MsgDlg('Tipo de data do preço não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbcFlgPreco.CanFocus then
         dbcFlgPreco.SetFocus;
      Exit;
   end;

   if dbrePreco.Value = 0 then
   begin
      MsgDlg('Cotação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbrePreco.CanFocus then
         dbrePreco.SetFocus;
      Exit;
   end;

   if Trim(dtOperacao.Text) = '' then
   begin
      MsgDlg('Data da Operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtOperacao.CanFocus then
         dtOperacao.SetFocus;
      Exit;
   end;

   if Trim(dtVencimento.Text) = '' then
   begin
      MsgDlg('Data de vencimento não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtVencimento.CanFocus then
         dtVencimento.SetFocus;
      Exit;
   end;

   if dbreQuantidade.Value = 0 then
   begin
      MsgDlg('Quantidade da operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreQuantidade.CanFocus then
         dbreQuantidade.SetFocus;
      Exit;
   end;

   if dbreValor.Value = 0 then
   begin
      MsgDlg('Valor da operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreValor.CanFocus then
         dbreValor.SetFocus;
      Exit;
   end;

   if dbreTaxa.Value = 0 then
   begin
      MsgDlg('Taxa da operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreTaxa.CanFocus then
         dbreTaxa.SetFocus;
      Exit;
   end;

   if (sTipoOper = [Aplicacao]) and (dtVencimento.Date <= dtOperacao.Date) then
   begin
      MsgDlg('Data de vencimento não pode menor ou igual à data de operação.','Mensagem do Sistema',mtWarning,[MbOk],0);
      Exit;
   end;

   Result := True;
end;

procedure TfrmCadOperEmpAcoes.FormShow(Sender: TObject);
begin
   inherited;

   // Monta Registro do Parâmetro
   Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');   

   Sel(-1);
   if pRPI.FLGEMPACOES = 'N' then
   begin
      MsgDlg('As operações de empréstimo de ações, não estão autorizadas.','Mensagem do Sistema',mtWarning,[MbOk],0);
      Exit;
   end;
end;

procedure TfrmCadOperEmpAcoes.sbtnInserirClick(Sender: TObject);
var
   iTipoOper : integer;
   fVlrOper  : Currency;
   fPuOper   : Double;
   dDataOper : TDateTime;
begin
   fVlrOper  := qryVLROPERACAO.AsFloat;
   fPuOper   := qryPUOPERACAO.AsFloat;

   inherited;
   fSaldo := 0;

   sbtnInserir.Enabled     := False;
   dblInvestimento.Enabled := True;

   sTipoOper   := [Aplicacao];
   iTipoOper   := -52;
   dDataOper   := pRPI.DATAULTFECHEMP + 1;
   while not DiasUteisInv.DiaUtil(dDataOper,-1,1,'',True,False,False) Do
     dDataOper := dDataOper + 1;   // Achar o proximo dia útil

   qryDATAOPERACAO.AsDateTime    := dDataOper;

   qryTIPOCONFIRMADO.AsString    := 'N';
   qryIDCARTEIRAINVEST.AsInteger := pRPI.IDCARTEMPACOES;
   qryIDTIPOINVEST.AsInteger     := 2;
   qryIDTIPOOPERACAO.AsInteger   := iTipoOper;

   bbtnConfirmar.Enabled         := True;
   bbtnCancelar.Enabled          := True;
   dbcFlgEmpAcoes.Checked        := False;

   HabDesabOperEmprestimo;

   qryInvestimento.Close;
   qryInvestimento.Open;

   sbtnApagar.Enabled            := False;

   dblInvestimento.SetFocus;
end;

procedure TfrmCadOperEmpAcoes.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      qryInvestimento.Close;
      qryInvestimento.Open;
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
      pnlFundo.Enabled          := True;

      dtOperacao.Enabled        := True;
      dtOperacao.Text           := MontaSelect.ValoresChave[2];
      dtOperacao.Enabled        := False;
      dblInvestimento.Enabled   := True;


      sbtnInserir.Enabled       := True;
      sbtnApagar.Enabled        := True;
      sbtnAlterar.Enabled       := True;

      bbtnConfirmar.Enabled     := True;
      bbtnCancelar.Enabled      := True;

      sTipoOper                 := [Aplicacao];

      If (qry.FieldbyName('TIPOCONFIRMADO').AsString = 'E') Or
         (qry.FieldbyName('TIPOCONFIRMADO').AsString = 'R') Or
         (qry.FieldbyName('TIPOCONFIRMADO').AsString = 'S') Then
      begin
         sbtnAlterar.Enabled    := False;
         pnlFundo.Enabled       := False;
      end;
   end
   else
   begin
      qry.Close;
      qry.Open;
   end;   
end;

procedure TfrmCadOperEmpAcoes.Sel(iChave: Integer);
begin
   qry.Close;
   qry.ParamByName('IDOPEREMPACOES').AsInteger := iChave;
   qry.Open;
end;

procedure TfrmCadOperEmpAcoes.sbtnApagarClick(Sender: TObject);
var
   dDataAnt : TDateTime;
begin
   if (not qry.IsEmpty) then
   begin
      if (qry.RecordCount >= 1) then
      begin
         If qry.FieldbyName('TIPOCONFIRMADO').AsString = 'E' Then
         begin
            MsgDlg('Operação de Empréstimo já confirmada. Não pode excluir.','Mensagem do Sistema',mtConfirmation,[mbOk],0);
            Exit;
         end;

         If (qry.FieldbyName('TIPOCONFIRMADO').AsString = 'R') Or
            (qry.FieldbyName('TIPOCONFIRMADO').AsString = 'S') Then
         begin
            MsgDlg('Operação já foi Revertida. Não pode excluir.','Mensagem do Sistema',mtConfirmation,[mbOk],0);
            Exit;
         end;

         Try
            if not dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.StartTransaction;

            if not EmprestAcoes.ExcluiOperEmpAcoes(qryIDOPEREMPACOES.AsInteger,
                                                   qryIDOPEREMPACOESAP.AsInteger,
                                                   qryDATAOPERACAO.AsDateTime, 'APL') then
               Abort;

            dDataAnt   := qryDATAOPERACAO.AsDateTime-1;
            while not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
              dDataAnt := dDataAnt - 1;   // Achar o dia útil anterior

            DtmBaseDados.dbBaseDados.Commit;
            MsgDlg('Operação Concluída com Sucesso.','Mensagem do Sistema',mtInformation,[mbOk],0);
            Sel(-1);
         except
            on E:Exception do
            begin
               DtmBaseDados.dbBaseDados.Rollback;
               MsgDlg('Não foi Possível Excluir a Operação.' + #13 +
                       E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
            end;
         end;
      end
      else
         MsgDlg('É Necessário Selecionar pelo Menos Uma Operação.',
                'Mensagem do Sistema', mtWarning, [mbOk], 0);
   end;
   CmeCadastro.AtualizaBotoes(Self);
   sbtnApagar.Down := False;
end;

procedure TfrmCadOperEmpAcoes.BuscaCotacaoEmpAcoes(dDataRef:TDateTime);
begin
  inherited;
   if (qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger <> 0) then
   begin
      with QryBuscaCotacao do
      begin
         Close;
         ParamByName('iIdAcao').AsInteger := qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
         ParamByName('dDataRef').AsString := DateToStr(dDataRef);
         Open;
         if not IsEmpty then
            qry.FieldByName('PUOPERACAO').AsFloat := OperComum.DivValorZero(FieldByName('VLRMEDIA').AsFloat,FieldByName('QTDELOTE').AsFloat)
         else
         begin
            qry.FieldByName('PUOPERACAO').AsFloat := 0;
            MsgDlg('Cotação não encontrada para esta data : '+DateToStr(dDataRef)+'.','Mensagem do Sistema',mtWarning,[MbOk],0)
         end;
      end;
   end;
end;

procedure TfrmCadOperEmpAcoes.CalculaValor;
var
   fAliquota : Double;
begin
   if ds.State in ([dsInsert]) then
   begin
      if (qry.FieldByName('PUOPERACAO').AsFloat <> 0) and
         (qry.FieldByName('QTDOPERACAO').AsFloat <> 0) then
          qryVLROPERACAO.AsFloat := qry.FieldByName('PUOPERACAO').AsFloat *
                                    qry.FieldByName('QTDOPERACAO').AsFloat;
   end;
end;

procedure TfrmCadOperEmpAcoes.dbrePrecoExit(Sender: TObject);
begin
  inherited;
   CalculaValor;
   if Trim(qryFLGPRECO.AsString) = '' then
   begin
      MsgDlg('Dia do Preço não definido.','Mensagem do Sistema',mtWarning,[MbOk],0);
      dbcFlgPreco.SetFocus;
   end;
end;

procedure TfrmCadOperEmpAcoes.dbreQuantidadeExit(Sender: TObject);
begin
   inherited;

   CalculaValor;

end;

procedure TfrmCadOperEmpAcoes.dbcFlgPrecoExit(Sender: TObject);
var
   dDataRef:TDateTime;
begin
  inherited;
   if ds.State in ([dsInsert, dsEdit]) then
   begin
      qryFLGPRECO.AsString := dbcFlgPreco.Value;
      if Trim(qryFLGPRECO.AsString) <> '' then
      begin
         if ((qryFLGPRECO.AsString = 'O') or (qryFLGPRECO.AsString = 'H')) then
         begin
            if (Trim(dtOperacao.Text) = '') then
               MsgDlg('Data da operação não definida.','Mensagem do Sistema',mtWarning,[MbOk],0)
            else
            begin
               dDataRef := dtOperacao.Date;
               if qryFLGPRECO.AsString = 'O' then
               begin
                  dDataRef := dDataRef - 1;
                  while not DiasUteisInv.DiaUtil(dDataRef,-1,1,'',True,False,False) Do
                     dDataRef  := dDataRef - 1;   // Achar o dia útil anterior
               end;
               BuscaCotacaoEmpAcoes(dDataRef);
            end;
         end
         else if (qryFLGPRECO.AsString = 'V') then
         begin
            if (Trim(dtVencimento.Text)= '') then
               MsgDlg('Data de Vencimento não definida.','Mensagem do Sistema',mtWarning,[MbOk],0)
            else
               BuscaCotacaoEmpAcoes(dtVencimento.Date);
         end;
      end;
   end;
end;

procedure TfrmCadOperEmpAcoes.dbreTaxaExit(Sender: TObject);
var
   a:string;
   Regra : TRegra;
begin

   Regra                 := TRegra.Create(Application);
   Regra.DatabaseName    := 'BaseDados';
   Regra.TipoCliente     := tcFundacao;

  inherited;
   if Trim(dtOperacao.Text) = '' then
   begin
      MsgDlg('A Data da Operação não foi informada'+#13+
             'para o cálculo do Valor de Resgate.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtOperacao.CanFocus then
         dtOperacao.SetFocus;
      Regra.Free;
      Exit;
   end
   else if Trim(dtVencimento.Text) = '' then
   begin
      MsgDlg('A Data de Vencimento não foi informada'+#13+
             'para o cálculo do Valor de Resgate.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtVencimento.CanFocus then
         dtVencimento.SetFocus;
      Regra.Free;
      Exit;
   end
   else if dbreValor.Value = 0 then
   begin
      MsgDlg('O Valor da operação não foi informado'+#13+
             'para o cálculo do Valor de Resgate.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreValor.CanFocus then
         dbreValor.SetFocus;
      Regra.Free;
      Exit;
   end;
   // Montar SQL
   DMEmprestAcoes.qryAux.SQL.Clear;
   DMEmprestAcoes.qryAux.SQL.Add('SELECT ');
   DMEmprestAcoes.qryAux.SQL.Add(QuotedStr(FormatDateTime('dd/mm/yyyy',dtOperacao.Date))   + ' AS DATAEMISSAO,');
   DMEmprestAcoes.qryAux.SQL.Add(QuotedStr(FormatDateTime('dd/mm/yyyy',dtVencimento.Date)) + ' AS DATAATUAL,');
   DMEmprestAcoes.qryAux.SQL.Add(QuotedStr('A')       + ' AS NATUREZAOPER,');
   DMEmprestAcoes.qryAux.SQL.Add(TrocaVirgulaPonto(FormatFloat('0.##',dbreValor.Value))    + ' AS VLRPRINCIPAL,');
   DMEmprestAcoes.qryAux.SQL.Add(TrocaVirgulaPonto(FormatFloat('0.##',dbreTaxa.Value))     + ' AS TAXA,');
   DMEmprestAcoes.qryAux.SQL.Add('1 AS IDPAIS,');
   DMEmprestAcoes.qryAux.SQL.Add('-1 AS IDCIDADES,');
   DMEmprestAcoes.qryAux.SQL.Add('-1 AS CODESTADO');
   DMEmprestAcoes.qryAux.SQL.Add('FROM DUAL');
   DMEmprestAcoes.qryAux.Open;
   if pRPI.IDREGRAEMPACOES = 0 then
   begin
      qryVLRRESGATE.AsFloat := 0;
      MsgDlg('Regra de Empréstimo de Ações não definida no Parâmetro do Sistema.','Mensagem do Sistema', MtWarning,[MbOk],0);
      Regra.Free;
      Exit;
   end;

   Regra.RuleName := IntToStr(pRPI.IDREGRAEMPACOES);
   Regra.QueryIn  := DMEmprestAcoes.qryAux;
   try
      Regra.Execute;
   except
      on E:Exception do
      begin
         MsgDlg('Erro ao calcular o Valor de Resgate.'+#13+E.Message,
               'Mensagem do Sistema', MtError,[MbOk],0);
         Regra.Free;
         Exit;
      end;
   end;

   qryVLRRESGATE.AsFloat      := StrToFloat(TrocaPontoVirgula(Regra.Result));   
   qryVALOREMPRESTIMO.AsFloat := StrToFloat(TrocaPontoVirgula(Regra.Result))- qryVLROPERACAO.AsFloat;

   Regra.Free;   
end;

procedure TfrmCadOperEmpAcoes.dbreValorExit(Sender: TObject);
begin
  inherited;
   if (qryQTDOPERACAO.AsFloat = 0) or (qryPUOPERACAO.AsFloat = 0) then
       qryVLROPERACAO.AsFloat := 0;
end;

procedure TfrmCadOperEmpAcoes.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   Sel(-1);
   sTipoOper := [Aplicacao]; // Para não carregar como resgate

   dtOperacao.Enabled        := True;
   dbrePreco.Enabled         := True;
   dbreValor.Enabled         := True;
   dblInvestimento.Enabled   := True;

   dtVencimento.Enabled      := True;
   dbcFlgPreco.Enabled       := True;
   dbreTaxa.Enabled          := True;
   dbcFlgEmpAcoes.Enabled    := True;

   sbtnAlterar.Enabled       := False;   
end;

procedure TfrmCadOperEmpAcoes.bbtnSairClick(Sender: TObject);
begin
   bbtnCancelarClick(Sender);
  inherited;
end;

procedure TfrmCadOperEmpAcoes.HabilitaComponentes;
begin
   if sTipoOper = [Resgate] then
   begin
      DMRelBoletaEmpAcoes.dbeDataVencto.Visible    := True;
      DMRelBoletaEmpAcoes.lblDataVencto.Visible    := True;
      DMRelBoletaEmpAcoes.lblVlrIR.Visible         := True;
      DMRelBoletaEmpAcoes.dbeVlrIr.Visible         := True;
      DMRelBoletaEmpAcoes.lblVlrResgDia.Visible    := True;
      DMRelBoletaEmpAcoes.dbeVlrResgDia.Visible    := True;
      DMRelBoletaEmpAcoes.dbeVlrJuros.Visible      := True;
      DMRelBoletaEmpAcoes.lblFlgReversao.Visible   := False;
   end
   else
   begin
      DMRelBoletaEmpAcoes.dbeDataVencto.Visible    := False;
      DMRelBoletaEmpAcoes.lblDataVencto.Visible    := False;
      DMRelBoletaEmpAcoes.lblVlrIR.Visible         := False;
      DMRelBoletaEmpAcoes.dbeVlrIr.Visible         := False;
      DMRelBoletaEmpAcoes.lblVlrResgDia.Visible    := False;
      DMRelBoletaEmpAcoes.dbeVlrResgDia.Visible    := False;
      DMRelBoletaEmpAcoes.lblVlrJuros.Visible      := False;
      DMRelBoletaEmpAcoes.dbeVlrJuros.Visible      := False;
      DMRelBoletaEmpAcoes.lblFlgReversao.Visible   := True;
   end;
   if qryFLGPRECO.AsString = 'O' then
      DMRelBoletaEmpAcoes.lblDiaPreco.Caption := 'Ontém'
   else
      DMRelBoletaEmpAcoes.lblDiaPreco.Caption := 'Hoje';

   if qryFLGREVERSAO.AsString = 'S' then
      DMRelBoletaEmpAcoes.lblFlgReversao.Caption   := 'Permite reversão no vencimento.'
   else
      DMRelBoletaEmpAcoes.lblFlgReversao.Caption   := 'Permite reversão no vencimento.';

end;

procedure TfrmCadOperEmpAcoes.dsStateChange(Sender: TObject);
begin
  inherited;
  if (ds.State = dsBrowse) and (not qry.IsEmpty) then
     sbtnApagar.Enabled   := True
  else
     sbtnApagar.Enabled := False;

end;

procedure TfrmCadOperEmpAcoes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   qryInvestimento.Close;
end;

procedure TfrmCadOperEmpAcoes.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   Qry.Edit;
end;

end.

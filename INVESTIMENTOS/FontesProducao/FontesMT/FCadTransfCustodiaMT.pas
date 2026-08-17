//******************************************************************************
// Data      : 21/09/2007
// Código    : AL_3
// Pendencia : 26357
// SOL       : 69119
// Desc      : Ajuste para: Segregação Plano / Patro
//******************************************************************************
// Data      : 28/11/2006
// Código    : AL_2
// Pendencia : 23891
// SOL       : 42459
// Desc      : Adaptação na GravaOperCustodia com o sTipoBoleta
//******************************************************************************
// Data      : 29/11/2006
// Código    : AL_1
// Pendencia : 22984 e 22986
// SOL       :
// Desc      : Segregação de Planos
//             Não usa mais CC e CCI na Custódia
// Obs       : Para habilitar esta tela é preciso alterar itens de menu:
//             Menu de Transferência de Motivo de bloqueio - Excluir
//             Menu de Transferência de Custodiante - Alterar para Transferência de Custódia
//   Script Necessário
{
      INSERT INTO TIPOOPERACAO
      (IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO, DESCTIPOOPERACAO                                             , NATUREZAOPERACAO, TIPOCUSTODIA, FLGGERACONTAB, FLGGERACAPCAR, RECPAG, FLGGERACAF, FLGTRANSF, FLGCORRET, FLGORDMOVINV, FLGOPDIREITO, FLGTRATAIR, SIGLATIPOOPER, TIPOMOVTO, STAATIVO, FLGRENTABILIDADE, FLGCONTAINVEST)
      VALUES
      (2           , -150          , NULL     , 'TRANSFERENCIA DE CUSTODIA                                  ', 'N'             , 'N'         , 0            , 0            , 'N'   , 0         , 'N'      , 'N'      , 'N'         , 'N'         ,'N'       , 'TRCU'        , 'TRC'    , 'S'     , 'N'             , 0             )
}
//******************************************************************************
unit FCadTransfCustodiaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams, wwdblook, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, DBCtrls, uCtrlCustodia, uCtrlInvestimento,
  uCtrlPadroes, wwdbedit, Wwdotdot, Wwdbcomb, Wwkeycb, uCMTypes, uCtrlRendaVariavel,
  faMensagem;

//uses uCmControlObject, uCmDbObject,

type
  TfrmCadTransfCustodiaMT = class(TFrmCadastroGridMTInv)
    CMSqlParamsCds: TCMSqlParams;
    pnlOrigem: TPanel;
    pnlDestino: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    dbdDataOperacao: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dbgSaldosOrigem: TwwDBGrid;
    Label3: TLabel;
    dbeQuantidade: TDBRealEdit;
    pnlSepQtd: TPanel;
    cdsSaldosOrigem: TCMClientDataSet;
    dsSaldosOrigem: TwwDataSource;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    dbeBoleta: TDBEdit;
    cdsInvestimentos: TCMClientDataSet;
    dblInvestimento: TwwDBLookupCombo;
    cdsCustodiante: TCMClientDataSet;
    dblCustodiante: TwwDBLookupCombo;
    cdsMotivoBloq: TCMClientDataSet;
    dblMotBlq: TwwDBLookupCombo;
    cdsCustodianteIDCUSTODIANTE: TFloatField;
    cdsCustodianteSGLCUSTODIANTE: TStringField;
    cdsCustodianteFLGCODATIVOCUST: TStringField;
    sqpSaldosOrigem: TCMSqlParams;
    CMSqlParamsMotBloq: TCMSqlParams;
    btnGeraBoleta: TSpeedButton;
    cdsBoleta: TCMClientDataSet;
    Label9: TLabel;
    cdsTipoOperacao: TCMClientDataSet;
    dblTipoOperacao: TwwDBLookupCombo;
    cdsSaldosOrigemDESCCARTINVEST: TStringField;
    cdsSaldosOrigemSGLCUSTODIANTE: TStringField;
    cdsSaldosOrigemDESCMOTBLOQ: TStringField;
    cdsSaldosOrigemSALDOTOTAL: TFloatField;
    cdsSaldosOrigemSALDOCC: TFloatField;
    cdsSaldosOrigemSALDOCCI: TFloatField;
    cdsSaldosOrigemIDCUSTODIA: TFloatField;
    cdsSaldosOrigemIDINVESTIMENTO: TFloatField;
    cdsSaldosOrigemIDCARTEIRAINVEST: TFloatField;
    cdsSaldosOrigemIDCUSTODIANTE: TFloatField;
    cdsSaldosOrigemIDMOTIVOBLOQUEIO: TFloatField;
    cdsSaldosOrigemIDPLANPREVCTBPATR: TFloatField;
    cdsSaldosOrigemFLGCONTAINVEST: TFloatField;
    cdsSaldosOrigemORDEM: TFloatField;
    cdsSaldosOrigemPLANPRVCONTABPATRO: TStringField;
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean;
                                  AFont: TFont; ABrush: TBrush);
    procedure dbgSaldosOrigemCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean;
                                            AFont: TFont; ABrush: TBrush);
    procedure cdsSaldosOrigemAfterScroll(DataSet: TDataSet);
    procedure dbdDataOperacaoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure dblInvestimentoExit(Sender: TObject);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dbcTipoContaOrigemCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure btnGeraBoletaClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
  protected
    procedure FazerRefresh; override;
  private
    { Private declarations }
    CtrlCustodia: TCtrlCustodia;
    CtrlInvestimento: TCtrlInvestimento;
    CtrlRendaVariavel: TCtrlRendaVariavel;
    function VerificaDados: Boolean;
    procedure Seleciona(sBoleta: String = ''; dDataOperacao: TDateTime = 0;
                        iInvestimento: Integer = -1; iCustodiante: Integer = -1;
                        iMotBloqueio: Integer = 0);
    procedure SelSldOrig;
    procedure CalculaQtd;
  public
    { Public declarations }
  end;

var
  frmCadTransfCustodiaMT: TfrmCadTransfCustodiaMT;
  iOperAtual: Integer;

implementation

{$R *.DFM}

uses uDataBase, uMensErro, DBaseDados, uEmprestAcoes, UBibliotecaInvest;

procedure TfrmCadTransfCustodiaMT.dbGrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;
          Highlight: Boolean; AFont: TFont; ABrush: TBrush);
const clYellowBaby = $00C0FFFF; //Amarelo Bebê
begin
  if not (gdFixed in State) then
  begin
     if TwwDBGrid(Sender).CalcCellRow = TwwDBGrid(Sender).GetActiveRow then
     begin
        if not ((gdSelected in State) or (gdFocused in State)) then
        begin
           if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
              AFont.Color := clYellowBaby
           else
              AFont.Color := clHighLightText;
        end
        else
           AFont.Color := clSilver;
        ABrush.Color := clHighLight;
     end
     else
     if not ((gdSelected in State) or (gdFocused in State)) then
     begin
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
           ABrush.Color := clYellowBaby
        else
           ABrush.Color := clWhite;
     end
     else
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;

end;

procedure TfrmCadTransfCustodiaMT.dbgSaldosOrigemCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;
                                                                Highlight: Boolean; AFont: TFont; ABrush: TBrush);
const clSelec = clMaroon;
      clYellowBaby = $00C0FFFF; //Amarelo Bebê
begin
  inherited;
  if not (gdFixed in State) then
  begin
     if TwwDBGrid(Sender).CalcCellRow = TwwDBGrid(Sender).GetActiveRow then
     begin
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
           AFont.Color := clYellowBaby
        else
           AFont.Color := clWhite;
        ABrush.Color := clSelec;
     end
     else
     if not ((gdSelected in State) or (gdFocused in State)) then
     begin
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
           ABrush.Color := clYellowBaby
        else
           ABrush.Color := clWhite;
     end
     else
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;

end;

procedure TfrmCadTransfCustodiaMT.cdsSaldosOrigemAfterScroll(DataSet: TDataSet);
begin
   inherited;
   //AL_1
   CalculaQtd;
end;

procedure TfrmCadTransfCustodiaMT.dbdDataOperacaoExit(Sender: TObject);
begin
  inherited;
  SelSldOrig;
end;


procedure TfrmCadTransfCustodiaMT.FormCreate(Sender: TObject);
begin
   // Cria e Inicializa a Control Investimentos
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);
   // Cria e Inicializa a Control Custódia
   CtrlCustodia := TCtrlCustodia.Create;
   CtrlCustodia.InitializeAs(Padroes);
   // Seta os Cds's das Control, para fazer o ApplyCds
   CtrlCustodia.CdsOperCustodia := cds;
   // Busca as Operações de Custódia para a Tela
   Seleciona;
   // Preenche os Cds's dos ComboBox
   cdsInvestimentos.Data := CtrlInvestimento.ListInvestimento(-1, 2);
   cdsCustodiante.Data := CtrlInvestimento.ListCustodiante;
   cdsMotivoBloq.Data := CtrlInvestimento.ListMotivoBloqueio;
   cdsTipoOperacao.Data := CtrlInvestimento.ListTipoOperacao(2, -150);
   inherited;
end;


procedure TfrmCadTransfCustodiaMT.Seleciona(sBoleta: String = ''; dDataOperacao: TDateTime = 0;
                                            iInvestimento: Integer = -1; iCustodiante: Integer = -1;
                                            iMotBloqueio: Integer = 0);
var i: Byte;
begin
  cds.Data := CtrlCustodia.ListaOperCustodia(sBoleta, dDataOperacao, iInvestimento, iCustodiante, iMotBloqueio);
end;

procedure TfrmCadTransfCustodiaMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlCustodia);
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaVariavel);
   inherited;
end;

procedure TfrmCadTransfCustodiaMT.SelSldOrig;
begin
   if (Trim(dbdDataOperacao.Text) <> '') and (Trim(dblInvestimento.Text) <> '') then
   begin
      //AL_1 - Ini
      // Busca os saldos de custódia do investimento selecionado na data selecionada
      cdsSaldosOrigem.Data := CtrlCustodia.ListaSldOrigCustodia(dbdDataOperacao.Date, cdsInvestimentos.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                Cds.FieldByName('IDCUSTODIAORIG').AsInteger, Cds.FieldByName('IDLOTE').AsString);
      // Localiza o saldo da OperCustodia posicionada
      cdsSaldosOrigem.Locate('IDPLANPREVCTBPATR;IDCARTEIRAINVEST;IDCUSTODIANTE;IDMOTIVOBLOQUEIO',
                             VarArrayOf([Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         Cds.FieldByName('IDCARTEIRAORIG').AsInteger,
                                         Cds.FieldByName('IDCUSTODIANTEORIG').AsInteger,
                                         Cds.FieldByName('IDMOTIVOBLOQORIG').AsInteger]), []);
      //AL_1 - Fim
   end
   else
      cdsSaldosOrigem.Data := CtrlCustodia.ListaSldOrigCustodia(0, -1);
end;

procedure TfrmCadTransfCustodiaMT.sbtnAlterarClick(Sender: TObject);
begin
   iOperAtual := Cds.FieldByName('IDOPERCUSTODIA').AsInteger;
   inherited;
   SelSldOrig;
   if dbdDataOperacao.CanFocus then
      dbdDataOperacao.SetFocus;
end;

procedure TfrmCadTransfCustodiaMT.dbGrdDblClick(Sender: TObject);
begin
   iOperAtual := Cds.FieldByName('IDOPERCUSTODIA').AsInteger;
   inherited;
   SelSldOrig;
   if dbdDataOperacao.CanFocus then
      dbdDataOperacao.SetFocus;
end;

procedure TfrmCadTransfCustodiaMT.sbtnInserirClick(Sender: TObject);
begin
   iOperAtual := 0;
   inherited;
   SelSldOrig;
   dblTipoOperacao.Text := cdsTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
   dblTipoOperacao.PerformSearch;
   if dbdDataOperacao.CanFocus then
      dbdDataOperacao.SetFocus;
end;

procedure TfrmCadTransfCustodiaMT.sbtnApagarClick(Sender: TObject);
begin
   iOperAtual := Cds.FieldByName('IDOPERCUSTODIA').AsInteger;
   inherited;
end;

procedure TfrmCadTransfCustodiaMT.dblInvestimentoExit(Sender: TObject);
begin
  inherited;
  SelSldOrig;
end;

procedure TfrmCadTransfCustodiaMT.dblInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  SelSldOrig;
end;

procedure TfrmCadTransfCustodiaMT.dbcTipoContaOrigemCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   inherited;
   if Select then
      CalculaQtd;
end;

procedure TfrmCadTransfCustodiaMT.CalculaQtd;
begin
   //AL_1
   if Cds.State = dsInsert then
   begin
      if dbeQuantidade.Value = 0 then
         dbeQuantidade.Value := cdsSaldosOrigem.FieldByName('SALDOTOTAL').AsFloat
      else
         dbeQuantidade.Value := cdsSaldosOrigem.FieldByName('SALDOTOTAL').AsFloat;
      dbeQuantidade.Update;
   end;
end;

procedure TfrmCadTransfCustodiaMT.btnGeraBoletaClick(Sender: TObject);
begin
  inherited;
  // Cria a Boleta da Operação de Transferencia de Custodia - TCU
  if (Trim(dbeBoleta.Text) = '') and (Trim(dbdDataOperacao.Text) <> '') then
      Cds.FieldByName('IDBOLETA').AsString := 'RV-'+Copy(dbdDataOperacao.Text,9,2)+'/'+FormatFloat('0000',
                             LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(dbdDataOperacao.Text,9,2)));
end;

procedure TfrmCadTransfCustodiaMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  try
    Cds.FieldByName('IDCARTEIRAORIG').AsInteger    := cdsSaldosOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
    Cds.FieldByName('IDCARTEIRADEST').AsInteger    := cdsSaldosOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
    Cds.FieldByName('IDCUSTODIANTEORIG').AsInteger := cdsSaldosOrigem.FieldByName('IDCUSTODIANTE').AsInteger;
    Cds.FieldByName('IDMOTIVOBLOQORIG').AsInteger  := cdsSaldosOrigem.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
    Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger := cdsSaldosOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
    Cds.FieldByName('IDPLANPREVCTBDEST').AsInteger := cdsSaldosOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
    Cds.FieldByName('IDTIPOINVEST').AsInteger      := cdsTipoOperacao.FieldByName('IDTIPOINVEST').AsInteger;
    //AL_1 - Usa sempre CCI (Acabou a distinção na custódia).
    Cds.FieldByName('FLGTIPOCONTAORIG').AsInteger  := 1;
    Cds.FieldByName('FLGTIPOCONTADEST').AsInteger  := 1;
  except
     Accept := False
  end;

  if Cds.State in dsEditModes then
    Accept := VerificaDados;
end;

procedure TfrmCadTransfCustodiaMT.bbtnConfirmarClick(Sender: TObject);
begin
   // Faz somente uma operação
   CmeCadastro.RepetirInsert := False;
   // Grava a OperCustodia
   inherited;
end;

procedure TfrmCadTransfCustodiaMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDOPERCUSTODIA', MontaSelect.ValoresChave[0], []);
end;

procedure TfrmCadTransfCustodiaMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   if CmeCadastro.Operacao in [OpInserir,OpAlterar] then
   begin
      if (Trim(dbeBoleta.Text) = '') and (Trim(dbdDataOperacao.Text) <> '') then
         dbeBoleta.Text := 'RV-'+Copy(dbdDataOperacao.Text,9,2)+'/'+FormatFloat('0000',
                                 LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(dbdDataOperacao.Text,9,2)));
   end;

   if Cds.State = dsInsert then
      Cds.FieldByName('IDOPERCUSTODIA').AsInteger := LeUltRegistro(Nil,'OPERCUSTODIA');

   //AL_2
   Accept := CtrlCustodia.GravaOperCustodia('TCU', Cds.FieldByName('IDOPERCUSTODIA').AsInteger);
   if not Accept then
      MsgDlg('Não foi possível gravar esta operação.' + #13 +
             'Motivo: ' + CtrlCustodia.MessageInfo,'Aviso do Sistema', mtWarning, [mbOk],0);
   inherited;
end;

procedure TfrmCadTransfCustodiaMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   Accept := CtrlCustodia.ExcluiOperCustodia(iOperAtual);
   if not Accept then
      MsgDlg('Não foi possível excluir esta operação.' + #13 +
             CtrlCustodia.MessageInfo,'Aviso do Sistema', mtWarning, [mbOk],0);
   inherited;
   iOperAtual := Cds.FieldByName('IDOPERCUSTODIA').AsInteger;
end;

function TfrmCadTransfCustodiaMT.VerificaDados: Boolean;
begin
  Result := False;
  try
     // Verifica campos de origem
     if Trim(dbdDataOperacao.Text) = '' then
        Raise EValidacao.Create('Data da operação não informada.', dbdDataOperacao)
     else
     if Trim(dblInvestimento.Text) = '' then
        Raise EValidacao.Create('Investimento não selecionado.', dblInvestimento)
     else
     if Trim(dblTipoOperacao.Text) = '' then
        Raise EValidacao.Create('Tipo de Operação não selecionado.', dblTipoOperacao);

     // Verifica quantidade transferida
     if dbeQuantidade.Value = 0 then
        Raise EValidacao.Create('Quantidade a ser Transferida não informada.', dbeQuantidade)
     else
     if dbeQuantidade.Value > cdsSaldosOrigem.FieldByName('SALDOTOTAL').AsFloat then
        Raise EValidacao.Create('Não é possível transferir uma quantidade maior que o saldo origem', dbeQuantidade);

     // Verifica campos de destino
     if Trim(dblCustodiante.Text) = '' then
        Raise EValidacao.Create('Custodiante Destino não selecionado.', dblCustodiante)
     else
     if Trim(dblMotBlq.Text) = '' then
        Raise EValidacao.Create('Motivo de Bloqueio Destino não selecionado.', dblMotBlq);

     // Verifica se Pode transferir quando for Carteira de Empréstimo de Ações
     //AL_3
     if not EmprestAcoes.VerificaTransfEmptmoAcoes(cdsSaldosOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                   cdsSaldosOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                   cdsSaldosOrigem.FieldByName('IDCUSTODIANTE').AsInteger,
                                                   cdsSaldosOrigem.FieldByName('IDINVESTIMENTO').AsInteger,
                                                   dbeQuantidade.Value, dbdDataOperacao.Text, False) then
        Raise EValidacao.Create('Existe saldo em garantia para Empréstimo de Ações', dbeQuantidade);

    // Verifica se Origem e Destino são identicos
    if (Cds.FieldByName('IDCUSTODIANTEORIG').AsInteger = Cds.FieldByName('IDCUSTODIANTEDEST').AsInteger) and
       (Cds.FieldByName('IDMOTIVOBLOQORIG').AsInteger  = Cds.FieldByName('IDMOTIVOBLOQDEST').AsInteger) then
       Raise EValidacao.Create('O Custodiante ou o Motivo de Bloqueio do saldo destino devem ser diferentes do saldo de origem', dblCustodiante);

     Result := True;
  except
     on ev : EValidacao do
     begin
       if ev.Show then
          MsgDlg(ev.message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
       Repaint;
       if ev.Control.CanFocus then
          ev.Control.SetFocus;
     end;
  end;

end;

procedure TfrmCadTransfCustodiaMT.FazerRefresh;
var iOper: Integer;
begin
  //Capta a operação posicionada atualmente
  iOper := Cds.FieldByName('IDOPERCUSTODIA').AsInteger;
  // Implementado para acertar bug do padrão
  Seleciona;
  // Posiciona na mesma operação
  Cds.Locate('IDOPERCUSTODIA', iOper, []);
  // A Herança deste método precisa do Cds aberto para atualizar a tela
  inherited;
end;

procedure TfrmCadTransfCustodiaMT.dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   inherited;
   TCMClientDataSet(TwwDBGrid(Sender).DataSource).IndexFieldNames := AFieldName;
end;

end.

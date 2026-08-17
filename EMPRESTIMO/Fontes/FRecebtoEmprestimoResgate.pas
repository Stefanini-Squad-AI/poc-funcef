unit FRecebtoEmprestimoResgate;

// Alterações:
{
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
 --------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc, fcButton, fcImgBtn, fcShapeBtn, UTypesEmptmo,
  Provider, DBClient, wwclient, Mask, wwdbedit, Wwdbspin;

type
  TfrmRecebtoEmprestimoResgate = class(TfrmOkCancelar)
    ntb: TNotebook;
    qryRecebe: TwwQuery;
    dsRecebe: TwwDataSource;
    btnProcessar: TButton;
    memResult: TMemo;
    Panel3: TPanel;
    btnVoltar: TfcShapeBtn;
    Panel1: TPanel;
    grp: TGroupBox;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    btnBuscaMatricula: TBitBtn;
    qryParcelasAbertas: TwwQuery;
    qryPagarParcelas: TwwQuery;
    qryItensParcelasAbertas: TwwQuery;
    dsParcelasAbertas: TwwDataSource;
    qryParcelasAbertasIDCONTRATOEMPTMO: TFloatField;
    qryParcelasAbertasHMEPARCELA: TFloatField;
    qryParcelasAbertasVALOR_PARCELA: TFloatField;
    qryParcelasAbertasQTDE_ITENS_PARCELA: TFloatField;
    qryItensParcelasAbertasIDCONTRATOEMPTMO: TFloatField;
    qryItensParcelasAbertasHMEPARCELA: TFloatField;
    qryItensParcelasAbertasHMEVLRPREVISTO: TFloatField;
    qryTotalItens: TwwQuery;
    qryTotalItensIDCONTRATOEMPTMO: TFloatField;
    qryTotalItensVALOR_TOTAL_ITENS_ABERTOS: TFloatField;
    qryTotalItensQTDE_TOTAL_ITENS_ABERTOS: TFloatField;
    qryContrato: TwwQuery;
    qryAtualizaTMPDESC: TwwQuery;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    gridContrato: TwwDBGrid;
    cdsRecebe: TwwClientDataSet;
    dspRecebe: TDataSetProvider;
    cdsRecebeSELECIONA: TFloatField;
    cdsRecebeMATRICULA: TStringField;
    cdsRecebeNOME: TStringField;
    cdsRecebeNODOCUMENTO: TFloatField;
    cdsRecebeDATACOBRANCA: TDateTimeField;
    cdsRecebeVALOR: TFloatField;
    cdsRecebeVALORRECEBIDO: TFloatField;
    cdsRecebeSITENVIO: TStringField;
    cdsRecebeMESREFERENCIA: TStringField;
    cdsRecebeDATARECEBIMENTO: TDateTimeField;
    cdsRecebeIDTMPDESC: TFloatField;
    cdsRecebeIDTIPOCONTREMPTMO: TFloatField;
    qryBaixaItem: TwwQuery;
    procedure btnProcessarClick(Sender: TObject);
    procedure gridContratoOnClick(Sender : TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaMatriculaClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    vLista    : TListaItem;
    dDataInicioProcesso : TDateTime;
    sMatriculas : String;
    sContratos : String;
    sCentroCusto    : String;
    iPrograma       : Integer;
    iMoedaCorrente  : Integer;
    iPrestacoesAberto : Integer;
    iPrestacoesPagas : Integer;
    cValorItemAberto : Currency;
    cValorItemAbertoPago : Currency;
    cValorAmortizado : Currency;
    cValorQuitado : Currency;
    function VerificaContratos : Boolean;
    function QuitarContrato(const rContrato : TDadosContrato; var TipoErro : Integer) : Boolean;
    function AmortizarContrato(const rContrato : TDadosContrato) : Boolean;
    procedure AbortarTudo;
    function ProcessarContrato : Boolean;
    function Exec_SP_Trata_Parcelas(pIdContrato : Double; pCargaIN, pCargaNOTIN : Integer; pAnoMes, pAnoMesComp, pAnoMesCobra: string; pDataCalculo: TDateTime ): boolean;
    function PagarParcelasAtrasadas(var cValorParaAmortizar : Currency) : Boolean;
    function AmortizarSaldoDevedor(const rContrato : TDadosContrato; cValorParaAmortizar : Currency) : Boolean;
    function GravaTipoMovimento(const rContrato : TDadosContrato; iEvento : Integer) : Boolean;
    procedure CarregaContratos;
    procedure DespreparaGrid;
    procedure FechaQuery;
  public
    { Public declarations }
  end;

var
  frmRecebtoEmprestimoResgate: TfrmRecebtoEmprestimoResgate;

implementation

uses UCalcEmptmo, uMensErro, UFuncoesEmptmo, dEmptmo, dCalcEmptmo, UIntegraEmptmo, dBaseDados, UDataBase, FProgresso, USistema, dAtualizacaoDiaria;

{$R *.DFM}

procedure TfrmRecebtoEmprestimoResgate.FormCreate(Sender: TObject);
begin
  inherited;
  gridContrato.ControlStyle := gridContrato.ControlStyle + [csClickEvents];
  TForm(gridContrato).OnClick := GridContratoOnClick;
end;

procedure TfrmRecebtoEmprestimoResgate.gridContratoOnClick(Sender : TObject);
begin
  if cdsRecebe.RecordCount > 0 then
    if not btnProcessar.Enabled then
      if cdsRecebeSeleciona.AsInteger = 1 then
        btnProcessar.Enabled := True;
end;

procedure TfrmRecebtoEmprestimoResgate.btnProcessarClick(
  Sender: TObject);
var
 i : Integer;
begin

  dDataInicioProcesso := Now;
  cdsRecebe.DisableControls;

  if VerificaContratos then
    begin
      // Pegando apenas os contratos selecionados
      cdsRecebe.Filtered := False;
      cdsRecebe.Filter   := 'SELECIONA = 1';
      cdsRecebe.Filtered := True;

      frmProgresso.MostraFormProgresso('Recebimento de Empréstimo com Resgate...',
                                        True,
                                        True,
                                        True,
                                        0,
                                        cdsRecebe.RecordCount
                                       );
      frmProgresso.Refresh;

      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      // Inicializando variáveis totalizadoras usadas no resultado do processamento
      sMatriculas          := '';
      sContratos           := '';
      iPrestacoesAberto    := 0;
      iPrestacoesPagas     := 0;
      cValorItemAberto     := 0;
      cValorItemAbertoPago := 0;
      cValorAmortizado     := 0;
      cValorQuitado        := 0;

      // Pegando o Nº de Cotnrato e Matrícula para mostra-los no resultado final
      sMatriculas := cdsRecebeMATRICULA.AsString;
      sContratos  := cdsRecebeNODOCUMENTO.AsString;

      // Processando contrato por contrato
      i := 1;
      while not cdsRecebe.Eof do
        begin
          // Se clicaram no botão cancelar ou se o ProcessarContrato retornar false então aborta tudo
          if (frmProgresso.Cancelou) or (not ProcessarContrato) then
            begin
              AbortarTudo;
              Exit;
            end;

          cdsRecebe.Next;

          Inc(i);
          frmProgresso.AndaFormProgresso(i);
          frmProgresso.Refresh;
          Application.ProcessMessages;
          if not cdsRecebe.Eof then
            begin
              // Pegando o Nº de Cotnrato e Matrícula para mostra-los no resultado final
              sMatriculas := sMatriculas + ',' + cdsRecebeMATRICULA.AsString;
              sContratos  := sContratos + ',' + cdsRecebeNODOCUMENTO.AsString;
            end;
        end;

      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
      frmProgresso.EscondeFormProgresso;
      Repaint;

      // Mantando o Resultado de Recebimento
      memResult.Lines.Add('Início do Processamento: ' + DateTimeToStr(dDataInicioProcesso));
      memResult.Lines.Add('           ');
      memResult.Lines.Add('           ');
      memResult.Lines.Add('Matrícula(s): ' + sMatriculas);
      memResult.Lines.Add('           ');
      memResult.Lines.Add('Contratos(s): ' + sContratos);
      memResult.Lines.Add('           ');
      memResult.Lines.Add('Quantidade de Prestações em Aberto: ' + IntToStr(iPrestacoesAberto));
      memResult.Lines.Add('           ');
      memResult.Lines.Add('Valor de Itens em Aberto: ' + CurrToStrF(cValorItemAberto,ffCurrency,2));
      memResult.Lines.Add('           ');
      memResult.Lines.Add('Quantidade de Prestações Pago: ' + IntToStr(iPrestacoesPagas));
      memResult.Lines.Add('           ');
      memResult.Lines.Add('Valor de Itens em Aberto Pago: ' + CurrToStrF(cValorItemAbertoPago,ffCurrency,2));
      memResult.Lines.Add('           ');
      memResult.Lines.Add('Valor Amortizado: ' + CurrToStrF(cValorAmortizado,ffCurrency,2));
      memResult.Lines.Add('           ');
      memResult.Lines.Add('Valor Quitado: ' + CurrToStrF(cValorQuitado,ffCurrency,2));
      memResult.Lines.Add('           ');
      memResult.Lines.Add('Final do Processo: ' + DateTimeToStr(Now));
      memResult.Lines.Add('           ');
      memResult.Lines.Add('Tempo do Processo: ' + TimeToStr(dDataInicioProcesso - Now));

      ntb.PageIndex := 1;
      btnProcessar.Visible := False;
    end;
  DespreparaGrid;
end;

function TfrmRecebtoEmprestimoResgate.VerificaContratos : Boolean;
begin

  // Verificando se há algum contrato selecionado
  cdsRecebe.Filtered := False;
  cdsRecebe.Filter   := 'SELECIONA = 1';
  cdsRecebe.Filtered := True;

  if cdsRecebe.RecordCount = 0 then
    begin
      MsgDlg('Favor selecionar um contrato.', 'Atenção!', mtConfirmation, [mbOk], 0);
      Result := False;
    end;
end;

function TfrmRecebtoEmprestimoResgate.ProcessarContrato : Boolean;
var
  rSaldosAntPos : TSaldosAntPos;
  rContrato : TDadosContrato;
  TipoErro : Integer;
  dDataAtuDia : TDateTime;
begin
  Result := True;

  Try
    // Para preencher o rContrato
    qryContrato.Close;
    qryContrato.Params[0].AsString := cdsRecebeMATRICULA.AsString;
    qryContrato.Params[1].AsFloat  := cdsRecebeNODOCUMENTO.AsFloat;
    qryContrato.Open;

    PreencheDadosContrato(qryContrato, rContrato);

    // Verificando se o Valor Recebido é igual ao Valor Enviado, se sim Quita o contrato. Senão, Paga as Parcelas Abertar e/ou amortiza o saldo devedor
    if FormatFloat('#,#0.00', Arredonda(Abs(cdsRecebeVALORRECEBIDO.AsFloat), 2)) = FormatFloat('#,#0.00', Arredonda(Abs(cdsRecebeVALOR.AsFloat), 2)) then
      begin
        // Tipo de erro já começa com zero por causa do erro padrão.
        TipoErro := 0;
        if not QuitarContrato(rContrato, TipoErro) then
          begin

            // Verificando qual tipo de erro
            case TipoErro of
               0: MsgDlg('Erro ao quitar contrato ' + cdsRecebeNODOCUMENTO.AsString +
                        '. Todo o processamento será abortado.', 'Erro!', mtError, [mbOk], 0);

              -1: MsgDlg('Valor da quitação do contrato ' + cdsRecebeNODOCUMENTO.AsString + ' foi alterado desde o Pagamento do Resgate.' +
                        ' Não será possível concluir a quitação. ' + #13 + ' Todo o processamento será abortado.', 'Erro!', mtError, [mbOk], 0);
            end;

            Result := False;
            Exit;
          end;
      end
    else if not AmortizarContrato(rContrato) then
      begin
        Result := False;
        Exit;
      end;

    // Atualiza na TMPDESC, o item que já foi processado vai ficar com SITENVIO = 9
    LimpaParametros(qryAtualizaTMPDESC);
    qryAtualizaTMPDESC.Params[0].AsFloat := cdsRecebeIDTMPDESC.AsFloat;
    qryAtualizaTMPDESC.ExecSQL;

  Except
    Result := False;
  end;
end;

function TfrmRecebtoEmprestimoResgate.QuitarContrato(const rContrato : TDadosContrato; var TipoErro : Integer) : Boolean;
var
  ValorQuitacao : Currency;
  i : Integer;
begin
  Result := True;
  Try

   ValorQuitacao := 0;
   // calcula todos os itens de contrato para o evento quitação
   if (CalcEmptmo.CalculaItensQuitacaoNOVA(rContrato,
                                           3,
                                           cdsRecebeDATARECEBIMENTO.AsDateTime,
                                           -1,
                                           0,
                                           vLista,
                                           False, // Não mostrar mensagem
                                           False, // Não mostrar progresso
                                           False
                                          )) then
      begin
        // Pegando o item centralizador para saber o valor calculado para quitação
        for i := 0 to High(vLista) do
          if (vLista[i].FlgCentraliza = 1) or (vLista[i].FlgDestacado = 1) then
            ValorQuitacao := ValorQuitacao + vLista[i].Valor;
      end
    else
      begin
        Result := False;
        Exit;
      end;

    // Verificando se o valor de quitação é igual ao valor enviado na TMPDESC. Se não for aborta todo processo.
    if FormatFloat('#,#0.00', Arredonda(Abs(cdsRecebeVALOR.AsCurrency), 2)) <> FormatFloat('#,#0.00', Arredonda(Abs(ValorQuitacao), 2)) then
      begin
        // É o único erro diferente, por isso somente ele altera TipoErro
        TipoErro := -1;
        Result := False;
        Exit;
      end;

    // Grava item de Quitação, o 3 é o evento quitação
    if not GravaTipoMovimento(rContrato, 3) then
      begin
        Result := False;
        Exit;
      end;

    // Estorna os itens posteriores à data da quitação
    if dtmEmptmo.qryParamEmptmoFLGESTORNOPOSQUIT.AsInteger = 1 then
      begin
        with dtmEmptmo.qryUpdateFlgEstorno do
          begin
            LimpaParametros(dtmEmptmo.qryUpdateFlgEstorno);
            ParamByName('PHMEDATAESTORNO').AsDateTime       := cdsRecebeDATARECEBIMENTO.AsDateTime;
            ParamByName('PIDUSUARIOESTORNO').AsInteger      := Sistema.IDUsuario;
            ParamByName('PHMEOBSERVACAO').AsString          := 'Estorno de item posterior a quitacao';
            ParamByName('PIDCONTRATOEMPTMO').AsFloat        := cdsRecebeNODOCUMENTO.AsFloat;
            ParamByName('PFLGESTORNOPOSQUIT').AsInteger     := 1;
            ParamByName('PFILTROPORDATAPREVISTA').AsInteger := 1;
            ParamByName('PHMEDATAPREVISTAINI').AsDateTime   := cdsRecebeDATARECEBIMENTO.AsDateTime + 1;
            ParamByName('PHMEDATAPREVISTAFIM').AsDateTime   := DiasUteis.SomaAnos(cdsRecebeDATARECEBIMENTO.AsDateTime, 10);
            ExecSQL;
          end;
      end;

    // Ajusta Saldo
    if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
        if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
          begin
            with dtmAtualizacaoDiaria.spUpdateEstornado do
              begin
                 ParamByName('IIDCONTRATOEMPTMO').AsFloat  := cdsRecebeNODOCUMENTO.AsFloat;
                 ParamByName('DDATAINI').AsDateTime        := cdsRecebeDATARECEBIMENTO.AsDateTime + 1;
                 ParamByName('DDATAFIM').AsDateTime        := cdsRecebeDATARECEBIMENTO.AsDateTime + 180;
                 ParamByName('IHMETIPOMOV').AsFloat        := 5;
                 if not(Prepared) then Prepare;
                 ExecProc;
              end;
          end;

        dtmAtualizacaoDiaria.ExecutaAjusteSaldo(cdsRecebeNODOCUMENTO.AsFloat, cdsRecebeDATARECEBIMENTO.AsDateTime, -1);
      end;

    // Marcação dos Itens "quitados"
    if CalcEmptmo.MarcaItensQuitados(cdsRecebeNODOCUMENTO.AsFloat, cdsRecebeDATARECEBIMENTO.AsDateTime, 10) = -2 then
      begin
        Result := False;
        Exit;
      end;

    // Acerto da situação do Contrato
    CalcEmptmo.AcertaSituacaoContratual(cdsRecebeNODOCUMENTO.AsFloat);

    // Gravação de log da operação
    if not(Sistema.GravaLogOperacoes('Quitação do Contrato via pagamento com Resgate ' + cdsRecebeNODOCUMENTO.AsString + ' ref: ' +
                                     FormatDateTime('dd/mm/yyyy', cdsRecebeDATACOBRANCA.AsDateTime))
                                    ) then
      begin
        Result := False;
        Exit;
      end;

    // Pegando o valor que foi quitado para mostrar no resultado final
    cValorQuitado := cValorQuitado + cdsRecebeVALOR.AsCurrency;
  Except
    Result := False;
  end;
end;

function TfrmRecebtoEmprestimoResgate.AmortizarContrato(const rContrato : TDadosContrato) : Boolean;
var
  sAnoMesResgate : String;
  ValorParaAmortizar : Currency;
begin
  {* * ROTEIRO
   ********************************************************************************************
   * 1º) Calcula as parcelas atrasadas para atualizar os seus valores.                        *
   * 2º) Paga as parcelas atrasadas, porém, pode acontecer de não ser pago todas, serão pagas *
   *     apenas as que derem para pagar integralmente.                                        *
   * 3º) Com o valor restante do pagamento das parcelas, indepentende se pagou todas,         *
   *     o restante será amortizado do saldo devedor. Portanto, será lançado um item de       *
   *     amortização com esse restante e em seguida será amortizado o saldo devedor.          *
   ********************************************************************************************}

  // 1º) Calculando as parcelas atrasadas
  sAnoMesResgate := FormatDateTime('yyyy',cdsRecebeDATARECEBIMENTO.AsDateTime) + FormatDateTime('mm',cdsRecebeDATARECEBIMENTO.AsDateTime);
  if not Exec_SP_Trata_Parcelas(cdsRecebeNODOCUMENTO.AsFloat, -1, -1, sAnoMesResgate, '-1', '-1', cdsRecebeDATARECEBIMENTO.AsDateTime) then
    begin
      MsgDlg('Erro ao calcular parcelas atrasadas do contrato ' + cdsRecebeNODOCUMENTO.AsString +
             '. Todo o processamento será abortado.', 'Erro!', mtError, [mbOk], 0);
      Result := False;
      Exit;
    end;

  // 2º) Pagando as parcelas atrasadas, vai pagar aquelas que derem para pagar integralmente e o que não der ficará em aberto
  // Passa o parâmetro ValorParaAmortizar = 0 e se for maior que 0 o mesmo vai sair da função com o valor para ser amortizado.
  ValorParaAmortizar := 0;
  if not PagarParcelasAtrasadas(ValorParaAmortizar) then
    begin
      MsgDlg('Erro ao pagar as parcelas atrasadas do contrato ' + cdsRecebeNODOCUMENTO.AsString +
             '. Todo o processamento será abortado.', 'Erro!', mtError, [mbOk], 0);
      Result := False;
      Exit;
    end;

  // 3º) Lançar item de amortização e amortizar saldo devedor, se o valor for maior que 0.
  if ValorParaAmortizar > 0 then
    begin
      if not AmortizarSaldoDevedor(rContrato,ValorParaAmortizar) then
        begin
          MsgDlg('Erro ao amortizar saldo devedor do contrato ' + cdsRecebeNODOCUMENTO.AsString +
                 '. Todo o processamento será abortado.', 'Erro!', mtError, [mbOk], 0);
          Result := False;
          Exit;
        end;
    end;
  Result := True;
end;

function TfrmRecebtoEmprestimoResgate.GravaTipoMovimento(const rContrato : TDadosContrato; iEvento : Integer) : Boolean;
var
  k : Integer;
begin
  Result := True;

  Try
    for k := 0 to High(vLista) do
      begin
        if ((vLista[k].FlgCentraliza = 1) or (vLista[k].FlgDestacado = 1)) and (vLista[k].Valor = 0) then
          begin
            vLista[k].ValorEfetivo  := 0;
            vLista[k].DataEfetiva   := cdsRecebeDATARECEBIMENTO.AsDateTime;
            vLista[k].FlgBaixado    := -1;
            vLista[k].FlgEnvio      := -1;
            vLista[k].FormaCobranca := '';
          end
        // Colocando valor efetivo e data efetiva
        else if ((vLista[k].FlgCentraliza = 1) or (vLista[k].FlgDestacado = 1)) and (vLista[k].Valor > 0) then
          begin
            vLista[k].ValorEfetivo  := vLista[k].Valor;
            vLista[k].DataEfetiva   := cdsRecebeDATARECEBIMENTO.AsDateTime;
          end
      end;

    // Granvando o item na HISTMOVEMPTMO
    if not(CalcEmptmo.GravaMovEmptmo(rContrato,
                                     vLista,
                                     iEvento,                                               // Evento
                                     -1,                                                    // Parcela
                                     StrToInt(Copy(cdsRecebeDATARECEBIMENTO.AsString,7,4)), // Ano Competência - Ano do Item
                                     StrToInt(Copy(cdsRecebeDATARECEBIMENTO.AsString,4,2)), // Mês Competência - Mês do Item
                                     StrToInt(Copy(cdsRecebeDATARECEBIMENTO.AsString,7,4)), // Ano Cobrança - Ano da Data de Quitação
                                     StrToInt(Copy(cdsRecebeDATARECEBIMENTO.AsString,4,2)), // Mês Cobranca - Mês da Data de Quitação
                                     -1,                                                    // Parcelas Remanescentes
                                     cdsRecebeDATARECEBIMENTO.AsDateTime,                   // DataPrevista -> Data de Quitação ou Amortização
                                     cdsRecebeDATARECEBIMENTO.AsDateTime,
                                     'F',                                                   // Forma de Envio
                                     '',
                                     False                                                  // Mostra o Form de Progresso
                                    )) then
      begin
        Result := False;
        Exit;
      end;

    // Dando baixa no item de quitação ou amortização que foi lançado
    LimpaParametros(qryBaixaItem);
    qryBaixaItem.ParamByName('PIDCONTRATOEMPTMO').AsFloat := cdsRecebeNODOCUMENTO.AsFloat;
    qryBaixaItem.ParamByName('PIDTMPDESC').AsFloat := cdsRecebeIDTMPDESC.AsFloat;
    qryBaixaItem.ExecSQL;

  Except
    Result := False;
  end;
end;

procedure TfrmRecebtoEmprestimoResgate.btnVoltarClick(Sender: TObject);
begin
  FechaQuery;
  btnProcessar.Visible := True;
  btnProcessar.Enabled := False;
  ntb.PageIndex := 0;
  DespreparaGrid;
  btnBuscaMatricula.OnClick(Self);
end;

procedure TfrmRecebtoEmprestimoResgate.DespreparaGrid;
begin
  cdsRecebe.Filtered := False;
  cdsRecebe.EnableControls;
  frmProgresso.EscondeFormProgresso;
  frmRecebtoEmprestimoResgate.Refresh;
end;

procedure TfrmRecebtoEmprestimoResgate.FechaQuery;
begin
  qryParcelasAbertas.Close;
  qryItensParcelasAbertas.Close;
  qryAtualizaTMPDESC.Close;
  qryContrato.Close;
  qryPagarParcelas.Close;
  qryBaixaItem.Close;
end;

procedure TfrmRecebtoEmprestimoResgate.FormShow(Sender: TObject);
begin
  inherited;
  iPrograma    := dtmEmptmo.qryParamEmptmoIDPROGRAMA.AsInteger;
  sCentroCusto := dtmEmptmo.qryParamEmptmoCODCENTROCUSTO.AsString;

  cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
  DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

  with dtmEmptmo.qryParamGlobal do
    begin
      LimpaParametros(dtmEmptmo.qryParamGlobal);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

      if not(dtmEmptmo.qryParamGlobal.isEmpty) then iMoedaCorrente := dtmEmptmo.qryParamGlobalMOEDACORRENTE.asInteger;
    end;
end;

procedure TfrmRecebtoEmprestimoResgate.AbortarTudo;
begin
  if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
  cdsRecebe.EnableControls;
  cdsRecebe.Filtered := False;
  frmProgresso.EscondeFormProgresso;
  Repaint;
  frmRecebtoEmprestimoResgate.Refresh;
  gridContrato.RefreshDisplay;
end;


function TfrmRecebtoEmprestimoResgate.Exec_SP_Trata_Parcelas(pIdContrato : Double; pCargaIN, pCargaNOTIN : Integer; pAnoMes, pAnoMesComp, pAnoMesCobra: string; pDataCalculo: TDateTime ): boolean;
var
  SP_PROC : TStoredProc;
begin
  try
    Result := False;

    SP_PROC := TStoredProc.Create(Self);
    SP_PROC.DatabaseName  := 'BaseDados';

    SP_PROC.StoredProcName := 'CM."SP_TRAT_PARCELAS_EM_ATRASO"';

    //Criando os parametros
    SP_PROC.Params.CreateParam(ftInteger, 'pNumContrato',       ptInput);
    SP_PROC.Params.CreateParam(ftInteger, 'pInArquivo',         ptInput);
    SP_PROC.Params.CreateParam(ftInteger, 'pNotInArquivo',      ptInput);
    SP_PROC.Params.CreateParam(ftString,  'pAnoMes',            ptInput);
    SP_PROC.Params.CreateParam(ftString,  'pAnoMesCobranca',    ptInput);
    SP_PROC.Params.CreateParam(ftString,  'pAnoMesCompetencia', ptInput);
    SP_PROC.Params.CreateParam(ftDate,    'pDataCalculo',       ptInput);

    //Passandos os parâmetros
    SP_PROC.ParamByName('pNumContrato').AsFloat        := pIdContrato;
    SP_PROC.ParamByName('pInArquivo').AsInteger        := pCargaIN;
    SP_PROC.ParamByName('pNotInArquivo').AsInteger     := pCargaNOTIN;
    SP_PROC.ParamByName('pAnoMes').AsString            := pAnoMes;
    SP_PROC.ParamByName('pAnoMesCobranca').AsString    := pAnoMesCobra;
    SP_PROC.ParamByName('pAnoMesCompetencia').AsString := pAnoMesComp;
    SP_PROC.ParamByName('pDataCalculo').AsDateTime     := pDataCalculo;

    if not SP_PROC.Prepared then
       SP_PROC.Prepare;

    SP_PROC.Close;
    SP_PROC.ExecProc;
    Result := True;
    SP_PROC.Close;

  finally
    FreeAndNil(SP_PROC);
  End;
end;

function TfrmRecebtoEmprestimoResgate.PagarParcelasAtrasadas(var cValorParaAmortizar : Currency) : Boolean;
var
  rLogTotalPrev : TLogTotalPrev;
  ValorParaPagar, ValorParcela : Currency;
begin
  Result := True;

  // Valor usado para pagar as parcelas
  ValorParaPagar := Arredonda(Abs(cdsRecebeVALORRECEBIDO.AsCurrency), 2);

  {** Sobre como traz as parcelas e os itens das parcelas
   ******************************************************************************************************************* *
   * Para pegar as parcelas e os seus itens, está sendo usado duas querys. A qryParcelasAbertas traz as parcelas com   *
   * os seus itens agrupados e somados, ou seja, traz o valor da parcela integral. A qryItensParcelasAbertas traz os   *
   * itens de cada parcela. Para isso, essas duas querys estão ligadas como Mestre-Detalhe, sendo a qryParcelasAbertas *
   * Mestre e a qryItensParcelasAbertas Detahe. Assim, para cada registro que passar no while de qryParcelasAbertas    *
   * traz automaticamente todos os itens dessa parcela em qryItensParcelasAbertas.                                     *
   *********************************************************************************************************************}

  try
    // Query que pega as parcelas com o seu valor total, somando os seus próprios itens
    qryParcelasAbertas.Close;
    qryParcelasAbertas.Params[0].AsFloat := cdsRecebeNODOCUMENTO.AsFloat;
    qryParcelasAbertas.Open;

    // Se não tiver parcelas atrasadas, manda direto o valor que tem para amortização
    if qryParcelasAbertas.IsEmpty then
      cValorParaAmortizar := ValorParaPagar
    else  // Se tiver parcelas atrasadas, faz o processo abaixo para quitá-las
      begin
        qryParcelasAbertas.First;

        // Query que pega o Valor Total de Itens em Aberto
        qryTotalItens.Close;
        qryTotalItens.Params[0].AsFloat := cdsRecebeNODOCUMENTO.AsFloat;
        qryTotalItens.Open;

        // Pegando o valor total de itens em aberto
        cValorItemAberto := cValorItemAberto + qryTotalItensVALOR_TOTAL_ITENS_ABERTOS.AsCurrency;

        // Pegando a quantidade total de parcelas em aberto
        iPrestacoesAberto := iPrestacoesAberto + qryParcelasAbertas.RecordCount;

        // Query que pega os itens de cada parcela
        qryItensParcelasAbertas.Close;
        qryItensParcelasAbertas.Open;

        // Selecionando parcela para ser paga
        while not qryParcelasAbertas.Eof do
          begin
            ValorParcela := Arredonda(Abs(qryParcelasAbertasVALOR_PARCELA.AsCurrency), 2);

            // Apenas paga a parcela se o valor total dos seus itens for menor que o valor recebido
            if ValorParcela <= ValorParaPagar then
              begin
                qryItensParcelasAbertas.First;

                // Pagando cada item da parcela
                while not qryItensParcelasAbertas.Eof do
                  begin
                    LimpaParametros(qryPagarParcelas);
                    qryPagarParcelas.ParamByName('PIDCONTRATOEMPTMO').AsFloat  := cdsRecebeNODOCUMENTO.AsFloat;
                    qryPagarParcelas.ParamByName('PHMEDATAEFETIVA').AsDateTime := cdsRecebeDATARECEBIMENTO.AsDateTime;
                    qryPagarParcelas.ParamByName('PIDTMPDESC').AsFloat         := cdsRecebeIDTMPDESC.AsFloat;
                    qryPagarParcelas.ParamByName('PHMEPARCELA').AsInteger      := qryParcelasAbertasHMEPARCELA.AsInteger;
                    qryPagarParcelas.ExecSQL;

                    // Próximo item da parcela para ser pago
                    qryItensParcelasAbertas.Next
                  end;
              end
            else
              Break; // Sai do bloco loop

            // Subtraindo do valor para pagar as parcelas o valor que já foi pago
            ValorParaPagar := ValorParaPagar - ValorParcela;

            // Incrementa quantidade de prestações pagas
            Inc(iPrestacoesPagas);

            // Pegando o Valor da Parcela Paga
            cValorItemAbertoPago := cValorItemAbertoPago + qryParcelasAbertasVALOR_PARCELA.AsCurrency;

            // Próxima Parcela
            qryParcelasAbertas.Next;
          end;

        // VALOR PARA AMORTIZAÇÃO
        // Independente de ter pago ou nao todas as parcelas, se ainda tem valor em ValorParaPagar entao
        // manda esse valor para amortizacao
        if ValorParaPagar > 0 then
          cValorParaAmortizar := ValorParaPagar;

      end;
  except
    Result := False;
    Exit;
  end;
end;

function TfrmRecebtoEmprestimoResgate.AmortizarSaldoDevedor(const rContrato : TDadosContrato; cValorParaAmortizar : Currency) : Boolean;
var
  iResult, iPlanilhaResult : Integer;
  sMensagem : String;
  sResult, sErro : TStringList;
  dDataAtuDia : TDateTime;
begin
  Result := True;
  Try
    // Calcula todos os itens de contrato para o evento amortização
    if not(CalcEmptmo.CalculaItensAmortizacao(rContrato,
                                              2, // Origem
                                              dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger,
                                              dtmEmptmo.qryParamEmptmoCODESTADO.AsString,
                                              dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger,
                                              'F',
                                              cValorParaAmortizar,
                                              cdsRecebeDATARECEBIMENTO.AsDateTime,
                                              vLista,
                                              False,
                                              False
                                             )) then
      begin
        //  Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
        //   por Cancelamento do Usuário, logo o procedimento será abortado
        Result := False;
        Exit;
      end;

    // Grava item de Amortização, o 2 é o evento Amortização
    if not GravaTipoMovimento(rContrato, 2) then
      begin
        Result := False;
        Exit;
      end;

    // Ajustando o Saldo Devedor
    dtmAtualizacaoDiaria.ExecutaAjusteSaldo(cdsRecebeNODOCUMENTO.AsFloat, cdsRecebeDATARECEBIMENTO.AsDateTime, -1);

    // Acerto da situação do Contrato
    CalcEmptmo.AcertaSituacaoContratual(cdsRecebeNODOCUMENTO.AsFloat);

    if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
      begin
        dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(rContrato.IDContratoEmptmo, -1);

        dtmAtualizacaoDiaria.ExecutaAtuDia(rContrato.IDContratoEmptmo,             // Contrato
                                           Sistema.IDModulo,
                                           -1,                                     // Tipo Contr
                                           -1,                                     // Tipo Emptmo
                                           -1,                                     // Patro
                                           -1,                                     // Plano
                                           1,                                      // Estorno
                                           0,                                      // Prov Perda
                                           1,                                      // Atu Saldo
                                           -1,                                     // In Arquivo
                                           -1,                                     // Not In Arquivo
                                           cdsRecebeDATARECEBIMENTO.AsDateTime,    // Data Ini
                                           dDataAtuDia,                            // Data Fim
                                           cdsRecebeDATARECEBIMENTO.AsDateTime - 1 // Data Considera
                                          );

      end;

    // cValorAmortizado será usado no resultado final mostrando o valor total amortizado
    cValorAmortizado := cValorAmortizado + cValorParaAmortizar;
  except
    Result := False;
  end;
end;

procedure TfrmRecebtoEmprestimoResgate.btnBuscaMatriculaClick(
  Sender: TObject);
begin
  inherited;
  CarregaContratos;
end;

procedure TfrmRecebtoEmprestimoResgate.CarregaContratos;
begin
  cdsRecebe.Close;
  cdsRecebe.Params[0].AsString := FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', CboMes.ItemIndex + 1);
  cdsRecebe.Open;
end;

procedure TfrmRecebtoEmprestimoResgate.BitBtn5Click(Sender: TObject);
begin
  inherited;

  // Desmarcando todos
  if cdsRecebe.RecordCount > 0 then
    begin
      cdsRecebe.First;
      cdsRecebe.DisableControls;

      while not cdsRecebe.Eof do
        begin
          cdsRecebe.Edit;
          cdsRecebeSELECIONA.AsInteger := 0;
          cdsRecebe.Post;
          cdsRecebe.Next;
        end;

      cdsRecebe.First;
      cdsRecebe.EnableControls;
    end;

  // Se nenhum estiver marcado então o botão deve ser desabilitado
  btnProcessar.Enabled := False;
  Repaint;
end;

procedure TfrmRecebtoEmprestimoResgate.BitBtn6Click(Sender: TObject);
begin
  inherited;

  // Marcando todos
  if cdsRecebe.RecordCount > 0 then
    begin
      cdsRecebe.First;
      cdsRecebe.DisableControls;

      while not cdsRecebe.Eof do
        begin
          cdsRecebe.Edit;
          cdsRecebeSELECIONA.AsInteger := 1;
          cdsRecebe.Post;
          cdsRecebe.Next;
        end;

      cdsRecebe.First;
      cdsRecebe.EnableControls;
    end;

  // Com algum marcado então botão pode ficar habilitado  
  btnProcessar.Enabled := True;
  Repaint;
end;

end.

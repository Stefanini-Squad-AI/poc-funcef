//******************************************************************************
// Data      : 12/02/2010
// Pendencia : 131044
// SOL       : 740728
// Descrição : Ajuste nos calculos de Saldo e Lucro e Prejuizo na QryAnalitico
// Autor     : Thiago Passos
//******************************************************************************
// Data      : 25/07/2007
// Código    : AL_9
// Pendencia : 24799
// SOL       : 55978
// Descrição : Ajuste no cálculo do valor aplicado após transferência de planos.
//             Ajuste nas críticas e utlilização de parâmetros pelo CtrlPInv
//******************************************************************************
//Data	     : 26/05/2006
//Codigo     : AL_8
//Pendência  : 22480
//SOL        : 43633
//Função     : Melhorias na Funcionalidade de Transferência entre Planos
//******************************************************************************
// Data     : 15/03/2006
// Código   : AL_7
// Pendencia: 21769
// SOL      : 41208
// Motivo   : Acerto na filtragem de registros vencidos que estava aparecendo
//            Melhoria na critica para pegar os Pagtos de Juros pela data de
//            Liquidação
//******************************************************************************
// Data     : 18/01/2006
// Código   : AL_6
// Pendencia: 20779
// SOL      : 35222
// Motivo   : Implementação dos filtros por Classe, Emissor e Investimento
//******************************************************************************
// Data     : 06/12/2005
// Código   : AL_5
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo FLGREGIMECXCOMP e DTAREGIMECXCOMP na PARAMINVEST
//            para testar a utilização de regime de Caixa ou Competência nas
//            Operações de Renda Fixa
// Motivo   : Melhoria de Verificação de Dados de Entrada
//******************************************************************************
// Data     : 03/10/2005
// Código   : AL_4
// Motivo   : Acerto para pegar o último dia útil na data inicial
//            Ajuste na query para melhorar a performance
//******************************************************************************
// Data     : 01/06/2005
// Código   : AL_3
// Motivo   : Acerto no text do MsgDlg qdo a qry estiver vazia e no caption dos
//            componetes de Data Inicial e Final
//******************************************************************************
// Data     : 19/05/2005
// Código   : AL_2
// Motivo   : Implementação de Sub-Relatório e qryMapaMensalRFAnalitico
//******************************************************************************
// Data     : 18/05/2005
// Motivo   : Alteração no nome do Relatório para MAPA DE MOVIMENTAÇÃO EM RENDA FIXA
//******************************************************************************
// Data     : 10/03/2005
// Código   : AL_1
// Motivo   : Colocado Combo com o Plano/Patro
//******************************************************************************

unit FParamMapaInvRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  FPreview, wwdblook, Db, DBTables, Wwquery,
  //AL_5
  //AL_7
  UBibliotecaInvest,
  //AL_9
  uCtrlParamInvest;

type
  TfrmParamMapaInvRF = class(TfrmOkCancelarInv)
    pnlFundo1: TPanel;
    lblDtIni: TLabel;
    dtDataInicio: TCMDateTimePicker;
    Label2: TLabel;
    dtDataFim: TCMDateTimePicker;
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    lblPlanoPatro: TLabel;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    lblDtFinal: TLabel;
    qryClasse: TwwQuery;
    qryClasseDESCCLASSETIT: TStringField;
    qryClasseIDCLASSETIT: TFloatField;
    Label4: TLabel;
    dblClasse: TwwDBLookupCombo;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    Label3: TLabel;
    dblEmissor: TwwDBLookupCombo;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    lblInvestimento: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    QryAux: TwwQuery;
    QryAnalitico: TwwQuery;
    Label1: TLabel;
    dblSegmentacao: TwwDBLookupCombo;
    qrySegmentacao: TwwQuery;
    qrySegmentacaoIDSEGMENTACAO: TFloatField;
    qrySegmentacaoDESCSEGMENTACAO: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblPlanPrevCtbPatrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblClasseCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblPlanPrevCtbPatrChange(Sender: TObject);
    procedure dblClasseChange(Sender: TObject);
    procedure dblEmissorChange(Sender: TObject);
    procedure dtDataFimExit(Sender: TObject);
  private
    { Private declarations }
    bModal: Boolean;
    function InsertAnalitico:string;
    procedure SetModal(bMod: Boolean);
    //AL_6
    procedure SetaClasse;
    procedure SetaEmissor;
    procedure SetaInvestimento;
  public
    { Public declarations }
  published
    { Published declarations }
     Property fModal: boolean read bModal write SetModal;
  end;

var
  frmParamMapaInvRF: TfrmParamMapaInvRF;

implementation

uses FDmRelRFMapaMensal, UOperComum, UMensErro, UDiasUteisInv, udatabase;

{$R *.DFM}

procedure TfrmParamMapaInvRF.bbtnConfirmarClick(Sender: TObject);

var
   //AL_5
   dDataMin : TDateTime;
 

begin
   inherited;
   //AL_5 Ini

   // Renan Cristiano - Sol: 39931 | Kintana: 523366 Inicio
   if (dtDataInicio.Date <= pRpi.DATARELINICIAL) then//and (dDataFim.Date <= pRpi.DATARELINICIAL) then
   begin
     MsgDlg('Consulta/Impressão somente permitido para data após '+ DateToStr(pRpi.DATARELINICIAL) +' !!','Mensagem do Sistema',mtWarning,[MbOk],0);
     if dtDataInicio.CanFocus then
        dtDataInicio.SetFocus;
     Exit;
   end;
   //else if (dtDataInicio.Date <= pRpi.DATARELINICIAL) and (dDataFim.Date >= pRpi.DATARELINICIAL) then
   //  dtDataInicio.Text := dateToStr(pRpi.DATARELINICIAL+1);
  // Renan Cristiano - Sol: 39931 | Kintana: 523366 Fim

    if dtDataFim.Date < dtDataInicio.Date then
   begin
      MsgDlg('A Data Final é menor que a Data Inicial informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
         dtDataFim.Text := dtDataInicio.Text;
      Exit;
   end
   else if Trim(dtDataInicio.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataInicio.CanFocus then
         dtDataInicio.SetFocus;
      Exit;
   end
   else if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end;
   //AL_5 Fim



   //1 - Trunca a Tabela Temporaria

     QryAux.Close;
     QryAux.SQL.Clear;
     QryAux.SQL.Add('DELETE FROM INVESTIMENTOGLOBAL');
     QryAux.ExecSQL;

   //2 - Carrega os Itens na Tabela Temporária
   {
       ***Mapa dos Campos***

        IDCHAVETEMP ='ITENS'
        CAMPO1      =HI.IDITEMRENFIX
        CAMPO2      =IT.TIPOITEM
        CAMPO3      =HI.IDHISTRENFIX
        CAMPO4      =HI.IDCURVARENFIX
        CAMPO5      =HI.IDREGRACALCULO
        CAMPO6      =HI.PUITEM
        CAMPO7      =HI.PUACUITEM
        CAMPO8      =HI.VLRITEM
        CAMPO9      =HI.VLRACUITEM
        CAMPO10     =IT.DESCITEMRENFIX
        CAMPO11     =IT.CODITEMRENFIX
        CAMPO12     =IT.FLGREGRA

    
     QryAux.Close;
     QryAux.SQL.Clear;
     QryAux.SQL.Add(' INSERT INTO INVESTIMENTOGLOBAL(IDCHAVETEMP,CAMPO1) ');
     QryAux.SQL.Add(' (SELECT ''HISTRENFIX'',IDHISTRENFIX FROM HISTRENFIX HIS ');
     QryAux.SQL.Add(' WHERE HIS.DATAHISTRENFIX BETWEEN  TO_DATE(:DATAINI,''DD/MM/YYYY'') AND TO_DATE(:DATAFIM,''DD/MM/YYYY'') ) ');
     QryAux.ParamByName('DATAINI').DataType := ftString;
     QryAux.ParamByName('DATAFIM').DataType := ftString;

     //Passando os Parametros
     dDataMin := DiasUteisInv.UltDiaUtilAnterior(dtDataInicio.DateTime + 1, -1, 1, '', True, False, False);
     QryAux.ParamByName('DATAINI').AsString := DateToStr(dDataMin);
     QryAux.ParamByName('DATAFIM').AsString := dtDataFim.Text;

     QryAux.ExecSQL;


     QryAux.Close;
     QryAux.SQL.Clear;
     QryAux.SQL.Add('     INSERT INTO INVESTIMENTOGLOBAL ');
     QryAux.SQL.Add('(IDCHAVETEMP,CAMPO1,CAMPO2,CAMPO3,CAMPO4,CAMPO5,CAMPO6,CAMPO7,CAMPO8,CAMPO9,CAMPO10,CAMPO11,CAMPO12) ');
     QryAux.SQL.Add(' ( ');
     QryAux.SQL.Add('SELECT ');
     QryAux.SQL.Add(' ''ITENS'',HI.IDITEMRENFIX,IT.TIPOITEM,HI.IDHISTRENFIX,HI.IDCURVARENFIX,HI.IDREGRACALCULO,HI.PUITEM,HI.PUACUITEM,HI.VLRITEM,HI.VLRACUITEM, IT.DESCITEMRENFIX,IT.CODITEMRENFIX,IT.FLGREGRA ');
     QryAux.SQL.Add(' FROM ITEMRENFIX IT, HISTRENFIXXITENS HI                                                     ');
     QryAux.SQL.Add(' WHERE IT.IDITEMRENFIX = HI.IDITEMRENFIX  ');
     QryAux.SQL.Add(' AND HI.IDHISTRENFIX IN (SELECT TO_NUMBER(CAMPO1) FROM INVESTIMENTOGLOBAL WHERE IDCHAVETEMP = ''HISTRENFIX'') ) ');

     QryAux.ExecSQL;
      }
      //Ajustando os parametros da QryAnalitico
      QryAnalitico.close;
      QryAnalitico.ParamByName('DATAMIN').DataType := ftString;
      QryAnalitico.ParamByName('DATAINI').DataType := ftString;
      QryAnalitico.ParamByName('DATAFIM').DataType := ftString;
      QryAnalitico.ParamByName('FLGREGIMECXCOMP').DataType := ftString;
      QryAnalitico.ParamByName('IDPLANPREVCTBPATR').DataType := ftInteger;
      QryAnalitico.ParamByName('IDCLASSETIT').DataType := ftInteger;
      QryAnalitico.ParamByName('IDEMISSOR').DataType := ftInteger;
      QryAnalitico.ParamByName('IDINVESTIMENTO').DataType := ftInteger;
      qryAnalitico.ParamByName('IDSEGMENTACAO').DataType := ftInteger; //RENAN CGPC28

     //Passando os Parametros
      dDataMin := DiasUteisInv.UltDiaUtilAnterior(dtDataInicio.DateTime + 1, -1, 1, '', True, False, False);
      QryAnalitico.ParamByName('DATAMIN').AsString := DateToStr(dDataMin);
      QryAnalitico.ParamByName('DATAINI').AsString := dtDataInicio.Text;
      QryAnalitico.ParamByName('DATAFIM').AsString := dtDataFim.Text;
      //AL_5 Ini
      //AL_7
      //AL_9 - Ini - Se utiliza Regime de Caixa ou de Competência
      if (CtrlPInv.FlgRegimeCxComp = 'S') and (dtDataInicio.Date >= CtrlPInv.DtaRegimeCxComp) then
         QryAnalitico.ParamByName('FLGREGIMECXCOMP').AsString := 'S'
      else
         QryAnalitico.ParamByName('FLGREGIMECXCOMP').AsString := 'N';
      //AL_9 - Fim
      //AL_5 Fim
      //AL_1


      if Trim(dblPlanPrevCtbPatr.Text) <> ''  then
        begin
          QryAnalitico.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
        end;

      if Trim(dblSegmentacao.Text) <> '' then
        begin
          QryAnalitico.ParamByName('IDSEGMENTACAO').AsInteger := strToInt(dblSegmentacao.LookupValue); //RENAN CGPC28
        end;

      if Trim(dblClasse.Text) <> ''  then
       begin
         QryAnalitico.ParamByName('IDCLASSETIT').AsInteger := StrToInt(dblClasse.LookupValue);
       end;

      if Trim(dblEmissor.Text) <> ''  then
        begin
         QryAnalitico.ParamByName('IDEMISSOR').AsInteger := StrToInt(dblEmissor.LookupValue);
        end;



      if Trim(dblInvestimento.Text) <> ''  then
       begin

         QryAnalitico.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(dblInvestimento.LookupValue);
       end;
       QryAnalitico.close;
       QryAnalitico.open;




    while not QryAnalitico.Eof do
    begin

     QryAux.SQL.clear;
     QryAux.close;
     QryAux.SQL.Add('INSERT INTO INVESTIMENTOGLOBAL   ');
     QryAux.SQL.Add('(IDCHAVETEMP                     ');
     QryAux.SQL.Add(',CAMPO3 --PLANPRVCONTABPATRO     ');
     QryAux.SQL.Add(',CAMPO4 --CLASSE                 ');
     QryAux.SQL.Add(',CAMPO5 --INVESTIMENTO           ');
     QryAux.SQL.Add(',CAMPO6 --DATAOPERACAO           ');
     QryAux.SQL.Add(',CAMPO7 --VENCIMENTO             ');
     QryAux.SQL.Add(',CAMPO8 --IDOPERRENFIX           ');
     QryAux.SQL.Add(',IDINVESTIMENTO --IDINVESTIMENTO ');
     QryAux.SQL.Add(',CAMPO9 --IDOPERRENFIX           ');
     QryAux.SQL.Add(',IDPLANPREVCTBPATR --IDPLANPREVCTBPATR ');
     QryAux.SQL.Add(',CAMPO10 --VALORAPLICADO         ');
     QryAux.SQL.Add(',CAMPO11 --SALDOANTERIOR         ');
     QryAux.SQL.Add(',CAMPO12 --SALDO                 ');
     QryAux.SQL.Add(',CAMPO13 --CORRECAO              ');
     QryAux.SQL.Add(',CAMPO14 --JUROS                 ');
     QryAux.SQL.Add(',CAMPO15 --VLRPROVPERDA          ');
     QryAux.SQL.Add(',CAMPO16 --AGIODESAGIO           ');
     QryAux.SQL.Add(',CAMPO17 --VLRIOF                ');
     QryAux.SQL.Add(',CAMPO18 --RESGATES              ');
     QryAux.SQL.Add(',CAMPO19 --LUCPREJ               ');
     QryAux.SQL.Add(',CAMPO20 --APLICACOES            ');
     QryAux.SQL.Add(',CAMPO21 --PRINCIPAL             ');
     QryAux.SQL.Add(',CAMPO22 --PAGTOJUR              ');
     QryAux.SQL.Add(',CAMPO23 --TRCPLANO              ');
     QryAux.SQL.Add(',CAMPO24 --DIF                   ');
     QryAux.SQL.Add(',CAMPO25 --DIF                   ');
     QryAux.SQL.Add(',CAMPO27 --SEGMENTACAO DE MERCADO');
     QryAux.SQL.Add(')                                ');
     QryAux.SQL.Add('VALUES (:IDCHAVETEMP              ');
     QryAux.SQL.Add(',:CAMPO3 --PLANPRVCONTABPATRO     ');
     QryAux.SQL.Add(',:CAMPO4 --CLASSE                 ');
     QryAux.SQL.Add(',:CAMPO5 --INVESTIMENTO           ');
     QryAux.SQL.Add(',:CAMPO6 --DATAOPERACAO           ');
     QryAux.SQL.Add(',:CAMPO7 --VENCIMENTO             ');
     QryAux.SQL.Add(',:CAMPO8 --IDOPERRENFIX           ');
     QryAux.SQL.Add(',:IDINVESTIMENTO --IDINVESTIMENTO ');
     QryAux.SQL.Add(',:CAMPO9 --IDOPERRENFIX           ');
     QryAux.SQL.Add(',:IDPLANPREVCTBPATR --IDPLANPREVCTBPATR ');
     QryAux.SQL.Add(',:CAMPO10 --VALORAPLICADO         ');
     QryAux.SQL.Add(',:CAMPO11 --SALDOANTERIOR         ');
     QryAux.SQL.Add(',:CAMPO12 --SALDO                 ');
     QryAux.SQL.Add(',:CAMPO13 --CORRECAO              ');
     QryAux.SQL.Add(',:CAMPO14 --JUROS                 ');
     QryAux.SQL.Add(',:CAMPO15 --VLRPROVPERDA          ');
     QryAux.SQL.Add(',:CAMPO16 --AGIODESAGIO           ');
     QryAux.SQL.Add(',:CAMPO17 --VLRIOF                ');
     QryAux.SQL.Add(',:CAMPO18 --RESGATES              ');
     QryAux.SQL.Add(',:CAMPO19 --LUCPREJ               ');
     QryAux.SQL.Add(',:CAMPO20 --APLICACOES            ');
     QryAux.SQL.Add(',:CAMPO21 --PRINCIPAL             ');
     QryAux.SQL.Add(',:CAMPO22 --PAGTOJUR              ');
     QryAux.SQL.Add(',:CAMPO23 --TRCPLANO              ');
     QryAux.SQL.Add(',:CAMPO24 --DIF                   ');
     QryAux.SQL.Add(',:CAMPO25 --DIF                   ');
     QryAux.SQL.Add(',:CAMPO27 --SEGMENTACAO DE MERCADO ');
     QryAux.SQL.Add(')                                 ');

     QryAux.ParamByName('IDCHAVETEMP').DataType := ftString;
     QryAux.ParamByName('CAMPO3').DataType := ftString;
     QryAux.ParamByName('CAMPO4').DataType := ftString;
     QryAux.ParamByName('CAMPO5').DataType := ftString;
     QryAux.ParamByName('CAMPO6').DataType := ftString;
     QryAux.ParamByName('CAMPO7').DataType := ftString;
     QryAux.ParamByName('CAMPO8').DataType := ftString;
     QryAux.ParamByName('IDINVESTIMENTO').DataType := ftInteger;
     QryAux.ParamByName('CAMPO9').DataType := ftString;
     QryAux.ParamByName('IDPLANPREVCTBPATR').DataType := ftInteger;
     QryAux.ParamByName('CAMPO10').DataType := ftString;
     QryAux.ParamByName('CAMPO11').DataType := ftString;
     QryAux.ParamByName('CAMPO12').DataType := ftString;
     QryAux.ParamByName('CAMPO13').DataType := ftString;
     QryAux.ParamByName('CAMPO14').DataType := ftString;
     QryAux.ParamByName('CAMPO15').DataType := ftString;
     QryAux.ParamByName('CAMPO16').DataType := ftString;
     QryAux.ParamByName('CAMPO17').DataType := ftString;
     QryAux.ParamByName('CAMPO18').DataType := ftString;
     QryAux.ParamByName('CAMPO19').DataType := ftString;
     QryAux.ParamByName('CAMPO20').DataType := ftString;
     QryAux.ParamByName('CAMPO21').DataType := ftString;
     QryAux.ParamByName('CAMPO22').DataType := ftString;
     QryAux.ParamByName('CAMPO23').DataType := ftString;
     QryAux.ParamByName('CAMPO24').DataType := ftString;
     QryAux.ParamByName('CAMPO25').DataType := ftString;
     QryAux.ParamByName('CAMPO27').DataType := ftString;

     QryAux.ParamByName('IDCHAVETEMP').AsString :=     'MAPARF';
     QryAux.ParamByName('CAMPO3').AsString :=      QryAnalitico.FieldByname('PLANPRVCONTABPATRO').asString;
     QryAux.ParamByName('CAMPO4').AsString :=      QryAnalitico.FieldByname('CLASSE').asString;
     QryAux.ParamByName('CAMPO5').AsString :=      QryAnalitico.FieldByname('INVESTIMENTO').asString;
     QryAux.ParamByName('CAMPO6').AsString :=      QryAnalitico.FieldByname('DATAOPERACAO').asString;
     QryAux.ParamByName('CAMPO7').AsString :=      QryAnalitico.FieldByname('VENCIMENTO').asString;
     QryAux.ParamByName('CAMPO8').AsString :=      QryAnalitico.FieldByname('IDOPERRENFIX').asString;
     QryAux.ParamByName('IDINVESTIMENTO').AsInteger := QryAnalitico.FieldByname('IDINVESTIMENTO').asInteger;
     QryAux.ParamByName('CAMPO9').AsString :=      QryAnalitico.FieldByname('IDOPERRENFIX').asString;
     QryAux.ParamByName('IDPLANPREVCTBPATR').AsInteger := QryAnalitico.FieldByname('IDPLANPREVCTBPATR').asInteger;
     QryAux.ParamByName('CAMPO10').AsString :=      QryAnalitico.FieldByname('VALORAPLICADO').asString;
     QryAux.ParamByName('CAMPO11').AsString :=      QryAnalitico.FieldByname('SALDOANTERIOR').asString;
     QryAux.ParamByName('CAMPO12').AsString :=      QryAnalitico.FieldByname('SALDO').asString;
     QryAux.ParamByName('CAMPO13').AsString :=      QryAnalitico.FieldByname('CORRECAO').asString;
     QryAux.ParamByName('CAMPO14').AsString :=      QryAnalitico.FieldByname('JUROS').asString;
     QryAux.ParamByName('CAMPO15').AsString :=      QryAnalitico.FieldByname('VLRPROVPERDA').asString;
     QryAux.ParamByName('CAMPO16').AsString :=      QryAnalitico.FieldByname('AGIODESAGIO').asString;
     QryAux.ParamByName('CAMPO17').AsString :=      QryAnalitico.FieldByname('VLRIOF').asString;
     QryAux.ParamByName('CAMPO18').AsString :=      QryAnalitico.FieldByname('RESGATES').asString;
     QryAux.ParamByName('CAMPO19').AsString :=      QryAnalitico.FieldByname('LUCPREJ').asString;
     QryAux.ParamByName('CAMPO20').AsString :=      QryAnalitico.FieldByname('APLICACOES').asString;
     QryAux.ParamByName('CAMPO21').AsString :=      QryAnalitico.FieldByname('PRINCIPAL').asString;
     QryAux.ParamByName('CAMPO22').AsString :=      QryAnalitico.FieldByname('PAGTOJUR').asString;
     QryAux.ParamByName('CAMPO23').AsString :=      QryAnalitico.FieldByname('TRCPLANO').asString;
     QryAux.ParamByName('CAMPO24').AsString :=      QryAnalitico.FieldByname('DIF').asString;
     QryAux.ParamByName('CAMPO25').AsString :=      dtDataInicio.Text + ' a ' + dtDataFim.Text;
     QryAux.ParamByName('CAMPO27').AsString :=      QryAnalitico.FieldByName('SEGMENTACAO').AsString;

     QryAux.execsql;


     QryAnalitico.Next;

   end;


   with OperComum do
   begin
      DmRelRFMapaMensal.qryMapaMensalRF.close;
      DmRelRFMapaMensal.qryMapaMensalRF.Open;

      if not DmRelRFMapaMensal.qryMapaMensalRF.IsEmpty then
      begin
         DmRelRFMapaMensal.qryMapaMensalRFAnalitico.close;
         DmRelRFMapaMensal.qryMapaMensalRFAnalitico.Open;

         //AL_2 Fim

         // AL_4

         // AL_6

         if not fModal then
          begin

            TfrmPreview.CreateModalPreview(Application,
                                           DmRelRFMapaMensal.rptMapaMensalRF,
                                           DmRelRFMapaMensal.rptMapaMensalRF.PrinterSetup.DocumentName);
          end
         else
            DmRelRFMapaMensal.rptMapaMensalRF.PrintToDevices;

      end
      else
      begin
         //AL_3
         MsgDlg('Nenhum saldo foi encontrado neste período.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dtDataInicio.CanFocus then
            dtDataInicio.SetFocus;
      end;
   end;

   if fModal then
      bbtnSair.Click;

end;

procedure TfrmParamMapaInvRF.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

procedure TfrmParamMapaInvRF.FormShow(Sender: TObject);
begin
   inherited;
   //AL_1
   qryPlanPrevCtbPatr.Open;
   //AL_6
   qrySegmentacao.Open;
   qryClasse.Open;
   qryEmissor.Open;
   qryInvestimento.Open;
end;

procedure TfrmParamMapaInvRF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   //AL_1
   qryPlanPrevCtbPatr.Close;
   //AL_6
   qrySegmentacao.Close;
   qryClasse.Close;
   qryEmissor.Close;
   qryInvestimento.Close;
   //AL_2
   DmRelRFMapaMensal.qryMapaMensalRFAnalitico.Close;
   DmRelRFMapaMensal.qryMapaMensalRF.Close;
end;

//AL_6
procedure TfrmParamMapaInvRF.SetaClasse;
begin
   OperComum.LimpaParametros(qryClasse);
   if Trim(dblPlanPrevCtbPatr.Text) <> '' then
      qryClasse.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
   qryClasse.Open;
end;

//AL_6
procedure TfrmParamMapaInvRF.SetaEmissor;
begin
   OperComum.LimpaParametros(qryEmissor);
   if Trim(dblPlanPrevCtbPatr.Text) <> '' then
      qryEmissor.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
   if Trim(dblClasse.Text) <> '' then
      qryEmissor.ParamByName('IDCLASSETIT').AsInteger := StrToInt(dblClasse.LookupValue);
   qryEmissor.Open;
end;

//AL_6
procedure TfrmParamMapaInvRF.SetaInvestimento;
begin
   OperComum.LimpaParametros(qryInvestimento);
   if Trim(dblPlanPrevCtbPatr.Text) <> '' then
      qryInvestimento.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
   if Trim(dblClasse.Text) <> '' then
      qryInvestimento.ParamByName('IDCLASSETIT').AsInteger := StrToInt(dblClasse.LookupValue);
   if Trim(dblEmissor.Text) <> '' then
      qryInvestimento.ParamByName('IDEMISSOR').AsInteger := StrToInt(dblEmissor.LookupValue);
   qryInvestimento.Open;
end;

//AL_6
procedure TfrmParamMapaInvRF.dblPlanPrevCtbPatrCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
   begin
      SetaClasse;
      SetaEmissor;
      SetaInvestimento;
   end;
end;

//AL_6
procedure TfrmParamMapaInvRF.dblPlanPrevCtbPatrChange(Sender: TObject);
begin
   inherited;
   if Trim(dblPlanPrevCtbPatr.Text) = '' then
   begin
      SetaClasse;
      SetaEmissor;
      SetaInvestimento;                                    
   end;
end;

//AL_6
procedure TfrmParamMapaInvRF.dblClasseCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   begin
      SetaEmissor;
      SetaInvestimento;
   end;
end;

//AL_6
procedure TfrmParamMapaInvRF.dblClasseChange(Sender: TObject);
begin
   inherited;
   if Trim(dblClasse.Text) = '' then
   begin
      SetaEmissor;
      SetaInvestimento;
   end;
end;

//AL_6
procedure TfrmParamMapaInvRF.dblEmissorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   SetaInvestimento;
end;

//AL_6
procedure TfrmParamMapaInvRF.dblEmissorChange(Sender: TObject);
begin
   inherited;
   if Trim(dblEmissor.Text) = '' then
      SetaInvestimento;
end;

procedure TfrmParamMapaInvRF.dtDataFimExit(Sender: TObject);
var
sInicio:string;

begin
  inherited;

//  DmRelRFMapaMensal.lblPeriodo.Caption :=sInicio ;
end;

function TfrmParamMapaInvRF.InsertAnalitico:string;
var
sSQL:string;

begin
sSQL:= 'SELECT ''MAPARF''                                                                                                                                                                                                           '+
',PLANPRVCONTABPATRO                                                                                                                                                                                                         '+
',CLASSE                                                                                                                                                                                                                     '+
',INVESTIMENTO                                                                                                                                                                                                               '+
',TO_CHAR(DATAOPERACAO,''DD/MM/YYYY'') DATAOPERACAO                                                                                                                                                                          '+
',TO_CHAR(VENCIMENTO,''DD/MM/YYYY'') VENCIMENTO                                                                                                                                                                              '+
',IDOPERRENFIX                                                                                                                                                                                                               '+
',IDINVESTIMENTO                                                                                                                                                                                                             '+
',IDOPERRENFIX                                                                                                                                                                                                               '+
',IDPLANPREVCTBPATR                                                                                                                                                                                                          '+
',VALORAPLICADO                                                                                                                                                                                                              '+
',SALDOANTERIOR                                                                                                                                                                                                              '+
',SALDO                                                                                                                                                                                                                      '+
',CORRECAO                                                                                                                                                                                                                   '+
',JUROS                                                                                                                                                                                                                      '+
',VLRPROVPERDA                                                                                                                                                                                                               '+
',AGIODESAGIO                                                                                                                                                                                                                '+
',VLRIOF                                                                                                                                                                                                                     '+
',RESGATES                                                                                                                                                                                                                   '+
',LUCPREJ                                                                                                                                                                                                                    '+
',APLICACOES                                                                                                                                                                                                                 '+
',PRINCIPAL                                                                                                                                                                                                                  '+
',PAGTOJUR                                                                                                                                                                                                                   '+
',TRCPLANO                                                                                                                                                                                                                   '+
',DIF                                                                                                                                                                                                                        '+
' FROM (                                                                                                                                                                                                                     '+
'WITH                                                                                                                                                                                                                        '+
' TRO AS (SELECT OO.QTDEOPERACAO AS QTDEORIG, (OO.QTDEOPERACAO-OT.QTDTRC) AS QTDETRC,                                                                                                                                        '+
'           (OO.QTDEOPERACAO-OT.QTDTRC) / OO.QTDEOPERACAO AS PERC,                                                                                                                                                           '+
'           OO.IDINVESTIMENTO, OO.IDOPERRENFIXAPLIC, OO.IDOPERRENFIXORIG                                                                                                                                                     '+
'    FROM (SELECT OOR.QTDEOPERACAO, OOR.IDINVESTIMENTO, OOR.IDOPERRENFIXAPLIC, OOR.IDOPERRENFIXORIG                                                                                                                          '+
'          FROM OPERRENFIX OOR                                                                                                                                                                                               '+
'          WHERE OOR.IDOPERRENFIX = OOR.IDOPERRENFIXAPLIC                                                                                                                                                                    '+
'            AND OOR.IDOPERRENFIXORIG IS NULL ) OO,                                                                                                                                                                          '+
'         (SELECT SUM(OTR.QTDEOPERACAO) AS QTDTRC, OTR.IDINVESTIMENTO, OTR.IDOPERRENFIXAPLIC, OTR.IDOPERRENFIXORIG                                                                                                           '+
'          FROM OPERRENFIX OTR                                                                                                                                                                                               '+
'          WHERE OTR.IDTIPOOPERACAO = -97                                                                                                                                                                                    '+
'          GROUP BY OTR.IDINVESTIMENTO, OTR.IDOPERRENFIXAPLIC, OTR.IDOPERRENFIXORIG ) OT                                                                                                                                     '+
'    WHERE OO.IDINVESTIMENTO = OT.IDINVESTIMENTO                                                                                                                                                                             '+
'      AND OO.IDOPERRENFIXAPLIC = OT.IDOPERRENFIXAPLIC ),                                                                                                                                                                    '+
' TRD AS (SELECT SUM(OP1.QTDEOPERACAO) QTDTRC, SUM(OP2.QTDEOPERACAO) QTDORIG, (SUM(OP1.QTDEOPERACAO) / SUM(OP2.QTDEOPERACAO)) PERC,                                                                                          '+
'           OP1.IDINVESTIMENTO, OP1.IDOPERRENFIXAPLIC, OP1.IDOPERRENFIXORIG                                                                                                                                                  '+
'    FROM OPERRENFIX OP1, OPERRENFIX OP2                                                                                                                                                                                     '+
'    WHERE OP1.IDTIPOOPERACAO = -98                                                                                                                                                                                          '+
'    AND OP1.IDOPERRENFIXORIG = OP2.IDOPERRENFIX                                                                                                                                                                             '+
'    GROUP BY OP1.IDINVESTIMENTO, OP1.IDOPERRENFIXAPLIC, OP1.IDOPERRENFIXORIG) ,                                                                                                                                             '+
' PP AS  (SELECT PA.IDPLANPREVCTBPATR, (''Plano / Patrocinadora: '' || PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO                                                                                                    '+
'    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL                                                                                                                                                             '+
'    WHERE (PA.IDPATRO = PE.IDPESSOA(+))                                                                                                                                                                                     '+
'    AND (PA.IDPLANOPREV = PL.IDPLANOPREV)),                                                                                                                                                                                 '+
' JRO AS (SELECT (O.VLROPERACAO) AS VLRPAGTOJURO, O.IDOPERRENFIXAPLIC, O.DATAOPERACAO AS DATAHISTRENFIX, O.IDINVESTIMENTO                                                                                                    '+
'           FROM OPERRENFIX O, PARAMINVEST P                                                                                                                                                                                 '+
'           WHERE                                                                                                                                                                                                            '+
'             (((P.FLGREGIMECXCOMP  = ''S'') AND (O.DATALIQUIDACAO BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND TO_DATE(:DATAFIM,''DD/MM/YYYY''))) OR                                                                        '+
'              ((NVL(P.FLGREGIMECXCOMP,''N'') = ''N'') AND (O.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND TO_DATE(:DATAFIM,''DD/MM/YYYY''))))                                                                  '+
'             AND (O.DATAOPERACAO <> O.DATALIQUIDACAO)                                                                                                                                                                       '+
'             AND (O.IDTIPOOPERACAO = -17) ),                                                                                                                                                                                '+
' JRO2 AS           (SELECT (O.VLROPERACAO) AS VLRPAGTOJURO, O.IDOPERRENFIXAPLIC, O.DATAOPERACAO AS DATAHISTRENFIX, O.IDINVESTIMENTO                                                                                         '+
'           FROM OPERRENFIX O                                                                                                                                                                                                '+
'           WHERE (O.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND TO_DATE(:DATAFIM,''DD/MM/YYYY''))                                                                                                             '+
'             AND (O.DATAOPERACAO <> O.DATALIQUIDACAO)                                                                                                                                                                       '+
'             AND (O.IDTIPOOPERACAO = -17) ),                                                                                                                                                                                '+
' HIS AS (SELECT                                                                                                                                                                                                             '+
'                 HI0.IDHISTRENFIX, HI0.IDINVESTIMENTO, HI0.IDOPERRENFIXAPLIC, HI0.IDPLANPREVCTBPATR,                                                                                                                        '+
'                 HI0.IDOPERRENFIX,                                                                                                                                                                                          '+
'                 DECODE(IV.IDCLASSETIT, PR.IDCLASSPOUPBLOQ, ''S'', DECODE(IV.IDCLASSETIT, PR.IDCLASSETIT, ''S'', ''N'')) AS POUP                                                                                            '+
'              FROM HISTRENFIX HI0, INVESTIMENTO IV,                                                                                                                                                                         '+
'                   (SELECT IDCLASSPOUPBLOQ, IDCLASSETIT FROM PARAMINVEST) PR                                                                                                                                                '+
'              WHERE (HI0.DATAHISTRENFIX BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND                                                                                                                                        '+
'                                                TO_DATE(:DATAFIM, ''DD/MM/YYYY''))                                                                                                                                          '+
'               AND (HI0.TIPMOVHISRENFIX = ''ATU'')                                                                                                                                                                          '+
'               AND (HI0.IDINVESTIMENTO = IV.IDINVESTIMENTO)),                                                                                                                                                               '+
'  QTD AS  (SELECT TO_NUMBER(CAMPO3) IDHISTRENFIX, TO_NUMBER(CAMPO7) PUACUITEM, CAMPO2 TIPOITEM, NVL(TO_NUMBER(CAMPO8),0) AS VLRITEM                                                                                         '+
'              FROM INVESTIMENTOGLOBAL                                                                                                                                                                                       '+
'              WHERE IDCHAVETEMP = ''ITENS'' AND CAMPO1 = ''-2'' --IDITEMRENFIX                                                                                                                                              '+
'           ),                                                                                                                                                                                                               '+
'  COR AS (SELECT TO_NUMBER(CAMPO3) IDHISTRENFIX, SUM(TO_NUMBER(CAMPO6)) AS PUITEM, CAMPO2 TIPOITEM,                                                                                                                         '+
'                     SUM(NVL(TO_NUMBER(CAMPO8),0)) AS VLRITEM, SUM(NVL(TO_NUMBER(CAMPO9),0)) AS VLRACUITEM                                                                                                                  '+
'              FROM INVESTIMENTOGLOBAL                                                                                                                                                                                       '+
'              WHERE IDCHAVETEMP = ''ITENS'' AND CAMPO2 = ''M''                                                                                                                                                              '+
'              GROUP BY TO_NUMBER(CAMPO3), CAMPO2),                                                                                                                                                                          '+
'  JUR AS (SELECT TO_NUMBER(CAMPO3) IDHISTRENFIX,TO_NUMBER(CAMPO6) PUITEM,  CAMPO2 TIPOITEM,                                                                                                                                 '+
'                     NVL(TO_NUMBER(CAMPO8),0) AS VLRITEM, NVL(TO_NUMBER(CAMPO9),0) AS VLRACUITEM                                                                                                                            '+
'              FROM INVESTIMENTOGLOBAL                                                                                                                                                                                       '+
'              WHERE IDCHAVETEMP = ''ITENS'' AND CAMPO2 = ''T'' --TIPOITEM                                                                                                                                                   '+
'         ),                                                                                                                                                                                                                 '+
'  PCOR AS (SELECT TO_NUMBER(CAMPO3) IDHISTRENFIX,TO_NUMBER(CAMPO6) PUITEM, CAMPO2 TIPOITEM,                                                                                                                                 '+
'                     NVL(TO_NUMBER(CAMPO8),0) AS VLRITEM, NVL(TO_NUMBER(CAMPO9),0) AS VLRACUITEM                                                                                                                            '+
'              FROM INVESTIMENTOGLOBAL                                                                                                                                                                                       '+
'              WHERE IDCHAVETEMP = ''ITENS'' AND CAMPO1 = ''26'' --IDITEMRENFIX                                                                                                                                              '+
'           ),                                                                                                                                                                                                               '+
'  PJUR AS (SELECT TO_NUMBER(CAMPO3) IDHISTRENFIX, TO_NUMBER(CAMPO6) PUITEM, CAMPO2 TIPOITEM,                                                                                                                                '+
'                     NVL(TO_NUMBER(CAMPO8),0) AS VLRITEM, NVL(TO_NUMBER(CAMPO9),0) AS VLRACUITEM                                                                                                                            '+
'              FROM INVESTIMENTOGLOBAL                                                                                                                                                                                       '+
'              WHERE IDCHAVETEMP = ''ITENS'' AND CAMPO1 = ''27'' --IDITEMRENFIX                                                                                                                                              '+
'          ),                                                                                                                                                                                                                '+
'  PPER AS (SELECT TO_NUMBER(CAMPO3) IDHISTRENFIX, TO_NUMBER(CAMPO6) PUITEM, CAMPO2 TIPOITEM,                                                                                                                                '+
'                     NVL(TO_NUMBER(CAMPO8),0) AS VLRITEM, NVL(TO_NUMBER(CAMPO9),0) AS VLRACUITEM                                                                                                                            '+
'              FROM INVESTIMENTOGLOBAL                                                                                                                                                                                       '+
'              WHERE IDCHAVETEMP = ''ITENS'' AND CAMPO1 = ''-15'' --IDITEMRENFIX                                                                                                                                             '+
'          ),                                                                                                                                                                                                                '+
'  AGI AS (SELECT TO_NUMBER(CAMPO3) IDHISTRENFIX, TO_NUMBER(CAMPO6) PUITEM, CAMPO2 TIPOITEM,                                                                                                                                 '+
'                     NVL(TO_NUMBER(CAMPO8),0) AS VLRITEM, NVL(TO_NUMBER(CAMPO9),0) AS VLRACUITEM                                                                                                                            '+
'              FROM INVESTIMENTOGLOBAL                                                                                                                                                                                       '+
'              WHERE IDCHAVETEMP = ''ITENS'' AND CAMPO1 = ''-19'' --IDITEMRENFIX                                                                                                                                             '+
'         ),                                                                                                                                                                                                                 '+
' DES AS (SELECT TO_NUMBER(CAMPO3) IDHISTRENFIX,TO_NUMBER(CAMPO6) PUITEM,CAMPO2 TIPOITEM,                                                                                                                                    '+
'                     NVL(TO_NUMBER(CAMPO8),0) AS VLRITEM, NVL(TO_NUMBER(CAMPO9),0) AS VLRACUITEM                                                                                                                            '+
'              FROM INVESTIMENTOGLOBAL                                                                                                                                                                                       '+
'              WHERE IDCHAVETEMP = ''ITENS'' AND CAMPO1 = ''-20'' --IDITEMRENFIX                                                                                                                                             '+
'        ),                                                                                                                                                                                                                  '+
' IOF AS (SELECT TO_NUMBER(G.CAMPO3)IDHISTRENFIX, NVL(TO_NUMBER(CAMPO7),0) AS VLRIOF,G.CAMPO2 TIPOITEM                                                                                                                       '+
'              FROM INVESTIMENTOGLOBAL G , HISTRENFIX HH8                                                                                                                                                                    '+
'              WHERE G.IDCHAVETEMP = ''ITENS''                                                                                                                                                                               '+
'              AND  HH8.DATAHISTRENFIX = TO_DATE(:DATAFIM, ''DD/MM/YYYY'')                                                                                                                                                   '+
'              AND  G.CAMPO1 = ''-8'' --IDITEMRENFIX                                                                                                                                                                         '+
'              AND  HH8.TIPMOVHISRENFIX = ''ATU''                                                                                                                                                                            '+
'              AND  TO_NUMBER(G.CAMPO3) = HH8.IDHISTRENFIX),                                                                                                                                                                 '+
' LUCPREJ AS (SELECT TO_NUMBER(G.CAMPO3)IDHISTRENFIX, TO_NUMBER(G.CAMPO6) PUITEM, HT.IDOPERRENFIX, TO_NUMBER(G.CAMPO8)VLRITEM                                                                                                '+
'              FROM INVESTIMENTOGLOBAL G, HISTRENFIX HT                                                                                                                                                                      '+
'              WHERE G.IDCHAVETEMP = ''ITENS''                                                                                                                                                                               '+
'              AND   G.CAMPO1 IN (''-9'',''-10'') --IDITEMRENFIX                                                                                                                                                             '+
'              AND HT.DATAHISTRENFIX BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND                                                                                                                                            '+
'                                              TO_DATE(:DATAFIM,''DD/MM/YYYY'')                                                                                                                                              '+
'              AND G.CAMPO6 <> ''0'' --PUITEM                                                                                                                                                                                '+
'              AND HT.TIPMOVHISRENFIX = ''OPE''                                                                                                                                                                              '+
'              AND HT.NATURMOVHISTRENFI = ''D''                                                                                                                                                                              '+
'              AND TO_NUMBER(G.CAMPO3) = HT.IDHISTRENFIX),                                                                                                                                                                   '+
'   VLRAPL1 AS (SELECT (OP.IDINVESTIMENTO || OP.IDOPERRENFIXAPLIC || OP.IDPLANPREVCTBPATR) AS ID,                                                                                                                            '+
'                  OP.IDINVESTIMENTO,                                                                                                                                                                                        '+
'                  OP.IDOPERRENFIXAPLIC,                                                                                                                                                                                     '+
'                  OP.IDPLANPREVCTBPATR,                                                                                                                                                                                     '+
'                  SUM(NVL(OP.VLROPERACAO,0))  AS VLROPERACAO                                                                                                                                                                '+
'           FROM OPERRENFIX OP, TIPOOPERACAO TP                                                                                                                                                                              '+
'           WHERE TP.IDTIPOINVEST = 1                                                                                                                                                                                        '+
'              AND (OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)                                                                                                                                                                  '+
'              AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO                                                                                                                                                                     '+
'           GROUP BY OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, OP.IDPLANPREVCTBPATR),                                                                                                                                         '+
' RSG AS (SELECT (OP.IDINVESTIMENTO || OP.IDOPERRENFIXAPLIC || OP.IDPLANPREVCTBPATR) AS ID,                                                                                                                                  '+
'             OP.IDINVESTIMENTO,                                                                                                                                                                                             '+
'             OP.IDOPERRENFIXAPLIC,                                                                                                                                                                                          '+
'             OP.IDPLANPREVCTBPATR,                                                                                                                                                                                          '+
'             SUM(NVL(OP.VLROPERACAO,0)) - SUM(DECODE(NVL(LUCPREJ.VLRITEM,0),0,ROUND(NVL(LUCPREJ.PUITEM,0),2),NVL(LUCPREJ.VLRITEM,0) )) AS VLROPERLIQ,                                                                       '+
'             SUM(NVL(OP.VLROPERACAO,0)) AS VLROPERACAO,                                                                                                                                                                     '+
'             SUM(DECODE(NVL(LUCPREJ.VLRITEM,0),0,ROUND(NVL(LUCPREJ.PUITEM,0),2),NVL(LUCPREJ.VLRITEM,0) )) AS VLRLUCPREJ                                                                                                     '+
'          FROM OPERRENFIX OP, TIPOOPERACAO TP, LUCPREJ                                                                                                                                                                      '+
'          WHERE TP.IDTIPOINVEST = 1                                                                                                                                                                                         '+
'            AND ((TP.IDTIPOOPERACAO > 0) AND (TP.NATUREZAOPERACAO = ''D''))                                                                                                                                                   '+
'            AND OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND                                                                                                                                                  '+
'                                        TO_DATE(:DATAFIM,''DD/MM/YYYY'')                                                                                                                                                      '+
'            AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO                                                                                                                                                                       '+
'            AND OP.IDOPERRENFIX = LUCPREJ.IDOPERRENFIX(+)                                                                                                                                                                   '+
'          GROUP BY OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, OP.IDPLANPREVCTBPATR)                                                                                                                                           '+
'SELECT                                                                                                                                                                                                                      '+
'   PP.PLANPRVCONTABPATRO,                                                                                                                                                                                                   '+
'   CL.DESCCLASSETIT AS CLASSE,                                                                                                                                                                                              '+
'   IV.DESCINVESTIMENTO AS INVESTIMENTO,                                                                                                                                                                                     '+
'   OP.DATAOPERACAO,                                                                                                                                                                                                         '+
'   OP.VENCOPERACAO AS VENCIMENTO,                                                                                                                                                                                           '+
'   OP.IDOPERRENFIX,                                                                                                                                                                                                         '+
'   SUB1.IDINVESTIMENTO,                                                                                                                                                                                                     '+
'   SUB1.IDOPERRENFIXAPLIC,                                                                                                                                                                                                  '+
'   SUB1.IDPLANPREVCTBPATR,                                                                                                                                                                                                  '+
'   SUB1.VALORAPLICADO,                                                                                                                                                                                                      '+
'   SUB1.SALDOANTERIOR,                                                                                                                                                                                                      '+
'   SUB1.SALDOATUAL AS SALDO,                                                                                                                                                                                                '+
'   SUB1.VLRCOR AS CORRECAO,                                                                                                                                                                                                 '+
'   SUB1.VLRJUR AS JUROS,                                                                                                                                                                                                    '+
'   SUB1.VLRPROVPERDA,                                                                                                                                                                                                       '+
'   SUB1.AGIODESAGIO,                                                                                                                                                                                                        '+
'   SUB1.VLRIOF,                                                                                                                                                                                                             '+
'   SUB1.RESGATES,                                                                                                                                                                                                           '+
'   SUB1.LUCPREJ,                                                                                                                                                                                                            '+
'   SUB1.APLICACOES,                                                                                                                                                                                                         '+
'   SUB1.PRINCIPAL,                                                                                                                                                                                                          '+
'   SUB1.PAGTOJUR,                                                                                                                                                                                                           '+
'   SUB1.TRCPLANO,                                                                                                                                                                                                           '+
'   (                                                                                                                                                                                                                        '+
'    SUB1.SALDOANTERIOR +                                                                                                                                                                                                    '+
'    SUB1.APLICACOES +                                                                                                                                                                                                       '+
'    SUB1.VLRJUR +                                                                                                                                                                                                           '+
'    SUB1.VLRCOR +                                                                                                                                                                                                           '+
'    NVL((DECODE(SUB1.VLRPROVPERDA,0,0,((SUB1.VLRPCOR + SUB1.VLRPJUR) * -1))),0) -                                                                                                                                           '+
'    SUB1.RESGATES +                                                                                                                                                                                                         '+
'    SUB1.LUCPREJ +                                                                                                                                                                                                          '+
'    SUB1.PAGTOJUR -                                                                                                                                                                                                         '+
'    SUB1.VLRIOF -                                                                                                                                                                                                           '+
'    (SUB1.SALDOATUAL - SUB1.VLRIOF) +                                                                                                                                                                                       '+
'    SUB1.TRCPLANO                                                                                                                                                                                                           '+
'   ) AS DIF                                                                                                                                                                                                                 '+
'FROM                                                                                                                                                                                                                        '+
'   INVESTIMENTO IV, CLASSETITRENFIX CL, OPERRENFIX OP, OPERRENFIX OP1, TRO, TRD, PP,                                                                                                                                        '+
'--  SUB1 - SOMOTORIO DOS UNIONS                                                                                                                                                                                             '+
'   (SELECT                                                                                                                                                                                                                  '+
'       SUB.IDINVESTIMENTO,                                                                                                                                                                                                  '+
'       SUB.IDOPERRENFIXAPLIC,                                                                                                                                                                                               '+
'       SUB.IDPLANPREVCTBPATR,                                                                                                                                                                                               '+
'       SUM(SUB.VALORAPLICADO) AS VALORAPLICADO,                                                                                                                                                                             '+
'       SUM(SUB.SALDOANTERIOR) AS SALDOANTERIOR,                                                                                                                                                                             '+
'       (SUM(SUB.SALDOATUAL) + SUM(SUB.VLRIOF)) AS SALDOATUAL,                                                                                                                                                               '+
'       SUM(SUB.VLRCOR) AS VLRCOR,                                                                                                                                                                                           '+
'       SUM(SUB.VLRJUR) AS VLRJUR,                                                                                                                                                                                           '+
'       SUM(SUB.VLRPROVPERDA) AS VLRPROVPERDA,                                                                                                                                                                               '+
'       SUM(SUB.VLRPCOR) AS VLRPCOR,                                                                                                                                                                                         '+
'       SUM(SUB.VLRPJUR) AS VLRPJUR,                                                                                                                                                                                         '+
'       SUM(SUB.AGIODESAGIO) AS AGIODESAGIO,                                                                                                                                                                                 '+
'       SUM(SUB.VLRIOF) AS VLRIOF,                                                                                                                                                                                           '+
'       SUM(SUB.RESGATES) AS RESGATES,                                                                                                                                                                                       '+
'       SUM(SUB.LUCPREJ) AS LUCPREJ,                                                                                                                                                                                         '+
'       SUM(SUB.APLICACOES) AS APLICACOES,                                                                                                                                                                                   '+
'       SUM(SUB.PRINCIPAL) AS PRINCIPAL,                                                                                                                                                                                     '+
'       SUM(SUB.PAGTOJUR) AS PAGTOJUR,                                                                                                                                                                                       '+
'       SUM(SUB.TRCPLANO) AS TRCPLANO                                                                                                                                                                                        '+
'    FROM                                                                                                                                                                                                                    '+
'--    SUB - UNION DOS SELECTS                                                                                                                                                                                               '+
'      (                                                                                                                                                                                                                     '+
'--     SALDO ANTERIOR                                                                                                                                                                                                       '+
'       SELECT                                                                                                                                                                                                               '+
'          HR.IDINVESTIMENTO,                                                                                                                                                                                                '+
'          HR.IDOPERRENFIXAPLIC,                                                                                                                                                                                             '+
'          HR.IDPLANPREVCTBPATR,                                                                                                                                                                                             '+
'          OP.DATAOPERACAO,                                                                                                                                                                                                  '+
'          (OP.VENCOPERACAO) AS VENCIMENTO,                                                                                                                                                                                  '+
'          0 AS VALORAPLICADO,                                                                                                                                                                                               '+
'          DECODE(:FLGREGIMECXCOMP, ''S'', NVL(HR.SALDOVLRHISTRENFI,0) - NVL(JRO.VLRPAGTOJURO,0), NVL(HR.SALDOVLRHISTRENFI,0) ) AS SALDOANTERIOR,                                                                              '+
'          0 AS SALDOATUAL,                                                                                                                                                                                                  '+
'          0 AS VLRCOR,                                                                                                                                                                                                      '+
'          0 AS VLRJUR,                                                                                                                                                                                                      '+
'          0 AS VLRPROVPERDA,                                                                                                                                                                                                '+
'          0 AS VLRPCOR,                                                                                                                                                                                                     '+
'          0 AS VLRPJUR,                                                                                                                                                                                                     '+
'          0 AS AGIODESAGIO,                                                                                                                                                                                                 '+
'          0 AS VLRIOF,                                                                                                                                                                                                      '+
'          0 AS RESGATES,                                                                                                                                                                                                    '+
'          0 AS LUCPREJ,                                                                                                                                                                                                     '+
'          0 AS APLICACOES,                                                                                                                                                                                                  '+
'          0 AS PRINCIPAL,                                                                                                                                                                                                   '+
'          0 AS PAGTOJUR,                                                                                                                                                                                                    '+
'          0 AS TRCPLANO                                                                                                                                                                                                     '+
'       FROM                                                                                                                                                                                                                 '+
'          HISTRENFIX HR, OPERRENFIX OP, JRO                                                                                                                                                                                 '+
'       WHERE (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)                                                                                                                                                                       '+
'         AND (HR.SALDOQTDHISTRENFI > 0)                                                                                                                                                                                     '+
'         AND ((OP.VENCOPERACAO >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) OR (OP.VENCOPERACAO IS NULL))                                                                                                                             '+
'         AND (HR.IDHISTRENFIX IN (SELECT MAX(H1.IDHISTRENFIX)                                                                                                                                                               '+
'                                  FROM HISTRENFIX H1                                                                                                                                                                        '+
'                                  WHERE (H1.DATAHISTRENFIX || H1.IDPLANPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN                                                                                         '+
'                                        (SELECT MAX(H2.DATAHISTRENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC                                                                                 '+
'                                         FROM HISTRENFIX H2                                                                                                                                                                 '+
'                                         WHERE (H2.DATAHISTRENFIX < TO_DATE(:DATAINI,''DD/MM/YYYY''))                                                                                                                         '+
'                                         GROUP BY H2.IDPLANPREVCTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC)                                                                                                            '+
'                                  GROUP BY H1.DATAHISTRENFIX, H1.IDPLANPREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))                                                                                               '+
'         AND HR.IDOPERRENFIXAPLIC = JRO.IDOPERRENFIXAPLIC(+)                                                                                                                                                                '+
'         AND HR.DATAHISTRENFIX    = JRO.DATAHISTRENFIX(+)                                                                                                                                                                   '+
'       UNION                                                                                                                                                                                                                '+
'--     SALDO ATUAL                                                                                                                                                                                                          '+
'       SELECT                                                                                                                                                                                                               '+
'          HR.IDINVESTIMENTO,                                                                                                                                                                                                '+
'          HR.IDOPERRENFIXAPLIC,                                                                                                                                                                                             '+
'          HR.IDPLANPREVCTBPATR,                                                                                                                                                                                             '+
'          OP.DATAOPERACAO,                                                                                                                                                                                                  '+
'          (OP.VENCOPERACAO) AS VENCIMENTO,                                                                                                                                                                                  '+
'          0 AS VALORAPLICADO,                                                                                                                                                                                               '+
'          0 AS SALDOANTERIOR,                                                                                                                                                                                               '+
'          DECODE(:FLGREGIMECXCOMP, ''S'', NVL(HR.SALDOVLRHISTRENFI,0) + NVL(JRO2.VLRPAGTOJURO,0) , NVL(HR.SALDOVLRHISTRENFI,0) ) AS SALDOATUAL,                                                                               '+
'          0.VLRCOR,                                                                                                                                                                                                         '+
'          0.VLRJUR,                                                                                                                                                                                                         '+
'          0 AS VLRPROVPERDA,                                                                                                                                                                                                '+
'          0 AS VLRPCOR,                                                                                                                                                                                                     '+
'          0 AS VLRPJUR,                                                                                                                                                                                                     '+
'          0 AS AGIODESAGIO,                                                                                                                                                                                                 '+
'          0.VLRIOF,                                                                                                                                                                                                         '+
'          0 AS RESGATES,                                                                                                                                                                                                    '+
'          0 AS LUCPREJ,                                                                                                                                                                                                     '+
'          0 AS APLICACOES,                                                                                                                                                                                                  '+
'          HI.PUACUITEM AS PRINCIPAL,                                                                                                                                                                                        '+
'          0 AS PAGTOJUR,                                                                                                                                                                                                    '+
'          0 AS TRCPLANO                                                                                                                                                                                                     '+
'       FROM                                                                                                                                                                                                                 '+
'          HISTRENFIX HR, OPERRENFIX OP, HISTRENFIXXITENS HI, JRO2                                                                                                                                                           '+
'       WHERE (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)                                                                                                                                                                       '+
'         AND (HR.SALDOQTDHISTRENFI > 0)                                                                                                                                                                                     '+
'         AND (HI.IDITEMRENFIX = -1)                                                                                                                                                                                         '+
'         AND ((OP.VENCOPERACAO >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) OR (OP.VENCOPERACAO IS NULL))                                                                                                                             '+
'         AND (HR.IDHISTRENFIX IN (SELECT MAX(H1.IDHISTRENFIX)                                                                                                                                                               '+
'                                  FROM HISTRENFIX H1                                                                                                                                                                        '+
'                                  WHERE (H1.DATAHISTRENFIX <= TO_DATE(:DATAFIM,''DD/MM/YYYY''))                                                                                                                               '+
'                                    AND (H1.DATAHISTRENFIX || H1.IDPLANPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN                                                                                         '+
'                                        (SELECT MAX(H2.DATAHISTRENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC                                                                                 '+
'                                         FROM HISTRENFIX H2                                                                                                                                                                 '+
'                                         WHERE (H2.DATAHISTRENFIX BETWEEN TO_DATE(:DATAFIM,''DD/MM/YYYY'') AND                                                                                                                '+
'                                                                          TO_DATE(:DATAFIM,''DD/MM/YYYY''))                                                                                                                   '+
'                                         GROUP BY H2.IDPLANPREVCTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC)                                                                                                            '+
'                                  GROUP BY H1.DATAHISTRENFIX, H1.IDPLANPREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))                                                                                               '+
'         AND HR.IDOPERRENFIXAPLIC = JRO2.IDOPERRENFIXAPLIC(+)                                                                                                                                                               '+
'         AND HR.DATAHISTRENFIX    = JRO2.DATAHISTRENFIX(+)                                                                                                                                                                  '+
'         AND HR.IDHISTRENFIX      = HI.IDHISTRENFIX                                                                                                                                                                         '+
'       UNION                                                                                                                                                                                                                '+
'--     VALORES DOS ITENS                                                                                                                                                                                                    '+
'       SELECT                                                                                                                                                                                                               '+
'          VAL.IDINVESTIMENTO,                                                                                                                                                                                               '+
'          VAL.IDOPERRENFIXAPLIC,                                                                                                                                                                                            '+
'          VAL.IDPLANPREVCTBPATR,                                                                                                                                                                                            '+
'          TO_DATE('',''DD/MM/YYYY'') AS DATAOPERACAO,                                                                                                                                                                         '+
'          TO_DATE('',''DD/MM/YYYY'') AS VENCIMENTO,                                                                                                                                                                           '+
'          0 AS VALORAPLICADO,                                                                                                                                                                                               '+
'          0 AS SALDOANTERIOR,                                                                                                                                                                                               '+
'          0 AS SALDOATUAL,                                                                                                                                                                                                  '+
'          VAL.VLRCOR,                                                                                                                                                                                                       '+
'          VAL.VLRJUR,                                                                                                                                                                                                       '+
'          (DECODE(VAL.VLRPER,0,0,(VAL.VLRPCOR + VAL.VLRPJUR) * -1)) AS VLRPROVPERDA,                                                                                                                                        '+
'          VAL.VLRPCOR,                                                                                                                                                                                                      '+
'          VAL.VLRPJUR,                                                                                                                                                                                                      '+
'          (VAL.VLRAGI - VAL.VLRDES) AS AGIODESAGIO,                                                                                                                                                                         '+
'          (VAL.VLRIOF * -1) AS VLRIOF,                                                                                                                                                                                      '+
'          0 AS RESGATES,                                                                                                                                                                                                    '+
'          0 AS LUCPREJ,                                                                                                                                                                                                     '+
'          0 AS APLICACOES,                                                                                                                                                                                                  '+
'          0 AS PRINCIPAL,                                                                                                                                                                                                   '+
'          0 AS PAGTOJUR,                                                                                                                                                                                                    '+
'          0 AS TRCPLANO                                                                                                                                                                                                     '+
'       FROM                                                                                                                                                                                                                 '+
'       (SELECT                                                                                                                                                                                                              '+
'           (HIS.IDINVESTIMENTO || HIS.IDOPERRENFIXAPLIC || HIS.IDPLANPREVCTBPATR) AS ID,                                                                                                                                    '+
'           HIS.IDINVESTIMENTO, HIS.IDOPERRENFIXAPLIC, HIS.IDPLANPREVCTBPATR,                                                                                                                                                '+
'           SUM(DECODE(HIS.POUP, ''S'', DECODE(NVL(COR.VLRITEM,0), 0, NVL(COR.PUITEM,0), NVL(COR.VLRITEM,0)),                                                                                                                  '+
'               DECODE(COR.TIPOITEM, ''V'', NVL(COR.PUITEM,0), DECODE(NVL(COR.VLRITEM,0) + NVL(COR.VLRACUITEM,0), 0, (ROUND(QTD.PUACUITEM * NVL(COR.PUITEM,0),2)),NVL(COR.VLRITEM,0))))) AS VLRCOR,                            '+
'           SUM(DECODE(HIS.POUP, ''S'', DECODE(NVL(JUR.VLRITEM,0), 0, NVL(JUR.PUITEM,0), NVL(JUR.VLRITEM,0)),                                                                                                                  '+
'               DECODE(JUR.TIPOITEM, ''V'', NVL(JUR.PUITEM,0), DECODE(NVL(JUR.VLRITEM,0) + NVL(JUR.VLRACUITEM,0), 0, (ROUND(QTD.PUACUITEM * NVL(JUR.PUITEM,0),2)),NVL(JUR.VLRITEM,0))))) AS VLRJUR,                            '+
'           SUM(DECODE(HIS.POUP, ''S'', DECODE(NVL(PCOR.VLRITEM,0), 0, NVL(PCOR.PUITEM,0), NVL(PCOR.VLRITEM,0)),                                                                                                               '+
'               DECODE(PCOR.TIPOITEM, ''V'', NVL(PCOR.PUITEM,0), DECODE(NVL(PCOR.VLRITEM,0)+NVL(PCOR.VLRACUITEM,0), 0, (ROUND(QTD.PUACUITEM * NVL(PCOR.PUITEM,0), 2)), NVL(PCOR.VLRITEM,0))))) AS VLRPCOR,                     '+
'           SUM(DECODE(HIS.POUP, ''S'', DECODE(NVL(PJUR.VLRITEM,0), 0, NVL(PJUR.PUITEM,0), NVL(PJUR.VLRITEM,0)),                                                                                                               '+
'               DECODE(PJUR.TIPOITEM, ''V'', NVL(PJUR.PUITEM,0), DECODE(NVL(PJUR.VLRITEM,0)+NVL(PJUR.VLRACUITEM,0), 0,(ROUND(QTD.PUACUITEM * NVL(PJUR.PUITEM,0), 2)), NVL(PJUR.VLRITEM,0))))) AS VLRPJUR,                      '+
'           SUM(DECODE(AGI.TIPOITEM,''V'', NVL(AGI.PUITEM,0), DECODE(NVL(AGI.VLRITEM,0)+NVL(AGI.VLRACUITEM,0), 0, (ROUND(QTD.PUACUITEM * NVL(AGI.PUITEM,0), 2)), NVL(AGI.VLRITEM,0)))) AS VLRAGI,                              '+
'           SUM(DECODE(DES.TIPOITEM,''V'', NVL(DES.PUITEM,0), DECODE(NVL(DES.VLRITEM,0)+NVL(DES.VLRACUITEM,0), 0, (ROUND(QTD.PUACUITEM * NVL(DES.PUITEM,0), 2)), NVL(DES.VLRITEM,0)))) AS VLRDES,                              '+
'           SUM(DECODE(PPER.TIPOITEM,''V'', NVL(PPER.PUITEM,0), DECODE(NVL(PPER.VLRITEM,0)+NVL(PPER.VLRACUITEM,0), 0, (ROUND(QTD.PUACUITEM * NVL(PPER.PUITEM,0), 2)), NVL(PPER.VLRITEM,0)))) AS VLRPER,                        '+
'           SUM(NVL(IOF.VLRIOF,0)) AS VLRIOF                                                                                                                                                                                 '+
'        FROM HIS, QTD, COR, JUR, PCOR, PJUR, PPER, AGI, DES, IOF                                                                                                                                                            '+
'       WHERE HIS.IDHISTRENFIX = QTD.IDHISTRENFIX                                                                                                                                                                            '+
'         AND HIS.IDHISTRENFIX = COR.IDHISTRENFIX(+)                                                                                                                                                                         '+
'         AND HIS.IDHISTRENFIX = JUR.IDHISTRENFIX(+)                                                                                                                                                                         '+
'         AND HIS.IDHISTRENFIX = PCOR.IDHISTRENFIX(+)                                                                                                                                                                        '+
'         AND HIS.IDHISTRENFIX = PJUR.IDHISTRENFIX(+)                                                                                                                                                                        '+
'         AND HIS.IDHISTRENFIX = PPER.IDHISTRENFIX(+)                                                                                                                                                                        '+
'         AND HIS.IDHISTRENFIX = AGI.IDHISTRENFIX(+)                                                                                                                                                                         '+
'         AND HIS.IDHISTRENFIX = DES.IDHISTRENFIX(+)                                                                                                                                                                         '+
'         AND HIS.IDHISTRENFIX = IOF.IDHISTRENFIX(+)                                                                                                                                                                         '+
'       GROUP BY HIS.IDINVESTIMENTO, HIS.IDOPERRENFIXAPLIC, HIS.IDPLANPREVCTBPATR) VAL                                                                                                                                       '+
'       UNION                                                                                                                                                                                                                '+
'--     RESGATES                                                                                                                                                                                                             '+
'       SELECT                                                                                                                                                                                                               '+
'          RSG.IDINVESTIMENTO,                                                                                                                                                                                               '+
'          RSG.IDOPERRENFIXAPLIC,                                                                                                                                                                                            '+
'          RSG.IDPLANPREVCTBPATR,                                                                                                                                                                                            '+
'          TO_DATE('',''DD/MM/YYYY'') AS DATAOPERACAO,                                                                                                                                                                         '+
'          TO_DATE('',''DD/MM/YYYY'') AS VENCIMENTO,                                                                                                                                                                           '+
'          0 AS VALORAPLICADO,                                                                                                                                                                                               '+
'          0 AS SALDOANTERIOR,                                                                                                                                                                                               '+
'          0 AS SALDOATUAL,                                                                                                                                                                                                  '+
'          0 AS VLRCOR,                                                                                                                                                                                                      '+
'          0 AS VLRJUR,                                                                                                                                                                                                      '+
'          0 AS VLRPROVPERDA,                                                                                                                                                                                                '+
'          0 AS VLRPCOR,                                                                                                                                                                                                     '+
'          0 AS VLRPJUR,                                                                                                                                                                                                     '+
'          0 AS AGIODESAGIO,                                                                                                                                                                                                 '+
'          0 AS VLRIOF,                                                                                                                                                                                                      '+
'          (RSG.VLROPERACAO * -1) AS RESGATES,                                                                                                                                                                               '+
'          (RSG.VLRLUCPREJ) AS LUCPREJ,                                                                                                                                                                                      '+
'          0 AS APLICACOES,                                                                                                                                                                                                  '+
'          0 AS PRINCIPAL,                                                                                                                                                                                                   '+
'          0 AS PAGTOJUR,                                                                                                                                                                                                    '+
'          0 AS TRCPLANO                                                                                                                                                                                                     '+
'       FROM                                                                                                                                                                                                                 '+
'          RSG                                                                                                                                                                                                               '+
'                                                                                                                                                                                                                            '+
'       UNION                                                                                                                                                                                                                '+
'--     APLICACOES                                                                                                                                                                                                           '+
'       SELECT                                                                                                                                                                                                               '+
'          APL.IDINVESTIMENTO,                                                                                                                                                                                               '+
'          APL.IDOPERRENFIXAPLIC,                                                                                                                                                                                            '+
'          APL.IDPLANPREVCTBPATR,                                                                                                                                                                                            '+
'          TO_DATE('',''DD/MM/YYYY'') AS DATAOPERACAO,                                                                                                                                                                         '+
'          TO_DATE('',''DD/MM/YYYY'') AS VENCIMENTO,                                                                                                                                                                           '+
'          0 AS VALORAPLICADO,                                                                                                                                                                                               '+
'          0 AS SALDOANTERIOR,                                                                                                                                                                                               '+
'          0 AS SALDOATUAL,                                                                                                                                                                                                  '+
'          0 AS VLRCOR,                                                                                                                                                                                                      '+
'          0 AS VLRJUR,                                                                                                                                                                                                      '+
'          0 AS VLRPROVPERDA,                                                                                                                                                                                                '+
'          0 AS VLRPCOR,                                                                                                                                                                                                     '+
'          0 AS VLRPJUR,                                                                                                                                                                                                     '+
'          0 AS AGIODESAGIO,                                                                                                                                                                                                 '+
'          0 AS VLRIOF,                                                                                                                                                                                                      '+
'          0 AS RESGATES,                                                                                                                                                                                                    '+
'          0 AS LUCPREJ,                                                                                                                                                                                                     '+
'          (APL.VLROPERACAO) AS APLICACOES,                                                                                                                                                                                  '+
'          0 AS PRINCIPAL,                                                                                                                                                                                                   '+
'          0 AS PAGTOJUR,                                                                                                                                                                                                    '+
'          0 AS TRCPLANO                                                                                                                                                                                                     '+
'       FROM                                                                                                                                                                                                                 '+
'          (SELECT (OP.IDINVESTIMENTO || OP.IDOPERRENFIXAPLIC || OP.IDPLANPREVCTBPATR) AS ID,                                                                                                                                '+
'              OP.IDINVESTIMENTO,                                                                                                                                                                                            '+
'              OP.IDOPERRENFIXAPLIC,                                                                                                                                                                                         '+
'              OP.IDPLANPREVCTBPATR,                                                                                                                                                                                         '+
'              SUM(NVL(OP.VLROPERACAO,0))  AS VLROPERACAO                                                                                                                                                                    '+
'           FROM OPERRENFIX OP, TIPOOPERACAO TP                                                                                                                                                                              '+
'           WHERE TP.IDTIPOINVEST = 1                                                                                                                                                                                        '+
'              AND TP.CODTIPDOC IS NOT NULL                                                                                                                                                                                  '+
'              AND ((TP.IDTIPOOPERACAO > 0) AND (TP.NATUREZAOPERACAO = ''A''))                                                                                                                                                 '+
'              AND OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND                                                                                                                                                '+
'                                          TO_DATE(:DATAFIM,''DD/MM/YYYY'')                                                                                                                                                    '+
'              AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO                                                                                                                                                                     '+
'           GROUP BY OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, OP.IDPLANPREVCTBPATR) APL                                                                                                                                      '+
'       UNION                                                                                                                                                                                                                '+
'--     VALOR APLICADO                                                                                                                                                                                                       '+
'       SELECT                                                                                                                                                                                                               '+
'          VLRAPL1.IDINVESTIMENTO,                                                                                                                                                                                           '+
'          VLRAPL1.IDOPERRENFIXAPLIC,                                                                                                                                                                                        '+
'          VLRAPL1.IDPLANPREVCTBPATR,                                                                                                                                                                                        '+
'          TO_DATE('',''DD/MM/YYYY'') AS DATAOPERACAO,                                                                                                                                                                         '+
'          TO_DATE('',''DD/MM/YYYY'') AS VENCIMENTO,                                                                                                                                                                           '+
'          VLRAPL1.VLROPERACAO AS VALORAPLICADO,                                                                                                                                                                             '+
'          0 AS SALDOANTERIOR,                                                                                                                                                                                               '+
'          0 AS SALDOATUAL,                                                                                                                                                                                                  '+
'          0 AS VLRCOR,                                                                                                                                                                                                      '+
'          0 AS VLRJUR,                                                                                                                                                                                                      '+
'          0 AS VLRPROVPERDA,                                                                                                                                                                                                '+
'          0 AS VLRPCOR,                                                                                                                                                                                                     '+
'          0 AS VLRPJUR,                                                                                                                                                                                                     '+
'          0 AS AGIODESAGIO,                                                                                                                                                                                                 '+
'          0 AS VLRIOF,                                                                                                                                                                                                      '+
'          0 AS RESGATES,                                                                                                                                                                                                    '+
'          0 AS LUCPREJ,                                                                                                                                                                                                     '+
'          0 AS APLICACOES,                                                                                                                                                                                                  '+
'          0 AS PRINCIPAL,                                                                                                                                                                                                   '+
'          0 AS PAGTOJUR,                                                                                                                                                                                                    '+
'          0 AS TRCPLANO                                                                                                                                                                                                     '+
'       FROM                                                                                                                                                                                                                 '+
'           VLRAPL1                                                                                                                                                                                                          '+
'       UNION                                                                                                                                                                                                                '+
'       SELECT                                                                                                                                                                                                               '+
'          VLRAPL2.IDINVESTIMENTO,                                                                                                                                                                                           '+
'          VLRAPL2.IDOPERRENFIXAPLIC,                                                                                                                                                                                        '+
'          VLRAPL2.IDPLANPREVCTBPATR,                                                                                                                                                                                        '+
'          TO_DATE('',''DD/MM/YYYY'') AS DATAOPERACAO,                                                                                                                                                                         '+
'          TO_DATE('',''DD/MM/YYYY'') AS VENCIMENTO,                                                                                                                                                                           '+
'          VLRAPL2.VALORAPLICADO,                                                                                                                                                                                            '+
'          0 AS SALDOANTERIOR,                                                                                                                                                                                               '+
'          0 AS SALDOATUAL,                                                                                                                                                                                                  '+
'          0 AS VLRCOR,                                                                                                                                                                                                      '+
'          0 AS VLRJUR,                                                                                                                                                                                                      '+
'          0 AS VLRPROVPERDA,                                                                                                                                                                                                '+
'          0 AS VLRPCOR,                                                                                                                                                                                                     '+
'          0 AS VLRPJUR,                                                                                                                                                                                                     '+
'          0 AS AGIODESAGIO,                                                                                                                                                                                                 '+
'          0 AS VLRIOF,                                                                                                                                                                                                      '+
'          0 AS RESGATES,                                                                                                                                                                                                    '+
'          0 AS LUCPREJ,                                                                                                                                                                                                     '+
'          0 AS APLICACOES,                                                                                                                                                                                                  '+
'          0 AS PRINCIPAL,                                                                                                                                                                                                   '+
'          0 AS PAGTOJUR,                                                                                                                                                                                                    '+
'          0 AS TRCPLANO                                                                                                                                                                                                     '+
'       FROM                                                                                                                                                                                                                 '+
'          (SELECT (HAP1.IDINVESTIMENTO || HAP1.IDOPERRENFIXAPLIC || HAP1.IDPLANPREVCTBPATR) AS ID,                                                                                                                          '+
'                  HAP1.IDINVESTIMENTO,                                                                                                                                                                                      '+
'                  HAP1.IDOPERRENFIXAPLIC,                                                                                                                                                                                   '+
'                  HAP1.IDPLANPREVCTBPATR,                                                                                                                                                                                   '+
'                  SUM(NVL(HAP1.VLRHISTRENFIX,0) + NVL(HAPI1.PUITEM,0))  AS VALORAPLICADO                                                                                                                                    '+
'           FROM HISTRENFIX HAP1, HISTRENFIXXITENS HAPI1                                                                                                                                                                     '+
'           WHERE HAP1.IDTIPOOPERACAO = -98                                                                                                                                                                                  '+
'             AND HAP1.DATAHISTRENFIX <= TO_DATE(:DATAINI,''DD/MM/YYYY'')                                                                                                                                                      '+
'             AND HAPI1.IDHISTRENFIX = HAP1.IDHISTRENFIX                                                                                                                                                                     '+
'             AND HAPI1.IDITEMRENFIX = -15                                                                                                                                                                                   '+
'           GROUP BY HAP1.IDINVESTIMENTO, HAP1.IDOPERRENFIXAPLIC, HAP1.IDPLANPREVCTBPATR) VLRAPL2                                                                                                                            '+
'       UNION                                                                                                                                                                                                                '+
'--     PAGAMENTOS DE JUROS                                                                                                                                                                                                  '+
'       SELECT                                                                                                                                                                                                               '+
'          PAGJUR.IDINVESTIMENTO,                                                                                                                                                                                            '+
'          PAGJUR.IDOPERRENFIXAPLIC,                                                                                                                                                                                         '+
'          PAGJUR.IDPLANPREVCTBPATR,                                                                                                                                                                                         '+
'          TO_DATE('',''DD/MM/YYYY'') AS DATAOPERACAO,                                                                                                                                                                         '+
'          TO_DATE('',''DD/MM/YYYY'') AS VENCIMENTO,                                                                                                                                                                           '+
'          0 AS VALORAPLICADO,                                                                                                                                                                                               '+
'          0 AS SALDOANTERIOR,                                                                                                                                                                                               '+
'          0 AS SALDOATUAL,                                                                                                                                                                                                  '+
'          0 AS VLRCOR,                                                                                                                                                                                                      '+
'          0 AS VLRJUR,                                                                                                                                                                                                      '+
'          0 AS VLRPROVPERDA,                                                                                                                                                                                                '+
'          0 AS VLRPCOR,                                                                                                                                                                                                     '+
'          0 AS VLRPJUR,                                                                                                                                                                                                     '+
'          0 AS AGIODESAGIO,                                                                                                                                                                                                 '+
'          0 AS VLRIOF,                                                                                                                                                                                                      '+
'          0 AS RESGATES,                                                                                                                                                                                                    '+
'          0 AS LUCPREJ,                                                                                                                                                                                                     '+
'          0 AS APLICACOES,                                                                                                                                                                                                  '+
'          0 AS PRINCIPAL,                                                                                                                                                                                                   '+
'          (PAGJUR.VLROPERACAO * -1) AS PAGTOJUR,                                                                                                                                                                            '+
'          0 AS TRCPLANO                                                                                                                                                                                                     '+
'       FROM                                                                                                                                                                                                                 '+
'          (SELECT (OP.IDINVESTIMENTO || OP.IDOPERRENFIXAPLIC || OP.IDPLANPREVCTBPATR) AS ID,                                                                                                                                '+
'              OP.IDINVESTIMENTO,                                                                                                                                                                                            '+
'              OP.IDOPERRENFIXAPLIC,                                                                                                                                                                                         '+
'              OP.IDPLANPREVCTBPATR,                                                                                                                                                                                         '+
'              SUM(NVL(OP.VLROPERACAO,0)) AS VLROPERACAO                                                                                                                                                                     '+
'           FROM OPERRENFIX OP, TIPOOPERACAO TP                                                                                                                                                                              '+
'           WHERE TP.IDTIPOINVEST = 1                                                                                                                                                                                        '+
'             AND TP.CODTIPDOC IS NOT NULL                                                                                                                                                                                   '+
'             AND (TP.IDTIPOOPERACAO IN (-17,-18,-19))                                                                                                                                                                       '+
'             AND (                                                                                                                                                                                                          '+
'                  ((NVL(:FLGREGIMECXCOMP, ''N'') = ''N'') AND                                                                                                                                                                   '+
'                   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND                                                                                                                                              '+
'                                            TO_DATE(:DATAFIM,''DD/MM/YYYY'')))                                                                                                                                                '+
'                  OR                                                                                                                                                                                                        '+
'                  ((:FLGREGIMECXCOMP = ''S'') AND                                                                                                                                                                             '+
'                   (OP.DATALIQUIDACAO BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND                                                                                                                                            '+
'                                              TO_DATE(:DATAFIM,''DD/MM/YYYY'')))                                                                                                                                              '+
'                 )                                                                                                                                                                                                          '+
'             AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO                                                                                                                                                                      '+
'          GROUP BY OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, OP.IDPLANPREVCTBPATR) PAGJUR                                                                                                                                    '+
'       UNION                                                                                                                                                                                                                '+
'--     TRANSFERENCIA ENTRE PLANOS                                                                                                                                                                                           '+
'       SELECT                                                                                                                                                                                                               '+
'          TRC.IDINVESTIMENTO,                                                                                                                                                                                               '+
'          TRC.IDOPERRENFIXAPLIC,                                                                                                                                                                                            '+
'          TRC.IDPLANPREVCTBPATR,                                                                                                                                                                                            '+
'          TO_DATE('',''DD/MM/YYYY'') AS DATAOPERACAO,                                                                                                                                                                         '+
'          TO_DATE('',''DD/MM/YYYY'') AS VENCIMENTO,                                                                                                                                                                           '+
'          0 AS VALORAPLICADO,                                                                                                                                                                                               '+
'          0 AS SALDOANTERIOR,                                                                                                                                                                                               '+
'          0 AS SALDOATUAL,                                                                                                                                                                                                  '+
'          0 AS VLRCOR,                                                                                                                                                                                                      '+
'          0 AS VLRJUR,                                                                                                                                                                                                      '+
'          0 AS VLRPROVPERDA,                                                                                                                                                                                                '+
'          0 AS VLRPCOR,                                                                                                                                                                                                     '+
'          0 AS VLRPJUR,                                                                                                                                                                                                     '+
'          0 AS AGIODESAGIO,                                                                                                                                                                                                 '+
'          0 AS VLRIOF,                                                                                                                                                                                                      '+
'          0 AS RESGATES,                                                                                                                                                                                                    '+
'          0 AS LUCPREJ,                                                                                                                                                                                                     '+
'          0 AS APLICACOES,                                                                                                                                                                                                  '+
'          0 AS PRINCIPAL,                                                                                                                                                                                                   '+
'          0 AS PAGTOJUR,                                                                                                                                                                                                    '+
'          (TRC.VLROPERACAO) AS TRCPLANO                                                                                                                                                                                     '+
'       FROM                                                                                                                                                                                                                 '+
'       (SELECT (OP.IDINVESTIMENTO || OP.IDOPERRENFIXAPLIC || OP.IDPLANPREVCTBPATR) AS ID,                                                                                                                                   '+
'           OP.IDINVESTIMENTO,                                                                                                                                                                                               '+
'           OP.IDOPERRENFIXAPLIC,                                                                                                                                                                                            '+
'           OP.IDPLANPREVCTBPATR,                                                                                                                                                                                            '+
'           SUM(DECODE(OP.IDTIPOOPERACAO,-97,(OP.VLROPERACAO * -1),(OP.VLROPERACAO))) AS VLROPERACAO                                                                                                                         '+
'         FROM OPERRENFIX OP                                                                                                                                                                                                 '+
'         WHERE (OP.IDTIPOOPERACAO in(-97,-98))                                                                                                                                                                              '+
'           AND OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND                                                                                                                                                   '+
'                                       TO_DATE(:DATAFIM,''DD/MM/YYYY'')                                                                                                                                                       '+
'      GROUP BY OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, OP.IDPLANPREVCTBPATR) TRC) SUB                                                                                                                                      '+
'   GROUP BY SUB.IDINVESTIMENTO, SUB.IDOPERRENFIXAPLIC, SUB.IDPLANPREVCTBPATR) SUB1                                                                                                                                          '+
'WHERE                                                                                                                                                                                                                       '+
'   -- Para nao trazer saldos anterior a data anterior                                                                                                                                                                       '+
'   OP.IDOPERRENFIX IN (SELECT DISTINCT H.IDOPERRENFIXAPLIC                                                                                                                                                                  '+
'                         FROM HISTRENFIX H                                                                                                                                                                                  '+
'                         WHERE ((H.DATAHISTRENFIX || H.IDINVESTIMENTO || H.IDOPERRENFIXAPLIC || H.IDPLANPREVCTBPATR) IN                                                                                                     '+
'                                     (SELECT MAX(H1.DATAHISTRENFIX) || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC || H1.IDPLANPREVCTBPATR                                                                                    '+
'                                      FROM HISTRENFIX H1                                                                                                                                                                    '+
'                                      WHERE (H1.DATAHISTRENFIX BETWEEN TO_DATE(:DATAMIN,''DD/MM/YYYY'') AND                                                                                                                 '+
'                                                                       TO_DATE(:DATAFIM,''DD/MM/YYYY''))                                                                                                                    '+
'                                      GROUP BY H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC, H1.IDPLANPREVCTBPATR)))                                                                                                             ';


result:=sSQL;
end;



end.


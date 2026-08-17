//************************************************************************************************//
// Data      : 09/08/2007
// Código    : AL_18
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação do Relatório Consolidado por Investimento
//******************************************************************************
// Data     : 31/10/2006
// Código   : AL_17
// Pendencia: 23661
// Descrição: Segregação de Planos // DFM
//******************************************************************************
// Data     : 03/11/2005
// Código   : AL_16
// Motivo   : Passa a qryAnuncioProv para o DataModule
//******************************************************************************
// Data     : 01/11/2005
// Código   : AL_15
// Motivo   : Ajuste para acertar o filtro de investimentos para captar TipoInvest = 2
//******************************************************************************
// Data     : 24/10/2005
// Código   : AL_14
// Motivo   : Ajuste para acertar o filtro pela DATAEX (DFM)
//******************************************************************************
// Data     : 21/10/2005
// Código   : AL_13
// Motivo   : Retirado o ajuste na query para só mostrar recebimentos parciais com saldo
//               a receber maior que 10 reais
//******************************************************************************
// Data     : 21/10/2005
// Código   : AL_12
// Motivo   : Ajuste na query para só mostrar recebimentos parciais com saldo
//               a receber maior que 10 reais
//******************************************************************************
// Data     : 20/10/2005
// Código   : AL_11
// Motivo   : Ajuste na query para recebimento parcial
//******************************************************************************
// Data     : 11/07/2005
// Código   : AL_10
// Motivo   : Implementação de Cor Zebrada no Grid
// ******************************************************************************
// Data      : 20/05/2005
// Código    : Al_9
// Motivo    : Simplificação da busca dos anuncios em aberto - qryAnuncioProv.
//************************************************************************************************//
// Data      : 05/05/2005                                                                         //
// Código    : AL_8                                                                               //
// Motivo    : Implementação para buscar qtd e valor somento qdo esses estiverem zerados          //
//************************************************************************************************//
// Data      : 05/05/2005                                                                         //
// Código    : AL_7                                                                               //
// Motivo    : Implementação na qryAnuncioProv o DATAOPERACAO para trazer os valores dos anuncios //
//************************************************************************************************//
// Data      : 04/05/2005                                                                         //
// Código    : AL_6                                                                               //
// Motivo    : Implementação do PUORIG para as AGE que tiverem o seu PU alterado no momento do    //
//             recebimento                                                                        //
//************************************************************************************************//
// Data      : 04/05/2005                                                                         //
// Código    : AL_5                                                                               //
// Motivo    : Implementação na QryOrigemDivJur o DATAOPERACAO para a busca do anúncio            //
//************************************************************************************************//
// Data      : 04/05/2005                                                                         //
// Motivo    : Ajuste na consulta da query QryOrigemDivJur para buscar especificamente os anúncios//
//             e o PU original da operação                                                        //
//************************************************************************************************//
// Data      : 27/04/2005                                                                         //
// Código    : AL_4                                                                               //
// Motivo    : Ajuste na consulta da query qryAnuncioProv para pegar operações de Multa (DFM)     //
//************************************************************************************************//
// Data      : 19/04/2005                                                                         //
// Motivo    : Ajuste na consulta da query qryAnuncioProv                                         //
//************************************************************************************************//
// Data      : 18/04/2005                                                                         //
// Motivo    : Ajuste na consulta da query qryAnuncioProv                                         //
//************************************************************************************************//
// Data      : 14/04/2005                                                                         //
// Motivo    : Ajuste na consulta da query qryAnuncioProv, para não trazer os anuncios ja vencidos//
//************************************************************************************************//
// Data      : 15/01/2005                                                                         //
// Motivo    : Ajuste na query qryAnuncioProv para trazer todos os anuncio a vencer e vencidos e  //
//             não recebidos                                                                      //
//************************************************************************************************//
// Data      : 16/01/2005                                                                         //
// Motivo    : Implementado na query QryLote para trazer o lote conforme a data do periodo na     //
//             tabela COTACAOACAO                                                                 //
//************************************************************************************************//
// Data      : 13/01/2005                                                                         //
// Código    : Alteração só no DFM                                                                //
// Motivo    : Inclusão do Campo DTBASE(campo referente ao DATAEX) na query QryAnuncioProv.       //
//************************************************************************************************//
// Data      : 06/01/2005                                                                         //
// Código    : AL_3                                                                               //
// Motivo    : Inclusão do filtro por Data EX.                                                    //
//             Alteração na query QryOrigemDivJur para poder somar a quantidade de todos os       //
//             custodiantes.                                                                      //
//************************************************************************************************//
// Data      : 05/01/2005                                                                         //
// Código    : AL_2                                                                               //
// Motivo    : Correção no Código. Não estava pegando a quantidade correta.                       //
//************************************************************************************************//
// Data      : 04/01/2005                                                                         //
// Código    : AL_1                                                                               //
// Motivo    : Correção na Query qryAnuncioProv (O SQL antigo da query está no final do PAS)      //
//************************************************************************************************//
// Data	     : 29/11/2004                                                                         //
//************************************************************************************************//

unit FConsAnuncioProvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, DBGrids, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Db, Wwdatsrc, DBTables, Wwquery, FPreview,
  Wwdbigrd, Wwdbgrid;

type
  TfrmConsAnunciosProventos = class(TfrmOkCancelarInv)
    pnlConsulta: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    DtRef: TCMDateTimePicker;
    dblkInvest: TwwDBLookupCombo;
    dblkTpOper: TwwDBLookupCombo;
    qryAnuncioProvOld: TwwQuery;
    dsAnuncioProv: TwwDataSource;
    qryTpOperacao: TwwQuery;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryTpOperacaoIDTIPOOPERACAO: TFloatField;
    qryTpOperacaoDESCTIPOOPERACAO: TStringField;
    btnImprimir: TBitBtn;
    QryOrigemDivJur: TwwQuery;
    UpdAnuncioProv: TUpdateSQL;
    QryLote: TwwQuery;
    Label2: TLabel;
    DtEX: TCMDateTimePicker;
    QryLoteOrig: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    qryAnuncioProvOldDESCTIPOOPERACAO: TStringField;
    qryAnuncioProvOldDATAEX: TDateTimeField;
    qryAnuncioProvOldDATAPREV: TDateTimeField;
    qryAnuncioProvOldDTBASE: TDateTimeField;
    qryAnuncioProvOldDATAAGE: TDateTimeField;
    qryAnuncioProvOldDESCINVESTIMENTO: TStringField;
    qryAnuncioProvOldIDINVESTIMENTO: TFloatField;
    qryAnuncioProvOldIDOPERACAODIREITO: TFloatField;
    qryAnuncioProvOldIDTIPOOPERACAO: TFloatField;
    qryAnuncioProvOldQTD: TFloatField;
    qryAnuncioProvOldPU: TFloatField;
    qryAnuncioProvOldVALOR: TFloatField;
    qryPlanoPrev: TwwQuery;
    qryPlanoPrevPLANPRVCONTABPATRO: TStringField;
    qryPlanoPrevPLANOCONTABIL: TStringField;
    qryPlanoPrevPATROCINADORA: TStringField;
    qryPlanoPrevIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    qryPlanoPrevIDPATRO: TFloatField;
    dblPlanoPrev: TwwDBLookupCombo;
    Label5: TLabel;
    ChBxConsolidadoInvest: TCheckBox;
    dblSegmentacao: TwwDBLookupCombo;
    Label6: TLabel;
    QrySegmentacao: TwwQuery;
    QrySegmentacaoIDSEGMENTACAO: TFloatField;
    QrySegmentacaoDESCSEGMENTACAO: TStringField;
    QrySegmentacaoIDGRUPO: TFloatField;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    DtAGE: TCMDateTimePicker;
    Label7: TLabel;
    dblkCarteira: TwwDBLookupCombo;
    Label8: TLabel;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraIDGESTORCARTEIRA: TFloatField;
    qryCarteiraFLGCARTPROP: TFloatField;
    qryCarteiraFLGCALCDIARIO: TStringField;
    qryCarteiraDATAINICIO: TDateTimeField;
    qryCarteiraFLGTRATALOTE: TStringField;
    qryCarteiraTRGDTINCLUSAO: TDateTimeField;
    qryCarteiraTRGUSERINCLUSAO: TStringField;
    qryCarteiraIDPLANOPREV: TFloatField;
    qryCarteiraIDPATROCINADORA: TFloatField;
    qryCarteiraIDTIPOINVEST: TFloatField;
    qryCarteiraIDMERCADO: TFloatField;
    qryCarteiraFLGORDMOVINV: TStringField;
    qryCarteiraDATAULTFECH: TDateTimeField;
    qryCarteiraIDDAIEACART: TFloatField;
    qryCarteiraFLGCARTLASTRO: TStringField;
    qryCarteiraFLGCARTTERC: TStringField;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure wwDBGrid1TopRowChanged(Sender: TObject);
    procedure ChBxConsolidadoInvestClick(Sender: TObject);
  private
    { Private declarations }
    function ValidaCampos : Boolean;

    procedure FazQuery;
  public
    { Public declarations }
  end;

var
  frmConsAnunciosProventos: TfrmConsAnunciosProventos;

implementation

{$R *.DFM}

uses UOperComum, UMensErro, FDmRelAGE, UBibliotecaInvest, dAGE;

function TfrmConsAnunciosProventos.ValidaCampos : Boolean;
begin
   Result := False;

   if Trim(DtRef.Text) = '' then
   begin
      MsgDlg('A Data de Referência não foi Informada.','Mensagem do Sistema', mtWarning, [MbOk], 0);
      if DtRef.CanFocus then
         DtRef.SetFocus;
      Exit;
   end;

   Result := True;
end;

procedure TfrmConsAnunciosProventos.FazQuery;
var
   fQtdLote, fQtd : Double;
begin
   if not ValidaCampos then
      Exit;

   fQtd := 0;

   // AL_18
   dmRelAGE.qryAnuncioProv.DisableControls; // Fim AL_18

   OperComum.LimpaParametros(dmRelAGE.qryAnuncioProv);

   dmRelAGE.qryAnuncioProv.ParamByName('DT_REF').AsString := DtRef.Text;

   //AL_17
   if Trim(dblPlanoPrev.Text) <> '' then
      dmRelAGE.qryAnuncioProv.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanoPrev.LookupValue);

   if Trim(dblkTpOper.Text) <> '' then
      dmRelAGE.qryAnuncioProv.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(dblkTpOper.LookupValue);

   if Trim(dblkInvest.Text) <> '' then
      dmRelAGE.qryAnuncioProv.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(dblkInvest.LookupValue);

   //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
   if Trim(dblSegmentacao.Text) <> '' then
      dmRelAGE.qryAnuncioProv.ParamByName('IDSEGMENTACAO').AsInteger := StrToInt(dblSegmentacao.LookupValue);
   //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim

   if Trim(dblkCarteira.Text) <> '' then
      dmRelAGE.qryAnuncioProv.ParamByName('IDCARTEIRAINVEST').AsInteger := StrToInt(dblkCarteira.LookupValue);


   // AL_11 - Inicio
   // AL_3
   // AL_14 - Inicio
   if Trim(DtEX.Text) <> '' then
   begin
      dmRelAGE.qryAnuncioProv.ParamByName('DATAEX').AsString := DtEX.Text;
      //AL_7
      dmRelAGE.qryAnuncioProv.ParamByName('DATAOPERACAO').AsString  := DtEX.Text;
   end
   //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
   else if Trim(DtAGE.Text) <> '' then
   begin
      dmRelAGE.qryAnuncioProv.ParamByName('DATAAGE').AsString := DtAGE.Text;
      dmRelAGE.qryAnuncioProv.ParamByName('DATAOPERACAO').AsString  := DtRef.Text;
   end
   else
      //AL_7
      dmRelAGE.qryAnuncioProv.ParamByName('DATAOPERACAO').AsString  := DtRef.Text;
   // AL_14 - Fim

   dmRelAGE.qryAnuncioProv.ParamByName('TIPODATA').AsInteger := OperComum.RetornaDataDivConsulta(dmRelAGE.qryAnuncioProv.ParamByName('DATAOPERACAO').AsDateTime);

   dmRelAGE.qryAnuncioProv.Open;

   // AL_18
   dmRelAGE.qryAnuncioProv.EnableControls;

   If ChBxConsolidadoInvest.checked then
   Begin
      OperComum.LimpaParametros(dmRelAGE.QryAnuncioProvCon);
      dmRelAGE.qryAnuncioProvCon.Sql.Clear;
      if Not dmRelAGE.qryAnuncioProv.IsEmpty then
      begin
         dmRelAGE.QryAnuncioProvCon.Sql.Add('SELECT * '+ #13);
         dmRelAGE.QryAnuncioProvCon.Sql.Add('FROM ( ' + #13);
         dmRelAGE.QryAnuncioProvCon.Sql.Add( '' + #13);
         dmRelAGE.QryAnuncioProvCon.Sql.Add(dmRelAGE.QryAnuncioProv.Sql.GetText);
         dmRelAGE.QryAnuncioProvCon.Sql.Add( '' + #13);
         dmRelAGE.QryAnuncioProvCon.Sql.Add( ' ) ' + #13);
         //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
         dmRelAGE.QryAnuncioProvCon.Sql.Add( 'ORDER BY IDSEGMENTACAO,DESCINVESTIMENTO,DESCTIPOOPERACAO,PLANPRVCONTABPATRO' + #13);
         // Passando os parâmetros
         dmRelAGE.qryAnuncioProvCon.ParamByName('DT_REF').AsString := DtRef.Text;
          if Trim(dblkTpOper.Text) <> '' then
            dmRelAGE.qryAnuncioProvCon.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(dblkTpOper.LookupValue)
          else
            dmRelAGE.qryAnuncioProvCon.ParamByName('IDTIPOOPERACAO').DataType  := ftInteger;
         if Trim(dblkInvest.Text) <> '' then
            dmRelAGE.qryAnuncioProvCon.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(dblkInvest.LookupValue)
         else
            dmRelAGE.qryAnuncioProvCon.ParamByName('IDINVESTIMENTO').DataType := ftInteger;
         //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
         if Trim(dblSegmentacao.Text) <> '' then
            dmRelAGE.qryAnuncioProvCon.ParamByName('IDSEGMENTACAO').AsInteger := StrToInt(dblSegmentacao.LookupValue)
         else
            dmRelAGE.qryAnuncioProvCon.ParamByName('IDSEGMENTACAO').DataType := ftInteger;

         if Trim(dblkCarteira.Text) <> '' then
            dmRelAGE.qryAnuncioProvCon.ParamByName('IDCARTEIRAINVEST').AsInteger := StrToInt(dblkCarteira.LookupValue)
         else
            dmRelAGE.qryAnuncioProvCon.ParamByName('IDCARTEIRAINVEST').DataType := ftInteger;

         //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim
         if Trim(DtEX.Text) <> '' then
         begin
            dmRelAGE.qryAnuncioProvCon.ParamByName('DATAEX').AsString := DtEX.Text;
            dmRelAGE.qryAnuncioProvCon.ParamByName('DATAOPERACAO').AsString  := DtEX.Text;
            //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
            dmRelAGE.qryAnuncioProvCon.ParamByName('DATAAGE').DataType := FtString;            
         end
         //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
         else if Trim(DtAGE.Text) <> '' then
         begin
            dmRelAGE.qryAnuncioProvCon.ParamByName('DATAAGE').AsString := DtAGE.Text;
            dmRelAGE.qryAnuncioProvCon.ParamByName('DATAOPERACAO').AsString  := DtRef.Text;
            dmRelAGE.qryAnuncioProvCon.ParamByName('DATAEX').DataType := FtString;
         end
         else
         begin
            dmRelAGE.qryAnuncioProvCon.ParamByName('DATAOPERACAO').AsString  := DtRef.Text;
            dmRelAGE.qryAnuncioProvCon.ParamByName('DATAEX').DataType := FtString;
            //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
            dmRelAGE.qryAnuncioProvCon.ParamByName('DATAAGE').DataType := FtString;
         end;

         dmRelAGE.qryAnuncioProvCon.ParamByName('IDPLANPREVCTBPATR').DataType := ftInteger;

         dmRelAGE.qryAnuncioProvCon.ParamByName('TIPODATA').AsInteger := OperComum.RetornaDataDivConsulta(dmRelAGE.qryAnuncioProv.ParamByName('DATAOPERACAO').AsDateTime);

         dmRelAGE.QryAnuncioProvCon.Open;

      end;
   end;   // Fim AL_18

end;

procedure TfrmConsAnunciosProventos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  DtRef.Text             := DateToStr(pRPI.DATAMOVTORV);
  dblkTpOper.LookupValue := '';
  dblkInvest.LookupValue := '';
  dmRelAGE.qryAnuncioProv.Close;
end;

procedure TfrmConsAnunciosProventos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryTpOperacao.Close;
  qryInvestimento.Close;

  QrySegmentacao.Close;   //Renan Cristiano Sol 131501/1101 Kintana 760170
  //AL_17
  qryPlanoPrev.Close;
  dmRelAGE.qryAnuncioProv.Close;
  //AL_18
  dmRelAGE.QryAnuncioProvCon.Close;

  qryCarteira.Close;
end;

procedure TfrmConsAnunciosProventos.FormShow(Sender: TObject);
begin
  inherited;

  DtRef.Text := DateToStr(pRPI.DATAMOVTORV);
  qryTpOperacao.Open;
  qryInvestimento.Open;
  //AL_17
  qryPlanoPrev.Open;
  //Renan Cristiano Sol 131501/1101 Kintana 760170 Inicio
  OperComum.LimpaParametros(qrySegmentacao);
  qrySegmentacao.ParamByName('GRUPO').AsInteger := 2;//Renda Variavel
  qrySegmentacao.Open;
  //Renan Cristiano Sol 131501/1101 Kintana 760170 Fim

  qryCarteira.Open;
end;

procedure TfrmConsAnunciosProventos.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   FazQuery;  //Monta a query em run time
end;

procedure TfrmConsAnunciosProventos.btnImprimirClick(Sender: TObject);
begin
   inherited;

   if dmRelAGE.qryAnuncioProv.IsEmpty Then
      Exit;

   dmRelAGE.ppLData.Caption   := DtRef.Text;
   dmRelAGE.ppLTitulo.Caption := 'Anúncios de Proventos em Aberto';
   //AL_18
   If ChBxConsolidadoInvest.Checked then
   begin
      try
         dmRelAGE.qryAnuncioProv.DisableControls;

         dmRelAGE.lblPerCon.Caption   := DtRef.Text;
         dmRelAGE.lblTitCon.Caption := 'Anúncios de Proventos em Aberto - Consolidado por Investimento';

         TFrmPreview.CreateModalPreview(Application,
                                        dmRelAGE.rptAnuncioProvCon,
                                        dmRelAGE.rptAnuncioProvCon.PrinterSetup.DocumentName);
      finally
         dmRelAGE.qryAnuncioProv.EnableControls;
      end;
   end
   else
   begin //Fim AL_18
      try
         dmRelAGE.qryAnuncioProv.DisableControls;

         TFrmPreview.CreateModalPreview(Application,
                                        dmRelAGE.ppReport2,
                                        dmRelAGE.ppReport2.PrinterSetup.DocumentName);
      finally
         dmRelAGE.qryAnuncioProv.EnableControls;
      end;
   end; //AL_18
end;

//AL_10
procedure TfrmConsAnunciosProventos.wwDBGrid1CalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmConsAnunciosProventos.wwDBGrid1TopRowChanged(Sender: TObject);
begin
  inherited;
  // AL_17 
  TwwDBGrid(Sender).Invalidate;
end;

// AL_18
procedure TfrmConsAnunciosProventos.ChBxConsolidadoInvestClick(
  Sender: TObject);
begin
  inherited;
  dblPlanoPrev.Clear;
  If (ChBxConsolidadoInvest.checked) and Not(dmrelage.qryAnuncioProv.IsEmpty)then
     bbtnConfirmarClick(Self);
end;

end.

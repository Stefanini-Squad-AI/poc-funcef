//******************************************************************************
// Data      : 17/10/2006
// Código    : AL_1
// Pendencia :
// SOL       :
// Desc      : Ajustes de transação
//******************************************************************************

unit FCadEspOrdemMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, wwdblook;

type
  TfrmEspOrdemMovimentacao = class(TfrmCadastroCS)
    PnlData: TPanel;
    dbDtaOperacao: TCMDateTimePicker;
    Label1: TLabel;
    PnlEspecificar: TPanel;
    PnlEspecificado: TPanel;
    dbgEspecificar: TwwDBGrid;
    dbgEspecificada: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    QryDetalhe: TwwQuery;
    DsDetalhe: TwwDataSource;
    QryDetalheIDORDMOVINV: TFloatField;
    QryDetalheIDCORRETVALORES: TFloatField;
    QryDetalheIDINVESTIMENTO: TFloatField;
    QryDetalhePUORDMOVINV: TFloatField;
    QryDetalheOBSMOVINV: TStringField;
    QryDetalheDATAORDMOVINV: TDateTimeField;
    QryDetalheQTDEORDMOVINV: TFloatField;
    QryDetalheNUMDOCMOVINV: TStringField;
    QryDetalheSTATMOVINV: TStringField;
    QryDetalheIDUSUARIO: TFloatField;
    QryDetalheIDAUTORIZACAO: TFloatField;
    QryDetalheTRGDTINCLUSAO: TDateTimeField;
    QryDetalheTRGUSERINCLUSAO: TStringField;
    QryDetalheIDTIPOINVEST: TFloatField;
    QryDetalheIDTIPOOPERACAO: TFloatField;
    QryDetalheOBSAUTMOV: TStringField;
    QryDetalheIDCARTEIRAINVEST: TFloatField;
    QryDetalheIDCARTEIRAGERENC: TFloatField;
    QryDetalheIDLOTE: TStringField;
    QryDetalheIDBOLSAVALORES: TFloatField;
    QryDetalheIDCUSTODIANTE: TFloatField;
    QryDetalheQTDEORDENADA: TFloatField;
    QryDetalheDATAAUTORIZACAO: TDateTimeField;
    QryDetalheIDPLANPREVCTBPATR: TFloatField;
    QryDetalheHORAMOV: TStringField;
    QryDetalheVALOR: TFloatField;
    QryDetalheDESCCARTINVEST: TStringField;
    QryDetalheSGLCORRETVALORES: TStringField;
    QryDetalheDESCTIPOOPERACAO: TStringField;
    QryDetalheSIGLATIPOOPER: TStringField;
    QryDetalheDESCINVESTIMENTO: TStringField;
    QryDetalheSGLBOLSAVALORES: TStringField;
    QryDetalheNATUREZAOPERACAO: TStringField;
    Toolbar972: TToolbar97;
    UpdDetalhe: TUpdateSQL;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    QryAux: TwwQuery;
    QryBuscaCarteira: TwwQuery;
    QryBuscaCarteiraIDCARTEIRAINVEST: TFloatField;
    QryBuscaCarteiraIDCARTEIRAGERENC: TFloatField;
    QryBuscaCarteiraDESCCARTINVEST: TStringField;
    QryCorretValores: TwwQuery;
    dblSiglaCorretora: TwwDBLookupCombo;
    Label2: TLabel;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    QryCorretValoresIDCORRETGERENC: TFloatField;
    PnlBoleta: TPanel;
    dblOperacao: TwwDBLookupCombo;
    Label3: TLabel;
    QryBuscaOperacao: TwwQuery;
    QryBuscaOperacaoDESCTIPOOPERACAO: TStringField;
    QryBuscaOperacaoSIGLATIPOOPER: TStringField;
    QryBuscaOperacaoIDTIPOOPERACAO: TFloatField;
    QryBuscaOperacaoNATUREZAOPERACAO2: TStringField;
    QryBuscaOperacaoTIPOCUSTODIA2: TStringField;
    QryBuscaOperacaoFLGTRATAIR2: TStringField;
    QryBuscaOperacaoIDMERCADO2: TFloatField;
    QryBuscaOperacaoVENCIMENTO: TFloatField;
    qryIDCORRETVALORES: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryNUMDOCMOVINV: TStringField;
    qrySTATMOVINV: TStringField;
    qryIDUSUARIO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDCARTEIRAGERENC: TFloatField;
    qryIDLOTE: TStringField;
    qryIDBOLSAVALORES: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryDATAAUTORIZACAO: TDateTimeField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryHORAMOV: TStringField;
    qryVALOR: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    qryPUORDMOVINV: TFloatField;
    qryQTDEORDMOVINV: TFloatField;
    qryQTDEORDENADA: TFloatField;
    QryDeleta: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    StringField5: TStringField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField14: TFloatField;
    DblCarteiraDetalhe: TwwDBLookupCombo;
    QryAuxiliar: TwwQuery;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    StringField10: TStringField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    DateTimeField2: TDateTimeField;
    FloatField28: TFloatField;
    DsAuxiliar: TwwDataSource;
    UpdAuxiliar: TUpdateSQL;
    procedure FormActivate(Sender: TObject);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure BtIncDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure BtOkDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgEspecificadaColExit(Sender: TObject);
    procedure QryDetalheBeforePost(DataSet: TDataSet);
    procedure dbgEspecificadaEnter(Sender: TObject);
    procedure dbgEspecificadaExit(Sender: TObject);
    procedure dbgEspecificadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgEspecificadaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblOperacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
     function AtualizaLote(QryPar : TQuery) : Double;

     procedure AbreQuery;
     procedure AlimentaQryAuxiliar;
     procedure AlimentaQry;
     procedure AlimentaQryDetalhe;
     procedure HabilitaBotoes;

  public
    { Public declarations }
  end;

var
  frmEspOrdemMovimentacao: TfrmEspOrdemMovimentacao;
  bTrocaLine : Boolean;  

implementation

uses UBibliotecaInvest, UOperComum, DBaseDados, UMensErro, UDataBase, uSistema;

{$R *.DFM}

procedure TfrmEspOrdemMovimentacao.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
  dbDtaOperacao.SetFocus;
end;

function TfrmEspOrdemMovimentacao.AtualizaLote(QryPar : TQuery) : Double;
Var
  wQtdLote: Integer;
begin
  //Busca a Quantidade por Lote na Bolsa

  Result := 1;
  
  If FazQuery(QryAux,'SELECT DISTINCT QTDELOTE FROM ACOESXBOLSA WHERE IDACAO = '+
                      QuotedStr(IntToStr(QryPar.FieldByName('IDINVESTIMENTO').AsInteger))) Then
     Result := QryAux.FieldByName('QTDELOTE').AsInteger;

  QryAux.Close;

  Result   := OperComum.DivValorZero((QryPar.FieldByName('PUORDMOVINV').AsFloat *
                             QryPar.FieldByName('QTDEORDENADA').AsFloat),Result);
End;

procedure TfrmEspOrdemMovimentacao.AlimentaQryAuxiliar;
Begin
   With QryAuxiliar Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         Edit;
         FieldByName('HORAMOV').AsString := '00:00';
         FieldByName('VALOR').AsFloat    := AtualizaLote(QryAuxiliar);
         Post;
         Next;
      End;
      First;
      EnableControls;
   End;
end;

procedure TfrmEspOrdemMovimentacao.AlimentaQry;
Var
   fValor : Currency;
Begin
   With Qry Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         Edit;
         FieldByName('HORAMOV').AsString := '00:00';
         fValor := 0;
         QryAuxiliar.Locate('IDINVESTIMENTO',
                            FieldByName('IDINVESTIMENTO').AsInteger,[loPartialKey]);
         While (Not QryAuxiliar.Eof) And
               (QryAuxiliar.FieldByName('IDINVESTIMENTO').AsInteger =
                Qry.FieldByName('IDINVESTIMENTO').AsInteger) Do
         Begin
            fValor := fValor + QryAuxiliar.FieldByName('VALOR').AsCurrency;
            QryAuxiliar.Next;
         End;
         FieldByName('VALOR').AsCurrency       := fValor;
         FazQuery(QryAux,'SELECT DISTINCT QTDELOTE FROM ACOESXBOLSA WHERE IDACAO = '+
                     QuotedStr(IntToStr(FieldByName('IDINVESTIMENTO').AsInteger)));
         FieldByName('PUORDMOVINV').AsCurrency := (fValor/FieldByName('QTDEORDENADA').AsFloat)*
                     QryAux.FieldByName('QTDELOTE').AsInteger;
         Post;
         Next;
      End;
      First;
      EnableControls;
   End;
end;

procedure TfrmEspOrdemMovimentacao.AlimentaQryDetalhe;
Begin
   QryDetalheDESCINVESTIMENTO.ReadOnly  := False;
   With QryDetalhe Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         Edit;
         FieldByName('HORAMOV').AsString :=
              FormatDateTime('HH:NN', FieldByName('DATAORDMOVINV').AsDateTime);         
         FieldByName('VALOR').AsFloat    := AtualizaLote(QryDetalhe);
         Post;
         Next;
      End;
      First;
      EnableControls;
   End;
   QryDetalheDESCINVESTIMENTO.ReadOnly  := True;
end;

procedure TfrmEspOrdemMovimentacao.HabilitaBotoes;
begin
   If Qry.RecordCount > 0 Then
      BtIncDet.Enabled := True
   Else
      BtIncDet.Enabled := False;

   If (QryDetalhe.RecordCount > 0) And (Qry.RecordCount > 0) Then
   Begin
      BtAltDet.Enabled := True;
      BtDelDet.Enabled := True;
   End
   Else
   Begin
      BtAltDet.Enabled := False;
      BtDelDet.Enabled := False;
   End;
end;

procedure TfrmEspOrdemMovimentacao.dbDtaOperacaoExit(Sender: TObject);
begin
  inherited;

  QryCorretValores.Close;
  QryCorretValores.ParamByName('DATAORDMOVINV').AsString := DateToStr(dbDtaOperacao.Date);
  QryCorretValores.Open;

  If QryCorretValores.RecordCount = 1 Then
  Begin
     dblSiglaCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString;
     dblOperacao.SetFocus;
  End;

end;

procedure TfrmEspOrdemMovimentacao.BtIncDetClick(Sender: TObject);
begin
   bTrocaLine             := False;

  inherited;

   PnlData.Enabled        := False;

   PnlEspecificar.Enabled := False;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   QryDetalhe.Append;

   //Prepara Grid para Inserir Dados
   dbgEspecificada.SelectedIndex := 0;
   dbgEspecificada.Options       := dbgEspecificada.Options + [TwwDBgridOption(dgEditing)];
   dbgEspecificada.Font.Color    := clBlack;
   dbgEspecificada.SetFocus;

   //Habilita botões do Detalhe
   BtOkDet.Enabled        := True;
   BtCancDet.Enabled      := True;
   BtVoltaDet.Enabled     := True;

   BtIncDet.Enabled       := False;
   BtAltDet.Enabled       := False;
   BtDelDet.Enabled       := False;

   //Habilita campos para modificação de dados
   QryDetalheDESCINVESTIMENTO.ReadOnly := False;

   //Trata Máscara
   QryDetalheQTDEORDENADA.DisplayFormat := '';
   QryDetalhePUORDMOVINV.DisplayFormat  := '';
   QryDetalheVALOR.DisplayFormat        := '';

   //Inserir a especificação dos dados na tabela 
   QryDetalhe.FieldByname('IDORDMOVINV').Asinteger := LeUltRegistro(nil,'ORDMOVINV');

   QryDetalhe.FieldByName('IDCORRETVALORES').AsInteger := Qry.FieldByName('IDCORRETVALORES').AsInteger;
   QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger :=  Qry.FieldByName('IDINVESTIMENTO').AsInteger;
   QryDetalhe.FieldByName('PUORDMOVINV').AsFloat := Qry.FieldByName('PUORDMOVINV').AsFloat;
   QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime := StrToDate(dbDtaOperacao.Text);
   QryDetalhe.FieldByName('QTDEORDMOVINV').AsFloat := Qry.FieldByName('QTDEORDMOVINV').AsFloat;
   QryDetalhe.FieldByName('NUMDOCMOVINV').AsString :=  Qry.FieldByName('NUMDOCMOVINV').AsString;
   QryDetalhe.FieldByName('STATMOVINV').AsString := Qry.FieldByName('STATMOVINV').AsString;
   QryDetalhe.FieldByName('IDUSUARIO').AsInteger := Qry.FieldByName('IDUSUARIO').AsInteger;
   QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger := Qry.FieldByName('IDTIPOINVEST').AsInteger;
   QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger :=  Qry.FieldByName('IDTIPOOPERACAO').AsInteger;
   QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger := Qry.FieldByName('IDCARTEIRAGERENC').AsInteger;
   QryDetalhe.FieldByName('IDLOTE').AsString := Qry.FieldByName('IDLOTE').AsString;
   QryDetalhe.FieldByName('IDBOLSAVALORES').AsInteger := Qry.FieldByName('IDBOLSAVALORES').AsInteger;
   QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger :=  Qry.FieldByName('IDCUSTODIANTE').AsInteger;
   QryDetalhe.FieldByName('QTDEORDENADA').AsFloat :=  Qry.FieldByName('QTDEORDENADA').AsFloat;
   QryDetalhe.FieldByName('DATAAUTORIZACAO').AsDateTime := Qry.FieldByName('DATAAUTORIZACAO').AsDateTime;
   QryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger := Qry.FieldByName('IDPLANPREVCTBPATR').AsInteger;
   QryDetalhe.FieldByName('HORAMOV').AsString := Qry.FieldByName('HORAMOV').AsString;
   QryDetalhe.FieldByName('VALOR').AsCurrency := Qry.FieldByName('VALOR').AsCurrency;
   QryDetalhe.FieldByName('DESCINVESTIMENTO').AsString :=  Qry.FieldByName('DESCINVESTIMENTO').AsString;

   //Desabilita campos para não modificar alguns dados
   QryDetalheDESCINVESTIMENTO.ReadOnly := True;

end;

procedure TfrmEspOrdemMovimentacao.BtCancDetClick(Sender: TObject);
begin
  inherited;

   bTrocaLine := True;

   Qry.Cancel;

   QryDetalheDESCINVESTIMENTO.ReadOnly := False;

   //Trata Máscara
   QryDetalheQTDEORDENADA.DisplayFormat := '###,###,###,###';
   QryDetalhePUORDMOVINV.DisplayFormat  := '###,###,###,########0.00000000';
   QryDetalheVALOR.DisplayFormat        := '###,###,###,###0.00';

   QryDetalhe.Cancel;

   dbgEspecificada.Options := dbgEspecificada.Options - [TwwDBgridOption(dgEditing)];
   dbgEspecificada.Color   := clSilver;

   BtIncDet.Down          := False;
   BtAltDet.Down          := False;

   HabilitaBotoes;

   BtOkDet.Enabled        := False;
   BtCancDet.Enabled      := False;
   BtVoltaDet.Enabled     := False;

end;

procedure TfrmEspOrdemMovimentacao.FormShow(Sender: TObject);
begin
  inherited;

    bTrocaLine  := True;

    If Sistema.NomeEmpresa  <> 'REFER' Then
    Begin
       DblCarteiraDetalhe.LookupField := 'IDCARTEIRAGERENC';
       DblCarteiraDetalhe.DataField   := 'IDCARTEIRAGERENC';
       QryDetalheDESCCARTINVEST.KeyFields := 'IDCARTEIRAGERENC';
       QryDetalheDESCCARTINVEST.LookupKeyFields := 'IDCARTEIRAGERENC';
       With QryBuscaCarteira Do
       Begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT IDCARTEIRAINVEST, IDCARTEIRAGERENC,');
          Sql.Add('DESCCARTGERENC AS DESCCARTINVEST FROM     ');
          Sql.Add('CARTEIRAGERENC ORDER BY DESCCARTINVEST ');
       End;
    End;

   QryBuscaCarteira.Open;
   QryBuscaOperacao.Open;

end;

procedure TfrmEspOrdemMovimentacao.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  If MontaSelect.RetornouValor Then
  Begin
     PnlBoleta.Caption      := MontaSelect.ValoresChave[0];
     PnlBoleta.Repaint;

     dbDtaOperacao.Text     := Copy(MontaSelect.ValoresChave[1],1,10);

     QryCorretValores.Close;
     QryCorretValores.ParamByName('DATAORDMOVINV').AsString := DateToStr(dbDtaOperacao.Date);
     QryCorretValores.Open;

     If QryCorretValores.Locate('IDCORRETVALORES', MontaSelect.ValoresChave[2], [loPartialKey]) Then
        dblSiglaCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString
     Else
        dblSiglaCorretora.Clear;

     If QryBuscaOperacao.Locate('IDTIPOOPERACAO', MontaSelect.ValoresChave[3], [loPartialKey]) Then
        dblOperacao.Text := QryBuscaOperacao.FieldByName('DESCTIPOOPERACAO').AsString
     Else
        dblOperacao.Clear;

     AbreQuery;

     HabilitaBotoes;
  End
end;

procedure TfrmEspOrdemMovimentacao.BtOkDetClick(Sender: TObject);
begin
  inherited;

   If Trim(QryDetalhe.FieldByName('DESCCARTINVEST').AsString) = '' Then
   Begin
      MsgDlg('Falta indicar a Carteira.', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Exit;
   End;

   If QryDetalhe.FieldByName('QTDEORDENADA').AsFloat = 0 Then
   Begin
      MsgDlg('A Quantidade Negociada não pode ser igual a zero.', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Exit;
   End;

   If (QryDetalhe.FieldByName('QTDEORDENADA').AsFloat >
       Qry.FieldByName('QTDEORDENADA').AsFloat) Then
   Begin
      MsgDlg('A Quantidade Negociada Especificada é maior que Quantidade Negociada à Especificar.',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Exit;
   End;

   bTrocaLine := True;

   BtIncDet.Down          := False;
   BtAltDet.Down          := False;

   QryDetalheDESCINVESTIMENTO.ReadOnly := False;

   //Trata Máscara
   QryDetalheQTDEORDENADA.DisplayFormat := '###,###,###,###';
   QryDetalhePUORDMOVINV.DisplayFormat  := '###,###,###,########0.00000000';
   QryDetalheVALOR.DisplayFormat        := '###,###,###,###0.00';

   Qry.Edit;

   If QryDetalhe.State = DsInsert Then
      Qry.FieldByName('QTDEORDENADA').AsFloat := (Qry.FieldByName('QTDEORDENADA').AsFloat -
                                                  QryDetalhe.FieldByName('QTDEORDENADA').AsFloat)
   Else
      Qry.FieldByName('QTDEORDENADA').AsFloat :=  (Qry.FieldByName('QTDEORDENADA').AsFloat+
                                                        QryDetalhe.FieldByName('QTDEORDENADA').OldValue-
                                                        QryDetalhe.FieldByName('QTDEORDENADA').NewValue);

   If  Qry.FieldByName('QTDEORDENADA').AsFloat = 0 Then
   Begin
      Qry.Cancel;
      Qry.Delete;
   End
   Else
   Begin
      Qry.FieldByName('VALOR').AsFloat    := AtualizaLote(Qry);
      Qry.Post;
   End;

   QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime := StrToDateTime(dbDtaOperacao.Text+' '+QryDetalhe.FieldByName('HORAMOV').AsString);

   If QryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger = 0 Then
      QryDetalhe.FieldByName('IDPLANPREVCTBPATR').Clear;

   QryDetalhe.Post;
   QryDetalhe.ApplyUpdates;
   QryDetalhe.CommitUpdates;

   If Qry.RecordCount = 0 Then
   Begin
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
   End;

   dbgEspecificada.Options := dbgEspecificada.Options - [TwwDBgridOption(dgEditing)];
   dbgEspecificada.Color   := clSilver;

   HabilitaBotoes;

   BtOkDet.Enabled        := False;
   BtCancDet.Enabled      := False;
   BtVoltaDet.Enabled     := False;

end;

procedure TfrmEspOrdemMovimentacao.bbtnConfirmarClick(Sender: TObject);
begin
   Try
      QryDeleta.Close;
      QryDeleta.ParamByName('DATAORDMOVINV').AsString    := DateToStr(dbDtaOperacao.Date);
      QryDeleta.ParamByName('IDTIPOOPERACAO').AsInteger  := QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
      QryDeleta.ParamByName('IDCORRETVALORES').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      QryDeleta.ExecSQL;

      If dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;

      MsgDlg('Operação Confirmada!', 'Mensagem do Sistema ',mtWarning,[mbOK],0);

      bbtnCancelarClick(Sender);

   Except

      MsgDlg('A Especificação das Ordens de Movimentação será Cancelada!', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
      
      bbtnCancelarClick(Sender);

   End;

   PnlFundo.Enabled       := True;
   PnlData.Enabled        := True;
   PnlEspecificar.Enabled := True;
end;

procedure TfrmEspOrdemMovimentacao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
    bTrocaLine := True;

    If dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.RollBack ;

    AbreQuery;

    HabilitaBotoes;

    PnlFundo.Enabled       := True;
    PnlData.Enabled        := True;
    PnlEspecificar.Enabled := True;

end;

procedure TfrmEspOrdemMovimentacao.dbgEspecificadaColExit(Sender: TObject);
begin
  inherited;
   If QryDetalhe.State In [DsInsert, DsEdit] Then
      QryDetalhe.FieldByName('VALOR').AsFloat    := AtualizaLote(QryDetalhe);

end;

procedure TfrmEspOrdemMovimentacao.QryDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  If Not bTrocaLine Then
  Begin
     MsgDlg('Não é permetido alterar o outro registro.', 'Mensagem do Sistema', mtWarning,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmEspOrdemMovimentacao.dbgEspecificadaEnter(Sender: TObject);
begin
  inherited;
   KeyPreview := False;
end;

procedure TfrmEspOrdemMovimentacao.dbgEspecificadaExit(Sender: TObject);
begin
  inherited;
   KeyPreview := True;
   If QryDetalhe.State In [DsInsert, DsEdit] Then
   Begin
      If QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger <> QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger Then
         QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger :=  QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

      If QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger <> QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger Then
         QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger := QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger;

      If QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger = 0 Then
         QryDetalhe.FieldByName('IDCARTEIRAGERENC').Clear;

      QryDetalhe.FieldByName('VALOR').AsFloat    := AtualizaLote(QryDetalhe);

   End;
end;

procedure TfrmEspOrdemMovimentacao.dbgEspecificadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgEspecificada.Options = [TwwDBgridOption(dgEditing),
                                  TwwDBgridOption(dgAlwaysShowEditor),
                                  TwwDBgridOption(dgTitles),
                                  TwwDBgridOption(dgIndicator),
                                  TwwDBgridOption(dgColumnResize),
                                  TwwDBgridOption(dgColLines),
                                  TwwDBgridOption(dgRowLines),
                                  TwwDBgridOption(dgAlwaysShowSelection),
                                  TwwDBgridOption(dgCancelOnExit),
                                  TwwDBgridOption(dgWordWrap)]) Then
      Key := 0;

  inherited;

end;

procedure TfrmEspOrdemMovimentacao.dbgEspecificadaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgEspecificada.Options = [TwwDBgridOption(dgEditing),
                                  TwwDBgridOption(dgAlwaysShowEditor),
                                  TwwDBgridOption(dgTitles),
                                  TwwDBgridOption(dgIndicator),
                                  TwwDBgridOption(dgColumnResize),
                                  TwwDBgridOption(dgColLines),
                                  TwwDBgridOption(dgRowLines),
                                  TwwDBgridOption(dgAlwaysShowSelection),
                                  TwwDBgridOption(dgCancelOnExit),
                                  TwwDBgridOption(dgWordWrap)]) Then
      Key := 0;

  inherited;

end;

procedure TfrmEspOrdemMovimentacao.AbreQuery;
Begin

   QryAuxiliar.Close;
   QryAuxiliar.ParamByName('DATAORDMOVINV').AsString    := DateToStr(dbDtaOperacao.Date);
   QryAuxiliar.ParamByName('IDTIPOOPERACAO').AsInteger  := QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
   QryAuxiliar.ParamByName('IDCORRETVALORES').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
   QryAuxiliar.Open;

   AlimentaQryAuxiliar;

   Qry.Close;
   Qry.ParamByName('DATAORDMOVINV').AsString    := DateToStr(dbDtaOperacao.Date);
   Qry.ParamByName('IDTIPOOPERACAO').AsInteger  := QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
   Qry.ParamByName('IDCORRETVALORES').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
   Qry.Open;

   PnlBoleta.Caption := Qry.FieldByName('NUMDOCMOVINV').AsString;
   PnlBoleta.Repaint;

   AlimentaQry;

   QryDetalhe.Close;
   QryDetalhe.ParamByName('DATAORDMOVINV').AsString    := dbDtaOperacao.Text;
   QryDetalhe.ParamByName('IDTIPOOPERACAO').AsInteger  := QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
   QryDetalhe.ParamByName('IDCORRETVALORES').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
   QryDetalhe.Open;

   AlimentaQryDetalhe;

End;

procedure TfrmEspOrdemMovimentacao.bbtnSairClick(Sender: TObject);
begin
  inherited;
    If dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.RollBack ;
end;

procedure TfrmEspOrdemMovimentacao.BtDelDetClick(Sender: TObject);
begin
  inherited;

   HabilitaBotoes;

   If Qry.RecordCount = 1 Then
   Begin
      Qry.Edit;
      Qry.FieldByName('QTDEORDENADA').AsFloat := (Qry.FieldByName('QTDEORDENADA').AsFloat+QryDetalhe.FieldByName('QTDEORDENADA').AsFloat);

      Qry.FieldByName('VALOR').AsFloat    := AtualizaLote(Qry);

      Qry.Post;

      QryDetalhe.Delete;

   End
   Else If (Qry.RecordCount = 0) And (QryDetalhe.RecordCount >= 1) Then
      bbtnCancelarClick(Sender);

   BtDelDet.Down := False;

end;

procedure TfrmEspOrdemMovimentacao.BtAltDetClick(Sender: TObject);
begin
  inherited;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   bbtnConfirmar.Enabled  := True;
   bbtnCancelar.Enabled   := True;

   //Habilita botões do Detalhe
   BtOkDet.Enabled        := True;
   BtCancDet.Enabled      := True;
   BtVoltaDet.Enabled     := True;

   BtIncDet.Enabled       := False;
   BtAltDet.Enabled       := False;
   BtDelDet.Enabled       := False;

   //Habilita campos para modificação de dados
   QryDetalheDESCINVESTIMENTO.ReadOnly  := False;

   //Trata Máscara
   QryDetalheQTDEORDENADA.DisplayFormat := '';
   QryDetalhePUORDMOVINV.DisplayFormat  := '';
   QryDetalheVALOR.DisplayFormat        := '';

   QryDetalhe.Edit;

   //Prepara Grid para Inserção de Dados
   dbgEspecificada.SelectedIndex := 0;
   dbgEspecificada.Options       := dbgEspecificada.Options + [TwwDBgridOption(dgEditing)];
   dbgEspecificada.Font.Color    := clBlack;
   dbgEspecificada.SetFocus;

   //Desabilita campos para não modificar alguns dados
   QryDetalheDESCINVESTIMENTO.ReadOnly := True;

end;

procedure TfrmEspOrdemMovimentacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   Qry.Close;
   QryAux.Close;
   QryDetalhe.Close;
   QryCorretValores.Close;
   QryBuscaCarteira.Close;
end;

procedure TfrmEspOrdemMovimentacao.dblOperacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
                                                      modified: Boolean);
begin
  inherited;
   if dblOperacao.lookupvalue <> '' then
   begin
     AbreQuery;
     bbtnConfirmar.Enabled := True;
     bbtnCancelar.Enabled  := True;
     HabilitaBotoes;
   end;
end;

procedure TfrmEspOrdemMovimentacao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //AL_1
  If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
      
  inherited;
  
end;

end.

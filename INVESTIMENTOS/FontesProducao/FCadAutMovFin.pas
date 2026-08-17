unit FCadAutMovFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  DBTables, Wwquery, FOkCancelar, USistema, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmCadAutMovFin = class(TfrmOkCancelar)
    grddbOrdMovInv: TwwDBGrid;
    DtsOrdMovInv: TwwDataSource;
    UpdtOrdMovInv: TUpdateSQL;
    txtData: TCMDateTimePicker;
    qryEmissor: TwwQuery;
    cbodbEmissor: TwwDBLookupCombo;
    QryOrdMovInv: TwwQuery;
    QryOrdMovInvSTATMOVINV: TStringField;
    QryOrdMovInvDATAORDMOVINV: TDateTimeField;
    QryOrdMovInvQTDEORDMOVINV: TFloatField;
    QryOrdMovInvPUORDMOVINV: TFloatField;
    QryOrdMovInvNUMDOCMOVINV: TStringField;
    QryOrdMovInvOBSMOVINV: TStringField;
    QryOrdMovInvDESCINVESTIMENTO: TStringField;
    QryOrdMovInvUSUARIO: TStringField;
    QryOrdMovInvIDORDMOVINV: TFloatField;
    QryOrdMovInvIDINVESTIMENTO: TFloatField;
    QryOrdMovInvIDEMISSOR: TFloatField;
    QryOrdMovInvIDAUTORIZACAO: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    cbodbCorretora: TwwDBLookupCombo;
    Label3: TLabel;
    qryCorretValores: TwwQuery;
    cbodbUsuario: TwwDBLookupCombo;
    Label4: TLabel;
    qryUsuario: TwwQuery;
    qryCorretValoresIDCORRETVALORES: TFloatField;
    qryCorretValoresSGLCORRETVALORES: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    qryUsuarioIDUSUARIO: TFloatField;
    qryUsuarioNOME: TStringField;
    qryEmissorSIGLAEMISSOR: TStringField;
    QryOrdMovInvSIGLAEMISSOR: TStringField;
    DbLkpMercado: TwwDBLookupCombo;
    Label5: TLabel;
    Label6: TLabel;
    DbLkpTipoOper: TwwDBLookupCombo;
    QryMercado: TwwQuery;
    DtsMercado: TwwDataSource;
    QryMercadoIDMERCADO: TFloatField;
    QryMercadoDESCMERCADO: TStringField;
    QryTipoOperacao: TwwQuery;
    QryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    QryOrdMovInvDESCTIPOOPERACAO: TStringField;
    BtMarcar: TBitBtn;
    Image1: TImage;
    LblTotalAutorizado: TLabel;
    QryOrdMovInvTOTAL: TFloatField;
    LblTotal: TLabel;
    QryOrdMovInvQTDEORDENADA: TFloatField;
    grddbOrdMovInvIButton: TwwIButton;
    QryOrdMovInvSGLCORRETVALORES: TStringField;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtDataChange(Sender: TObject);
    procedure QryOrdMovInvBeforeEdit(DataSet: TDataSet);
    procedure cbodbEmissorChange(Sender: TObject);
    procedure cbodbCorretoraChange(Sender: TObject);
    procedure cbodbUsuarioChange(Sender: TObject);
    procedure DbLkpMercadoChange(Sender: TObject);
    procedure DbLkpTipoOperChange(Sender: TObject);
    procedure DbLkpTipoOperClick(Sender: TObject);
    procedure BtMarcarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryOrdMovInvAfterPost(DataSet: TDataSet);
    procedure QryOrdMovInvSTATMOVINVChange(Sender: TField);
    procedure QryOrdMovInvAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CalculaTotais;
    function BuscaDadosCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
                              UsaLote:Boolean; var QtdLote : double): double;
  public
    { Public declarations }
    Data, Emissor, Corretora, Usuario, Mercado, TipoOperacao: string;

  end;

const
 sqlq = 'SELECT O.STATMOVINV, O.DATAORDMOVINV, O.QTDEORDMOVINV, O.PUORDMOVINV,'+
        'O.NUMDOCMOVINV, O.OBSMOVINV, I.DESCINVESTIMENTO, O.IDAUTORIZACAO, O.QTDEORDENADA,'+
        'PU.NOME AS USUARIO, E.SIGLAEMISSOR, O.IDORDMOVINV, I.IDINVESTIMENTO,'+
        'C.SGLCORRETVALORES, '+
        'E.IDEMISSOR, T.DESCTIPOOPERACAO, (O.PUORDMOVINV*O.QTDEORDMOVINV) AS TOTAL '+

        'FROM ORDMOVINV O, PESSOA PU, EMISSOR E, INVESTIMENTO I,'+
        '     TIPOOPERACAO T, MERCADO M, CORRETVALORES C '+

        'Where (O.StatMovInv<>'+#39+'L'+#39+' and '+
        'O.IDINVESTIMENTO    =  I.IDINVESTIMENTO AND '+
        'I.IDEMISSOR         =  E.IDEMISSOR AND '+
        'O.IDCORRETVALORES   =  C.IDCORRETVALORES  AND '+
        'PU.IDPESSOA         =  O.IDUSUARIO AND '+
        'O.IDTIPOOPERACAO    =  T.IDTIPOOPERACAO(+) AND '+
        'M.IDMERCADO(+)      =  T.IDMERCADO) ';
var
  frmCadAutMovFin: TfrmCadAutMovFin;
  TotalAutoriza, Total,  wCotacao, QtdLote : double;

implementation

uses DBaseDados, uBibliotecaInvest;

{$R *.DFM}

procedure TfrmCadAutMovFin.bbtnCancelarClick(Sender: TObject);
begin
// Inherited;
// Inicia uma Transaçao no Banco de Dados \\
  If DtmBaseDados.dbBaseDados.InTransaction Then Begin
     DtmBaseDados.dbBaseDados.Rollback
  End;
// Refresh no Grid
  QryOrdMovInv.Close;
  QryOrdMovInv.Open;
//-----------------------------------------------------------------------------------------
  MessageBox(Handle,'Atualização cancelada.',
             'Autorização de Movimentação Financeira',MB_OK or
             MB_APPLMODAL or MB_ICONEXCLAMATION)
end;

procedure TfrmCadAutMovFin.bbtnConfirmarClick(Sender: TObject);
Var
  Mexeu: boolean;
begin
     if qryOrdMovInv.State in [dsEdit, dsInsert] then
        Mexeu := true
     else
        Mexeu := false;

     try
        // Inicia uma Transaçao no Banco de Dados \\
        if qryOrdMovInv.State in [dsEdit] then
           qryOrdMovInv.Post;

        If DtmBaseDados.dbBaseDados.InTransaction Then
           DtmBaseDados.dbBaseDados.Commit;

//        if Mexeu then
           MessageBox(Handle,'Operação concluida com sucesso.',
                      'Autorização de Movimentação Financeira',MB_OK or
                      MB_APPLMODAL or MB_ICONINFORMATION)
     except
        MessageBox(Handle,'Ordem de Movimentação não foi autorizada.',
                   'Autorização de Movimentação Financeira [Erro]',MB_OK or
                   MB_APPLMODAL or MB_ICONERROR)
     end;
end;

procedure TfrmCadAutMovFin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Fecha queries
  qryOrdMovInv.Close;
  qryEmissor.Close;
  qryUsuario.Close;
  qryCorretValores.Close;
  QryMercado.Close;
  QryTipoOperacao.Close;
end;

procedure TfrmCadAutMovFin.txtDataChange(Sender: TObject);
begin
 //inherited;
 if Trim(txtData.Text) <> '' then
    Data := ' AND TO_DATE(TO_CHAR(O.DATAORDMOVINV'+
            ',''DD/MM/YYYY''),''DD/MM/YYYY'')='+
            'TO_DATE('+QuotedStr(txtData.Text)+
            ',''DD/MM/YYYY'') '
 else
    txtData.Text := DateToStr(txtData.Date);

 FazQuery(qryOrdMovInv, sqlq+ Data + Emissor+ Corretora+ Usuario+Mercado+TipoOperacao);
 CalculaTotais;

 LblTotalAutorizado.Caption := 'TOTAL AUTORIZADO : '+
                     FormatFloat('###,###,###,###,##0.00',TotalAutoriza);
 LblTotal.Caption := 'TOTAL : '+
                     FormatFloat('###,###,###,###,##0.00',Total);
end;

procedure TfrmCadAutMovFin.QryOrdMovInvBeforeEdit(DataSet: TDataSet);
Begin

// Se o campo QTDEORDMOVINV estiver vazio, gravo nele a QTDEORDENADA
  If QryOrdMovInv.FieldByName('QTDEORDMOVINV').IsNull Then Begin
     UpdtOrdMovInv.ModifySQL.Text := 'UPDATE ORDMOVINV SET '+
                                  ' STATMOVINV     = :STATMOVINV,'+
                                  ' IDAUTORIZACAO  = '+ IntToStr(Sistema.IdUsuario)+', '+
                                  ' QTDEORDMOVINV  = '+ qryOrdMovInv.FieldByName('QTDEORDENADA').AsString+' '+
                                  ' WHERE IDORDMOVINV = :OLD_IDORDMOVINV ';
  End Else Begin
     UpdtOrdMovInv.ModifySQL.Text := 'UPDATE ORDMOVINV SET '+
                                  ' STATMOVINV = :STATMOVINV,'+
                                  ' IDAUTORIZACAO = '+ IntToStr(Sistema.IdUsuario)+',  '+
                                  ' QTDEORDMOVINV  = :QTDEORDMOVINV '+
                                  ' WHERE IDORDMOVINV = :OLD_IDORDMOVINV';
  End;

  If Not DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.StartTransaction

end;

procedure TfrmCadAutMovFin.cbodbEmissorChange(Sender: TObject);
begin
  inherited;
  if Trim(cbodbEmissor.Text) <> '' then
     Emissor := ' AND E.IDEMISSOR ='+QuotedStr(cbodbEmissor.LookupValue)
  else
     Emissor := '';

  FazQuery(qryOrdMovInv, sqlq+ Data + Emissor+ Corretora+ Usuario+Mercado+TipoOperacao);

  LblTotalAutorizado.Caption := 'TOTAL AUTORIZADO : '+
                      FormatFloat('###,###,###,###,##0.00', TotalAutoriza);

  LblTotal.Caption := 'TOTAL : '+
                      FormatFloat('###,###,###,###,##0.00', Total);
end;

procedure TfrmCadAutMovFin.cbodbCorretoraChange(Sender: TObject);
begin
  inherited;
  If Trim(cbodbCorretora.Text) <> '' Then
     Corretora := ' AND C.IDCORRETVALORES =' + QuotedStr(cbodbCorretora.LookupValue)
  Else
     Corretora := '';

  FazQuery(qryOrdMovInv, sqlq+ Data + Emissor+ Corretora+ Usuario+Mercado+TipoOperacao);

  LblTotalAutorizado.Caption := 'TOTAL AUTORIZADO : '+
                      FormatFloat('###,###,###,###,##0.00',TotalAutoriza);

  LblTotal.Caption := 'TOTAL : '+
                      FormatFloat('###,###,###,###,##0.00',Total);
end;

procedure TfrmCadAutMovFin.cbodbUsuarioChange(Sender: TObject);
begin
   inherited;
   If Trim(cbodbUsuario.Text) <> '' Then
      Usuario := ' AND O.IDUSUARIO ='+QuotedStr(cbodbUsuario.LookupValue)
   Else
      Usuario := '';

   FazQuery(qryOrdMovInv, sqlq+ Data + Emissor+ Corretora+ Usuario+Mercado+TipoOperacao);

   LblTotalAutorizado.Caption := 'TOTAL AUTORIZADO : '+
                       FormatFloat('###,###,###,###,##0.00', TotalAutoriza);

   LblTotal.Caption := 'TOTAL : '+
                       FormatFloat('###,###,###,###,##0.00', Total);
end;

procedure TfrmCadAutMovFin.DbLkpMercadoChange(Sender: TObject);
begin
  inherited;
  If Trim(DbLkpMercado.Text) <> '' Then
     Mercado := ' AND M.IDMERCADO  ='+QuotedStr(DbLkpMercado.LookupValue)
  Else
     Mercado := '';

  FazQuery(qryOrdMovInv, sqlq+ Data + Emissor+ Corretora+ Usuario+Mercado+TipoOperacao);

  LblTotalAutorizado.Caption := 'TOTAL AUTORIZADO : '+
                       FormatFloat('###,###,###,###,##0.00', TotalAutoriza);

  LblTotal.Caption := 'TOTAL : '+
                      FormatFloat('###,###,###,###,##0.00', Total);
end;


procedure TfrmCadAutMovFin.DbLkpTipoOperChange(Sender: TObject);
begin
  inherited;
  If Trim(DbLkpTipoOper.Text) <> '' Then
     TipoOperacao := ' AND T.IDTIPOOPERACAO  ='+QuotedStr(DbLkpTipoOper.LookupValue)
  Else
     TipoOperacao := '';

  FazQuery(qryOrdMovInv, sqlq+ Data + Emissor+ Corretora+ Usuario+Mercado+TipoOperacao);
  LblTotal.Caption := 'TOTAL : '+
                      FormatFloat('###,###,###,###,##0.00', TotalAutoriza);
end;

procedure TfrmCadAutMovFin.DbLkpTipoOperClick(Sender: TObject);
begin
  inherited;
  DbLkpTipoOper.Text := QryTipoOperacao.FieldbyName('DESCTIPOOPERACAO').AsString;
end;

procedure TfrmCadAutMovFin.BtMarcarClick(Sender: TObject);
var I :   Integer;
begin
  inherited;
// Se clicar no botão Marcar Todos, mudo o status de todos os registros do grid para 'A'
// senão mudo o status de todos os registros do grid para 'P'
  With qryOrdMovInv Do Begin
    DisableControls;
    First;
    While Not EOF Do Begin
      Edit;
      If BtMarcar.Caption = 'Marcar Todos' Then Begin
        FieldByName('STATMOVINV').AsString := 'A';
      End Else Begin
        FieldByName('STATMOVINV').AsString := 'P';
      End;
//      Post;
      Next;
    End;

    If BtMarcar.Caption = 'Marcar Todos' Then Begin
      BtMarcar.Caption:='Desmarcar Todos';
    End Else Begin
      BtMarcar.Caption:='Marcar Todos';
    End;
    CalculaTotais;
    EnableControls;
  End;

end;

procedure TfrmCadAutMovFin.FormShow(Sender: TObject);
begin
  inherited;
// Abre queries
  txtData.Date := Date;
  qryUsuario.Open;
  qryCorretValores.Open;
  qryEmissor.Open;
  QryMercado.Open;
  QryTipoOperacao.Open;
end;

//*****************************************************************************************
procedure TfrmCadAutMovFin.CalculaTotais;
Var
  QryLocal:TwwQuery;
Begin
// Prepara Query
 QryLocal             := TwwQuery.Create(Application);
 QryLocal.DatabaseName:= 'BaseDados';
 FazQuery(QryLocal, SQLq+Data+Emissor+Corretora+Usuario+Mercado+TipoOperacao);

// Abre a Query
 QryLocal.Open;

// QryLocal:=QryOrdMovInv;
 QryLocal.DisableControls;
// Busca a Ultima Cotacao deste Investimento / Lote
 wCotacao := BuscaDadosCotacaoInvest(QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
              TxtData.Date, True, QtdLote);

// Zera Variaveis Globais
 TotalAutoriza := 0;
 Total         := 0;

// Altera o Ambiente
 grddbOrdMovInv.Enabled := Not QryLocal.IsEmpty;
 BtMarcar.Enabled       := Not QryLocal.IsEmpty;

 QryLocal.First;
// Calcula Total do Grid e de Autorizados
 While Not QryLocal.EOF Do Begin
// Totaliza Grid
    Total := Total + (QryLocal.FieldByName('TOTAL').AsFloat/QtdLote);
// Caso seja Autorizado Totaliza
    If (QryLocal.FieldByName('STATMOVINV').AsString = 'A') Then
       TotalAutoriza := TotalAutoriza + (QryLocal.FieldByName('TOTAL').AsFloat/QtdLote);
// Proximo Registro
    QryLocal.Next;
 End;
// Volta ao Primeiro Registro
 QryLocal.First;

 QryLocal.EnableControls;

 LblTotalAutorizado.Caption := 'TOTAL AUTORIZADO : '+
                     FormatFloat('###,###,###,###,##0.00',TotalAutoriza);
 LblTotal.Caption := 'TOTAL : '+
                     FormatFloat('###,###,###,###,##0.00',Total);
end;

procedure TfrmCadAutMovFin.QryOrdMovInvAfterPost(DataSet: TDataSet);
begin
  inherited;
// Guarda alterações
  If Not QryOrdMovInv.IsEmpty Then Begin
    Try
      qryOrdMovInv.ApplyUpdates;
      qryOrdMovInv.CommitUpdates;
    Except
      Raise;
    End;
  End;
end;

// Função que Busca Cotação de um Investimento numa determinada data.
function TfrmCadAutMovFin.BuscaDadosCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
                              UsaLote:Boolean; var QtdLote : double): double;
var
   QryLocal  :TwwQuery;
begin
    Result := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    FazQuery(QryLocal,
      'SELECT DATACOTACAO, VLRCONTABIL, QTDTITLOTE '+
      'FROM COTACAOINVEST '+
      'WHERE 	(IDINVESTIMENTO = '''+ InttoStr(iInvestimento)+''') AND '+
      '      	(DATACOTACAO <= TO_DATE( '''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+
      'ORDER BY DATACOTACAO DESC ');

// Caso Utilize Lote Faz Calculo
    If UsaLote = True Then Begin
      If QryLocal.FieldByName('QTDTITLOTE').AsFloat <> 0 then
         Result := (QryLocal.FieldByName('VLRCONTABIL').AsFloat /
                   QryLocal.FieldByName('QTDTITLOTE').AsFloat)

      Else
         Result := QryLocal.FieldByName('VLRCONTABIL').AsFloat;
    End Else Begin
// Caso Não Utilize Lote. Guarda
      Result := QryLocal.FieldByName('VLRCONTABIL').AsFloat;
    End;
    If (QryLocal.FieldByName('QTDTITLOTE').AsFloat = 0) or
       (QryLocal.FieldByName('QTDTITLOTE').IsNull)  Then
       QtdLote := 1
    Else
       QtdLote := QryLocal.FieldByName('QTDTITLOTE').AsFloat;

    QryLocal.Free;
end;

procedure TfrmCadAutMovFin.QryOrdMovInvSTATMOVINVChange(Sender: TField);
begin
  inherited;
  If (QryOrdMovInv.State In [DsEdit]) Then Begin
// Guarda alterações
    If Not QryOrdMovInv.IsEmpty Then Begin
      Try
        QryOrdMovInv.Post;
        CalculaTotais;
      Except
        Raise;
      End;
    End;
  End;
end;

procedure TfrmCadAutMovFin.QryOrdMovInvAfterOpen(DataSet: TDataSet);
begin
  inherited;
  BtMarcar.Enabled := Not (QryOrdMovInv.IsEmpty);
end;

end.



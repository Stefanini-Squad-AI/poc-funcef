unit FCadPosicaoFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, Mask, UDataBase, TREdit, wwdbedit,
  Wwdotdot, Wwdbcomb, USistema, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DBGrids, Wwdbdlg, CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, CmEventosCadastro, ImgList;

type                      
  TfrmCadPosicaoFundo = class(TfrmCadastroCS)
    PageControlDetalhe: TPageControl;
    TabSheet1: TTabSheet;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    QryDetalhe: TwwQuery;
    DsDetalhe: TwwDataSource;
    updDetalhe: TUpdateSQL;
    Label3: TLabel;
    Dock978: TDock97;
    Toolbar975: TToolbar97;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    Panel1: TPanel;
    QryFundoInvest: TwwQuery;
    QryInvestimento: TwwQuery;
    QryFundoInvestIDFUNDOINVEST: TFloatField;
    QryFundoInvestDESCFUNDOINVEST: TStringField;
    QryDetalheIDFUNDOINVEST: TFloatField;
    QryDetalheIDINVESTIMENTO: TFloatField;
    QryDetalheDATAREFERENCIA: TDateTimeField;
    QryDetalheQTDATUAL: TFloatField;
    qryAux: TwwQuery;
    dbgPosicao: TwwDBGrid;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    pnlPrincipal: TPanel;
    Label1: TLabel;
    dbDtaPosicao: TCMDateTimePicker;
    Label2: TLabel;
    dblFundo: TwwDBLookupCombo;
    dblkInvestimento: TwwDBLookupCombo;
    QryDetalheDESCINVESTIMENTO: TStringField;
    QryBuscaAcaoPosicao: TwwQuery;
    QryBuscaAcaoPosicaoQTDATUAL: TFloatField;
    dbgPosicaoIButton: TwwIButton;
    sbtnImprime: TToolbarButton97;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgFundosKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure dbgFundosKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure BtIncDetClick(Sender: TObject);
    procedure BtOkDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure HabilitaIncAltExcDetalhe;
    procedure DesabilitaIncAltExcDetalhe;
    procedure AbreQry;
    function  ValidaCamposPrincipal : Boolean;
    function  ValidaCamposDetalhe : Boolean;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure QryDetalheBeforePost(DataSet: TDataSet);
    procedure dbgPosicaoKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure dbgPosicaoKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure dblFundoExit(Sender: TObject);
    procedure HabilitaBotoesDetalhe;
    procedure DesabilitaBotoesDetalhe;
    procedure dbDtaPosicaoExit(Sender: TObject);
    function VerificaDados:boolean;
    procedure dbgPosicaoEnter(Sender: TObject);
    procedure dbgPosicaoExit(Sender: TObject);
    procedure dblFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbgPosicaoDblClick(Sender: TObject);
    procedure sbtnImprimeClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dtRefRel: TDateTime;
    iFundoRel: Integer;
  end;

var
  frmCadPosicaoFundo: TfrmCadPosicaoFundo;
  bTrocaLine: Boolean;

implementation

uses DBaseDados, UBibliotecaInvest, UOperComum, UMensErro,
  FParamPosicaoFundo, FTelaAut, FDmRelatoriosFundos;

{$R *.DFM}

Procedure TfrmCadPosicaoFundo.CmeCadastroFind(Sender: TObject);
Begin
   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') and
      (MontaSelect.ValoresChave[1] <> '') then
      begin
         if MontaSelect.ValoresChave[0] <> '' then
         begin
            if QryFundoInvest.Locate('IDFUNDOINVEST', MontaSelect.ValoresChave[0], [loPartialKey]) then
               dblFundo.Text := QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString
            else
               dblFundo.Text := '';
            end
         else
           dblFundo.Text    := '';
         if MontaSelect.ValoresChave[1] <> '' then
            dbDtaPosicao.Text := Copy(MontaSelect.ValoresChave[1],1,10)
         else
            dbDtaPosicao.Text := '';
         AbreQry;
      end
   else
   begin
     dblFundo.Text     := QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString;
     dbDtaPosicao.Text := DateToStr(Date);
   end;
End;

procedure TfrmCadPosicaoFundo.FormShow(Sender: TObject);
begin
  inherited;
    QryFundoInvest.Open;
    QryInvestimento.Open;
    bTrocaLine       := True;
    pnlFundo.Enabled := True;
    pnlPrincipal.Enabled := True;
    PageControlDetalhe.Enabled := False;
    dbDtaPosicao.Text:= DateToStr(Date);
    if dbDtaPosicao.CanFocus then
       dbDtaPosicao.SetFocus;
end;

procedure TfrmCadPosicaoFundo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    QryFundoInvest.Close;
    QryInvestimento.Close;
    Qry.Close;
    QryDetalhe.Close;
end;

procedure TfrmCadPosicaoFundo.HabilitaIncAltExcDetalhe;
Begin
   BtAltDet.Enabled    := True;
   BtDelDet.Enabled    := True;
   BtIncDet.Enabled    := True;
   BtAltDet.Down       := False;
   BtDelDet.Down       := False;
   BtIncDet.Down       := False;
End;

procedure TfrmCadPosicaoFundo.DesabilitaIncAltExcDetalhe;
begin
   BtAltDet.Enabled   := False;
   BtDelDet.Enabled   := False;
   BtIncDet.Enabled   := False;
   BtAltDet.Down      := True;
   BtDelDet.Down      := True;
   BtIncDet.Down      := True;
end;

procedure TfrmCadPosicaoFundo.HabilitaBotoesDetalhe;
Begin
   BtOkDet.Enabled      := True;
   BtCancDet.Enabled    := True;
   BtVoltaDet.Enabled   := True;
End;

procedure TfrmCadPosicaoFundo.DesabilitaBotoesDetalhe;
begin
   BtOkDet.Enabled      := False;
   BtCancDet.Enabled    := False;
   BtVoltaDet.Enabled   := False;
end;

procedure TfrmCadPosicaoFundo.AbreQry;
Begin
   QryDetalhe.Close;
   if Trim(dblFundo.Text) = '' then
      QryDetalhe.ParamByName('IDFUNDOINVEST').Clear
   else
      QryDetalhe.ParamByName('IDFUNDOINVEST').AsString := dblFundo.LookupValue;

   if Trim(dbDtaPosicao.Text) = '' then
      QryDetalhe.ParamByName('DATAREFERENCIA').Clear
   else
     QryDetalhe.ParamByName('DATAREFERENCIA').AsDateTime := dbDtaPosicao.DateTime;

   QryDetalhe.Open;
   QryDetalhe.First;
   dbgPosicao.Options := dbgPosicao.Options - [TwwDBgridOption(dgEditing)];
End;

procedure TfrmCadPosicaoFundo.dbgFundosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If ((Key = 38) Or (Key = 40)) And
      (dbgPosicao.Options = [TwwDBgridOption(dgEditing),TwwDBgridOption(dgAlwaysShowEditor),TwwDBgridOption(dgTitles),TwwDBgridOption(dgIndicator),
                             TwwDBgridOption(dgColumnResize),TwwDBgridOption(dgColLines),TwwDBgridOption(dgRowLines),TwwDBgridOption(dgCancelOnExit)])
   Then
      Key := 0;

  inherited;
end;

procedure TfrmCadPosicaoFundo.dbgFundosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If ((Key = 38) Or (Key = 40)) And
      (dbgPosicao.Options = [TwwDBgridOption(dgEditing),TwwDBgridOption(dgAlwaysShowEditor),TwwDBgridOption(dgTitles),TwwDBgridOption(dgIndicator),
                             TwwDBgridOption(dgColumnResize),TwwDBgridOption(dgColLines),TwwDBgridOption(dgRowLines),TwwDBgridOption(dgCancelOnExit)])
   Then
      Key := 0;
  inherited;
end;

procedure TfrmCadPosicaoFundo.BtIncDetClick(Sender: TObject);
begin
   inherited;
   dbgPosicao.Enabled  := True;
   DesabilitaIncAltExcDetalhe;
   HabilitaBotoesDetalhe;

   if dbgPosicao.CanFocus then
      dbgPosicao.SetFocus;

   dbgPosicao.Options := dbgPosicao.Options + [TwwDBgridOption(dgEditing)];
   bTrocaLine := False;

   QryDetalhe.Append;
   QryDetalhe.FieldByName('IDFUNDOINVEST').AsString := dblFundo.LookupValue;
   QryDetalhe.FieldByName('DATAREFERENCIA').AsDateTime := dbDtaPosicao.Date;

   dbgPosicao.SelectedIndex := 1;
   dbgPosicao.SelectedIndex := 0;

end;

procedure TfrmCadPosicaoFundo.BtOkDetClick(Sender: TObject);
var sData: String;
    bOutra, bComita: Boolean;
begin

   dbgPosicao.FixedCols := 0;

   if not VerificaDados then
      Exit;

   bTrocaLine := True;
   bOutra := False;
   bComita := True;

   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      if QryDetalhe.State = DsInsert then begin
         QryDetalhe.FieldByName('IDFUNDOINVEST').Value := dblFundo.LookupValue;
         QryDetalhe.FieldByName('DATAREFERENCIA').Value := StrToDate(dbDtaPosicao.Text);
         QryDetalhe.FieldByName('IDINVESTIMENTO').Value := QryInvestimento.FieldByName('IDINVESTIMENTO').Value;
         bOutra := True;
      end else begin
         if QryDetalheDATAREFERENCIA.AsDateTime <> dbDtaPosicao.DateTime then
         begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('INSERT INTO POSICAOFUNDO (IDFUNDOINVEST, IDINVESTIMENTO, ' +
                           ' DATAREFERENCIA, QTDATUAL) VALUES( ' + QryDetalheIDFUNDOINVEST.AsString +
                           ', ' + QryDetalheIDINVESTIMENTO.AsString + ', ''' + dbDtaPosicao.Text +
                           ''', ' + QryDetalheQTDATUAL.AsString + ')');
            qryAux.Prepare;
            qryAux.ExecSQL;
            bComita := False;
            QryDetalhe.Cancel;
         end;
      end;

      if bComita then begin
         QryDetalhe.Post;
         QryDetalhe.ApplyUpdates;
         QryDetalhe.CommitUpdates;
      end;

      DtmBaseDados.dbBaseDados.Commit;
   except
      DtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Não foi possível realizar a Operação.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      QryDetalhe.Close;
      QryDetalhe.Open;
      Exit;
   end;

   HabilitaIncAltExcDetalhe;
   DesabilitaBotoesDetalhe;

   dbgPosicao.Options  := dbgPosicao.Options - [TwwDBgridOption(dgEditing)];

   // Refresh na query para visualização das eventuais alterções na posição do fundo
   AbreQry;

   // Inclui novo registro se o processo atual for de inclusão
   if bOutra then
      BtIncDet.Click;
end;

procedure TfrmCadPosicaoFundo.BtAltDetClick(Sender: TObject);
begin
  inherited;
  if not QryDetalhe.IsEmpty then
  begin
     dbgPosicao.Enabled  := True;
     DesabilitaIncAltExcDetalhe;
     HabilitaBotoesDetalhe;

     dbgPosicao.SelectedIndex := 0;
     dbgPosicao.Options       := dbgPosicao.Options + [TwwDBgridOption(dgEditing)];
     if dbgPosicao.CanFocus then
        dbgPosicao.SetFocus;

     bTrocaLine := False;

     QryDetalhe.Edit;

     dbgPosicao.FixedCols := 1;
     dbgPosicao.SelectedIndex := 1;

  end;
end;

procedure TfrmCadPosicaoFundo.BtDelDetClick(Sender: TObject);
begin
  inherited;
  if not QryDetalhe.IsEmpty then
  begin
     if MsgDlg('Confirma Exclusão ?', 'Mensagem do Sistema ',mtConfirmation , [mbYes, mbNo], 0) = mrNo then
     begin
        dbgPosicao.Enabled  := False;
        HabilitaIncAltExcDetalhe;
        DesabilitaBotoesDetalhe;
        bTrocaLine    := True;
        Exit;
     end;

     //--- Exclui a linha corrente
     try
        if not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

        QryDetalhe.Delete;
        QryDetalhe.ApplyUpdates;
        QryDetalhe.CommitUpdates;
        DtmBaseDados.dbBaseDados.Commit;
     except
        DtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Registro não Excluido ...',
               'Mensagem do Sistema ',mtWarning,[mbOK],0);
     end;

     // Refresh na query para visualização das alterções na posição do fundo
     AbreQry;

     BtDelDet.Down := False;

  end;
end;

procedure TfrmCadPosicaoFundo.BtCancDetClick(Sender: TObject);
begin
   dbgPosicao.FixedCols := 0;
   HabilitaIncAltExcDetalhe;
   inherited;
   DesabilitaBotoesDetalhe;
   pnlPrincipal.Enabled := True;
   AbreQry;
end;

procedure TfrmCadPosicaoFundo.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
  else if key = VK_Insert then begin
     if BtIncDet.Enabled then
        BtIncDetClick(Self);
  end;
end;

function TfrmCadPosicaoFundo.ValidaCamposPrincipal : Boolean;
begin
   if (Trim(dbDtaPosicao.Text) <> '') and (Trim(dblFundo.Text) <> '') then
   begin
      Result := True;
      PageControlDetalhe.Enabled := True;
      dbgPosicao.Enabled := True;
      HabilitaIncAltExcDetalhe;
   end else
   begin
      if Trim(dbDtaPosicao.Text) = '' then
      begin
         MsgDlg('Informe a Data de Operação.','Mensagem do Sistema', MtError,[MbOk],0);
         if dbDtaPosicao.CanFocus then
            dbDtaPosicao.SetFocus;
      end;
      if Trim(dblFundo.Text) = '' then
      begin
         MsgDlg('Informe o Fundo de Investimento.','Mensagem do Sistema', MtError,[MbOk],0);
         if dblFundo.CanFocus then
            dblFundo.SetFocus;
      end;
      Result := False;
      Exit;
   end;
end;

function TfrmCadPosicaoFundo.ValidaCamposDetalhe : Boolean;
begin
   Result := True;

   if QryDetalhe.FieldByName('IDINVESTIMENTO').IsNull then begin
      MsgDlg('Informe o Investimento.                               ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dbgPosicao.CanFocus then
         dbgPosicao.SetFocus;
      Result := False;
      Exit;
   end;

   if QryDetalhe.FieldByName('DATAREFERENCIA').IsNull then begin
      MsgDlg('Informe a Data.                               ',
          'Mensagem do Sistema', MtError,[MbOk],0);
      if dbgPosicao.CanFocus then
         dbgPosicao.SetFocus;
      Result := False;
      Exit;
   end;

   if QryDetalhe.FieldByName('QTDATUAL').IsNull then begin
      MsgDlg('Informe a Quantidade Posicionada.',
             'Mensagem do Sistema', MtError,[MbOk],0);
      if dbgPosicao.CanFocus then
         dbgPosicao.SetFocus;
      Result := False;
      Exit;
   end;
end;

procedure TfrmCadPosicaoFundo.QryDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  If Not bTrocaLine Then
  Begin
     MsgDlg('Não é permetido alterar o outro registro.',
            'Mensagem do Sistema', MtError,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmCadPosicaoFundo.dbgPosicaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then begin
      Key := 0;
      if BtCancDet.Enabled then
         BtCancDetClick(Self);
   end;

   If ((Key = 38) Or (Key = 40)) And
      (dbgPosicao.Options = [TwwDBgridOption(dgEditing),

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

procedure TfrmCadPosicaoFundo.dbgPosicaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgPosicao.Options = [TwwDBgridOption(dgEditing),
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

procedure TfrmCadPosicaoFundo.dblFundoExit(Sender: TObject);
begin
  inherited;
  if Trim(dblFundo.Text) = '' then
  begin
     if ValidaCamposPrincipal then
     begin
        AbreQry;
     end;
  end;
end;

procedure TfrmCadPosicaoFundo.dbDtaPosicaoExit(Sender: TObject);
begin
   inherited;
   AbreQry;
   if Trim(dblFundo.Text) = '' then
   begin
      dbgPosicao.Enabled  := False;
      DesabilitaIncAltExcDetalhe;
      DesabilitaBotoesDetalhe;
   end;
end;

function TfrmCadPosicaoFundo.VerificaDados:boolean;
begin
    Result := True;
    if Trim(QryDetalhe.FieldByName('DESCINVESTIMENTO').AsString) = '' then
    begin
       MsgDlg('Falta informar a ação.','Mensagem do Sistema', MtWarning,[MbOk],0);
       if dbgPosicao.CanFocus then
          dbgPosicao.SetFocus;
       Result := False;
       Exit;
    end
    else
    begin
       with QryBuscaAcaoPosicao do
       begin
          Close;
          ParamByName('DATAREFERENCIA').AsString  := dbDtaPosicao.Text;
          ParamByName('IDFUNDOINVEST').AsInteger  := QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
          ParamByName('IDINVESTIMENTO').AsInteger := QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger;
          Open;
          if (not IsEmpty) and (QryDetalhe.State = DsInsert) then
          begin
             MsgDlg('A ação já está informada.','Mensagem do Sistema', MtWarning,[MbOk],0);
             if dbgPosicao.CanFocus then
                dbgPosicao.SetFocus;
             Result := False;
             Exit;
          end;
       end;
    end;

    if (QryDetalhe.FieldByName('QTDATUAL').AsFloat < 0) or
       (QryDetalhe.FieldByName('QTDATUAL').IsNull) then
    begin
       MsgDlg('A quantidade deve ser informada e não pode ser negativa.','Mensagem do Sistema', MtWarning,[MbOk],0);
       if dbgPosicao.CanFocus then
          dbgPosicao.SetFocus;
       Result := False;
       Exit;
    end;
end;

procedure TfrmCadPosicaoFundo.dbgPosicaoEnter(Sender: TObject);
begin
   inherited;
   KeyPreview := False;
end;

procedure TfrmCadPosicaoFundo.dbgPosicaoExit(Sender: TObject);
begin
   inherited;
   KeyPreview := True;
end;

procedure TfrmCadPosicaoFundo.dblFundoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
   begin
      if ValidaCamposPrincipal then
      begin
         AbreQry;
      end;
   end;
end;

procedure TfrmCadPosicaoFundo.dbgPosicaoDblClick(Sender: TObject);
begin
  inherited;
  BtAltDet.Click;
end;

procedure TfrmCadPosicaoFundo.sbtnImprimeClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamPosicaoFundo, TfrmParamPosicaoFundo, False);
  sbtnImprime.Down := False;
end;

procedure TfrmCadPosicaoFundo.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled  :=True;

  PageControlDetalhe.Enabled :=True;

  TabSheet1.Enabled :=True;

  BtIncDet.Enabled  := True;
  BtAltDet.Enabled  := True;
  BtDelDet.Enabled  := True;


  dbDtaPosicao.Enabled:= True;
  dblFundo.Enabled    := True;

  if MontaSelect.RetornouValor then
  Begin
     dblFundo.LookupValue := MontaSelect.ValoresChave[0];
     dblFundo.PerformSearch;
     AbreQry;
  End;

  If Trim(dblFundo.Text) = '' then
  begin
     dbgPosicao.Enabled  := False;
     DesabilitaIncAltExcDetalhe;
     DesabilitaBotoesDetalhe;
  end;

end;

end.

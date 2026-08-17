unit FParamOperRendaVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, checklst, Db, DBTables,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamOperRendaVar = class(TfrmOkCancelar)
    Panel2: TPanel;
    clbInvestimento: TCheckListBox;
    Panel1: TPanel;
    Label3: TLabel;
    btnMarcaTodos: TSpeedButton;
    dblCarteira: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    dbdInicio: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dbdFim: TCMDateTimePicker;
    qryCarteira: TwwQuery;
    qryInvestimento: TwwQuery;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    rgpAnalSint: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btnMarcaTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    OperRendaVarQtdDatas : Integer;
    Procedure AbreMinhaQuery;
    Function VerificaMarcado : Boolean;

  public
  iAnalitSint : Integer;
    { Public declarations }
  end;

var
  frmParamOperRendaVar: TfrmParamOperRendaVar;

implementation

uses FDmRelatorio;

{$R *.DFM}

Procedure TfrmParamOperRendaVar.AbreMinhaQuery;
Var
  ListaInvestimento : TStringList;
  I : Integer;
begin
  Modalresult := mrOk;
  ListaInvestimento := TStringList.Create;
  Try
    ListaInvestimento.Clear;
    For I := 0 To Pred(clbInvestimento.Items.Count) Do
      If clbInvestimento.Checked[I] Then
        ListaInvestimento.Add(IntToStr(Integer(clbInvestimento.Items.Objects[I])));

     With  DtmRelatorio.qryOperRendaVar Do
     Begin
        Close;
        SQL.Clear;

         SQL.Add('SELECT OI.DATAOPERACAO,');
         SQL.Add('       INV.DESCINVESTIMENTO,');
         SQL.Add('       OI.QTDEOPERACAO,');
         SQL.Add('       OI.VLROPERACAO,');
         SQL.Add('       DECODE(HCI.SALDOQTDEINVCART, 0, 0, (OI.VLROPERACAO - ((HCI.SALDOAQUI * OI.QTDEOPERACAO)/ HCI.SALDOQTDEINVCART ))) AS RESULTADO,');
         SQL.Add('       ((HCI.SALDOAQUI * OI.QTDEOPERACAO)/ DECODE(HCI.SALDOQTDEINVCART,0,1,HCI.SALDOQTDEINVCART) ) AS VALCUSTO,');
         SQL.Add('       NVL(OI.VLRIR, 0) VLRIR,');
         SQL.Add('       (1) CONTADOR');
         SQL.Add('FROM');
         SQL.Add('   INVESTIMENTO INV,');
         SQL.Add('   OPERACAOINVEST OI,');
         SQL.Add('   HISTCARTINV HCI,');
         SQL.Add('   CARTEIRAINVEST CI,');
         SQL.Add('   TIPOOPERACAO TP');
         SQL.Add('WHERE');
         SQL.Add('  OI.IDINVESTIMENTO = INV.IDINVESTIMENTO  AND');
         SQL.Add('  OI.IDINVESTIMENTO = HCI.IDINVESTIMENTO AND');
         SQL.Add('  OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST  AND');
         SQL.Add('  OI.IDOPERACAOINVEST = HCI.IDOPERACAOINVEST  AND');
         SQL.Add('  TP.IDTIPOOPERACAO  = OI.IDTIPOOPERACAO AND');
         SQL.Add('  TP.FLGTRATAIR      <> ''N'' AND');
         SQL.Add('  OI.QTDEOPERACAO    <> 0 AND ');
         SQL.Add('  INV.IDTIPOINVEST = 2  AND');
         SQL.Add('  HCI.TIPMOVCARTINV = '#39'OPE'#39' AND');
         SQL.Add('  OI.DATAOPERACAO >= :DATAINICIAL AND');
         SQL.Add('  OI.DATAOPERACAO <= :DATAFINAL AND');
         SQL.Add('  HCI.IDCARTEIRAINVEST = :P_IDCARTEIRAINVEST ');
         If ListaInvestimento.Count > 0 Then
          Begin
            SQL.Add('AND OI.IDINVESTIMENTO IN (');
            For I := 0 To Pred(ListaInvestimento.Count) Do
                If I = Pred(ListaInvestimento.Count) Then
                   SQL.Add(Format('%S', [ListaInvestimento[I]]))
                else
                   SQL.Add(Format('%S,', [ListaInvestimento[I]]));
            SQL.Add(')');
          End;
         SQL.Add('  ORDER BY OI.DATAOPERACAO,INV.DESCINVESTIMENTO  ');

         ParamByName('DATAINICIAL').AsDateTime     := dbdInicio.Date;
         ParamByName('DATAFINAL').AsDateTime       := dbdFim.Date;
         ParamByName('P_IDCARTEIRAINVEST').AsInteger := StrToInt(dblCarteira.LookupValue);
         Open;
         end;

         With  DtmRelatorio Do
           begin
             RptOperRendaVarLabel8.Caption := dbdInicio.Text;
             RptOperRendaVarLabel10.Caption := dbdFim.Text;
             RptOperRendaVarLabel11.Caption := dblCarteira.Value;

             DtmRelatorio.RptOperRendaVarLabel9.Caption := '0'; //analitico
             if rgpAnalSint.ItemIndex = 0 Then
                DtmRelatorio.ppDetailBand10.Visible := True
             Else
             Begin
                DtmRelatorio.RptOperRendaVarGroupFooterBand2.Visible := False;
                DtmRelatorio.ppDetailBand10.Visible := False;
                DtmRelatorio.RptOperRendaVarLabel9.Caption := '1'; //sintetico
             end;
           end;

  Finally
    ListaInvestimento.Free;
  End;
End;

procedure TfrmParamOperRendaVar.FormCreate(Sender: TObject);
begin
  inherited;
  qryCarteira.Open;
  qryInvestimento.Open;
  If (qryInvestimento.RecordCount Mod 20) = 0 Then
    clbInvestimento.Columns := (qryInvestimento.RecordCount Div 20)
  Else
    clbInvestimento.Columns := (qryInvestimento.RecordCount Div 20) + 1;
  qryInvestimento.First;
  While Not qryInvestimento.EOF Do
    Begin
      clbInvestimento.Items.AddObject(qryInvestimentoDESCINVESTIMENTO.AsString, TObject(qryInvestimentoIDINVESTIMENTO.AsInteger));
      qryInvestimento.Next;
    End;
end;

procedure TfrmParamOperRendaVar.btnMarcaTodosClick(Sender: TObject);
Var
 I : Integer;
begin
  For I := 0 To Pred(clbInvestimento.Items.Count) Do
    clbInvestimento.Checked[I] := (btnMarcaTodos.Caption = 'Marca Todos');
  If btnMarcaTodos.Caption = 'Marca Todos'
     Then
       btnMarcaTodos.Caption := 'Desmarca Todos'
     Else
       btnMarcaTodos.Caption := 'Marca Todos';
end;

procedure TfrmParamOperRendaVar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCarteira.Close;
  qryInvestimento.Close;
  inherited;
end;

procedure TfrmParamOperRendaVar.bbtnConfirmarClick(Sender: TObject);
begin
  If Trim(dbdInicio.Text) = '' Then
     Begin
       MessageDlg('Data de Início não preenchida.', mtError, [mbOK], 0);
       dbdInicio.SetFocus;
       Exit;
     End
  Else
    If Trim(dbdFim.Text) = '' Then
      Begin
        MessageDlg('Data de Fim não preenchida.', mtError, [mbOK], 0);
        dbdFim.SetFocus;
        Exit;
      End
    Else
      If dblCarteira.LookupValue = '' Then
        Begin
          MessageDlg('Carteira não selecionada.', mtError, [mbOK], 0);
          dblCarteira.SetFocus;
          Exit;
        End
      Else
        If Not VerificaMarcado Then
           Begin
             MessageDlg('Nenhuma Ação selecionada.', mtError, [mbOK], 0);
             clbInvestimento.SetFocus;
             Exit;
           end;

  AbreMinhaQuery;
  inherited;
end;

Function TfrmParamOperRendaVar.VerificaMarcado : Boolean;
Var
  I : Integer;
begin
  Result := False;
  For I := 0 To Pred(clbInvestimento.Items.Count) Do
    If clbInvestimento.Checked[I] Then
       Begin
         Result := True;
         Break;
       End;
end;

end.

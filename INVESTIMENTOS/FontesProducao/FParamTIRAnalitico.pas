//******************************************************************************
// Data      : 24/01/2006
// Pendência : 233367
// SOL       : 21140
// Código    : AL_1
// Motivo    : Filtragem para somente TipoInvest = Renda Variável
//********************************************************************************************************

unit FParamTIRAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwquery, 
  checklst, wwdblook, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  Wwdatsrc;

type
  TFrmParamTIRAnalitico = class(TfrmOkCancelar)
    dblcCarteira: TwwDBLookupCombo;
    Label4: TLabel;
    qryCarteira: TwwQuery;
    Label5: TLabel;
    dblcTipoInvest: TwwDBLookupCombo;
    Label2: TLabel;
    edDataIni: TCMDateTimePicker;
    Label1: TLabel;
    edDataFim: TCMDateTimePicker;
    QryTipoInvest: TwwQuery;
    QryTipoInvestIDTIPOINVEST: TFloatField;
    QryTipoInvestDESCTIPOINVEST: TStringField;
    dsCarteira: TwwDataSource;
    dsTipoInvest: TwwDataSource;
    ChckDiasUteis: TCheckBox;
    qryInvestimentos: TwwQuery;
    qryInvestimentosIDINVESTIMENTO: TFloatField;
    qryInvestimentosDESCINVESTIMENTO: TStringField;
    qryInvestimentosIDLOTE: TStringField;
    Panel2: TPanel;
    Panel1: TPanel;
    sbtnMarcar: TSpeedButton;
    chklstInvestimentos: TCheckListBox;
    Label3: TLabel;
    ChckTIRInv: TCheckBox;
    qryInvestimentosNew: TwwQuery;
    qryInvestimentosNewIDINVESTIMENTO: TFloatField;
    qryInvestimentosNewDESCINVESTIMENTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcCarteiraExit(Sender: TObject);
    procedure dblcTipoInvestExit(Sender: TObject);
    procedure sbtnMarcarClick(Sender: TObject);
    procedure SelInvestimentos;
    procedure ChckTIRInvClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamTIRAnalitico: TFrmParamTIRAnalitico;
  dDataAnt: TDate;
  dDataRef: TDate;
  ListaGeral,ListaPapeis: TStringList;
implementation

{$R *.DFM}

Uses USistema, uMensErro, FDmRelatorios, UDiasUteis, UBibliotecaInvest, dOperacaoInvest,
     UOperacaoInvest, UOperComum, dOperComum, dFuncoesInvest;

Procedure TFrmParamTIRAnalitico.FazQry;
var
   dDataRef : TDateTime;
   i, iFlag : smallint;
   bSaldo   : boolean;
   fNulo, fSaldo, fSaldoMercado, fSaldoPre, fTotSaldo : double;
   QryLocal :TwwQuery;
   sSQL, sTipoInv  : string;
   Iv,Jv : Byte;
   bFluxoTitulo : boolean;
Begin

   For I := 1 To 100 Do
   Begin
      DmRelatorios.VetSaldoDiaData[I] := 0;
       DmRelatorios.VetSaldoDiaVlr[I]  := 0;
   End;

   dDataAnt := StrToDate(EdDataIni.Text) - 1;
   DmRelatorios.lbDataIniA.Caption    := edDataIni.Text;
   DmRelatorios.lbDataFimA.Caption    := edDataFim.Text;

   if Trim(dblcCarteira.Text) <> '' Then
      DmRelatorios.RptTIRAnaliticoCarteira.Caption := dblcCarteira.Text
   else
      DmRelatorios.RptTIRAnaliticoCarteira.Caption := 'Todas';

   QryLocal             := TwwQuery.Create(Application);
   QryLocal.DatabaseName:= 'BaseDados';

   sSQL :=
      'SELECT DISTINCT IV.DESCINVESTIMENTO, HC.IDLOTE,'+
      '                 HC.IDINVESTIMENTO           '+
      'FROM HISTCARTINV HC, INVESTIMENTO IV '+
      'WHERE '+
      '      (HC.IDINVESTIMENTO       = IV.IDINVESTIMENTO)   '+

      '  AND (HC.IDINVESTIMENTO  IS NOT NULL)                ';

   sSQL := sSQL +
      ' AND (IV.IDINVESTIMENTO IN (' + ListaPapeis.Text + '))';

   sSQL := sSQL +
      '  ORDER BY                                                  '+
      '        IV.DESCINVESTIMENTO,                                '+
      '        HC.IDLOTE                                           ';

   FazQuery(QryLocal, sSQL);

   DmRelatorios.qryTIRAnalitico.Close;
   DmRelatorios.qryTIRAnalitico.Open;

   with QryLocal do
   begin
      Open;
      First;
      While Not EOF Do
      Begin
         dDataRef := dDataAnt;
         While dDataRef <= StrToDate(edDataFim.Text) Do
         Begin
            DmRelatorios.qryTIRAnalitico.Append;
            DmRelatorios.qryTIRAnalitico.FieldByName('DESCINVESTIMENTO').asString := FieldByName('DESCINVESTIMENTO').asString;
            DmRelatorios.qryTIRAnalitico.FieldByName('IDINVESTIMENTO').asString   := FieldByName('IDINVESTIMENTO').asString;
            DmRelatorios.qryTIRAnalitico.FieldByName('IDLOTE').asString           := FieldByName('IDLOTE').asString;
            DmRelatorios.qryTIRAnalitico.FieldByName('DATAMOVCARTINV').asDateTime := dDataRef;
            DmRelatorios.qryTIRAnalitico.FieldByName('SALDODIA').asFloat          := 0;
            DmRelatorios.qryTIRAnalitico.Post;

            dDataRef := dDataRef + 1;

         end;
         Next;
      end;
   end;
   QryLocal.Close;

   with DmRelatorios.qryTIRAnalitico do
   begin
      First;
      While Not EOF Do
      Begin
         QryLocal.Close;
         sSQL :=
              'SELECT DISTINCT HC.IDCARTEIRAINVEST FROM HISTCARTINV HC '+
              'WHERE  (HC.IDINVESTIMENTO = ' + FieldByName('IDINVESTIMENTO').AsString+') ';

         if FieldByName('IDLOTE').AsString <> '' then
            sSQL := sSQL + ' AND (HC.IDLOTE = '''+FieldByName('IDLOTE').AsString+''')  '
         else
            sSQL := sSQL + ' AND (HC.IDLOTE IS NULL)  ';

         if Trim(dblcCarteira.Text) <> '' Then
             sSQL := sSQL + '    AND (HC.IDCARTEIRAINVEST = '+QuotedStr(dblcCarteira.LookupValue)+')  ';

         FazQuery(QryLocal, sSQL);

         // Varre Carteiras que possuem o Investimento

         QryLocal.Open;
         QryLocal.First;
         fTotSaldo := 0;
         While Not QryLocal.EOF Do
         Begin
            if FieldByName('DATAMOVCARTINV').asDateTime = dDataAnt then
            begin
              // Busca Saldo Inicial no dia anterior a Data Inicio para simular uma Compra (-)
              OperComum.CalculaSaldo(FieldByName('IDINVESTIMENTO').AsInteger,
                                     QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                     FieldByName('IDLOTE').AsString,
                                     dDataAnt,fNulo, fSaldo,
                                     fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fSaldoMercado,
                                     fNulo, fNulo, fSaldoPre, fNulo, fNulo, fNulo, fNulo, fNulo);

              fTotSaldo := fTotSaldo + (fSaldo * -1);
            end
            else
            begin
               with dtmFuncoesInvest.QryBuscaFluxoTitulo do
               begin
                  Close;
                  ParamByName('iIdinvestimento').AsInteger := StrToInt(DmRelatorios.qryTIRAnalitico.FieldByName('IDINVESTIMENTO').AsString);
                  ParamByName('dDataRef').AsString         := DateToStr(DmRelatorios.qryTIRAnalitico.FieldByName('DATAMOVCARTINV').asDateTime);
                  Open;
                  if not IsEmpty then
                     bFluxoTitulo := True
                  else
                     bFluxoTitulo := False;
               end;

               fSaldo   := OperacaoInvest.CalculaSaldoDiaTIR(
                                             FieldByName('IDINVESTIMENTO').AsInteger,
                                             QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger,
                                             FieldByName('IDLOTE').AsString,
                                             FieldByName('DATAMOVCARTINV').asDateTime,
                                             StrToDate(EdDataFim.Text), StrToDate(EdDataFim.Text),
                                             iFlag,bFluxoTitulo);
               fTotSaldo := fTotSaldo + fSaldo;
            end;

            QryLocal.Next;
         end;

         Edit;
         FieldByName('SALDODIA').asFloat := fTotSaldo;

         // Alimenta Vetor Público de DmRelatorios, que quarda acumulado por dia a ser mostrado no
         // final do Relatório.
         Jv := 0;
         For Iv := 1 To 100 Do
         Begin
            If FieldByName('DATAMOVCARTINV').asDateTime = DmRelatorios.VetSaldoDiaData[Iv] Then
            Begin
               DmRelatorios.VetSaldoDiaVlr[Iv] := DmRelatorios.VetSaldoDiaVlr[Iv] + fTotSaldo;
               Break;
            End;
            If DmRelatorios.VetSaldoDiaData[Iv] = 0 Then
            Begin
               Jv := Iv;
               break;
            End;
         End;

         If Jv <> 0 Then Begin
            DmRelatorios.VetSaldoDiaData[Iv] := FieldByName('DATAMOVCARTINV').asDateTime;
            DmRelatorios.VetSaldoDiaVlr[Iv]  := fTotSaldo;
         End;

         Post;
         Next;
      End;
          First;
      End;
      QryLocal.Free;

End;

procedure TFrmParamTIRAnalitico.FormCreate(Sender: TObject);
var
   iAno, iMes, iDia: word;
begin
  inherited;
  DecodeDate(Date, iAno, iMes, iDia);
  edDataIni.Date := Date;
  edDataFim.Date := Date;
end;

procedure TFrmParamTIRAnalitico.bbtnConfirmarClick(Sender: TObject);
var x: Integer;
    strInv: String;
begin
  inherited;
  ListaPapeis.Clear;
  for x := 0 to (chklstInvestimentos.Items.Count-1) do
  begin
    // Caso Checado inclui na lista
    if chklstInvestimentos.Checked[x] then
    begin
       if ListaPapeis.Count = 0 then
          ListaPapeis.Add(ListaGeral.Strings[x])
       else
          ListaPapeis.Add(',' + ListaGeral.Strings[x]);
    end;
  end;

  if ListaPapeis.Count = 0 then
  begin
     MsgDlg('Nenhum Investimento foi escolhido ','Mensagem do Sistema ',
            mtWarning,[MbOk],0);
     ModalResult := mrNone;
     Exit;
  end
  else
     FazQry;

end;

procedure TFrmParamTIRAnalitico.edDataIniExit(Sender: TObject);
begin
  inherited;
  If trim(edDataIni.Text) = '' Then
     Begin
         MsgDlg('Data Inicial não foi preenchida','Erro',mtError,[mbOK],0);
         edDataIni.SetFocus;
     End
     else
        dDataAnt := StrToDate(edDataIni.Text) - 1;
end;

procedure TFrmParamTIRAnalitico.edDataFimExit(Sender: TObject);
begin
  inherited;
  If trim(edDataFim.Text) = '' Then
     Begin
         MsgDlg('Data Final não foi preenchida','Erro',mtError,[mbOK],0);
         edDataFim.SetFocus;
     End;
end;

procedure TFrmParamTIRAnalitico.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
  QryTipoInvest.Open;
  ListaPapeis := TStringList.Create;
  ListaGeral := TStringList.Create;
end;

procedure TFrmParamTIRAnalitico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.close;
  QryTipoInvest.Close;
  qryInvestimentos.Close;
end;

procedure TFrmParamTIRAnalitico.SelInvestimentos;
var
   sTipo: String;
   x: Integer;
begin
  inherited;
  qryInvestimentosNew.Close;
  qryInvestimentosNew.Open;
  qryInvestimentosNew.First;

  ListaGeral.Clear;
  chklstInvestimentos.Clear;


  while not qryInvestimentosNew.Eof do
  begin
     chklstInvestimentos.Items.Add(qryInvestimentosNew.FieldByName('DESCINVESTIMENTO').AsString);
     chklstInvestimentos.Checked[chklstInvestimentos.Items.Count-1] := True;

     ListaGeral.Add(qryInvestimentosNew.FieldByName('IDINVESTIMENTO').AsString);

     qryInvestimentosNew.Next;
  end;
  sbtnMarcar.Down := True;
  sbtnMarcar.Caption := 'Desmarcar Todos';


end;


procedure TFrmParamTIRAnalitico.dblcCarteiraExit(Sender: TObject);
begin
  inherited;
   SelInvestimentos;
end;

procedure TFrmParamTIRAnalitico.dblcTipoInvestExit(Sender: TObject);
begin
  inherited;
   SelInvestimentos;
end;

procedure TFrmParamTIRAnalitico.sbtnMarcarClick(Sender: TObject);
var
   x: Integer;
begin
  inherited;
  if sbtnMarcar.Down then
  begin
     for x := 0 to chklstInvestimentos.Items.Count -1 do
         chklstInvestimentos.Checked[x] := True;
     sbtnMarcar.Caption := 'Desmarcar Todos';
  end
  else
  begin
     for x := 0 to chklstInvestimentos.Items.Count -1 do
         chklstInvestimentos.Checked[x] := False;
     sbtnMarcar.Caption := 'Marcar Todos';
  end
end;

procedure TFrmParamTIRAnalitico.ChckTIRInvClick(Sender: TObject);
begin
  inherited;
  if ChckTIRInv.Checked then
  begin
     sbtnMarcar.Enabled := True;
     chklstInvestimentos.Enabled := True;
  end
  else
  begin
     sbtnMarcar.Enabled := False;
     chklstInvestimentos.Enabled := False;
  end;
end;

end.

//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_5
// Pendencia:
// SOL      :
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_4
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_3
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************

unit FPVarMesCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  TB97, StdCtrls, Buttons, ComCtrls, ExtCtrls, Db,
  DBTables, Wwquery, FOkCancelar, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmPVarMesCarteira = class(TFrmOkCancelar)
    qryCarteira: TwwQuery;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    Label4: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    RgCotacaoPor: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmPVarMesCarteira: TFrmPVarMesCarteira;
  dDataAnt: TDate;

implementation

{$R *.DFM}

Uses USistema, uMensErro, FDmRelatorios, uBibliotecaInvest, UOperacaoInvest, UOperComum, dOperComum;

Procedure TFrmPVarMesCarteira.FazQry;
var
  wTotalCarteira, wH2SaldoVlrInvCart, wH2SaldoAqui, wCotacao1, wCotacao2 : double;
  iCartant : integer;
  fNulo : double;
  UsaLote:Boolean;
Begin
    fNulo := 0;
    iCartAnt := 0;
    With DmRelatorios.qryVarMesCarteira Do
      Begin
          Close;
          Sql.Clear;
          Sql.add(' SELECT                                                          ');
          Sql.add('     CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, H1.IDLOTE, H1.IDCARTEIRAINVEST, ');
          Sql.add('     H1.DATAMOVCARTINV AS DATAMOV1, H1.IDINVESTIMENTO,                       ');
          Sql.add('     H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART, H1.SALDOAQUI, (0) AS COTACAO,  ');
          Sql.add('     (0) AS VARATEMESANT, (0) AS VARATEMES, (0) AS VARMES, (0) AS TOTCART, (0) AS VARIACAO ');
          Sql.add('  FROM                                                                       ');
          Sql.add('     HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO IV             ');
          Sql.add('  WHERE                                                                      ');
          Sql.add('     (H1.DATAMOVCARTINV =                                                    ');
          Sql.add('         (SELECT MAX(H11.DATAMOVCARTINV)                                     ');
          Sql.add('          FROM   HISTCARTINV H11                                             ');
          Sql.add('          WHERE (H11.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND             ');
          Sql.add('                (H11.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND               ');
          Sql.add('                (((H1.IDLOTE IS NOT NULL) AND (H11.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H11.IDLOTE IS NULL))) AND ');
          Sql.add('                (H11.DATAMOVCARTINV  <= TO_DATE('''+DateToStr(edDataFim.Date)+''',''DD/MM/YYYY'')))) ');
          Sql.add('     AND (H1.IDHISTCARTINV =                                                 ');
          Sql.add('         (SELECT MAX(H12.IDHISTCARTINV)                                      ');
          Sql.add('          FROM   HISTCARTINV H12                                             ');
          Sql.add('          WHERE (H12.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND             ');
          Sql.add('                (H12.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND               ');
          Sql.add('                (((H1.IDLOTE IS NOT NULL) AND (H12.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H12.IDLOTE IS NULL))) AND ');
          Sql.add('                (H12.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))                 ');

            if Trim(dblcCarteira.Text) <> '' Then
               Sql.add('    AND (H1.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+')  ');

          Sql.add('    AND (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST)     ');
          Sql.add('    AND (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO)       ');
          Sql.add('    AND (H1.IDTIPOINVEST         = 2)                       ');
          Sql.add('    AND (H1.SALDOQTDEINVCART     > 0)                       ');                    
          Sql.add('    AND (H1.IDINVESTIMENTO  IS NOT NULL)                    ');
          Sql.add('  ORDER BY                                                  ');
          Sql.add('        CA.DESCCARTINVEST,                                  ');
          Sql.add('        IV.DESCINVESTIMENTO,                                ');
          Sql.add('        H1.IDLOTE                                           ');
          Open;
          First;
          While Not EOF Do Begin
             if iCartant <> FieldByName('IDCARTEIRAINVEST').AsInteger then begin
                OperComum.SaldosInvCart(FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             EdDataFim.Date, fNulo, wTotalCarteira,
                                             fNulo, fNulo, fNulo, fNulo, fNulo);
                iCartAnt := FieldByName('IDCARTEIRAINVEST').AsInteger;
             end;
// Cotacao Por Lote ou Investimento
             If RgCotacaoPor.ItemIndex = 0 Then
               UsaLote:=False
             Else
               UsaLote:=True;
// Guarda Cotacao
             wCotacao1 := OperComum.BuscaCotacaoInvest(
                           FieldByName('IDINVESTIMENTO').AsInteger, edDataFim.Date, UsaLote);
             wCotacao2 := OperComum.BuscaCotacaoInvest(
                           FieldByName('IDINVESTIMENTO').AsInteger, edDataIni.Date-1, UsaLote);

             wH2SaldoVlrInvCart := 0;
             wH2SaldoAqui :=0;
             //AL_2
             //AL_1
             //AL_3
             //AL_4
             //AL_5
             OperComum.BuscaTodosSaldosInvestLote (
                     FieldByName('IDCARTEIRAINVEST').AsInteger,
                     0{IDCARTEIRAGERENC},
                     FieldByName('IDINVESTIMENTO').AsInteger, 99999999,-1,
                     FieldByName('IDLOTE').AsString, DateToStr(edDataIni.Date-1), -1,
                     fNulo, wH2SaldoVlrInvCart, fNulo, fNulo, wH2SaldoAqui,
                     fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo,fNulo,fNulo,fNulo,
                     fNulo);

             Edit;
             FieldByName('VARATEMESANT').asFloat := wH2SaldoVlrInvCart - wH2SaldoAqui;
             FieldByName('VARATEMES').asFloat    := FieldByName('SALDOVLRINVCART').AsFloat -
                                                    FieldByName('SALDOAQUI').AsFloat;
             FieldByName('VARMES').asFloat       := FieldByName('SALDOVLRINVCART').AsFloat -
                                                    FieldByName('SALDOAQUI').AsFloat -
                                                    (wH2SaldoVlrInvCart - wH2SaldoAqui);
             if wCotacao2 <> 0 then
                FieldByName('VARIACAO').asFloat  := ((wCotacao1/wCotacao2) - 1)*100;
             FieldByName('TOTCART').asFloat      := wTotalCarteira;
             FieldByName('COTACAO').asFloat      := wCotacao1;
             Post;
             Next;
          end;
      End;
End;

procedure TFrmPVarMesCarteira.FormCreate(Sender: TObject);
var
   iAno, iMes, iDia: word;
begin
  inherited;
  DecodeDate(Date, iAno, iMes, iDia);
  edDataIni.Date := Date;
  edDataFim.Date := Date;

end;

procedure TFrmPVarMesCarteira.edDataIniExit(Sender: TObject);
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

procedure TFrmPVarMesCarteira.edDataFimExit(Sender: TObject);
begin
  inherited;
  If trim(edDataFim.Text) = '' Then
     Begin
         MsgDlg('Data Final não foi preenchida','Erro',mtError,[mbOK],0);
         edDataFim.SetFocus;
     End;
end;

procedure TFrmPVarMesCarteira.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TFrmPVarMesCarteira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

procedure TFrmPVarMesCarteira.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if  (edDataIni.Text = '') or (edDataFim.Text = '') or (dblcCarteira.Text = '') then
  begin
     MsgDlg('Parâmetros devem ser informados.','Mensagem do Sistema',mtError,[mbOK],0);
     edDataIni.SetFocus;
     Exit;
  end;
  
  FazQry;

end;

end.

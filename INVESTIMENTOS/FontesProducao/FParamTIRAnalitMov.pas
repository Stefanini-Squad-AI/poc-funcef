//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_6
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_5
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_4
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data      : 24/01/2006
// Código    : AL_3
// Pendência : 233367
// SOL       : 21140
// Motivo    : Filtragem para somente TipoInvest = Renda Variável
//********************************************************************************************************
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************

unit FParamTIRAnalitMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwquery, 
  checklst, DBCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamTIRAnalitMov = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label2: TLabel;
    edDataIni: TCMDateTimePicker;
    dblcCarteira: TwwDBLookupCombo;
    Label4: TLabel;
    qryCarteira: TwwQuery;
    Label1: TLabel;
    CkLstTpMov: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CkLstTpMovExit(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamTIRAnalitMov: TFrmParamTIRAnalitMov;
  dDataAnt: TDate;
  dDataRef: TDate;
implementation

{$R *.DFM}

Uses USistema, uMensErro, FDmRelatorios, UDiasUteis, UBibliotecaInvest, dOperacaoInvest, UOperacaoInvest,
     UOperComum, dOperComum;

Procedure TFrmParamTIRAnalitMov.FazQry;
var
   dDataRef : TDateTime;
   i, iFlag : smallint;
   bSaldo   : boolean;
   fNulo, fSaldo, fSaldoMercado, fSaldoPre, fSaldoInutil : double;
   QryLocal, QryLocal1, QryLocal2 :TwwQuery;
   sSQL, sTipoInv  : string;
   Iv,Jv : Byte;
Begin
    DmRelatorios.ppLabel55.Caption     := edDataIni.Text;

    DmRelatorios.ppLabel56.Caption     := '';
    If CkLstTpMov.Checked[0] Then
        DmRelatorios.ppLabel56.Caption     := 'Movimentação Inicial';
    If CkLstTpMov.Checked[1] Then
        DmRelatorios.ppLabel56.Caption     := 'Movimentação Final';

    QryLocal              := TwwQuery.Create(Application);
    QryLocal.DatabaseName := 'BaseDados';
    QryLocal1             := TwwQuery.Create(Application);
    QryLocal1.DatabaseName:= 'BaseDados';
    QryLocal2             := TwwQuery.Create(Application);
    QryLocal2.DatabaseName:= 'BaseDados';

    DmRelatorios.qryTIRAnalitMov.Close;
    DmRelatorios.qryTIRAnalitMov.Open;

    sSQL :=
      'SELECT DISTINCT IV.DESCINVESTIMENTO, HC.IDLOTE,'+
      '                 HC.IDINVESTIMENTO           '+
      'FROM HISTCARTINV HC, INVESTIMENTO IV '+
      'WHERE '+
      '      (HC.IDINVESTIMENTO       = IV.IDINVESTIMENTO)   '+
      '  AND (HC.IDINVESTIMENTO  IS NOT NULL)                '+
      '  AND (HC.IDTIPOINVEST = 2)                      ';
      sSQL := sSQL +
      '  ORDER BY                                                  '+
      '        IV.DESCINVESTIMENTO,                                '+
      '        HC.IDLOTE                                           ';

    FazQuery(QryLocal, sSQL);

    QryLocal.First;
    While Not QryLocal.EOF Do Begin

       QryLocal1.Close;
       sSQL :=
         'SELECT DISTINCT HC.IDCARTEIRAINVEST, CA.DESCCARTINVEST '+
         'FROM HISTCARTINV HC, CARTEIRAINVEST CA '+
         'WHERE  (HC.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AND '+
         '       (HC.IDINVESTIMENTO = ' + QryLocal.FieldByName('IDINVESTIMENTO').AsString+') ';

       if QryLocal.FieldByName('IDLOTE').AsString <> '' then
          sSQL := sSQL + ' AND (HC.IDLOTE = '''+QryLocal.FieldByName('IDLOTE').AsString+''')  '
       else
          sSQL := sSQL + ' AND (HC.IDLOTE IS NULL)  ';

       if Trim(dblcCarteira.Text) <> '' Then
           sSQL := sSQL + '    AND (HC.IDCARTEIRAINVEST = '+QuotedStr(dblcCarteira.LookupValue)+')  ';

       FazQuery(QryLocal1, sSQL);

// Varre Carteiras que possuem o Investimento

       QryLocal1.Open;
       QryLocal1.First;
       While Not QryLocal1.EOF Do Begin

          If not (CkLstTpMov.Checked[0]) Then begin

             With QryLocal2 Do Begin
                Close;
                Sql.Clear;
                Sql.add(' SELECT HC.VLRMOVCARTINV, HC.MOVIMATU, HC.TIPMOVCARTINV,             ');
                Sql.add(' HC.NATURMOVCARTINV, HC.HISTMOVCARTINV                               ');
                Sql.add(' FROM   HISTCARTINV HC                                            ');
                Sql.add(' WHERE                                                               ');
                Sql.add('    (HC.DATAMOVCARTINV   = TO_DATE('''+EdDataIni.Text+''',''DD/MM/YYYY'')) ');

                Sql.add('    AND (HC.MOVIMATU <> 0)                                           ');
                Sql.add('    AND (HC.TIPMOVCARTINV <> ''INI'')                                ');

                Sql.add(' AND (HC.IDCARTEIRAINVEST = '+QryLocal1.FieldByName('IDCARTEIRAINVEST').AsString+')        ');
                Sql.add(' AND (HC.IDINVESTIMENTO   = '+QryLocal.FieldByName('IDINVESTIMENTO').AsString+')          ');
                if QryLocal.FieldByName('IDLOTE').AsString <> '' then
                   Sql.add(' AND (HC.IDLOTE = '''+QryLocal.FieldByName('IDLOTE').AsString+''')  ')
                else
                   Sql.add(' AND (IDLOTE IS NULL)  ');
                Open;
                First;
             End;

             While Not QryLocal2.Eof Do Begin
                // Alimenta Saldo do Dia

                if qryLocal2.FieldByName('TIPMOVCARTINV').AsString = 'TRF' then

                  Case qryLocal2.FieldByName('NATURMOVCARTINV').AsString[1] Of
                    'A': // Aumenta quantidade de cotas (Compra)
                      fSaldo := (-1) * (ABS(QryLocal2.FieldByName('VLRMOVCARTINV').AsFloat));
                    'D': // Diminui quantidade de cotas (Venda)
                      fSaldo := (ABS(QryLocal2.FieldByName('VLRMOVCARTINV').AsFloat));
                  else
                    fSaldo := (-1) * (ABS(QryLocal2.FieldByName('VLRMOVCARTINV').AsFloat)*
                                      (ABS(QryLocal2.FieldByName('MOVIMATU').AsFloat)/
                                       QryLocal2.FieldByName('MOVIMATU').AsFloat));
                  end
                Else
                  fSaldo := (-1) * (ABS(QryLocal2.FieldByName('VLRMOVCARTINV').AsFloat)*
                                    (ABS(QryLocal2.FieldByName('MOVIMATU').AsFloat)/
                                     QryLocal2.FieldByName('MOVIMATU').AsFloat));
                if fSaldo <> 0  then begin
                   DmRelatorios.qryTIRAnalitMov.Append;
                   DmRelatorios.qryTIRAnalitMov.FieldByName('CARTEIRA').asString     :=
                                 QryLocal1.FieldByName('DESCCARTINVEST').AsString;
                   DmRelatorios.qryTIRAnalitMov.FieldByName('INVESTIMENTO').asString :=
                                 QryLocal.FieldByName('DESCINVESTIMENTO').AsString;
                   DmRelatorios.qryTIRAnalitMov.FieldByName('LOTE').asString         :=
                                 QryLocal.FieldByName('IDLOTE').AsString;
                   DmRelatorios.qryTIRAnalitMov.FieldByName('HISTORICO').asString    :=
                                 QryLocal2.FieldByName('HISTMOVCARTINV').AsString;
                   DmRelatorios.qryTIRAnalitMov.FieldByName('VALMOVIM').asFloat      := fSaldo;
                   DmRelatorios.qryTIRAnalitMov.Post;
                End;

                QryLocal2.Next;
             End;

          End;

          If CkLstTpMov.Checked[0] or CkLstTpMov.Checked[1] Then
          begin
             //AL_1
             //AL_2
             //AL_4
             //AL_5
             //AL_6
             OperComum.BuscaTodosSaldosInvestLote (
                    QryLocal1.FieldByName('IDCARTEIRAINVEST').AsInteger, 0{IDCARTEIRAGERENC},
                    QryLocal.FieldByName('IDINVESTIMENTO').AsInteger, 99999999,-1,
                    QryLocal.FieldByName('IDLOTE').AsString, EdDataIni.Text, -1,
                    fSaldoInutil, fSaldo      , fSaldoInutil,  fSaldoInutil,
                    fSaldoInutil, fSaldoInutil, fSaldoMercado, fSaldoInutil,
                    fSaldoInutil, fSaldoPre   , fSaldoInutil,  fSaldoInutil,
                    fSaldoInutil, fSaldoInutil, fSaldoInutil,  fSaldoInutil,
                    fSaldoInutil, fSaldoInutil, fSaldoInutil);

             if Abs(fSaldo) > 0.001  then
             begin
                DmRelatorios.qryTIRAnalitMov.Append;
                DmRelatorios.qryTIRAnalitMov.FieldByName('CARTEIRA').asString     :=
                              QryLocal1.FieldByName('DESCCARTINVEST').AsString;
                DmRelatorios.qryTIRAnalitMov.FieldByName('INVESTIMENTO').asString :=
                              QryLocal.FieldByName('DESCINVESTIMENTO').AsString;
                DmRelatorios.qryTIRAnalitMov.FieldByName('LOTE').asString         :=
                              QryLocal.FieldByName('IDLOTE').AsString;
                DmRelatorios.qryTIRAnalitMov.FieldByName('HISTORICO').asString    := '';
                DmRelatorios.qryTIRAnalitMov.FieldByName('VALMOVIM').asFloat      := fSaldo - fSaldoPre;
                DmRelatorios.qryTIRAnalitMov.Post;
             End;
          End;

          QryLocal1.Next;

       end;

       QryLocal.Next;
    End;

    // Libera Objetos Locais
    QryLocal.Free;
    QryLocal1.Free;
    QryLocal2.Free;

End;

procedure TFrmParamTIRAnalitMov.FormCreate(Sender: TObject);
var
   iAno, iMes, iDia: word;
begin
  inherited;
  DecodeDate(Date, iAno, iMes, iDia);
  edDataIni.Date := Date;
end;

procedure TFrmParamTIRAnalitMov.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamTIRAnalitMov.edDataIniExit(Sender: TObject);
begin
  inherited;
  If trim(edDataIni.Text) = '' Then
     Begin
         MsgDlg('Data não foi preenchida','Erro',mtError,[mbOK],0);
         edDataIni.SetFocus;
     End
     else
        dDataAnt := StrToDate(edDataIni.Text) - 1;
end;

procedure TFrmParamTIRAnalitMov.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
  CkLstTpMov.Checked[0]:=False;
  CkLstTpMov.Checked[1]:=False;
end;

procedure TFrmParamTIRAnalitMov.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.close;
end;

procedure TFrmParamTIRAnalitMov.CkLstTpMovExit(Sender: TObject);
begin
  inherited;
    If CkLstTpMov.Checked[0] and CkLstTpMov.Checked[1] Then
    Begin
         MsgDlg('Escolha somente um ou nenhum Tipo de Movimentação Inicial/Final','Erro',mtError,[mbOK],0);
    end;
end;

end.

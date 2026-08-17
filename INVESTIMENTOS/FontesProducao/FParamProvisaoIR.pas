unit FParamProvisaoIR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Wwquery, UBibliotecaInvest,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamProvisaoIR = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamProvisaoIR: TFrmParamProvisaoIR;
  dDataAnt: TDate;

implementation

{$R *.DFM}

uses uSistema, uMensErro, UOperacaoInvest, UOperComum, dOperComum, FDmRelatorios;

Procedure TfrmParamProvisaoIR.FazQry;
var
   fNulo, fSaldoQtdeInv, fSaldoVlrInv, fSaldoAqui, fSaldoVlrInvAnt, fSaldoAquiAnt, wCotacao1 : double;
   QryLocal :TwwQuery;
Begin
    QryLocal              := TwwQuery.Create(Application);
    QryLocal.DatabaseName := 'BaseDados';
    FazQuery(QryLocal,'SELECT * FROM PARAMINVEST');
    DmRelatorios.wGanhoCapital := QryLocal.FieldByName('PERCIMPRENDA').AsInteger;
    QryLocal.Free;
    With DmRelatorios.qryProvisaoIR Do
      Begin
          DmRelatorios.RptProvisaoIRLabel2.Caption    := edDataIni.Text;
          DmRelatorios.RptProvisaoIRLabel4.Caption    := edDataFim.Text;
          Close;
          Sql.Clear;
          Sql.add('SELECT DISTINCT                                                         ');
          Sql.add('     IV.DESCINVESTIMENTO, PE.NOME, H1.IDINVESTIMENTO,                   ');
          Sql.add('     (0) AS SALDOQTDEINVCART, (0) AS SALDOVLRCARTINV, (0) AS SALDOAQUI, ');
          Sql.add('     (0) AS SALDOVLRANT, (0) AS SALDOAQUIANT, (0) AS COTACAO            ');
          Sql.add('FROM   HISTCARTINV H1, INVESTIMENTO IV, ACAO AC, PESSOA PE     ');
          Sql.add('  WHERE                                                                            ');
          Sql.add('        (H1.IDINVESTIMENTO = IV.IDINVESTIMENTO)       ');
          Sql.add('    AND (H1.IDINVESTIMENTO  IS NOT NULL)              ');
          Sql.add('    AND (IV.IDEMISSOR      = PE.IDPESSOA)             ');
          Sql.add('  ORDER BY                                            ');
          Sql.add('        IV.DESCINVESTIMENTO                           ');
          Open;
          First;
          While Not EOF Do Begin
//          Busca Saldos do Investimento para última data do periodo
            OperComum.CalculaSaldo(FieldByName('IDINVESTIMENTO').AsInteger,
                                        -1, '-1', edDataFim.Date,
                                        fSaldoQtdeInv, fSaldoVlrInv,
                                        fNulo, fNulo, fNulo, fNulo,
                                        fSaldoAqui, fNulo, fNulo, fNulo, fNulo, fNulo,
                                        fNulo, fNulo, fNulo, fNulo, fNulo);
//          Busca Saldos do Investimento para última data anterior ao primeiro dia do periodo
            OperComum.CalculaSaldo(FieldByName('IDINVESTIMENTO').AsInteger,
                                        -1, '-1', dDataAnt, fNulo,
                                        fSaldoVlrInvAnt, fNulo, fNulo, fNulo, fNulo,
                                        fSaldoAquiAnt, fNulo, fNulo, fNulo, fNulo, fNulo,
                                        fNulo, fNulo, fNulo, fNulo, fNulo);
            wCotacao1 := OperComum.BuscaCotacaoInvest(
                              FieldByName('IDINVESTIMENTO').AsInteger, edDataFim.Date, True);
            Edit;
            FieldByName('SALDOQTDEINVCART').asFloat := fSaldoQtdeInv;
            FieldByName('SALDOVLRCARTINV').asFloat  := fSaldoVlrInv;
            FieldByName('SALDOVLRANT').asFloat      := fSaldoVlrInvAnt;
            FieldByName('SALDOAQUIANT').asFloat     := fSaldoAquiAnt;
            FieldByName('SALDOAQUI').asFloat        := fSaldoAqui;
            FieldByName('COTACAO').asFloat          := wCotacao1;
            Post;
            Next;
          End;
          First;
      End;
End;
procedure TFrmParamProvisaoIR.FormCreate(Sender: TObject);
var
   iAno, iMes, iDia: word;
begin
  inherited;

  DecodeDate(Date, iAno, iMes, iDia);
  edDataIni.Date := Date;
  edDataFim.Date := Date;
end;

procedure TFrmParamProvisaoIR.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamProvisaoIR.edDataIniExit(Sender: TObject);
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

procedure TFrmParamProvisaoIR.edDataFimExit(Sender: TObject);
begin
  inherited;
  If trim(edDataFim.Text) = '' Then
     Begin
         MsgDlg('Data Final não foi preenchida','Erro',mtError,[mbOK],0);
         edDataFim.SetFocus;
     End;
end;

end.


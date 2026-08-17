unit FParamRentRendaFixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  UOperComum, dOperComum, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamRentRendaFixa = class(TfrmOkCancelar)
    Label2: TLabel;
    Label4: TLabel;
    qryCarteira: TwwQuery;
    Label1: TLabel;
    Label3: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    edDataFinal: TCMDateTimePicker;
    edDataInicial: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataInicialExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDataFinalExit(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamRentRendaFixa: TFrmParamRentRendaFixa;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorios, UBibliotecaInvest;

Procedure TfrmParamRentRendaFixa.FazQry;
var
    QryLocal :TwwQuery;
    fValAplic, fRendimento, fResgate : double;
Begin
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    With DmRelatorios.qryRentRendaFixa Do
      Begin
          DmRelatorios.RptRentRendaFixaDtIni.Caption    := edDataInicial.Text;
          DmRelatorios.RptRentRendaFixaDtFim.Caption    := edDataFinal.Text;
          Close;
          Sql.Clear;
          Sql.add(' SELECT DISTINCT                                                   ');
          Sql.add('     CA.IDCARTEIRAINVEST, CA.DESCCARTINVEST, TP.CODTIPRENFIXA,     ');
          Sql.add('     TP.DESCTIPRENFIXA, (0) AS SALDOREND                           ');
          Sql.add('  FROM                                                             ');
          Sql.add('     HISTCARTINV H1,  CARTEIRAINVEST CA, INVESTIMENTO IV, ');
          Sql.add('     TITRENFIXA TT, TIPOTITRENFIXA TP                        ');
          Sql.add('  WHERE                                                            ');

          If Trim(dblcCarteira.Text) <> '' Then
            Sql.add('    (H1.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+')  AND ');

          Sql.add('        (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) ');
          Sql.add('    AND (H1.IDINVESTIMENTO   = IV.IDINVESTIMENTO)   ');
          Sql.add('    AND (H1.IDINVESTIMENTO   = TT.IDTITRENFIXA)     ');
          Sql.add('    AND (TT.CODTIPRENFIXA    = TP.CODTIPRENFIXA)    ');
          Sql.add('  ORDER BY                                              ');
          Sql.add('        CA.DESCCARTINVEST,                              ');
          Sql.add('        TP.DESCTIPRENFIXA                               ');
          Open;
          First;
          While Not EOF Do Begin
            Edit;
            OperacaoInvest.BuscaSaldosTipoAplic(
                              FieldByName('IDCARTEIRAINVEST').AsInteger,
                              FieldByName('CODTIPRENFIXA').AsString,
                              edDataInicial.Date, edDataFinal.Date,
                              fValAplic, fRendimento, fResgate);
            FieldByName('SALDOREND').asFloat     := fRendimento;
            Post;
            Next;
          End;
          First;
      End;
End;
procedure TFrmParamRentRendaFixa.FormCreate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := Date;
  edDataFinal.Date := Date;

end;

procedure TFrmParamRentRendaFixa.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;

end;

procedure TFrmParamRentRendaFixa.edDataInicialExit(Sender: TObject);
begin
  inherited;
  If trim(edDataInicial.Text) = '' Then
     Begin
         MsgDlg('Data Inicial não foi preenchida','Erro',mtError,[mbOK],0);
         edDataInicial.SetFocus;
     End;
end;

procedure TFrmParamRentRendaFixa.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TFrmParamRentRendaFixa.FormClose(Sender: TObject;   var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

procedure TFrmParamRentRendaFixa.edDataFinalExit(Sender: TObject);
begin
  inherited;
  If trim(edDataFinal.Text) = '' Then
     Begin
         MsgDlg('Data Final não foi preenchida','Erro',mtError,[mbOK],0);
         edDataFinal.SetFocus;
     End;

end;

end.

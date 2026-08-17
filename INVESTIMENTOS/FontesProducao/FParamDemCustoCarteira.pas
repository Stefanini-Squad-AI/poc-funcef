unit FParamDemCustoCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  UOperComum, dOperComum, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamDemCustoCarteira = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label4: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataRefExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamDemCustoCarteira: TFrmParamDemCustoCarteira;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorios, UBibliotecaInvest;

Procedure TfrmParamDemCustoCarteira.FazQry;
var
    wCotacao1, wCotacaoAtu : double;
    QryLocal :TwwQuery;
    dDataCotacao: TDateTime;
Begin
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    //BuscaCotação da Moeda Atuarial
    FazQuery(QryLocal, 'Select MoedaAtu From ParamInvest');
    If Not OperComum.BuscaCotacaoMoeda(QryLocal.FieldByName('MoedaAtu').AsInteger,
               edDataRef.Date,'',wCotacaoAtu, dDataCotacao) then wCotacaoAtu := 0;
    With DmRelatorios.qryDemCustoCarteira Do
      Begin
          DmRelatorios.lbDataRef.Caption    := edDataRef.Text;
          Close;
          Sql.Clear;
          Sql.add(' SELECT                                                                            ');
          Sql.add('     CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, H1.DATAMOVCARTINV, H1.IDLOTE, H1.IDINVESTIMENTO, ');
          Sql.add('     H1.IDHISTCARTINV, H1.SALDOQTDEINVCART, H1.VLRMOVCARTINV, H1.SALDOAQUI,        ');
          Sql.add('     H1.SALDOREND, H1.SALDOCAR, (0) AS COTACAO                                     ');
          Sql.add('  FROM                                                                             ');
          Sql.add('     HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO IV                   ');
          Sql.add('  WHERE                                                                            ');
          Sql.add('     (H1.DATAMOVCARTINV =                                                          ');
          Sql.add('         (SELECT MAX(H2.DATAMOVCARTINV)                                            ');
          Sql.add('          FROM   HISTCARTINV H2                                                    ');
          Sql.add('          WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND                    ');
          Sql.add('                (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND                      ');
          Sql.add('                (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND ');
          Sql.add('                (H2.DATAMOVCARTINV  <= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')))) ');
          Sql.add('     AND (H1.IDHISTCARTINV =                                                       ');
          Sql.add('         (SELECT MAX(H3.IDHISTCARTINV)                                             ');
          Sql.add('          FROM   HISTCARTINV H3                                                    ');
          Sql.add('          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND                    ');
          Sql.add('                (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND                      ');
          Sql.add('                (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND ');
          Sql.add('                (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))                        ');

            if Trim(dblcCarteira.Text) <> '' Then
               Sql.add('    AND (H1.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+')  ');

          Sql.add('    AND (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST)     ');
          Sql.add('    AND (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO)       ');
          Sql.add('    AND (H1.SALDOQTDEINVCART     <> 0)                      ');
          Sql.add('    AND (H1.IDINVESTIMENTO  IS NOT NULL)                    ');
          Sql.add('  ORDER BY                                                  ');
          Sql.add('        CA.DESCCARTINVEST,                                  ');
          Sql.add('        IV.DESCINVESTIMENTO,                                ');
          Sql.add('        H1.IDLOTE                                           ');
          Open;
          First;
          While Not EOF Do Begin
            wCotacao1 := OperComum.BuscaCotacaoInvest(
                              FieldByName('IDINVESTIMENTO').AsInteger, edDataRef.Date, True);
            Edit;
            FieldByName('COTACAO').asFloat := wCotacao1;
            FieldByName('SALDOCAR').asFloat := FieldByName('SALDOCAR').asFloat * wCotacaoAtu;
            Post;
            Next;
          End;
          First;
      End;
End;
procedure TFrmParamDemCustoCarteira.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;

end;

procedure TFrmParamDemCustoCarteira.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamDemCustoCarteira.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

procedure TFrmParamDemCustoCarteira.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TFrmParamDemCustoCarteira.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

end.

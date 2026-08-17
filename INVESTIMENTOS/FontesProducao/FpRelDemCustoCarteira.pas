unit FpRelDemCustoCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  TB97, StdCtrls, Buttons, ComCtrls, ExtCtrls, Db,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmpRelDemCustoCarteira = class(TCMParamRel)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    dblcCarteira: TwwDBLookupCombo;
    Label4: TLabel;
    qryCarteira: TwwQuery;
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure FazQry;
  public
    { Public declarations }
  end;

var  FrmpRelDemCustoCarteira: TFrmpRelDemCustoCarteira;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorios, UOperacaoInvest, UOperComum, dOperComum, UBibliotecaInvest;

procedure TFrmpRelDemCustoCarteira.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
 // Confirma Dados
  If (trim(edDataRef.Text) = '') or (dblcCarteira.Text = '') Then
     Begin
         MsgDlg('Parâmetros devem ser preenchidos','Mensagem do Sistema',mtError,[mbOK],0);
         edDataRef.SetFocus;
         Exit;
     End;

  FazQry;
//  DmRelatorios.RptDemCustoCarteira.Print;
//  DmRelatorios.qryDemCustoCarteira.Close;
end;

Procedure TFrmpRelDemCustoCarteira.FazQry;
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
//    ShowMessage(DateToStr(edDataRef.Date));
    With DmRelatorios.qryDemCustoCarteira Do
      Begin
          DmRelatorios.lbDataRefC.Caption    := edDataRef.Text;
          Close;
          Sql.Clear;
          Sql.add(' SELECT                                                                            ');
          Sql.add('     CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, H1.DATAMOVCARTINV, H1.IDLOTE, H1.IDINVESTIMENTO, ');
          Sql.add('     H1.IDHISTCARTINV, H1.SALDOQTDEINVCART, H1.VLRMOVCARTINV, H1.SALDOAQUI,        ');
          Sql.add('     H1.SALDOREND, H1.SALDOCAR, (0) AS COTACAO                                     ');
          Sql.add('  FROM                                                                             ');
          Sql.add('     CM.HISTCARTINV H1, CM.CARTEIRAINVEST CA, CM.INVESTIMENTO IV                   ');
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

procedure TFrmpRelDemCustoCarteira.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
end;

procedure TFrmpRelDemCustoCarteira.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TFrmpRelDemCustoCarteira.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

end.

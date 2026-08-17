unit FParamCompGerLotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamCompGerLotes = class(TfrmOkCancelar)
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
  FrmParamCompGerLotes: TFrmParamCompGerLotes;

implementation

{$R *.DFM}

uses uSistema, uMensErro, FDmRelatorios;

Procedure TfrmParamCompGerLotes.FazQry;
Begin
    With DmRelatorios.qryCompGerLotes Do
      Begin
          DmRelatorios.RptCompGerLotesLabel2.Caption    := edDataRef.Text;
          Close;
          Sql.Clear;
          Sql.add(' SELECT                                                                 ');
          Sql.add('     CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, HC.IDLOTE,                 ');
          Sql.add('     HC.IDCARTEIRAINVEST, HC.IDINVESTIMENTO,                          ');
          Sql.add('     CI.SERIE, CI.DATAVENCIM, CI.PRECOVENCIM, HC.SALDOQTDEINVCART      ');
          Sql.add('  FROM                                                                  ');
          Sql.add('     HISTCARTINV HC, CARTEIRAINVEST CA, INVESTIMENTO IV,       ');
          Sql.add('     CONTRATOINVESTIM CI                                             ');
          Sql.add('  WHERE                                                                 ');
          Sql.add('     (HC.DATAMOVCARTINV =                                                          ');
          Sql.add('         (SELECT MAX(H2.DATAMOVCARTINV)                                            ');
          Sql.add('          FROM   HISTCARTINV H2                                                    ');
          Sql.add('          WHERE (H2.IDCARTEIRAINVEST = HC.IDCARTEIRAINVEST) AND                    ');
          Sql.add('                (H2.IDINVESTIMENTO   = HC.IDINVESTIMENTO) AND                      ');
          Sql.add('                (((HC.IDLOTE IS NOT NULL) AND (H2.IDLOTE =HC.IDLOTE)) OR ((HC.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND ');
          Sql.add('                (H2.DATAMOVCARTINV  <= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')))) ');
          Sql.add('     AND (HC.IDHISTCARTINV =                                                       ');
          Sql.add('         (SELECT MAX(H3.IDHISTCARTINV)                                             ');
          Sql.add('          FROM   HISTCARTINV H3                                                    ');
          Sql.add('          WHERE (H3.IDCARTEIRAINVEST = HC.IDCARTEIRAINVEST) AND                    ');
          Sql.add('                (H3.IDINVESTIMENTO   = HC.IDINVESTIMENTO) AND                      ');
          Sql.add('                (((HC.IDLOTE IS NOT NULL) AND (H3.IDLOTE =HC.IDLOTE)) OR ((HC.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND ');
          Sql.add('                (H3.DATAMOVCARTINV   = HC.DATAMOVCARTINV)))                        ');
          Sql.add('    AND (HC.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST)     ');
          Sql.add('    AND (HC.IDINVESTIMENTO       = IV.IDINVESTIMENTO)       ');
          Sql.add('    AND (HC.IDINVESTIMENTO  IS NOT NULL)                    ');
          Sql.add('    AND (HC.IDLOTE  IS NOT NULL)                            ');
          Sql.add('    AND (HC.SALDOQTDEINVCART <> 0)                          ');
          Sql.add('    AND (HC.IDINVESTIMENTO       = CI.IDINVESTIMENTO)       ');
          Sql.add('    AND (HC.IDLOTE               = CI.IDLOTE)               ');

            if Trim(dblcCarteira.Text) <> '' Then
               Sql.add('    AND (HC.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+')  ');

          Sql.add('  ORDER BY                          ');
          Sql.add('        CA.DESCCARTINVEST,          ');
          Sql.add('        IV.DESCINVESTIMENTO,        ');
          Sql.add('        CI.SERIE,                   ');
          Sql.add('        CI.DATAVENCIM,              ');
          Sql.add('        HC.IDLOTE                   ');
          Open;
      End;
End;

procedure TFrmParamCompGerLotes.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
end;

procedure TFrmParamCompGerLotes.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamCompGerLotes.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

procedure TFrmParamCompGerLotes.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TFrmParamCompGerLotes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

end.

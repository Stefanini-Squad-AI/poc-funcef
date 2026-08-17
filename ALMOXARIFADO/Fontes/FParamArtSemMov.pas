unit FParamArtSemMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamArtSemMov = class(TfrmOkCancelar)
    qryGrpProd: TwwQuery;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    Label1: TLabel;
    edData: TCMDateTimePicker;
    RgOrdem: TRadioGroup;
    qryAlmox: TwwQuery;
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    chkimp: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Fazqry;
  public
    { Public declarations }
  end;

var
  FrmParamArtSemMov: TFrmParamArtSemMov;

implementation

{$R *.DFM}
Uses DRptRelats, uMensErro, uSistema, uModulo;

Procedure TFrmParamArtSemMov.Fazqry;
Begin
    With DtmRptRelats.qryArtSemMov Do
       Begin
           Close;
           Sql.Clear;
           sql.Add(' SELECT ');
           sql.Add('     P.CODGRUPOPROD, ');
           sql.Add('     G.DESCGRUPOPROD, ');
           sql.Add('     A.CODARTIGO, ');
           sql.Add('     (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO) AS DESCRICAO, ');
           sql.Add('     S.SALDOQTDE, ');
           sql.Add('     C.CUSTOMEDIO, ');
           sql.Add('     P.CODMEDCUSTO, ');
           sql.Add('     (S.SALDOQTDE * C.CUSTOMEDIO ) VALOR, ');
           sql.Add('     ULT.ULTDATA ');
           sql.Add(' FROM ');
           sql.Add('    ARTIGO A, ');
           sql.Add('    PRODUTO P, ');
           sql.Add('    CUSTOMED C, ');
           sql.Add('    SALDO S, ');
           sql.Add('    GRUPPROD G, ');
           sql.Add('    (SELECT CODARTIGO,MAX(DATAMOV) AS ULTDATA  ');
           sql.Add('     FROM MOVIMENT ');
           sql.Add('     WHERE (CODTIPOMOV <> ''Z'') ');
           sql.Add('       AND (DATAMOV <= TO_DATE('''+EdData.Text+''',''DD/MM/YYYY'') )');
           sql.Add('       AND (CODALMOXARIFADO = '+ dblcAlmox.lookUpValue+') ');
           sql.Add('     GROUP BY CODARTIGO) ULT ');
           sql.Add(' WHERE ');
           sql.Add('      (S.CODALMOXARIFADO = '+dblcAlmox.lookUpValue+' ) ');
           sql.Add('  AND (C.CODCUSTEIO = '+IntToStr(Modulo.iCodCusteio)+') ');
           sql.Add('  AND (NOT EXISTS (SELECT MV.CODARTIGO       ');
           sql.Add('                            FROM MOVIMENT MV ');
           sql.Add('                            WHERE (MV.CODTIPOMOV <> ''Z'') ');
           sql.Add('                              AND (MV.DATAMOV > TO_DATE('''+EdData.Text+''',''DD/MM/YYYY'') )');
           sql.Add('                              AND (MV.CODALMOXARIFADO = '+ dblcAlmox.lookUpValue+')  ');
           sql.Add('                              AND (MV.CODARTIGO = A.CODARTIGO) ');
           sql.Add('                    GROUP BY MV.CODARTIGO  ) ) ');
           If ( Trim(dblcGrpProd.Text) <> '' )  Then
              sql.Add(' AND (RTRIM(G.CODGRUPOPROD) = '''+Trim(dblcGrpProd.LookUpValue)+''') ');
           If chkImp.Checked Then
              sql.Add('  AND (S.SALDOQTDE > 0 )');

           sql.Add('  AND (A.CODPRODUTO = P.CODPRODUTO) ');
           sql.Add('  AND (A.CODARTIGO  = S.CODARTIGO)  ');
           sql.Add('  AND (A.CODARTIGO  = C.CODARTIGO)  ');
           sql.Add('  AND (A.CODARTIGO  = ULT.CODARTIGO(+)) ');
           sql.Add('  AND (G.CODGRUPOPROD = P.CODGRUPOPROD) ');

           Case RgOrdem.ItemIndex Of
                0 : sql.Add(' ORDER BY G.CODGRUPOPROD, (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO)');
                1 : sql.Add(' ORDER BY G.CODGRUPOPROD, A.CODARTIGO ');
           End;
           Open;
       End;
       DtmRptRelats.lbAlmox8.Caption := dblcAlmox.Text;
       DtmRptRelats.lbTit.Caption    := ' Artigos sem Movimentação desde '+ edData.Text +' ';

End;

procedure TFrmParamArtSemMov.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.Params[0].Value := Sistema.idEmpresa;
  qryAlmox.Open;
  //
  qryGrpProd.Open;
  //
  edData.Date := Modulo.LeDataRepresa;
end;

procedure TFrmParamArtSemMov.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcAlmox.Text) = '' Then
    Begin
        MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOk],0);
        dblcAlmox.SetFocus;
        exit;
    End;
  If trim(edData.Text) = '' Then
    Begin
        MsgDlg('Data limite não preenchido','Erro',mtError,[mbOk],0);
        edData.SetFocus;
        exit;
    End;
  FazQry;
end;

end.






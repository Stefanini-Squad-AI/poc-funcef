unit FParamConsMed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker ;

type
  TFrmParamConsMed = class(TfrmOkCancelar)
    qryGrpProd: TwwQuery;
    qryAlmox: TwwQuery;
    pln: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    dblcAlmox: TwwDBLookupCombo;
    RgOrdem: TRadioGroup;
    gbDatas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    chkConsMed: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamConsMed: TFrmParamConsMed;

implementation

uses DRptRelats, uMensErro, uSistema;

{$R *.DFM}

procedure TFrmParamConsMed.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni.Date := Date;
  edDataFim.Date := Date;
  //
  qryAlmox.Close;
  qryAlmox.Params[0].Value := Sistema.idEmpresa;
  qryAlmox.Open;
  //
  qryGrpProd.Open;
end;

Procedure TFrmParamConsMed.FazQry;
Var
   nDias : Double;
Begin
    nDias := (EdDataFim.Date - EdDataIni.Date) + 1;
    With DtmRptRelats.qryConsMed Do
       Begin
           Close;
           Sql.Clear;
           Sql.Add(' SELECT               ');
           Sql.Add('      G.CODGRUPOPROD, ');
           Sql.Add('      G.DESCGRUPOPROD,');
           Sql.Add('      A.CODARTIGO,    ');
           Sql.Add('      P.CODMEDCUSTO,  ');
           Sql.Add('      (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, ');
           Sql.Add('      CM.CONSMED,  ');
           Sql.Add('      CM.CONSTOT,  ');
           Sql.Add('      SAT.SALDOATU,');
           Sql.Add('      SAN.SALDOANT,');
           Sql.Add('      DECODE(CM.CONSMED,0,0,(SAT.SALDOATU/CM.CONSMED)) AS COBERTURA, ');
           Sql.Add('      DECODE(CM.CONSTOT,0,0,('+FloatToStr(nDias)+'*(((SAT.SALDOATU+SAN.SALDOANT)/2)/CM.CONSTOT))) AS GIRO ');
           Sql.Add(' FROM                   ');
           Sql.Add('      ARTIGO A,         ');
           Sql.Add('      PRODUTO P,        ');
           Sql.Add('      GRUPPROD G,       ');
           Sql.Add('      (SELECT           ');
           Sql.Add('            M.CODARTIGO,');
           Sql.Add('            ((SUM(M.QTDEMOV)* -1)/'+FloatToStr(nDias)+') AS CONSMED, ');
           Sql.Add('            (SUM(QTDEMOV)* -1) AS CONSTOT ');
           Sql.Add('       FROM ');
           Sql.Add('            MOVIMENT M ');
           Sql.Add('       WHERE ');
           Sql.Add('            (M.CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''A'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''K'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''Z'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''B'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''S'') ');
           Sql.Add('        AND (M.DATAMOV >= TO_DATE('''+DateToStr(EdDataINI.Date)+''',''dd/mm/yyyy'')) ');
           Sql.Add('        AND (M.DATAMOV <= TO_DATE('''+DateToStr(EdDataFIM.Date)+''',''dd/mm/yyyy'')) ');
           Sql.Add('       GROUP BY M.CODARTIGO ) CM, ');
           Sql.Add('       ( SELECT ');
           Sql.Add('               M.CODARTIGO, ');
           Sql.Add('               M.SALDOQTDEMOV AS SALDOATU ');
           Sql.Add('         FROM ');
           Sql.Add('               MOVIMENT M, ');
           Sql.Add('              ( SELECT ');
           Sql.Add('                     M.CODARTIGO, ');
           Sql.Add('                     MAX(M.IDMOV) AS IDMOV ');
           Sql.Add('                FROM ');
           Sql.Add('                     MOVIMENT M, ');
           Sql.Add('                     ( SELECT ');
           Sql.Add('                            CODARTIGO, ');
           Sql.Add('                            MAX(DATAMOV) AS DATAMOV ');
           Sql.Add('                       FROM ');
           Sql.Add('                            MOVIMENT ');
           Sql.Add('                       WHERE (DATAMOV <= TO_DATE('''+DateToStr(EdDataFIM.Date)+''',''dd/mm/yyyy'')) ');
           Sql.Add('                         AND (CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
           Sql.Add('                      GROUP BY CODARTIGO');
           Sql.Add('                     ) AUX');
           Sql.Add('                WHERE');
           Sql.Add('                     (M.CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
           Sql.Add('                 AND (M.CODARTIGO = AUX.CODARTIGO)');
           Sql.Add('                 AND (M.DATAMOV = AUX.DATAMOV)');
           Sql.Add('                GROUP BY M.CODARTIGO');
           Sql.Add('               ) AUX1');
           Sql.Add('         WHERE ');
           Sql.Add('              (M.CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
           Sql.Add('          AND (M.IDMOV = AUX1.IDMOV) ');
           Sql.Add('          AND (M.CODARTIGO = AUX1.CODARTIGO) ');
           Sql.Add('        ) SAT, ');
           Sql.Add('        ( SELECT ');
           Sql.Add('               M.CODARTIGO, ');
           Sql.Add('               M.SALDOQTDEMOV AS SALDOANT ');
           Sql.Add('          FROM ');
           Sql.Add('               MOVIMENT M, ');
           Sql.Add('              ( SELECT ');
           Sql.Add('                     M.CODARTIGO, ');
           Sql.Add('                     MAX(M.IDMOV) AS IDMOV ');
           Sql.Add('                FROM ');
           Sql.Add('                     MOVIMENT M, ');
           Sql.Add('                     ( SELECT ');
           Sql.Add('                            CODARTIGO, ');
           Sql.Add('                            MAX(DATAMOV) AS DATAMOV ');
           Sql.Add('                       FROM ');
           Sql.Add('                            MOVIMENT ');
           Sql.Add('                       WHERE (DATAMOV < TO_DATE('''+DateToStr(EdDataIni.Date)+''',''dd/mm/yyyy'')) ');
           Sql.Add('                         AND (CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
           Sql.Add('                      GROUP BY CODARTIGO');
           Sql.Add('                     ) AUX');
           Sql.Add('                WHERE');
           Sql.Add('                     (M.CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
           Sql.Add('                 AND (M.CODARTIGO = AUX.CODARTIGO)');
           Sql.Add('                 AND (M.DATAMOV = AUX.DATAMOV)');
           Sql.Add('                GROUP BY M.CODARTIGO');
           Sql.Add('               ) AUX1');
           Sql.Add('         WHERE ');
           Sql.Add('              (M.CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
           Sql.Add('          AND (M.IDMOV = AUX1.IDMOV) ');
           Sql.Add('          AND (M.CODARTIGO = AUX1.CODARTIGO) ');
           Sql.Add('        ) SAN ');
           Sql.Add(' WHERE  ');
           Sql.Add('       (A.CODPRODUTO  = P.CODPRODUTO) ');
           If Trim(dblcGrpProd.Text) <> ''   Then
              Begin
                 sql.Add(' AND (RTRIM(G.CODGRUPOPROD) LIKE '''+Trim(dblcGrpProd.LookUpValue)+''' || ''%'' ) ');
                 DtmRptRelats.lbFiltro3.Caption := dblcGrpProd.LookupValue + ' - '+dblcGrpProd.Text;
              End;
           If chkConsMed.Checked Then
              Sql.Add('   AND (CM.CONSMED >= 0 )');

              Sql.Add('   AND (P.CODGRUPOPROD = G.CODGRUPOPROD)');
              Sql.Add('   AND (A.CODARTIGO = CM.CODARTIGO)  ');
              Sql.Add('   AND (A.CODARTIGO = SAN.CODARTIGO(+)) ');
              Sql.Add('   AND (A.CODARTIGO = SAT.CODARTIGO(+)) ');
           Case RgOrdem.ItemIndex Of
               0 : Sql.Add('ORDER BY G.CODGRUPOPROD, DESCRICAO');
               1 : Sql.Add('ORDER BY G.CODGRUPOPROD, A.CODARTIGO');
               2 : Sql.Add('ORDER BY G.CODGRUPOPROD,CM.CONSMED');
           End;
           Open;
       End;
       DtmRptRelats.lbAlmox10.Caption := dblcAlmox.Text;
       DtmRptRelats.lbPer9.Caption := ' De '+EdDataINI.Text+ ' a '+EdDataFIM.Text +' ';
End;

procedure TFrmParamConsMed.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcAlmox.Text) = '' Then
    Begin
        MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOk],0);
        dblcAlmox.SetFocus;
        ModalResult := MrNone;
    End
  Else
  If EdDataFim.Date < EdDataIni.Date Then
     Begin
        MsgDlg('Data de final não pode ser menor do que a data final','Erro',mtError,[mbOK],0);
        EdDataFim.SetFocus;
        ModalResult := MrNone;
     End
  Else
     Begin
         ModalResult := MrOk;
         FazQry;
     End;
end;

end.

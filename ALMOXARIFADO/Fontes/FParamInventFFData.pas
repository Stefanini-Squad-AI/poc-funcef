{-------------------------------------------------------------------------------
 Data       : 25.08.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22816
 Descrição  : SQL do método FazerQuery alterado para permitir a seleção de itens
              estocáveis.
----------------------------------------------------------------------------------}

unit FParamInventFFData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery,  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook;

type
  TFrmParamInventFFData = class(TfrmOkCancelar)
    qryGrpProd: TwwQuery;
    qryAlmox: TwwQuery;
    qryAux: TwwQuery;
    Label3: TLabel;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    grp: TGroupBox;
    chkimp: TCheckBox;
    RgOrdem: TRadioGroup;
    dblcAlmox: TwwDBLookupCombo;
    edData: TCMDateTimePicker;
    Label1: TLabel;
    chkEstocaveis: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataExit(Sender: TObject);
  private
    { Private declarations }
    Procedure FazerQry;
  public
    { Public declarations }
  end;

var
  FrmParamInventFFData: TFrmParamInventFFData;

implementation

uses DRptRelats, uMensErro, uModulo, uSistema;
{$R *.DFM}

procedure TFrmParamInventFFData.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.SQL.Text:='SELECT CodAlmoxarifado,DescAlmox FROM ALMOX WHERE (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')';
  qryAlmox.Open;
  //
  qryGrpProd.Open;
  //
  edData.Date := Modulo.LeDataRepresa;
end;

procedure TFrmParamInventFFData.bbtnConfirmarClick(Sender: TObject);
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
  FazerQry;
end;

procedure TFrmParamInventFFData.FazerQry;
var
    X           : Integer;
begin
   x:= Pos('.',Modulo.sMascaraGrupoProd)-1;
  qryAux.Close;
  qryAux.SQL.text := 'SELECT CODCUSTEIO FROM ALMOX WHERE CODALMOXARIFADO = '+dblcAlmox.lookUpValue;
  qryAux.Open;
  With DtmRptRelats.QryInventFFData DO
     Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT ');
         Sql.Add('      UN.CODGRUPOPROD, ');
         Sql.Add('      UN.DESCGRUPOPROD, ');
         Sql.Add('      UN.STATUSGRUPO, ');
         Sql.Add('      UN.CODARTIGO, ');
         Sql.Add('      UN.DESCPROD, ');
         Sql.Add('      UN.CODMEDCUSTO, ');
         Sql.Add('      UN.QTDE, ');
         Sql.Add('      UN.VALORUN, ');
         Sql.Add('      UN.VALOR, ');
         Sql.Add('      UN.TOTAL ');
         Sql.Add('FROM ');
         Sql.Add('( ');
         Sql.Add(' SELECT ');
         Sql.Add('      P.CODGRUPOPROD, ');
         Sql.Add('      G.DESCGRUPOPROD,');
         Sql.Add('      G.STATUSGRUPO,');
         Sql.Add('      MOV.CODARTIGO,');
         Sql.Add('      P.DESCPROD, ');
         Sql.Add('      P.CODMEDCUSTO,  ');
         Sql.Add('      MOV.SALDOQTDEMOV AS QTDE,');
         Sql.Add('      MOV.CUSTOMEDIOMOV AS VALORUN, ');
         Sql.Add('      (MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV) AS VALOR, ');
         Sql.Add('      (0) AS TOTAL ');
         Sql.Add(' FROM ');
         Sql.Add('      PRODUTO P,  ');
         Sql.Add('      GRUPPROD G, ');
         Sql.Add('      ( SELECT ');
         Sql.Add('               M.IDMOV, ');
         Sql.Add('               M.CODARTIGO,    ');
         Sql.Add('               M.SALDOQTDEMOV, ');
         Sql.Add('               M.CUSTOMEDIOMOV, ');
         Sql.Add('               M.CODALMOXARIFADO, ');
         Sql.Add('               M.IDPESSOA ');
         Sql.Add('         FROM ');
         Sql.Add('              MOVIMENT M, ');
         Sql.Add('              ( SELECT ');
         Sql.Add('                      M.CODARTIGO, ');
         Sql.Add('                      MAX(M.IDMOV) AS IDMOV ');
         Sql.Add('                 FROM ');
         Sql.Add('                      MOVIMENT M, ');
         Sql.Add('                     (SELECT ');
         Sql.Add('                           CODARTIGO, ');
         Sql.Add('                           MAX(DATAMOV) AS MAXDATAMOV ');
         Sql.Add('                      FROM MOVIMENT ');
         Sql.Add('                      WHERE  ( DATAMOV <= TO_DATE('''+ EdData.Text+''',''DD/MM/YYYY'') )');
         Sql.Add('                         AND (CODALMOXARIFADO  = '+ dblcAlmox.lookUpValue+')');
         Sql.Add('                      GROUP BY CODARTIGO ');
         Sql.Add('                     ) SUB ');
         Sql.Add('                Where (M.CODARTIGO = SUB.CODARTIGO)');
         Sql.Add('                  AND (M.DATAMOV =SUB.MAXDATAMOV) ');
         Sql.Add('                  AND (M.CODALMOXARIFADO ='+ dblcAlmox.lookUpValue +') ');
         Sql.Add('                GROUP BY M.CODARTIGO ) AUX ');
         Sql.Add('         WHERE ');
         Sql.Add('              (M.CODARTIGO = AUX.CODARTIGO) ');
         Sql.Add('          AND (M.CODALMOXARIFADO ='+ dblcAlmox.lookUpValue +') ');
         Sql.Add('          AND (M.IDMOV = AUX.IDMOV) ) MOV ');
         Sql.Add(' WHERE ');
         Sql.Add('         (MOV.CODALMOXARIFADO = '+ dblcAlmox.lookUpValue +') ');
         Sql.Add('     AND (MOV.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +') ');
             if Not chkimp.Checked Then
              sql.add('     AND (MOV.SALDOQTDEMOV <> 0)');
         sql.add('     AND (SUBSTR(MOV.CODARTIGO,1,6) = P.CODPRODUTO)');
         Sql.Add('     AND (G.CODGRUPOPROD = P.CODGRUPOPROD) ');

         if chkEstocaveis.Checked then
            SQL.Add('  AND ((P.ITEMESTOCAVEL = ''S'' ))');

         Sql.Add(' UNION ');
         Sql.Add('  SELECT ');
         Sql.Add('        G.CODGRUPOPROD, ');
         Sql.Add('        G.DESCGRUPOPROD, ');
         Sql.Add('        G.STATUSGRUPO, ');
         Sql.Add('        ('''') AS CODARTIGO, ');
         Sql.Add('        ('''') AS DESCPROD, ');
         Sql.Add('        ('''') AS CODMEDCUSTO, ');
         Sql.Add('        (0) AS QTDE, ');
         Sql.Add('        (0) AS VALORUN, ');
         Sql.Add('        (0) AS VALOR, ');
         Sql.Add('        (SUM(MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV)) AS TOTAL ');
         Sql.Add('   FROM ');
         Sql.Add('        PRODUTO P, ');
         Sql.Add('        GRUPPROD G, ');
         Sql.Add('        ( SELECT ');
         Sql.Add('               M.IDMOV, ');
         Sql.Add('               M.CODARTIGO, ');
         Sql.Add('               M.SALDOQTDEMOV, ');
         Sql.Add('               M.CUSTOMEDIOMOV, ');
         Sql.Add('               M.CODALMOXARIFADO,  ');
         Sql.Add('               M.IDPESSOA ');
         Sql.Add('          FROM ');
         Sql.Add('               MOVIMENT M, ');
         Sql.Add('               ( SELECT ');
         Sql.Add('                      M.CODARTIGO, ');
         Sql.Add('                      MAX(M.IDMOV) AS IDMOV ');
         Sql.Add('                 FROM ');
         Sql.Add('                      MOVIMENT M, ');
         Sql.Add('                      ( SELECT ');
         Sql.Add('                             CODARTIGO, ');
         Sql.Add('                             MAX(DATAMOV) AS MAXDATAMOV ');
         Sql.Add('                        FROM MOVIMENT ');
         Sql.Add('                        WHERE   ( DATAMOV <= TO_DATE('''+EdData.Text+''',''DD/MM/YYYY'') )');
         Sql.Add('                         AND (CODALMOXARIFADO  = '+dblcAlmox.lookUpValue+')');
         Sql.Add('                        GROUP BY CODARTIGO ');
         Sql.Add('                       ) SUB ');
         Sql.Add('                 Where (M.CODARTIGO = SUB.CODARTIGO) ');
         Sql.Add('                   AND (M.DATAMOV =SUB.MAXDATAMOV) ');
         Sql.Add('                   AND (M.CODALMOXARIFADO ='+ dblcAlmox.lookUpValue +') ');
         Sql.Add('                 GROUP BY M.CODARTIGO ');
         Sql.Add('                ) AUX ');
         Sql.Add('          WHERE ');
         Sql.Add('               (M.CODARTIGO = AUX.CODARTIGO) ');
         Sql.Add('           AND (M.CODALMOXARIFADO ='+ dblcAlmox.lookUpValue +') ');
         Sql.Add('           AND (M.IDMOV = AUX.IDMOV) ');
         Sql.Add('        ) MOV ');
         Sql.Add('   WHERE ');
         Sql.Add('        (MOV.CODALMOXARIFADO ='+ dblcAlmox.lookUpValue +') ');
         Sql.Add('    And (MOV.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +') ');
            if Not chkimp.Checked Then
              sql.add('    AND (MOV.SALDOQTDEMOV <> 0)');
         Sql.Add('    And (SUBSTR(MOV.CODARTIGO,1,6) = P.CODPRODUTO) ');
         Sql.Add('    AND (G.CODGRUPOPROD LIKE SUBSTR(RTRIM(P.CODGRUPOPROD),1,'+ IntToStr( X )+') || ''%'') ');
         Sql.Add('    AND (LENGTH(RTRIM(G.CODGRUPOPROD)) <= '+ IntToStr( X )+') ');
         Sql.Add('    And (G.STATUSGRUPO = ''S'') ');

         if chkEstocaveis.Checked then
            SQL.Add('  AND ((P.ITEMESTOCAVEL = ''S'' ))');

         Sql.Add('   GROUP BY   G.CODGRUPOPROD, ');
         Sql.Add('              G.DESCGRUPOPROD, ');
         Sql.Add('              G.STATUSGRUPO ) UN ');
          If  Trim(dblcGrpProd.Text) <> ''  Then
             Begin
                sql.Add(' WHERE (RTRIM(UN.CODGRUPOPROD) LIKE '''+dblcGrpProd.LookUpValue+''' || ''%'' ) ');
                DtmRptRelats.lbFiltro.Caption  := dblcGrpProd.LookupValue + ' - '+ dblcGrpProd.Text;
             End;
          Case RgOrdem.ItemIndex Of
             0 : sql.Add(' ORDER BY UN.CODGRUPOPROD, UN.DESCPROD  ');
             1 : sql.Add(' ORDER BY UN.CODGRUPOPROD, UN.CODARTIGO ');
          End;
       Open;
    End;
    DtmRptRelats.lbAlmox4.Caption   := dblcAlmox.Text;
    DtmRptRelats.lbPer4.Caption     := 'em '+ edData.Text;
End;

procedure TFrmParamInventFFData.edDataExit(Sender: TObject);
begin
  inherited;
  If EdData.Date > Modulo.LeDataRepresa Then
     Begin
        MsgDlg('A data não pode ser maior que a data represamento','Erro',mtError,[mbOK],0);
        EdData.Date := Modulo.LeDataRepresa;
     End;
end;

end.

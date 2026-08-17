unit FParamInventFF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, wwdblook, ComCtrls, IvDictio, IvMulti, IvEMulti;

type
  TFrmParamInventFF = class(TfrmOkCancelar)
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    dblcGrpProd: TwwDBLookupCombo;
    Label5: TLabel;
    qryAlmox: TwwQuery;
    qryGrpProd: TwwQuery;
    GroupBox1: TGroupBox;
    chkimp: TCheckBox;
    RgOrdem: TRadioGroup;
    qryAux: TwwQuery;
    chkEstoque: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazerQry;
  public
    { Public declarations }
  end;

var
  FrmParamInventFF: TFrmParamInventFF;

implementation

uses DRptRelats, uMensErro, uModulo, uSistema;

{$R *.DFM}

procedure TFrmParamInventFF.FazerQry;
var
   iCodCusteio : LongInt;
   X           : Integer;
Begin
   x:= Pos('.',Modulo.sMascaraGrupoProd)-1;
  qryAux.Close;
  qryAux.SQL.text := 'SELECT CODCUSTEIO FROM ALMOX WHERE CODALMOXARIFADO = '+dblcAlmox.lookUpValue;
  qryAux.Open;
  iCodCusteio:=qryAux.fieldbyName('CODCUSTEIO').AsInteger;
   With DtmRptRelats.QryInventFF DO
     Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT ');
         Sql.Add('     CAT.CodGrupoProd, ');
         Sql.Add('     CAT.StatusGrupo,  ');
         Sql.Add('     CAT.CODARTIGO,    ');
         Sql.Add('     CAT.SALDOQTDE,    ');
         Sql.Add('     CAT.DESCPROD,     ');
         Sql.Add('     CAT.CodMedCusto,  ');
         Sql.Add('     CAT.CustoMedio,   ');
         Sql.Add('     CAT.DescGrupoProd,');
         Sql.Add('     CAT.Valor, ');
         Sql.Add('     CAT.TOTAL ');
         Sql.Add(' FROM ');
         Sql.Add(' (SELECT ');
         Sql.Add('      S.CODARTIGO,    ');
         Sql.Add('      S.SALDOQTDE,    ');
         Sql.Add('      P.DESCPROD,     ');
         Sql.Add('      P.CodGrupoProd, ');
         Sql.Add('      P.CodMedCusto,  ');
         Sql.Add('      C.CustoMedio,   ');
         Sql.Add('      G.DescGrupoProd,');
         Sql.Add('      G.StatusGrupo,  ');
         Sql.Add('      (S.SaldoQtde * C.CustoMedio ) As Valor, ');
         Sql.Add('      (0) as TOTAL ');
         Sql.Add(' FROM ');
         Sql.Add('     Saldo S,    ');
         Sql.Add('     CustoMed C, ');
         Sql.Add('     Produto P,  ');
         Sql.Add('     GrupProd G  ');
         Sql.Add(' WHERE ');
         Sql.Add('      (S.CodAlmoxarifado = '+ dblcAlmox.lookUpValue +') ');
      If chkEstoque.Checked Then
         Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

         Sql.Add('  And (C.CodCusteio = '+ IntToStr(icodCusteio) +') ');
         Sql.Add('  And (S.idPessoa = '+ IntToStr(Sistema.IdEmpresa) +') ');
         Sql.Add('  And (Substr(S.CodArtigo,1,6) = P.CodProduto)');
         Sql.Add('  And (C.CodArtigo = S.CodArtigo)       ');
         Sql.Add('  And (G.CodGrupoProd(+) = P.CodGrupoProd) ');
         Sql.Add(' UNION  ');
         Sql.Add(' SELECT ');
         Sql.Add('      ('''') AS C1,    ');
         Sql.Add('      (0)    AS C2,    ');
         Sql.Add('      ('''') AS C3,     ');
         Sql.Add('      G.CodGrupoProd AS C4,  ');
         Sql.Add('      ('''') AS C5, ');
         Sql.Add('      (0)    AS C6, ');
         Sql.Add('       G.DescGrupoProd AS C7, ');
         Sql.Add('       G.StatusGrupo AS C8 , ');
         Sql.Add('      (0)    AS C9, ');
         Sql.Add('     SUM(AUX.TOTAL) AS C10 ');
         Sql.Add(' FROM ');
         Sql.Add('      GRUPPROD G, ');
         Sql.Add('       (SELECT    ');
         Sql.Add('            P.CODGRUPOPROD, ');
         Sql.Add('            SUM(S.SaldoQtde * C.CustoMedio ) As TOTAL ');
         Sql.Add('        FROM ');
         Sql.Add('            SALDO S,   ');
         Sql.Add('            PRODUTO P, ');
         Sql.Add('            CUSTOMED C ');
         Sql.Add('        WHERE ');
         Sql.Add('              (S.CodAlmoxarifado = '+ dblcAlmox.lookUpValue +') ');
      If chkEstoque.Checked Then
         Sql.Add('          AND (P.ITEMESTOCAVEL = ''S'')');
         Sql.Add('          And (C.CodCusteio = '+ IntToStr(icodCusteio) +') ');
         Sql.Add('          And (S.idPessoa = '+ IntToStr(Sistema.IdEmpresa) +') ');
         Sql.Add('          And (Substr(S.CodArtigo,1,6) = P.CodProduto )');
         Sql.Add('          And (C.CodArtigo = S.CodArtigo)');
         Sql.Add('        GROUP BY P.CODGRUPOPROD ) AUX ');
         Sql.Add(' WHERE ');
         Sql.Add('      (G.STATUSGRUPO = ''S'') ');
         Sql.Add('  AND (G.CODGRUPOPROD LIKE SUBSTR(RTRIM(AUX.CODGRUPOPROD),1,'+IntToStr(x)+') || ''%'')');
         Sql.Add('  AND (LENGTH(RTRIM(G.CODGRUPOPROD)) <= '+IntToStr(x)+') ');
         Sql.Add(' GROUP BY G.CODGRUPOPROD,G.DescGrupoProd,G.StatusGrupo ) CAT');
          If ( trim(dblcGrpProd.Text) <> '' ) And ( ChkImp.Checked )  Then
              sql.Add(' WHERE (RTRIM(CAT.CodGrupoProd) LIKE '''+dblcGrpProd.LookUpValue+''' || ''%'' ) ')
          Else
          If ( trim(dblcGrpProd.Text) <> '' ) And ( Not ChkImp.Checked )  Then
              sql.Add(' WHERE (RTRIM(CAT.CodGrupoProd) LIKE '''+dblcGrpProd.LookUpValue+''' || ''%'' ) '+
                      '   AND ( ( CAT.VALOR <> 0 ) AND ( CAT.SaldoQtde <> 0 ) ) ')
          Else
          If ( trim(dblcGrpProd.Text) = '' ) And ( Not ChkImp.Checked )  Then
              sql.Add(' WHERE ( ( CAT.VALOR <> 0 ) AND ( CAT.SaldoQtde <> 0 ) ) ');
          Case RgOrdem.ItemIndex Of
             0 : sql.Add(' Order By CAT.CodGrupoProd, CAT.DescProd  ');
             1 : sql.Add(' Order By CAT.CodGrupoProd, CAT.CODARTIGO ');
          End;
       Open;
     End;
     DtmRptRelats.lbAlmox2.Caption   := dblcAlmox.Text;
End;

procedure TFrmParamInventFF.bbtnConfirmarClick(Sender: TObject);
begin
  If trim(dblcAlmox.Text) = '' Then
    Begin
        MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOk],0);
        dblcAlmox.SetFocus;
        exit;
    End;
  FazerQry;
end;

procedure TFrmParamInventFF.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.SQL.Text:='SELECT CodAlmoxarifado,DescAlmox FROM ALMOX WHERE (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')';
  qryAlmox.Open;
  qryGrpProd.Open;
end;

end.


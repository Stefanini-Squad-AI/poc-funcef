unit FParamExtMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
   Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TFrmParamExtMov = class(TfrmOkCancelar)
    dblcAlmox: TwwDBLookupCombo;
    grpPeriodo: TGroupBox;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblcItem: TwwDBLookupCombo;
    dblcGrpProd: TwwDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    qryAlmox: TwwQuery;
    qryItem: TwwQuery;
    qryGrpProd: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure edDataIExit(Sender: TObject);
    procedure EdDataFExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcItemExit(Sender: TObject);
    procedure dblcGrpProdExit(Sender: TObject);
  private
    { Private declarations }
    Procedure FazerQry;
  public
    { Public declarations }
  end;

var
  FrmParamExtMov: TFrmParamExtMov;

implementation

uses DRptRelats,uSistema, uMensErro, uString;

{$R *.DFM}
procedure TFrmParamExtMov.FazerQry;
Begin
   With DtmRptRelats.QryExtMov DO
     Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                ');
         Sql.Add('     M.CODARTIGO,      ');
         Sql.Add('     M.DATAMOV,        ');
         Sql.Add('     M.QTDEMOV,        ');
         Sql.Add('     M.VALORMOV,       ');
         Sql.Add('     M.DATALANCMOV,    ');
         Sql.Add('     M.CUSTOMEDIOMOV,  ');
         Sql.Add('     M.SALDOQTDEMOV,   ');
         Sql.Add('     M.NUMDOCUMENTO,   ');
         Sql.Add('     M.CODTIPOMOV,     ');
         Sql.Add('     M.IDMOV,          ');
         Sql.Add('     U.DESCMEDIDA,     ');
         Sql.Add('     P.DESCPROD,       ');
         Sql.Add('     (DECODE (SIGN(M.QTDEMOV) , 1 ,M.QTDEMOV) )       as ENTRADA,   ');
         Sql.Add('     (DECODE (SIGN(M.QTDEMOV) , -1,Abs(M.QTDEMOV)) )  as SAIDA,     ');
         Sql.Add('     (DECODE (SIGN(M.VALORMOV), 1 ,M.VALORMOV) )      as V_ENTRADA, ');
         Sql.Add('     (DECODE (SIGN(M.VALORMOV), -1,Abs(M.VALORMOV)) ) as V_SAIDA,   ');
         Sql.Add('     (M.SALDOQTDEMOV * M.CUSTOMEDIOMOV) as VALOR,                   ');
         Sql.Add('     (M.SALDOQTDEMOV + (M.QTDEMOV*-1)) as SALDOANT,                 ');
         Sql.Add('     VLR.VALORANT as VALORANT,  ');
         Sql.Add('      Decode (M.CODTIPOMOV,''S'',T.DESCRESUMIDA||'' ''||RTRIM(A.DESCALMOX),           ');
         Sql.Add('                           ''F'',T.DESCRESUMIDA||'' ''||RTRIM(A.DESCALMOX),           ');
         Sql.Add('                           ''T'',T.DESCRESUMIDA||'' ''||RTRIM(A.DESCALMOX),           ');
         Sql.Add('                           ''G'',T.DESCRESUMIDA||'' ''||RTRIM(A.DESCALMOX),           ');
         Sql.Add('                           ''U'',T.DESCRESUMIDA||'' ''||RTRIM(A.DESCALMOX),           ');
         Sql.Add('                           ''B'',T.DESCRESUMIDA||'' ''||RTRIM(A.DESCALMOX),           ');
         Sql.Add('                           ''R'',T.DESCRESUMIDA||'' ''||RTRIM(A.DESCALMOX),           ');
         Sql.Add('                           ''A'',T.DESCRESUMIDA||'' ''||RTRIM(PE.RAZAOSOCIAL),        ');
         Sql.Add('                           ''K'',T.DESCRESUMIDA||'' ''||RTRIM(PE.RAZAOSOCIAL),        ');
         Sql.Add('                                 T.DESCRESUMIDA||'' ''||RTRIM(C.NOME)) as Historico   ');
         Sql.Add(' FROM ');
         Sql.Add('      MOVIMENT M,          ');
         Sql.Add('      PESSOA PE,           ');
         Sql.Add('      ITENSRECEBDEVOL I,   ');
         Sql.Add('      NFRECEBDEVOL NF,     ');
         Sql.Add('      UNMEDIDA U,          ');
         Sql.Add('      ARTIGO  AR,          ');         
         Sql.Add('      PRODUTO  P,          ');
         Sql.Add('      ALMOX A,             ');
         Sql.Add('      CENTCUST  C,         ');
         Sql.Add('      TIPOMOV T,           ');
         Sql.Add('      (                            ');
         Sql.Add('        SELECT                     ');
         Sql.Add('              M.CODARTIGO,');
         Sql.Add('              (M.SALDOQTDEMOV * M.CUSTOMEDIOMOV) AS VALORANT ');
         Sql.Add('        FROM                       ');
         Sql.Add('              MOVIMENT M,          ');
         Sql.Add('              (                    ');
         Sql.Add('               SELECT M.CODARTIGO, ');
         Sql.Add('                      MAX(M.IDMOV) AS MAXIDMOV  ');
         Sql.Add('               FROM MOVIMENT M,                 ');
         Sql.Add('                    ( SELECT M.CODARTIGO ,MAX(M.DATAMOV) AS DATAMOV ');
         Sql.Add('                      FROM MOVIMENT M                               ');
         Sql.Add('                      WHERE (1=1)                                   ');
         If Trim(dblcITem.Text) <> '' Then
            Sql.Add('                     AND (M.CODARTIGO = '''+Espaco(Trim(dblcItem.LookUpValue),14) + ''') ');

         Sql.Add('                        AND (M.CODALMOXARIFADO = ' + dblcAlmox.LookUpValue + ') ');
         Sql.Add('                        AND (M.DATAMOV < TO_DATE('''+EdDataI.Text+''',''dd/mm/yyyy'') ) ');
         Sql.Add('                        AND (M.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')  ');
         Sql.Add('                      GROUP BY M.CODARTIGO ');
         Sql.Add('                      ) SUB ');
         Sql.Add('                Where (M.CODARTIGO = SUB.CODARTIGO)       ');
         Sql.Add('                  AND (M.DATAMOV =SUB.DATAMOV)         ');
         Sql.Add('                  AND (M.CODALMOXARIFADO ='+dblcAlmox.LookupValue +')');
         Sql.Add('               GROUP BY M.CODARTIGO ');
         Sql.Add('              ) AUX      ');
         Sql.Add('        WHERE                                  ');
         Sql.Add('              (M.CODARTIGO = AUX.CODARTIGO)               ');
         Sql.Add('          AND (M.CODALMOXARIFADO ='+dblcAlmox.LookupValue +') ');
         Sql.Add('          AND (M.IDMOV = AUX.MAXIDMOV)          ');
         Sql.Add('      ) VLR                                    ');
         Sql.Add(' WHERE (1=1)                 ');
         If Trim(dblcITem.Text) <> '' Then
             Sql.Add(' And (M.CODARTIGO = '''+Espaco(Trim(dblcItem.LookUpValue),14) + ''') ')
         Else
         If Trim(dblcGrpProd.Text) <> '' Then
            Sql.Add(' And (P.CODGRUPOPROD = '''+Espaco(Trim(dblcGrpProd.LookUpValue),10)+''') ');

         Sql.Add('   And (M.CODALMOXARIFADO = ' + dblcAlmox.LookUpValue + ')        ');
         Sql.Add('   And (M.IDPESSOA        = ' + IntToStr(Sistema.IdEmpresa) + ')  ');
         Sql.Add('   And (M.DATAMOV        >= TO_DATE('''+EdDataI.Text+''',''dd/mm/yyyy'')) ');
         Sql.Add('   And (M.DATAMOV        <= TO_DATE('''+EdDataF.Text+''',''dd/mm/yyyy'')) ');
         Sql.Add('   And (M.CODARTIGO = AR.CODARTIGO)   ');
         Sql.Add('   And (AR.CODPRODUTO = P.CODPRODUTO)   ');
         Sql.Add('   And (M.CODARTIGO = VLR.CODARTIGO(+))           ');
         Sql.Add('   And (M.CODTIPOMOV = T.CODTIPOMOV)              ');
         Sql.Add('   And (U.CODMEDIDA = P.CODMEDCUSTO)              ');
         Sql.Add('   And (I.IDMOV(+) = M.IDMOV)                     ');
         Sql.Add('   And (I.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL(+))  ');
         Sql.Add('   And (NF.IDFORCLI = PE.IDPESSOA(+))             ');
         Sql.Add('   And (M.CODALMOXTRANSF = A.CODALMOXARIFADO(+))  ');
         Sql.Add('   And (M.CODCENTROCUSTO = C.CODCENTROCUSTO(+) )  ');
         Sql.Add('   And (M.IDPESSOA = C.IDEMPRESA(+) )');
         Sql.Add(' ORDER BY M.CODARTIGO, M.DATAMOV,M.IDMOV ');
       Open;
     End;
     DtmRptRelats.lbAlmox.Caption   := dblcAlmox.Text;
     DtmRptRelats.lbPeriodo.Caption := ' De ' + edDataI.Text + ' a ' + edDataF.Text + ' ';
End;


procedure TFrmParamExtMov.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.SQL.Text:='SELECT DescAlmox,CodAlmoxarifado FROM ALMOX WHERE IDPESSOA = '+IntToStr(Sistema.idEmpresa);
  qryAlmox.Open;
  //
  qryItem.Open;
  //
  qryGrpProd.Open;
  edDataI.Text := DateToStr( Date );
  edDataF.Text := DateToStr( Date );
end;

procedure TFrmParamExtMov.edDataIExit(Sender: TObject);
begin
  inherited;
  If Trim(edDataF.Text) <> '' Then
    Begin
        IF StrToDate(EdDataI.Text) > StrToDate(EdDataF.Text) Then
          Begin
              MsgDlg('A data inicial não pode ser maior que a data final','Erro',mtError,[mbOk],0);
              EdDataI.SetFocus;
          End;
    End;
end;

procedure TFrmParamExtMov.EdDataFExit(Sender: TObject);
begin
  inherited;
  If Trim(edDataI.Text) <> '' Then
    Begin
        IF StrToDate(EdDataF.Text) < StrToDate(EdDataI.Text) Then
          Begin
              MsgDlg('A data final não pode ser menor que a data inicial','Erro',mtError,[mbOk],0);
              EdDataF.SetFocus;
          End;
    End;
end;

procedure TFrmParamExtMov.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcAlmox.Text) = '' Then
    Begin
        MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOk],0);
        dblcAlmox.SetFocus;
        exit;
    End
  Else
  
     FazerQry;
end;

procedure TFrmParamExtMov.dblcItemExit(Sender: TObject);
begin
  inherited;
  If trim(dblcItem.Text) <> '' Then
    Begin
        dblcGrpProd.Text := '';
        dblcGrpProd.Enabled := False;
    End
  Else
    dblcGrpProd.Enabled := True;

end;

procedure TFrmParamExtMov.dblcGrpProdExit(Sender: TObject);
begin
  inherited;
  If trim(dblcGrpProd.Text) <> '' Then
    Begin
        dblcItem.Text := '';
        dblcItem.Enabled := False;
    End
  Else
    dblcItem.Enabled := True;
end;

end.


unit fParamSoliComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, wwdblook, IvDictio, IvMulti, IvEMulti;

type
  TfrmParamSoliComp = class(TfrmOkCancelar)
    rgrpStatus: TRadioGroup;
    Label1: TLabel;
    dblkcmbNumSoli: TwwDBLookupCombo;
    qryNumSoli: TwwQuery;
    dblkcmbCentro: TwwDBLookupCombo;
    Label2: TLabel;
    qryCentro: TwwQuery;
    RgOrdem: TRadioGroup;
    chkResumida: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgrpStatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sNumSolCompra : String;
  end;

var
  frmParamSoliComp: TfrmParamSoliComp;

implementation

uses DRptRelats, usistema, uModulo ;

{$R *.DFM}

procedure TfrmParamSoliComp.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Not chkResumida.Checked Then
     DtmRptRelats.bResumida := False
  Else
     DtmRptRelats.bResumida := True;

  //
  DtmRptRelats.qrySoliComp.Close;
  With DtmRptRelats.qrySoliComp Do
    Begin
        Sql.Clear;
        Sql.Add('SELECT /*+ rule */  ');
        Sql.Add('      SO.NUMSOLCOMPRA,                                                    ');
        Sql.Add('      SO.CODCENTROCUSTO,                                                  ');
        Sql.Add('      SO.DATAENTREGA AS DATA,                                             ');
        Sql.Add('      SO.IMPRESSO,                                                        ');
        Sql.Add('      SO.IDPESSOA,                                                        ');
        Sql.Add('      IT.CODARTIGO,                                                       ');
        Sql.Add('      SUBSTR(DECODE(IT.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI),1,60) AS PRODUTO,  ');
        Sql.Add('      IT.QTDEPEDIDA,                                                      ');
        Sql.Add('      IT.CODMEDIDA,                                                       ');
        Sql.Add('      IT.OBSITEMSOLIC,                                                    ');
        Sql.Add('      SA.SALDOQTDE,                                                       ');
        Sql.Add('      SA.ESTMAXIMO,                                                       ');
        Sql.Add('      IT.SALDOACOMPRAR AS SALDO,                                          ');
        Sql.Add('      PR.CODMEDCUSTO,                                                     ');
        Sql.Add('      PR.CODPRODUTO,                                                      ');
        Sql.Add('      U.DATAULTCOMP AS DATAU,                                             ');
        Sql.Add('      U.FORMECEDOR AS FORNECEDOR,                                         ');
        Sql.Add('      U.QTDE ,                                                            ');
        Sql.Add('      U.UNID,                                                             ');
        Sql.Add('      U.VALUNIT AS PRECO,                                                 ');
        Sql.Add('      U.PRAZO,                                                            ');
        Sql.Add('      U.PERIODO AS PERIDO,                                                ');
        Sql.Add('      CC.NOME AS CENTROCUSTO,                                             ');
        Sql.Add('      DECODE(NVL(U.VALUNIT,0),0,0,((((C.CUSTOMEDIO*CF.Fator/CO.Fator)/U.VALUNIT)-1)*100)) AS PERCVAR, ');
        Sql.Add('      DECODE (PR.ITEMESTOCAVEL,''S'',''SIM'',''NÃO'') AS ITEMESTOCAVEL,   ');
        Sql.Add('      (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) AS VALORUN,                        ');
        Sql.Add('      (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) * IT.QTDEPEDIDA AS VALORTOTAL,     ');
        Sql.Add('      CM.CONSUMO                                                          ');
        Sql.Add('FROM                                                                      ');
        Sql.Add('     SOLICOMP SO,                                                         ');
        Sql.Add('     ITEMSOLI IT,                                                         ');
        Sql.Add('     ARTIGO AR,                                                           ');
        Sql.Add('     PRODUTO PR,                                                          ');
        Sql.Add('     CUSTOMED C,                                                          ');
        Sql.Add('     CONVER  CO,                                                          ');
        Sql.Add('     CONVER  CF,                                                          ');
        Sql.Add('     SALDO SA,                                                            ');
        Sql.Add('     PRODVARI PV,                                                         ');
        Sql.Add('     (                                                                    ');
        Sql.Add('SELECT                                                                    ');
        Sql.Add('     M.CODARTIGO AS CODARTIGO,                                            ');
        Sql.Add('     ROUND((SUM(M.QTDEMOV)*-1)/90,2)  AS CONSUMO                          ');
        Sql.Add('     FROM                                                                 ');
        Sql.Add('     MOVIMENT M                                                           ');
        Sql.Add('     WHERE                                                                ');
        Sql.Add('      (M.DATAMOV >= (SYSDATE-90))                                         ');
        Sql.Add('  AND (M.DATAMOV <= SYSDATE )                                             ');
        Sql.Add('  AND (M.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')                      ');
        Sql.Add('  AND (M.CODALMOXARIFADO = ' + IntToStr( Modulo.iCodAlmoxa ) + ')         ');
        Sql.Add('  AND (M.CODTIPOMOV NOT IN (''A'',''K'',''B'',''C'',''S'',''Z'') )        ');
        Sql.Add('  GROUP BY M.CODARTIGO                                                    ');
        Sql.Add('     ) CM,                                                                ');
        Sql.Add('       VWULTCOMPRA U,                                                       ');
        Sql.Add('       CENTCUST CC                                                        ');
        Sql.Add('WHERE                                                                     ');
        Sql.Add('          (SO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')                 ');
      If Trim(dblkcmbNumSoli.text ) <> '' then
         SQL.add(' AND (SO.NUMSOLCOMPRA = ' + dblkcmbNumSoli.LookupValue+')');
      If Trim(dblkcmbCentro.text ) <> '' then
         SQL.add('   AND (RTRIM(SO.CODCENTROCUSTO) = ''' +Trim(dblkcmbCentro.LookupValue)+''')');
        Case rgrpStatus.ItemIndex of
            0 : Begin
                   Sql.Add('   AND(SO.IMPRESSO = ''F'') ');
                End;
            1 : Begin
                   Sql.Add('   AND (SO.IMPRESSO = ''T'') '  );
                End;
        End;
        Sql.Add('   AND (SA.CODALMOXARIFADO(+) = ' + IntToStr( Modulo.iCodAlmoxa ) + ')');
        Sql.Add('   AND (C.CODCUSTEIO(+) = ' + IntToStr( Modulo.LeUnCusteio( Modulo.iCodAlmoxa )) + ')');
        Sql.add('   AND (CC.CODCENTROCUSTO = SO.CODCENTROCUSTO)');
        Sql.add('   AND (CC.IDEMPRESA = SO.IDEMPRESA)       ');
        Sql.Add('   AND (IT.NUMSOLCOMPRA = SO.NUMSOLCOMPRA) ');
        Sql.Add('   AND (IT.CODARTIGO   = AR.CODARTIGO)     ');
        Sql.Add('   AND (AR.CODPRODUTO  = PR.CODPRODUTO)    ');
        Sql.Add('   AND (AR.CODARTIGO   = C.CODARTIGO(+))   ');
        Sql.Add('   AND (PR.CODPRODUTO  = CO.CODPRODUTO)    ');
        Sql.Add('   AND (CO.CODMEDIDA   = PR.CODMEDCUSTO)   ');
        Sql.Add('   AND (PR.CODPRODUTO  = CF.CODPRODUTO)    ');
        Sql.Add('   AND (CF.CODMEDIDA   = IT.CODMEDIDA)     ');
        Sql.Add('   AND (IT.IDPRODVARI  = PV.IDPRODVARI(+)) ');
        Sql.Add('   AND (IT.CODARTIGO   = SA.CODARTIGO(+))  ');
        Sql.Add('   AND (IT.CODARTIGO   = U.CODARTIGO(+))   ');
        Sql.Add('   AND (U.IDPESSOA(+)  = '+IntToStr(Sistema.IdEmpresa)+')                 ');
        Sql.Add('   AND (IT.CODARTIGO   = CM.CODARTIGO(+))   ');
        Case RgOrdem.ItemIndex Of
           0 : Sql.Add(' ORDER BY SO.NUMSOLCOMPRA, PRODUTO    ');
           1 : Sql.Add(' ORDER BY SO.NUMSOLCOMPRA, IT.CODARTIGO ');
        End;

        DtmRptRelats.lbStatus.caption := rgrpStatus.Items.strings[rgrpStatus.itemindex];
    End;
 DtmRptRelats.qrySoliComp.Open;
end;

procedure TfrmParamSoliComp.FormCreate(Sender: TObject);
begin
  inherited;
  qryNumSoli.Close;
  qryNumSoli.SQL.Text:= ' SELECT NUMSOLCOMPRA FROM SOLICOMP WHERE (IDPESSOA = ' +IntToStr(Sistema.IdEmpresa) +')'+
                        ' AND (IMPRESSO = ''F'') ORDER BY NUMSOLCOMPRA ';
  qryNumSoli.Open;
  //
  qryCentro.Close;
  qryCentro.SQL.Text:= ' SELECT DISTINCT S.CODCENTROCUSTO, C.NOME FROM SOLICOMP S, CENTCUST C '+
                       ' WHERE (S.IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+')'+
                       '   AND (S.CODCENTROCUSTO = C.CODCENTROCUSTO ) '+
                       '   AND (S.IDPESSOA = C.IDEMPRESA ) '+
                       '   AND (IMPRESSO = ''F'') ORDER BY 2';
  qryCentro.Open;
end;

procedure TfrmParamSoliComp.rgrpStatusClick(Sender: TObject);
Var sSql : String;
begin
  inherited;
  qryNumSoli.Close;
  sSql := ' SELECT NUMSOLCOMPRA FROM SOLICOMP WHERE (IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+')';
  If rgrpStatus.ItemIndex = 0 Then
     sSql := sSql + ' AND (IMPRESSO = ''F'') ORDER BY NUMSOLCOMPRA '
  Else sSql := sSql + ' AND (IMPRESSO = ''T'') ORDER BY NUMSOLCOMPRA ';

  qryNumSoli.Sql.Text := sSql;
  qryNumSoli.Open;

  qryCentro.Close;
  sSql := ' SELECT DISTINCT S.CODCENTROCUSTO, C.NOME FROM SOLICOMP S, CENTCUST C '+
          ' WHERE (S.IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+')'+
          '   AND (S.CODCENTROCUSTO = C.CODCENTROCUSTO ) '+
          '   AND (S.IDPESSOA = C.IDEMPRESA ) ';
  If rgrpStatus.ItemIndex = 0 Then
     sSql := sSql + ' AND (IMPRESSO = ''F'') ORDER BY 2 '
  Else sSql := sSql + ' AND (IMPRESSO = ''T'') ORDER BY 2 ';

  qryCentro.Sql.Text := sSql ;
  qryCentro.Open;

end;

end.


unit FParamControleOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CMProcuraSubTipo, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, Db, DBTables, Wwquery;

type
  TFrmParamControleOC = class(TfrmOkCancelar)
    Label1: TLabel;
    rgItem: TRadioGroup;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edIniOC: TCMDateTimePicker;
    edFimOC: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edIniPreEnt: TCMDateTimePicker;
    edFimPreEnt: TCMDateTimePicker;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edIniEnt: TCMDateTimePicker;
    edFimEnt: TCMDateTimePicker;
    cmpForn: TCMProcuraForCli;
    edNumOC: TRealEdit;
    RgOC: TRadioGroup;
    qryArtigo: TwwQuery;
    Label4: TLabel;
    dblcItem: TwwDBLookupCombo;
    procedure cmpFornExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }

  end;

var
  FrmParamControleOC: TFrmParamControleOC;

implementation

{$R *.DFM}
Uses DRelCompras, uMensErro, uCMTypes,  uModulo, uSistema ;

Procedure TFrmParamControleOC.FazRel;
Var
  sCodCusteio : String;
Begin
    DtmRelCompras.lbItem.caption  := rgItem.Items.strings[rgItem.ItemIndex];
    DtmRelCompras.lbOrdem.caption := rgOC.Items.strings[rgOC.ItemIndex];
    With DtmRelCompras.qryControleOC Do
       Begin
          Close;
          Sql.Clear;
          Sql.Add(' SELECT                                                                                       ');
          Sql.Add('      P.NOME AS FORNECEDOR,                                                                   ');
          Sql.Add('      O.NUMOC,                                                                                ');
          Sql.Add('      O.DATAOC,                                                                               ');
          Sql.Add('      O.OCATENDIDA,                                                                           ');
          Sql.Add('      DECODE(O.FLGIMPRESSA,''T'',''O.C. JÁ IMPRESSA'',''O.C. NÃO IMPRESSA'') AS IIMPRESSA,    ');
          Sql.Add('      O.OBSOC,                                                                                ');
          Sql.Add('      I.CODARTIGO,                                                                            ');
          Sql.Add('      I.CODMEDIDA,                                                                            ');
          Sql.Add('      SUBSTR(DECODE(I.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO,        ');
          Sql.Add('      I.VALORUN,                                                                              ');
          Sql.Add('      PE.QTDEENTREGA,                                                                         ');
          Sql.Add('      PE.DATAENTREGA,                                                                         ');
          Sql.Add('      NF.NUMNF,                                                                               ');
          Sql.Add('      NF.DATAENTDEVOL,                                                                        ');
          Sql.Add('      DECODE(INF.QTDERECEBDEVOL,NULL,0,INF.QTDERECEBDEVOL) AS QTDERECEBIDA,                   ');
          Sql.Add('      DECODE(IMP.TOTIMP,NULL,0,IMP.TOTIMP)AS TOTIMP,                                          ');
          Sql.Add('      DECODE(IPI.TOTIPI,NULL,0,IPI.TOTIPI) AS TOTIPI,                                         ');
          Sql.Add('      TOT.TOTITEM,                                                                            ');
          Sql.Add('      (I.VALORUN*PE.QTDEENTREGA) AS VALTOTAL,                                                 ');
          Sql.Add('      (DECODE(IPI.TOTIPI,NULL,0,IPI.TOTIPI)+DECODE(IMP.TOTIMP,NULL,0,IMP.TOTIMP)+TOT.TOTITEM) AS TOTOC, ');
          Sql.Add('      I.OBSITEMOC                                                                             ');
          Sql.Add(' FROM                                                                                         ');
          Sql.Add('      PESSOA P,                                                                               ');
          Sql.Add('      ITEMOC I,                                                                               ');
          Sql.Add('      OC O,                                                                                   ');
          Sql.Add('      ARTIGO A,                                                                               ');
          Sql.Add('      PRODUTO PR,                                                                             ');
          Sql.Add('      PRODVARI PV,                                                                            ');
          Sql.Add('      PRAZOENTREGAOC PE,                                                                      ');
          Sql.Add('      ITENSRECEBDEVOL INF,                                                                    ');
          Sql.Add('      NFRECEBDEVOL NF,                                                                        ');
          Sql.Add('      (SELECT I.NUMOC, SUM(I.VALORUN*PE.QTDEENTREGA) AS TOTITEM                               ');
          Sql.Add('       FROM ITEMOC I, PRAZOENTREGAOC PE                                                       ');
          Sql.Add('       WHERE (1=1)                                                                            ');
                 Case rgOC.ItemIndex Of
                    1 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') OR (I.FLGITEMATENDIDO = ''T''))');
                    2 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') AND (I.FLGITEMATENDIDO IS NOT NULL)) ');
                    3 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''T'') AND (I.FLGITEMATENDIDO IS NOT NULL))');

                 End;
          Sql.Add('             AND (I.IDITEMOC = PE.IDITEMOC)                                                       ');
          Sql.Add('       GROUP BY I.NUMOC) TOT,                                                                 ');
          Sql.Add('      ((SELECT AOC.NUMOC,                                                                     ');
          Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AOC.VLRAGREGTOT*-1),AOC.VLRAGREGTOT)) AS TOTIMP ');
          Sql.Add('        FROM  AGREGTOTOC AOC,                                                                 ');
          Sql.Add('              TIPOAGRE T                                                                      ');
          Sql.Add('        WHERE                                                                                 ');
          Sql.Add('               (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))                ');
          Sql.Add('           AND (UPPER(T.DESCCUSTAGREG) NOT LIKE ''IPI''||''%'')                               ');
          Sql.Add('           AND (AOC.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                                    ');
          Sql.Add('        GROUP BY AOC.NUMOC)                                                                   ');
          Sql.Add('        UNION                                                                                 ');
          Sql.Add('       (SELECT I.NUMOC,                                                                       ');
          Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AI.VLRAGREGITEM*-1),AI.VLRAGREGITEM)) AS TOTIMP ');
          Sql.Add('        FROM  AGREGITEMOC AI,                                                                 ');
          Sql.Add('              TIPOAGRE T,                                                                     ');
          Sql.Add('              ITEMOC I                                                                        ');
          Sql.Add('        WHERE                                                                                 ');
          Sql.Add('               (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))                 ');
              Case rgOC.ItemIndex Of
                 1 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') OR (I.FLGITEMATENDIDO = ''T''))');
                 2 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') AND (I.FLGITEMATENDIDO IS NOT NULL)) ');
                 3 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''T'') AND (I.FLGITEMATENDIDO IS NOT NULL))');
              End;
          Sql.Add('           AND (UPPER(T.DESCCUSTAGREG) NOT LIKE ''IPI''||''%'')                               ');
          Sql.Add('           AND (I.IDITEMOC = AI.IDITEMOC)                                                     ');
          Sql.Add('           AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                                     ');
          Sql.Add('        GROUP BY I.NUMOC)) IMP,                                                               ');
          Sql.Add('      ((SELECT AOC.NUMOC,                                                                     ');
          Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AOC.VLRAGREGTOT*-1),AOC.VLRAGREGTOT)) AS TOTIPI ');
          Sql.Add('        FROM  AGREGTOTOC AOC,                                                                 ');
          Sql.Add('              TIPOAGRE T                                                                      ');
          Sql.Add('        WHERE                                                                                 ');
          Sql.Add('               (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))                ');
          Sql.Add('           AND (UPPER(T.DESCCUSTAGREG) LIKE ''IPI''||''%'')                                   ');
          Sql.Add('           AND (AOC.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                                    ');
          Sql.Add('        GROUP BY AOC.NUMOC)                                                                   ');
          Sql.Add('        UNION                                                                                 ');
          Sql.Add('       (SELECT I.NUMOC,                                                                       ');
          Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AI.VLRAGREGITEM*-1),AI.VLRAGREGITEM)) AS TOTIPI ');
          Sql.Add('        FROM  AGREGITEMOC AI,                                                                 ');
          Sql.Add('              TIPOAGRE T,                                                                     ');
          Sql.Add('              ITEMOC I                                                                        ');
          Sql.Add('        WHERE                                                                                 ');
          Sql.Add('              (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))                 ');
          Sql.Add('          AND (UPPER(T.DESCCUSTAGREG) LIKE ''IPI''||''%'')                                    ');
             Case rgOC.ItemIndex Of
                1 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') OR (I.FLGITEMATENDIDO = ''T''))      ');
                2 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') AND (I.FLGITEMATENDIDO IS NOT NULL)) ');
                3 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''T'') AND (I.FLGITEMATENDIDO IS NOT NULL)) ');
             End;
          Sql.Add('          AND (I.IDITEMOC = AI.IDITEMOC)                                                      ');
          Sql.Add('          AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                                      ');
          Sql.Add('        GROUP BY I.NUMOC)) IPI                                                                ');
          Sql.Add(' WHERE (NF.FLGTIPONOTA(+) = ''R'')                               ');
          Sql.Add('   AND (O.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')            ');
          If edNumOC.Value > 0 Then
              Sql.Add('  AND (O.NUMOC = '+ EdNumOC.Text+')')
          Else
             Begin
                 If Trim(cmpForn.Text) <> '' Then
                    Sql.Add(' AND (NF.IDFORCLI = '+IntToStr(cmpForn.ForCliReg.Id)+') ');

                 If Trim(dblcItem.Text) <> '' Then
                    Sql.Add(' AND (I.CODARTIGO = '+QuotedStr(dblcItem.LookupValue)+') ');

                 Case rgOC.ItemIndex Of
                    1 : Sql.Add(' AND (NF.DATAENTDEVOL(+) IS NOT NULL) ');
                    2 : Sql.Add(' AND (NF.DATAENTDEVOL(+) IS NULL) AND (PE.DATAENTREGA >= SYSDATE) ');
                    3 : Sql.Add(' AND (NF.DATAENTDEVOL(+) IS NULL) AND (PE.DATAENTREGA < SYSDATE) ');
                 End;
                 Case rgItem.ItemIndex Of
                    1 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') OR  (I.FLGITEMATENDIDO = ''T'')) AND (NF.DATAENTDEVOL(+) IS NOT NULL)');
                    2 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') AND (NF.DATAENTDEVOL(+) IS NOT NULL))');
                    3 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''T'') AND (NF.DATAENTDEVOL(+) IS NOT NULL))');
                    4 : Sql.Add('AND (NF.DATAENTDEVOL(+) IS NULL)');
                 End;
                 If Trim(edIniOC.Text ) <> '' then
                    Sql.add(' AND (O.DATAOC >= TO_DATE('''+edIniOC.Text+''',''DD/MM/YYYY''))');
                 If Trim(edFimOC.Text ) <> '' then
                    Sql.add(' AND (O.DATAOC <= TO_DATE('''+edFimOC.Text+''',''DD/MM/YYYY''))');
                 If Trim(edIniPreEnt.Text ) <> '' then
                    Sql.add(' AND (PE.DATAENTREGA >= TO_DATE('''+edIniPreEnt.Text+''',''DD/MM/YYYY''))');
                 If Trim(edFimPreEnt.Text ) <> '' then
                    Sql.add(' AND (PE.DATAENTREGA <= TO_DATE('''+edFimPreEnt.Text+''',''DD/MM/YYYY''))');
                 If Trim(edIniEnt.Text ) <> '' then
                    Sql.add(' AND (NF.DATAENTDEVOL >= TO_DATE('''+edIniEnt.Text+''',''DD/MM/YYYY''))');
                 If Trim(edFimEnt.Text ) <> '' then
                    Sql.add(' AND (NF.DATAENTDEVOL <= TO_DATE('''+edFimEnt.Text+''',''DD/MM/YYYY''))');
                 sCodCusteio := IntToStr( Modulo.LeUnCusteio( Modulo.iCodAlmoxa ) );
             End;
          Sql.Add('  AND (O.NUMOC = I.NUMOC)                           ');
          Sql.Add('  AND (I.IDITEMOC = INF.IDITEMOC(+))                ');
          Sql.Add('  AND (INF.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL(+))   ');
          Sql.Add('  AND (P.IDPESSOA = O.IDFORCLI)                     ');
          Sql.Add('  AND (I.CODARTIGO = A.CODARTIGO)                   ');
          Sql.Add('  AND (A.CODPRODUTO = PR.CODPRODUTO)                ');
          Sql.Add('  AND (I.IDPRODVARI = PV.IDPRODVARI(+))             ');
          Sql.Add('  AND (PE.IDITEMOC = I.IDITEMOC)                    ');
          Sql.Add('  AND (IMP.NUMOC(+) = O.NUMOC)                      ');
          Sql.Add('  AND (IPI.NUMOC(+) = O.NUMOC)                      ');
          Sql.Add('  AND (TOT.NUMOC = O.NUMOC)                         ');
          Sql.Add(' ORDER BY O.NUMOC, I.IDITEMOC                       ');
          Open;
       End;
End;

procedure TFrmParamControleOC.cmpFornExit(Sender: TObject);
begin
  inherited;
  If cmpForn.Valida <> vcOK Then
     Begin
         cmpForn.Text := '';
     End;

end;

procedure TFrmParamControleOC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazRel;
end;

procedure TFrmParamControleOC.FormCreate(Sender: TObject);
begin
  inherited;
  qryArtigo.Open;
end;

end.

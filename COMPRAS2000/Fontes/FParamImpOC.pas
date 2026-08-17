unit FParamImpOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery, Mask, TREdit;

type
  TFrmParamImpOC = class(TfrmOkCancelar)
    RgImp: TRadioGroup;
    dblcOC: TCMDBLookupCombo;
    Label1: TLabel;
    ChkAtend: TCheckBox;
    QryOC: TwwQuery;
    QryOCNUMOC: TFloatField;
    QryOCIDFORCLI: TFloatField;
    QryOCRAZAOSOCIAL: TStringField;
    GroupBox1: TGroupBox;
    edNumI: TRealEdit;
    edNumF: TRealEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure RgImpClick(Sender: TObject);
    procedure ChkAtendClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcOCCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Procedure SetQryOC;
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmParamImpOC: TFrmParamImpOC;

implementation

{$R *.DFM}

Uses uSistema, DRelCompras, uMensErro, uModulo, uCmFileUtils,
  DCompras;

procedure TFrmParamImpOC.FormCreate(Sender: TObject);
begin
  inherited;
  SetQryOC;
end;

Procedure TFrmParamImpOC.SetQryOC;
Begin
   qryOC.Close;
   qryOC.Sql.Clear;
   qryOC.Sql.Add(' SELECT              ');
   qryOC.Sql.Add('       OC.NUMOC,     ');
   qryOC.Sql.Add('       OC.IDFORCLI,  ');
   qryOC.Sql.Add('       P.RAZAOSOCIAL ');
   qryOC.Sql.Add(' FROM                ');
   qryOC.Sql.Add('      PESSOA P,      ');
   qryOC.Sql.Add('      OC             ');
   qryOC.Sql.Add('WHERE (OC.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +')');
   If Not ChkAtend.Checked Then
      qryOC.Sql.Add('  AND (OC.OCATENDIDA = ''F'')     ')
   Else
      qryOC.Sql.Add('  AND (OC.OCATENDIDA = ''T'')     ');
   If RgImp.ItemIndex = 0 Then
      qryOC.Sql.Add('   AND (OC.FLGIMPRESSA = ''F'' )   ')
   Else
      qryOC.Sql.Add('   AND (OC.FLGIMPRESSA = ''T'' )   ');
   qryOC.Sql.Add('   AND (OC.IDFORCLI = P.IDPESSOA)     ');
   qryOC.Sql.Add(' ORDER BY OC.NUMOC                    ');
   qryOC.Open;
End;

procedure TFrmParamImpOC.RgImpClick(Sender: TObject);
begin
  inherited;
  SetQryOC;
end;

procedure TFrmParamImpOC.ChkAtendClick(Sender: TObject);
begin
  inherited;
  SetQryOC;
end;

Procedure TFrmParamImpOC.FazRel;
Begin
  DtmCompras.qryEndCobEnt.Close;
  DtmCompras.qryEndCobEnt.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  DtmCompras.qryEndCobEnt.Open;
  Case DtmRelCompras.iModelo Of
      0 : Begin
//---------------------------------------------------------------------------------------------------------------------------------------
//  ORDEM DE COMPRAS MODELO DFAULT
//---------------------------------------------------------------------------------------------------------------------------------------
             DtmRelCompras.qryPrazoOC.Close;
             DtmRelCompras.qryAgregOC.Close;
             DtmRelCompras.qryCompOC.Close;
             //
             DtmRelCompras.qryPrazoOC.DataSource := DtmRelCompras.dsOC;
             DtmRelCompras.qryAgregOC.DataSource := DtmRelCompras.dsOC;
             DtmRelCompras.qryCompOC.DataSource  := DtmRelCompras.dsOC;
             //
             DtmRelCompras.qryPrazoOC.Open;
             DtmRelCompras.qryAgregOC.Open;
             DtmRelCompras.qryCompOC.Open;
             //
             DtmRelCompras.LbEndEnt.Caption    := Trim(DtmCompras.qryEndCobEntENDENT.AsString) +' Nº '+Trim(DtmCompras.qryEndCobEntNUMENT.AsString);
             DtmRelCompras.LbCompEnt.Caption   := DtmCompras.qryEndCobEntCOMPLENT.AsString;
             DtmRelCompras.LbCidadeEnt.Caption := DtmCompras.qryEndCobEntCIDADEENT.AsString;
             DtmRelCompras.LbBairroEnt.Caption := DtmCompras.qryEndCobEntBAIRROENT.AsString;
             DtmRelCompras.LbUFEnt.Caption     := DtmCompras.qryEndCobEntUFENT.AsString;
             //
             DtmRelCompras.LbEndCob.Caption    := Trim(DtmCompras.qryEndCobEntENDCOB.AsString) +' Nº '+Trim(DtmCompras.qryEndCobEntNUMCOB.AsString);
             DtmRelCompras.LbCompCob.Caption   := DtmCompras.qryEndCobEntCOMPLCOB.AsString;
             DtmRelCompras.LbCidadeCob.Caption := DtmCompras.qryEndCobEntCIDADECOB.AsString;
             DtmRelCompras.LbBairroCob.Caption := DtmCompras.qryEndCobEntBAIRROCOB.AsString;
             DtmRelCompras.LbUFCob.Caption     := DtmCompras.qryEndCobEntUFCOB.AsString;
             //
             if Sistema.idiomaAtivo = 1 Then
                Begin // Idioma Português
                   DtmRelCompras.LbCepEnt.Caption    := FormatMaskText('00000-999;0;',DtmCompras.qryEndCobEntCEPENT.AsString);
                   DtmRelCompras.LbCepCob.Caption    := FormatMaskText('00000-999;0;',DtmCompras.qryEndCobEntCEPCOB.AsString);
                   DtmRelCompras.LbNumDocEnt.Caption := FormatMaskText('00.000.000/0000.000;0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
                   DtmRelCompras.LbNumDocCob.Caption := FormatMaskText('00.000.000/0000.000;0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
                End
             Else
                Begin // outros idiomas
                   DtmRelCompras.LbCepEnt.Caption    := DtmCompras.qryEndCobEntCEPENT.AsString;
                   If DtmCompras.qryEndCobEntMASCARA.IsNull Then
                      Begin
                         DtmRelCompras.LbNumDocEnt.Caption := DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString;
                         DtmRelCompras.LbNumDocCob.Caption := DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString;
                      End
                   Else
                      Begin
                         DtmRelCompras.LbNumDocEnt.Caption  := FormatMaskText( Trim(DtmCompras.qryEndCobEntMASCARA.AsString) + ';0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
                         DtmRelCompras.LbNumDocCob.Caption  := FormatMaskText( Trim(DtmCompras.qryEndCobEntMASCARA.AsString) + ';0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
                      End;
                   DtmRelCompras.LbCepCob.Caption    := DtmCompras.qryEndCobEntCEPCOB.AsString;
                End;

             With DtmRelCompras.qryOC Do
                Begin
                   Close;
                   Sql.Clear;
                   Sql.Add('SELECT /*+ rule */                                                         ');
                   Sql.Add('      P.RAZAOSOCIAL,                                                       ');
                   Sql.Add('      P.NOME,                                                              ');
                   Sql.Add('      P.NUMDOCUMENTO,                                                      ');
                   Sql.Add('     (E.LOGRADOURO ||'' ''|| E.NUMERO) AS ENDERECO,                        ');
                   Sql.Add('      E.COMPLEMENTO,                                                       ');
                   Sql.Add('      E.BAIRRO,                                                            ');
                   Sql.Add('      E.CEP,                                                               ');
                   Sql.Add('      ES.CODESTADO,                                                        ');
                   Sql.Add('      P.EMAIL,                                                             ');
                   Sql.Add('      DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,                ');
                   Sql.Add('      TC.TELEFONE,                                                         ');
                   Sql.Add('      TC.DDD,                                                              ');
                   Sql.Add('      O.NUMOC,                                                             ');
                   Sql.Add('      O.IDFORCLI,                                                          ');
                   Sql.Add('      O.OCATENDIDA,                                                        ');
                   Sql.Add('      O.FLGIMPRESSA,                                                       ');
                   Sql.Add('      O.FLGCOMSEMOC,                                                       ');
                   Sql.Add('      O.FLGCOMSEMCOT,                                                      ');
                   Sql.Add('      O.OBSOC,                                                             ');
                   Sql.Add('      O.DATAOC,                                                            ');
                   Sql.Add('      DECODE(O.FLGTIPOFRETE,1,''CIF'',''FOB'') AS FRETE,                   ');
                   Sql.Add('      I.CODARTIGO,                                                         ');
                   Sql.Add('      I.CODMEDIDA,                                                         ');
                   Sql.Add('      DECODE(I.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI) AS DESCRICAO,  ');
                   Sql.Add('      I.VALORUN,                                                           ');
                   Sql.Add('      PE.QTDEENTREGA,                                                      ');
                   Sql.Add('      PE.DATAENTREGA,                                                      ');
                   Sql.Add('      PE.PRAZOENTREGA,                                                     ');
                   Sql.Add('      IMP.TOTIMP,                                                          ');
                   Sql.Add('      TOT.TOTITEM,                                                         ');
                   Sql.Add('      (I.VALORUN*PE.QTDEENTREGA) AS VALTOTITEM,                            ');
                   Sql.Add('      (DECODE(IMP.TOTIMP,NULL,0,IMP.TOTIMP)+TOT.TOTITEM) AS TOTOC,         ');
                   Sql.Add('      PR.DESCRCOMPL,                                                       ');
                   Sql.Add('      I.OBSITEMOC,                                                         ');
                   Sql.Add('      O.CONTATO                                                            ');
                   Sql.Add('FROM                                                                       ');
                   Sql.Add('     PESSOA P,                                                             ');
                   Sql.Add('     ENDPESS E,                                                            ');
                   Sql.Add('     CIDADES C,                                                            ');
                   Sql.Add('     ESTADO  ES,                                                           ');
                   Sql.Add('     (                                                                     ');
                   Sql.Add('      SELECT TP.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD            ');
                   Sql.Add('      FROM  TELENDPESS  TP,                                                ');
                   Sql.Add('           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE               ');
                   Sql.Add('            FROM TELENDPESS                                                ');
                   Sql.Add('            WHERE (TIPO LIKE ''%C%'')                                      ');
                   Sql.Add('            GROUP BY IDENDERECO) C                                         ');
                   Sql.Add('      WHERE (TP.IDENDERECO = C.IDENDERECO) AND                             ');
                   Sql.Add('            (TP.IDTELEFONE = C.IDTELEFONE)                                 ');
                   Sql.Add('      ) TC,                                                                ');
                   Sql.Add('      ITEMOC I,                                                            ');
                   Sql.Add('      OC O,                                                                ');
                   Sql.Add('      ARTIGO A,                                                            ');
                   Sql.Add('      PRODUTO PR,                                                          ');
                   Sql.Add('      PRODVARI PV,                                                         ');
                   Sql.Add('      PRAZOENTREGAOC PE,                                                   ');
                   Sql.Add('      (SELECT I.NUMOC, SUM(I.VALORUN*PE.QTDEENTREGA) AS TOTITEM            ');
                   Sql.Add('       FROM ITEMOC I, PRAZOENTREGAOC PE                                    ');
                   Sql.Add('       WHERE                                                               ');
                   Sql.Add('              ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))');
                   Sql.Add('          AND  (I.IDITEMOC = PE.IDITEMOC)                                  ');
                   Sql.Add('       GROUP BY I.NUMOC) TOT,                                              ');
                   Sql.Add('      ((SELECT AOC.NUMOC,                                                  ');
                   Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AOC.VLRAGREGTOT*-1),AOC.VLRAGREGTOT)) AS TOTIMP ');
                   Sql.Add('        FROM  AGREGTOTOC AOC,                                              ');
                   Sql.Add('              TIPOAGRE T                                                   ');
                   Sql.Add('        WHERE                                                              ');
                   Sql.Add('               (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6'')) ');
                   Sql.Add('           AND (AOC.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                 ');
                   Sql.Add('        GROUP BY AOC.NUMOC)                                                ');
                   Sql.Add('        UNION                                                              ');
                   Sql.Add('       (SELECT I.NUMOC,                                                    ');
                   Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AI.VLRAGREGITEM*-1),AI.VLRAGREGITEM)) AS TOTIMP');
                   Sql.Add('        FROM  AGREGITEMOC AI,                                              ');
                   Sql.Add('              TIPOAGRE T,                                                  ');
                   Sql.Add('              ITEMOC I                                                     ');
                   Sql.Add('        WHERE                                                              ');
                   Sql.Add('              (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))');
                   Sql.Add('          AND ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))');
                   Sql.Add('          AND (I.IDITEMOC = AI.IDITEMOC)                                   ');
                   Sql.Add('          AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                   ');
                   Sql.Add('        GROUP BY I.NUMOC)) IMP                                             ');
                   Sql.Add('WHERE (O.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +')');
             If Trim(dblcOC.Text) <> '' Then
                Sql.Add('  AND (O.NUMOC = '+dblcOC.LookupValue+') ')
             Else
                Begin
                   If edNumI.Value > 0 Then
                      Sql.Add('   AND (O.NUMOC >= '+edNumI.Text+') ');
                   If edNumF.Value > 0 Then
                      Sql.Add('   AND (O.NUMOC <= '+edNumF.Text+') ');
                   //
                   If Not ChkAtend.Checked Then
                      Sql.Add('   AND (O.OCATENDIDA = ''F'')     ')
                   Else
                   If Not ChkAtend.Checked Then
                      Sql.Add('   AND (O.OCATENDIDA = ''T'')     ');
                   If RgImp.ItemIndex = 0 Then
                      Sql.Add('   AND (O.FLGIMPRESSA = ''F'' )   ')
                   Else
                    If RgImp.ItemIndex = 0 Then
                      Sql.Add('   AND (O.FLGIMPRESSA = ''T'' )   ');
                End;
                   Sql.Add('  AND ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))        ');
                   Sql.Add('  AND (O.NUMOC = I.NUMOC)                   ');
                   Sql.Add('  AND (P.IDPESSOA = O.IDFORCLI)             ');
                   Sql.Add('  AND (I.CODARTIGO = A.CODARTIGO)           ');
                   Sql.Add('  AND (A.CODPRODUTO = PR.CODPRODUTO)        ');
                   Sql.Add('  AND (I.IDPRODVARI = PV.IDPRODVARI(+))     ');
                   Sql.Add('  AND (PE.IDITEMOC = I.IDITEMOC)            ');
                   Sql.Add('  AND (IMP.NUMOC(+) = O.NUMOC)              ');
                   Sql.Add('  AND (TOT.NUMOC = O.NUMOC)                 ');
                   Sql.Add('  AND (P.IDPESSOA       = O.IDFORCLI)       ');
                   Sql.Add('  AND (E.IDPESSOA(+)    = P.IDPESSOA)       ');
                   Sql.Add('  AND (E.IDENDERECO(+)  = P.IDENDCOMERCIAL) ');
                   Sql.Add('  AND (E.IDCIDADES      = C.IDCIDADES(+))   ');
                   Sql.Add('  AND (ES.IDESTADO(+)   = C.IDESTADO)       ');
                   Sql.Add('  AND (TC.IDENDERECO(+) = E.IDENDERECO)     ');
                   Sql.Add('ORDER BY O.NUMOC, I.IDITEMOC                ');
                   Open;
                End;
          End;
      1 : Begin
//---------------------------------------------------------------------------------------------------------------------------------------
//  ORDEM DE COMPRAS MODELO 1
//---------------------------------------------------------------------------------------------------------------------------------------
             DtmRelCompras.qryImagens.Close;
             DtmRelCompras.qryImagens.Params[0].AsInteger := DtmCompras.qryEndCobEntIDIMAGEM.AsInteger;
             DtmRelCompras.qryImagens.Open;
             //
             DtmRelCompras.qryPrazoOC.Close;
             DtmRelCompras.qryAgregOC.Close;
             DtmRelCompras.qryCompOC.Close;
             //
             DtmRelCompras.qryPrazoOC.DataSource := DtmRelCompras.dsOCM1;
             DtmRelCompras.qryAgregOC.DataSource := DtmRelCompras.dsOCM1;
             DtmRelCompras.qryCompOC.DataSource  := DtmRelCompras.dsOCM1;
             //
             DtmRelCompras.qryPrazoOC.Open;
             DtmRelCompras.qryAgregOC.Open;
             DtmRelCompras.qryCompOC.Open;
             //
             DtmRelCompras.LbEndEntM1.Caption    := Trim(DtmCompras.qryEndCobEntENDENT.AsString) +' Nº '+Trim(DtmCompras.qryEndCobEntNUMENT.AsString);
             DtmRelCompras.LbCompEntM1.Caption   := DtmCompras.qryEndCobEntCOMPLENT.AsString;
             DtmRelCompras.LbCidadeEntM1.Caption := DtmCompras.qryEndCobEntCIDADEENT.AsString;
             DtmRelCompras.LbBairroEntM1.Caption := DtmCompras.qryEndCobEntBAIRROENT.AsString;
             DtmRelCompras.LbUFEntM1.Caption     := DtmCompras.qryEndCobEntUFENT.AsString;
             //
             DtmRelCompras.LbEndCobM1.Caption    := Trim(DtmCompras.qryEndCobEntENDCOB.AsString) +' Nº '+Trim(DtmCompras.qryEndCobEntNUMCOB.AsString);
             DtmRelCompras.LbCompCobM1.Caption   := DtmCompras.qryEndCobEntCOMPLCOB.AsString;
             DtmRelCompras.LbCidadeCobM1.Caption := DtmCompras.qryEndCobEntCIDADECOB.AsString;
             DtmRelCompras.LbBairroCobM1.Caption := DtmCompras.qryEndCobEntBAIRROCOB.AsString;
             DtmRelCompras.LbUFCobM1.Caption     := DtmCompras.qryEndCobEntUFCOB.AsString;
             //
             if Sistema.idiomaAtivo = 1 Then
                Begin // idioma Português
                   DtmRelCompras.LbCepEntM1.Caption    := FormatMaskText('00000-999;0;',DtmCompras.qryEndCobEntCEPENT.AsString);
                   DtmRelCompras.LbCepCobM1.Caption    := FormatMaskText('00000-999;0;',DtmCompras.qryEndCobEntCEPCOB.AsString);
                   DtmRelCompras.LbNumDocEntM1.Caption := FormatMaskText('00.000.000/0000.000;0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
                   DtmRelCompras.LbNumDocCobM1.Caption := FormatMaskText('00.000.000/0000.000;0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
                End
             Else
                Begin  // Outros Idiomas
                   DtmRelCompras.LbCepEntM1.Caption    := DtmCompras.qryEndCobEntCEPENT.AsString;
                   If DtmCompras.qryEndCobEntMASCARA.IsNull Then
                      Begin
                         DtmRelCompras.LbNumDocEntM1.Caption := DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString;
                         DtmRelCompras.LbNumDocCobM1.Caption := DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString;
                      End
                   Else
                      Begin
                         DtmRelCompras.LbNumDocEntM1.Caption  := FormatMaskText( Trim(DtmCompras.qryEndCobEntMASCARA.AsString) + ';0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
                         DtmRelCompras.LbNumDocCobM1.Caption  := FormatMaskText( Trim(DtmCompras.qryEndCobEntMASCARA.AsString) + ';0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
                      End;
                   DtmRelCompras.LbCepCobM1.Caption    := DtmCompras.qryEndCobEntCEPCOB.AsString;
                End;
             //
             With DtmRelCompras.qryOCM1 Do
                Begin
                   Close;
                   Sql.Clear;
                   Sql.Add('SELECT  /*+ rule */                                                        ');
                   Sql.Add('      P.RAZAOSOCIAL,                                                       ');
                   Sql.Add('      P.NOME,                                                              ');
                   Sql.Add('      P.NUMDOCUMENTO,                                                      ');
                   Sql.Add('     (E.LOGRADOURO ||'' ''|| E.NUMERO) AS ENDERECO,                        ');
                   Sql.Add('      E.COMPLEMENTO,                                                       ');
                   Sql.Add('      E.BAIRRO,                                                            ');
                   Sql.Add('      E.CEP,                                                               ');
                   Sql.Add('      ES.CODESTADO,                                                        ');
                   Sql.Add('      P.EMAIL,                                                             ');
                   Sql.Add('      DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,                ');
                   Sql.Add('      TC.TELEFONE,                                                         ');
                   Sql.Add('      TC.DDD,                                                              ');
                   Sql.Add('      FC.FAX,                                                              ');
                   Sql.Add('      FC.DDDFAX,                                                           ');
                   Sql.Add('      O.NUMOC,                                                             ');
                   Sql.Add('      O.IDFORCLI,                                                          ');
                   Sql.Add('      O.OCATENDIDA,                                                        ');
                   Sql.Add('      O.FLGIMPRESSA,                                                       ');
                   Sql.Add('      DECODE(O.FLGIMPRESSA,''T'',''2º via'',''1º via'') AS VIA,            ');
                   Sql.Add('      O.FLGCOMSEMOC,                                                       ');
                   Sql.Add('      O.FLGCOMSEMCOT,                                                      ');
                   Sql.Add('      O.OBSOC,                                                             ');
                   Sql.Add('      O.DATAOC,                                                            ');
                   Sql.Add('      DECODE(O.FLGTIPOFRETE,1,''CIF'',''FOB'') AS FRETE,                   ');
                   Sql.Add('      I.CODARTIGO,                                                         ');
                   Sql.Add('      I.CODMEDIDA,                                                         ');
                   Sql.Add('      DECODE(I.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI) AS DESCRICAO,  ');
                   Sql.Add('      I.VALORUN,                                                           ');
                   Sql.Add('      PE.QTDEENTREGA,                                                      ');
                   Sql.Add('      PE.DATAENTREGA,                                                      ');
                   Sql.Add('      PE.PRAZOENTREGA,                                                     ');
                   Sql.Add('      IMP.TOTIMP,                                                          ');
                   Sql.Add('      DECODE(IPI.TOTIPI,NULL,0,IPI.TOTIPI) AS TOTIPI,                      ');
                   Sql.Add('      TOT.TOTITEM,                                                         ');
                   Sql.Add('      (I.VALORUN*PE.QTDEENTREGA) AS VALTOTITEM,                            ');
                   Sql.Add('      (NVL(IPI.TOTIPI,0)+ NVL(IMP.TOTIMP,0) + (I.VALORUN*PE.QTDEENTREGA)) AS TOTOC,');
                   Sql.Add('      PR.DESCRCOMPL,                                                       ');
                   Sql.Add('      I.OBSITEMOC,                                                         ');
                   Sql.Add('      M.MOEDESC,                                                           ');
                   Sql.Add('      O.CONTATO                                                            ');
                   Sql.Add('FROM                                                                       ');
                   Sql.Add('     PESSOA P,                                                             ');
                   Sql.Add('     ENDPESS E,                                                            ');
                   Sql.Add('     CIDADES C,                                                            ');
                   Sql.Add('     ESTADO  ES,                                                           ');
                   Sql.Add('     (                                                                     ');
                   Sql.Add('      SELECT TP.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD            ');
                   Sql.Add('      FROM  TELENDPESS  TP,                                                ');
                   Sql.Add('           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE               ');
                   Sql.Add('            FROM TELENDPESS                                                ');
                   Sql.Add('            WHERE (TIPO LIKE ''%C%'')                                      ');
                   Sql.Add('            GROUP BY IDENDERECO) C                                         ');
                   Sql.Add('      WHERE (TP.IDENDERECO = C.IDENDERECO) AND                             ');
                   Sql.Add('            (TP.IDTELEFONE = C.IDTELEFONE)                                 ');
                   Sql.Add('      ) TC,                                                                ');
                   Sql.Add('      (SELECT TP.IDENDERECO, TP.NUMERO AS FAX,TP.DDI AS DDIFAX ,TP.DDD AS DDDFAX  ');
                   Sql.Add('      FROM  TELENDPESS  TP,                                                ');
                   Sql.Add('           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE               ');
                   Sql.Add('            FROM TELENDPESS                                                ');
                   Sql.Add('            WHERE (TIPO LIKE ''%F%'')                                      ');
                   Sql.Add('            GROUP BY IDENDERECO) C                                         ');
                   Sql.Add('      WHERE (TP.IDENDERECO = C.IDENDERECO) AND                             ');
                   Sql.Add('            (TP.IDTELEFONE = C.IDTELEFONE)                                 ');
                   Sql.Add('      ) FC,                                                                ');
                   Sql.Add('      COTACOES CO,                                                         ');
                   Sql.Add('      ITEMOC I,                                                            ');
                   Sql.Add('      OC O,                                                                ');
                   Sql.Add('      ARTIGO A,                                                            ');
                   Sql.Add('      PRODUTO PR,                                                          ');
                   Sql.Add('      PRODVARI PV,                                                         ');
                   Sql.Add('      PRAZOENTREGAOC PE,                                                   ');
                   Sql.Add('      MOEDA M,                                                             ');
                   Sql.Add('      (SELECT I.NUMOC, I.IDITEMOC, SUM(I.VALORUN*PE.QTDEENTREGA) AS TOTITEM            ');
                   Sql.Add('       FROM ITEMOC I, PRAZOENTREGAOC PE                                    ');
                   Sql.Add('       WHERE                                                               ');
                   Sql.Add('              ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))');
                   Sql.Add('          AND  (I.IDITEMOC = PE.IDITEMOC)                                  ');
                   Sql.Add('       GROUP BY I.NUMOC,I.IDITEMOC) TOT,                                              ');
                   Sql.Add('       (SELECT I.NUMOC, I.IDITEMOC,                                                   ');
                   Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AI.VLRAGREGITEM*-1),AI.VLRAGREGITEM)) AS TOTIMP');
                   Sql.Add('        FROM  AGREGITEMOC AI,                                              ');
                   Sql.Add('              TIPOAGRE T,                                                  ');
                   Sql.Add('              ITEMOC I                                                     ');
                   Sql.Add('        WHERE                                                              ');
                   Sql.Add('              (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))');
                   Sql.Add('           AND ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))');
                   Sql.Add('           AND (UPPER(T.DESCCUSTAGREG) NOT LIKE ''IPI''||''%'')            ');
                   Sql.Add('           AND (I.IDITEMOC = AI.IDITEMOC)                                  ');
                   Sql.Add('           AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                  ');
                   Sql.Add('        GROUP BY I.NUMOC,I.IDITEMOC) IMP,                                  ');
                   Sql.Add('       (SELECT I.NUMOC,I.IDITEMOC,                                         ');
                   Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AI.VLRAGREGITEM*-1),AI.VLRAGREGITEM)) AS TOTIPI');
                   Sql.Add('        FROM  AGREGITEMOC AI,                                              ');
                   Sql.Add('              TIPOAGRE T,                                                  ');
                   Sql.Add('              ITEMOC I                                                     ');
                   Sql.Add('        WHERE                                                              ');
                   Sql.Add('              (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))');
                   Sql.Add('          AND (UPPER(T.DESCCUSTAGREG) LIKE ''IPI''||''%'')                 ');
                   Sql.Add('          AND ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))');
                   Sql.Add('          AND (I.IDITEMOC = AI.IDITEMOC)                                   ');
                   Sql.Add('          AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                   ');
                   Sql.Add('        GROUP BY I.NUMOC,I.IDITEMOC) IPI                                             ');
                   Sql.Add('WHERE (O.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +')');
             If Trim(dblcOC.Text) <> '' Then
                Sql.Add('  AND (O.NUMOC = '+dblcOC.LookupValue+') ')
             Else
                Begin
                   If edNumI.Value > 0 Then
                      Sql.Add('   AND (O.NUMOC >= '+edNumI.Text+') ');
                   If edNumF.Value > 0 Then
                      Sql.Add('   AND (O.NUMOC <= '+edNumF.Text+') ');
                   //
                   If Not ChkAtend.Checked Then
                      Sql.Add('   AND (O.OCATENDIDA = ''F'')     ')
                   Else
                   If Not ChkAtend.Checked Then
                      Sql.Add('   AND (O.OCATENDIDA = ''T'')     ');
                   If RgImp.ItemIndex = 0 Then
                      Sql.Add('   AND (O.FLGIMPRESSA = ''F'' )   ')
                   Else
                    If RgImp.ItemIndex = 0 Then
                      Sql.Add('   AND (O.FLGIMPRESSA = ''T'' )   ');
                End;
                   Sql.Add('  AND ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))        ');
                   Sql.Add('  AND (O.NUMOC = I.NUMOC)                     ');
                   Sql.Add('  AND (I.IDITEMOC = CO.IDITEMOC(+))           ');
                   Sql.Add('  AND (CO.MOECODIGO = M.MOECODIGO(+))         ');
                   Sql.Add('  AND (P.IDPESSOA = O.IDFORCLI)               ');
                   Sql.Add('  AND (I.CODARTIGO = A.CODARTIGO)             ');
                   Sql.Add('  AND (A.CODPRODUTO = PR.CODPRODUTO)          ');
                   Sql.Add('  AND (I.IDPRODVARI = PV.IDPRODVARI(+))       ');
                   Sql.Add('  AND (PE.IDITEMOC = I.IDITEMOC)              ');
                   Sql.Add('  AND (IMP.NUMOC(+) = I.NUMOC)                ');
                   Sql.Add('  AND (IPI.NUMOC(+) = I.NUMOC)                ');
                   Sql.Add('  AND (IMP.IDITEMOC(+) = I.IDITEMOC)          ');
                   Sql.Add('  AND (IPI.IDITEMOC(+) = I.IDITEMOC)          ');
                   Sql.Add('  AND (TOT.NUMOC = O.NUMOC)                   ');
                   Sql.Add('  AND (TOT.IDITEMOC = I.IDITEMOC)             ');
                   Sql.Add('  AND (P.IDPESSOA       = O.IDFORCLI)         ');
                   Sql.Add('  AND (E.IDPESSOA(+)    = P.IDPESSOA)         ');
                   Sql.Add('  AND (E.IDENDERECO(+)  = P.IDENDCOMERCIAL)   ');
                   Sql.Add('  AND (E.IDCIDADES      = C.IDCIDADES(+))     ');
                   Sql.Add('  AND (ES.IDESTADO(+)   = C.IDESTADO)         ');
                   Sql.Add('  AND (TC.IDENDERECO(+) = E.IDENDERECO)       ');
                   Sql.Add('  AND (FC.IDENDERECO(+) = E.IDENDERECO)       ');
                   Sql.Add('ORDER BY O.NUMOC, I.IDITEMOC                  ');
                   Open;
                End;
          End;
      2 : Begin
//---------------------------------------------------------------------------------------------------------------------------------------
//  ORDEM DE COMPRAS MODELO 2
//---------------------------------------------------------------------------------------------------------------------------------------
             DtmRelCompras.qryImagens.Close;
             DtmRelCompras.qryImagens.Params[0].AsInteger := DtmCompras.qryEndCobEntIDIMAGEM.AsInteger;
             DtmRelCompras.qryImagens.Open;
             //
             DtmRelCompras.qryPrazoOC.Close;
             DtmRelCompras.qryAgregOC.Close;
             DtmRelCompras.qryCompOC.Close;
             //
             DtmRelCompras.qryPrazoOC.DataSource := DtmRelCompras.dsOCM2;
             DtmRelCompras.qryAgregOC.DataSource := DtmRelCompras.dsOCM2;
             DtmRelCompras.qryCompOC.DataSource  := DtmRelCompras.dsOCM2;
             //
             DtmRelCompras.qryPrazoOC.Open;
             DtmRelCompras.qryAgregOC.Open;
             DtmRelCompras.qryCompOC.Open;
             //
             If DtmCompras.qryEndCobEntMASCARA.IsNull Then
                DtmRelCompras.LbNumDocEntM2.Caption  := DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString
             Else
                DtmRelCompras.LbNumDocEntM2.Caption  := FormatMaskText( Trim(DtmCompras.qryEndCobEntMASCARA.AsString) + ';0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);

             DtmRelCompras.LbEndEntM2.Caption     := Trim(DtmCompras.qryEndCobEntENDENT.AsString) +' Nº '+Trim(DtmCompras.qryEndCobEntNUMENT.AsString);
             DtmRelCompras.LbCidadeEntM2.Caption  := DtmCompras.qryEndCobEntCIDADEENT.AsString;
             DtmRelCompras.LbCidadeEnt2M2.Caption := DtmCompras.qryEndCobEntCIDADEENT.AsString;
             DtmRelCompras.LbBairroEntM2.Caption  := DtmCompras.qryEndCobEntBAIRROENT.AsString;
             DtmRelCompras.LbUFEntM2.Caption      := DtmCompras.qryEndCobEntUFENT.AsString;

             If Sistema.IdiomaAtivo = 1 Then
               DtmRelCompras.LbCepEntM2.Caption   := FormatMaskText('00000-999;0;',DtmCompras.qryEndCobEntCEPENT.AsString)
             Else
               DtmRelCompras.LbCepEntM2.Caption   := DtmCompras.qryEndCobEntCEPENT.AsString;

             DtmRelCompras.LbDDDEntM2.Caption     := '('+DtmCompras.qryEndCobEntDDDENT.AsString+')';
             DtmRelCompras.LbDDDFaxEntM2.Caption  := '('+DtmCompras.qryEndCobEntDDDFAXENT.AsString+')';
             DtmRelCompras.LbTelEntM2.Caption     := FormatMaskText('0000-0000;0;',DtmCompras.qryEndCobEntTELENT.AsString);
             DtmRelCompras.LbFaxEntM2.Caption     := FormatMaskText('0000-0000;0;',DtmCompras.qryEndCobEntFAXENT.AsString);
             //
             DtmRelCompras.LbAssinat1.Caption  := Modulo.sAssinatura1;
             DtmRelCompras.LbAssinat2.Caption  := Modulo.sAssinatura2;
             DtmRelCompras.LbAssinat3.Caption  := Modulo.sAssinatura3;
             //
             With DtmRelCompras.qryOCM2 Do
                Begin
                   Close;
                   Sql.Clear;
                   Sql.Add('SELECT  /*+ rule */                                                        ');
                   Sql.Add('      CT.MOECODIGO,                                                        ');
                   Sql.Add('      P.RAZAOSOCIAL,                                                       ');
                   Sql.Add('      P.NOME,                                                              ');
                   Sql.Add('      P.NUMDOCUMENTO,                                                      ');
                   Sql.Add('     (E.LOGRADOURO ||'' ''|| E.NUMERO) AS ENDERECO,                        ');
                   Sql.Add('      E.COMPLEMENTO,                                                       ');
                   Sql.Add('      E.BAIRRO,                                                            ');
                   Sql.Add('      E.CEP,                                                               ');
                   Sql.Add('      ES.CODESTADO,                                                        ');
                   Sql.Add('      P.EMAIL,                                                             ');
                   Sql.Add('      DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,                ');
                   Sql.Add('      TC.TELEFONE,                                                         ');
                   Sql.Add('      TC.DDD,                                                              ');
                   Sql.Add('      FC.FAX,                                                              ');
                   Sql.Add('      FC.DDDFAX,                                                           ');
                   Sql.Add('      O.NUMOC,                                                             ');
                   Sql.Add('      O.IDFORCLI,                                                          ');
                   Sql.Add('      O.OCATENDIDA,                                                        ');
                   Sql.Add('      O.FLGIMPRESSA,                                                       ');
                   Sql.Add('      DECODE(O.FLGIMPRESSA,''T'',''2º via'',''1º via'') AS VIA,            ');
                   Sql.Add('      O.FLGCOMSEMOC,                                                       ');
                   Sql.Add('      O.FLGCOMSEMCOT,                                                      ');
                   Sql.Add('      O.OBSOC,                                                             ');
                   Sql.Add('      O.DATAOC,                                                            ');
                   Sql.Add('      DECODE(O.FLGTIPOFRETE,1,''CIF'',''FOB'') AS FRETE,                   ');
                   Sql.Add('      I.CODARTIGO,                                                         ');
                   Sql.Add('      I.CODMEDIDA,                                                         ');
                   Sql.Add('      DECODE(I.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI) AS DESCRICAO,  ');
                   Sql.Add('      CT.PRECO AS VALORUN,                                                 ');
                   Sql.Add('      PE.QTDEENTREGA,                                                      ');
                   Sql.Add('      PE.DATAENTREGA,                                                      ');
                   Sql.Add('      PE.PRAZOENTREGA,                                                     ');
                   Sql.Add('      IMP.TOTIMP,                                                          ');
                   Sql.Add('      IPI.TOTIPI,                                                          ');
                   Sql.Add('      (CT.PRECO*PE.QTDEENTREGA) AS VALTOTITEM,                             ');
                   Sql.Add('      (CT.PRECO*PE.QTDEENTREGA) AS TOTITEM,                                ');
                   Sql.Add('      (NVL(IPI.TOTIPI,0)+ NVL(IMP.TOTIMP,0) + (CT.PRECO*PE.QTDEENTREGA)) AS TOTOC,');
                   Sql.Add('      PR.DESCRCOMPL,                                                       ');
                   Sql.Add('      I.OBSITEMOC,                                                         ');
                   Sql.Add('      O.CONTATO                                                            ');
                   Sql.Add('FROM                                                                       ');
                   Sql.Add('     PESSOA P,                                                             ');
                   Sql.Add('     ENDPESS E,                                                            ');
                   Sql.Add('     CIDADES C,                                                            ');
                   Sql.Add('     ESTADO  ES,                                                           ');
                   Sql.Add('     (                                                                     ');
                   Sql.Add('      SELECT TP.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD            ');
                   Sql.Add('      FROM  TELENDPESS  TP,                                                ');
                   Sql.Add('           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE               ');
                   Sql.Add('            FROM TELENDPESS                                                ');
                   Sql.Add('            WHERE (TIPO LIKE ''%C%'')                                      ');
                   Sql.Add('            GROUP BY IDENDERECO) C                                         ');
                   Sql.Add('      WHERE (TP.IDENDERECO = C.IDENDERECO) AND                             ');
                   Sql.Add('            (TP.IDTELEFONE = C.IDTELEFONE)                                 ');
                   Sql.Add('      ) TC,                                                                ');
                   Sql.Add('      (SELECT TP.IDENDERECO, TP.NUMERO AS FAX,TP.DDI AS DDIFAX ,TP.DDD AS DDDFAX  ');
                   Sql.Add('      FROM  TELENDPESS  TP,                                                ');
                   Sql.Add('           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE               ');
                   Sql.Add('            FROM TELENDPESS                                                ');
                   Sql.Add('            WHERE (TIPO LIKE ''%F%'')                                      ');
                   Sql.Add('            GROUP BY IDENDERECO) C                                         ');
                   Sql.Add('      WHERE (TP.IDENDERECO = C.IDENDERECO) AND                             ');
                   Sql.Add('            (TP.IDTELEFONE = C.IDTELEFONE)                                 ');
                   Sql.Add('      ) FC,                                                                ');
                   Sql.Add('      ITEMOC I,                                                            ');
                   Sql.Add('      OC O,                                                                ');
                   Sql.Add('      ARTIGO A,                                                            ');
                   Sql.Add('      PRODUTO PR,                                                          ');
                   Sql.Add('      PRODVARI PV,                                                         ');
                   Sql.Add('      PRAZOENTREGAOC PE,                                                   ');
                   Sql.Add('      COTACOES CT,                                                   ');
                   Sql.Add('      (SELECT I.NUMOC,I.IDITEMOC, SUM(I.VALORUN*PE.QTDEENTREGA) AS TOTITEM            ');
                   Sql.Add('       FROM ITEMOC I, PRAZOENTREGAOC PE                                    ');
                   Sql.Add('       WHERE                                                               ');
                   Sql.Add('              ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))');
                   Sql.Add('          AND  (I.IDITEMOC = PE.IDITEMOC)                                  ');
                   Sql.Add('       GROUP BY I.NUMOC,I.IDITEMOC) TOT,                                              ');
                   Sql.Add('       (SELECT I.NUMOC,I.IDITEMOC,                                                    ');
                   Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AI.VLRAGREGITEM*-1),AI.VLRAGREGITEM)) AS TOTIMP');
                   Sql.Add('        FROM  AGREGITEMOC AI,                                              ');
                   Sql.Add('              TIPOAGRE T,                                                  ');
                   Sql.Add('              ITEMOC I                                                     ');
                   Sql.Add('        WHERE                                                              ');
                   Sql.Add('              (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))');
                   Sql.Add('           AND ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))');
                   Sql.Add('           AND (UPPER(T.DESCCUSTAGREG) NOT LIKE ''IPI''||''%'')            ');
                   Sql.Add('           AND (I.IDITEMOC = AI.IDITEMOC)                                  ');
                   Sql.Add('           AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                  ');
                   Sql.Add('        GROUP BY I.NUMOC,I.IDITEMOC) IMP,                                  ');
                   Sql.Add('       (SELECT I.NUMOC,I.IDITEMOC,                                         ');
                   Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AI.VLRAGREGITEM*-1),AI.VLRAGREGITEM)) AS TOTIPI');
                   Sql.Add('        FROM  AGREGITEMOC AI,                                              ');
                   Sql.Add('              TIPOAGRE T,                                                  ');
                   Sql.Add('              ITEMOC I                                                     ');
                   Sql.Add('        WHERE                                                              ');
                   Sql.Add('              (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))');
                   Sql.Add('          AND (UPPER(T.DESCCUSTAGREG) LIKE ''IPI''||''%'')                 ');
                   Sql.Add('          AND ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))');
                   Sql.Add('          AND (I.IDITEMOC = AI.IDITEMOC)                                   ');
                   Sql.Add('          AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                   ');
                   Sql.Add('        GROUP BY I.NUMOC,I.IDITEMOC) IPI                                             ');
                   Sql.Add('WHERE (O.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +')');
             If Trim(dblcOC.Text) <> '' Then
                Sql.Add('   AND (O.NUMOC = '+dblcOC.LookupValue+') ')
             Else
                Begin
                   If edNumI.Value > 0 Then
                      Sql.Add('   AND (O.NUMOC >= '+edNumI.Text+') ');
                   If edNumF.Value > 0 Then
                      Sql.Add('   AND (O.NUMOC <= '+edNumF.Text+') ');
                   //
                   If Not ChkAtend.Checked Then
                      Sql.Add('   AND (O.OCATENDIDA = ''F'') ')
                   Else
                   If Not ChkAtend.Checked Then
                      Sql.Add('   AND (O.OCATENDIDA = ''T'') ');
                   If RgImp.ItemIndex = 0 Then
                      Sql.Add('   AND (O.FLGIMPRESSA = ''F'' )   ')
                   Else
                    If RgImp.ItemIndex = 0 Then
                      Sql.Add('   AND (O.FLGIMPRESSA = ''T'' )   ');
                End;
                   Sql.Add('  AND ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))        ');
                   Sql.Add('  AND (O.NUMOC = I.NUMOC)                   ');
                   Sql.Add('  AND (P.IDPESSOA = O.IDFORCLI)             ');
                   Sql.Add('  AND (I.CODARTIGO = A.CODARTIGO)           ');
                   Sql.Add('  AND (I.IDITEMOC = CT.IDITEMOC)            ');
                   Sql.Add('  AND (A.CODPRODUTO = PR.CODPRODUTO)        ');
                   Sql.Add('  AND (I.IDPRODVARI = PV.IDPRODVARI(+))     ');
                   Sql.Add('  AND (PE.IDITEMOC = I.IDITEMOC)            ');
                   Sql.Add('  AND (IMP.NUMOC(+) = I.NUMOC)              ');
                   Sql.Add('  AND (IPI.NUMOC(+) = I.NUMOC)              ');
                   Sql.Add('  AND (IMP.IDITEMOC(+) = I.IDITEMOC)        ');
                   Sql.Add('  AND (IPI.IDITEMOC(+) = I.IDITEMOC)        ');
                   Sql.Add('  AND (TOT.NUMOC = O.NUMOC)                 ');
                   Sql.Add('  AND (TOT.IDITEMOC = I.IDITEMOC)           ');
                   Sql.Add('  AND (P.IDPESSOA       = O.IDFORCLI)       ');
                   Sql.Add('  AND (E.IDPESSOA(+)    = P.IDPESSOA)       ');
                   Sql.Add('  AND (E.IDENDERECO(+)  = P.IDENDCOMERCIAL) ');
                   Sql.Add('  AND (E.IDCIDADES      = C.IDCIDADES(+))   ');
                   Sql.Add('  AND (ES.IDESTADO(+)   = C.IDESTADO)       ');
                   Sql.Add('  AND (TC.IDENDERECO(+) = E.IDENDERECO)     ');
                   Sql.Add('  AND (FC.IDENDERECO(+) = E.IDENDERECO)     ');
                   Sql.Add('ORDER BY O.NUMOC, I.IDITEMOC                ');
                   Open;
                   DtmRelCompras.iCodMoeda := DtmRelCompras.qryOCM2MOECODIGO.AsInteger;
                End;
          End;
  End; 

End;

procedure TFrmParamImpOC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazRel;
end;

procedure TFrmParamImpOC.dblcOCCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
    Begin
       edNumI.Value := 0;
       edNumF.Value := 0;
    End;
end;

end.



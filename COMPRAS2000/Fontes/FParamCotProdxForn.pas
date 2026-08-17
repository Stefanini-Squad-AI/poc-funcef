unit FParamCotProdxForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery;
Const
     MaxForn = 6;
type
  TFrmParamCotProdxForn = class(TfrmOkCancelar)
    qryProc: TwwQuery;
    qryProcCODPROCESSO: TFloatField;
    dblcProc: TwwDBLookupCombo;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    qryFornCot: TwwQuery;
    qryFornCotIDFORCLI: TFloatField;
    qryFornCotPROPOSTA: TFloatField;
    qryFornCotRAZAOSOCIAL: TStringField;
    qryFornCotVALOR: TFloatField;
    qryCotacao: TwwQuery;
    updCotacao: TUpdateSQL;
    qryCotacaoIDPROCXART: TFloatField;
    qryCotacaoIDFORCLI: TFloatField;
    qryCotacaoPROPOSTA: TFloatField;
    qryCotacaoVALTOTPRE: TFloatField;
    qryCotacaoSTATUS: TStringField;
    qryCotacaoMENORVALOR: TFloatField;
    qryCotacaoMENORVALORF: TFloatField;
    qryCotacaoVALTOTPREF: TFloatField;
    qryCotacaoPERCMIXIDEAL: TFloatField;
    qryCotacaoPOS: TFloatField;
    qryCotacaoPRECOAVALORPRES: TFloatField;
    qryFornCotTELEFONE: TStringField;
    qryCotacaoTELEFONE: TStringField;
    qryCotacaoCONDPAG: TStringField;
    qryCotacaoPRAZOENT: TStringField;
    RgTipo: TRadioGroup;
    qryCotacaoVALTOT: TFloatField;
    qryCotacaoVALUNIT: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    iNumForn : LongInt;
    Procedure FazRel;
    Function  CalcPrazo(Tipo : char; IdForCli, CodProcesso, Proposta : LongInt ) : String;
    Procedure SetValor;
  public
    { Public declarations }
  end;

var
  FrmParamCotProdxForn: TFrmParamCotProdxForn;

implementation

{$R *.DFM}
Uses DRelCompras, uModulo, uMensErro, uDataBase,
     dBaseDados, uSistema;

Function  TFrmParamCotProdxForn.CalcPrazo(Tipo : char; IdForCli, CodProcesso, Proposta : LongInt ) : String;
Var
   sSql : String;
   sAux : String;
Begin
   Result := '';
   sSql   := '';
   sSql := sSql + ' SELECT ';
   Case upCase(Tipo) Of
      'P': sSql := sSql + '     PRAZOPGTO AS PRAZO';
      'E': sSql := sSql + '     PRAZOENT  AS PRAZO';
   End;
   sSql := sSql + ' FROM ';
   Case upCase(Tipo) Of
      'P': sSql := sSql + '     PRAZOPGTO ';
      'E': sSql := sSql + '     PRAZOENTREGA ';
   End;
   sSql := sSql + ' WHERE ';
   sSql := sSql + '       (IDFORCLI = '+IntToStr(IdForCli)+') ';
   sSql := sSql + '   AND (CODPROCESSO = '+IntToStr(CodProcesso)+') ';
   sSql := sSql + '   AND (PROPOSTA   = '+IntToStr(Proposta)+') ';
   sSql := sSql + ' ORDER BY 1 ';
   If  FazQuery(DtmBaseDados.qry, sSql ) Then
      Begin
         sAux := IntToStr(DtmBaseDados.qry.FieldByName('PRAZO').AsInteger);
         Repeat
            DtmBaseDados.qry.Next;
            If ( Not DtmBaseDados.qry.EOF) And (Pos( IntToStr(DtmBaseDados.qry.FieldByName('PRAZO').AsInteger),sAux) = 0) Then
               sAux := sAux +'/'+IntToStr(DtmBaseDados.qry.FieldByName('PRAZO').AsInteger);
         Until DtmBaseDados.qry.EOF;
         Result := sAux;
      End;
End;

procedure TFrmParamCotProdxForn.FormCreate(Sender: TObject);
begin
  inherited;
  qryProc.Open;
end;

Procedure TFrmParamCotProdxForn.SetValor;
Begin
   qryCotacao.Close;
   qryCotacao.Sql.Clear;
   qryCotacao.Sql.Add('SELECT                 ');
   qryCotacao.Sql.Add('     PXA.IDPROCXART,   ');
   qryCotacao.Sql.Add('     C.IDFORCLI,       ');
   qryCotacao.Sql.Add('     C.PROPOSTA,       ');
   Case RgTipo.ItemIndex Of
      0 : qryCotacao.Sql.Add('     (C.PRECOAVALORPRES*C.QTDEFORNECIDA) AS VALTOTPRE,   ');
      1 : qryCotacao.Sql.Add('     (C.PRECO*C.QTDEFORNECIDA) AS VALTOTPRE,   ');
      2 : qryCotacao.Sql.Add('     (C.PRECO) AS VALTOTPRE,   ');
   End;
   qryCotacao.Sql.Add('     (C.PRECO*C.QTDEFORNECIDA) AS VALTOT,                ');
   qryCotacao.Sql.Add('     (C.PRECO) AS VALUNIT,                               ');
   qryCotacao.Sql.Add('     C.STATUS,                                           ');
   qryCotacao.Sql.Add('     C.PRECOAVALORPRES,                                  ');
   qryCotacao.Sql.Add('     MV.MENORVALOR,                                      ');
   qryCotacao.Sql.Add('     TF.MENORVALORF,                                     ');
   qryCotacao.Sql.Add('     TF.VALTOTPREF,                                      ');
   qryCotacao.Sql.Add('     TF.PERCMIXIDEAL,                                    ');
   qryCotacao.Sql.Add('     (0) AS POS,                                         ');
   qryCotacao.Sql.Add('     (''                    '') AS TELEFONE,             ');
   qryCotacao.Sql.Add('     (''                    '') AS CONDPAG,              ');
   qryCotacao.Sql.Add('     (''                    '') AS PRAZOENT              ');
   qryCotacao.Sql.Add('FROM                                                     ');
   qryCotacao.Sql.Add('    COTACOES C,                                          ');
   qryCotacao.Sql.Add('    PROCXART PXA,                                        ');
   qryCotacao.Sql.Add('   (SELECT                                               ');
   qryCotacao.Sql.Add('        C.CODPROCESSO,                                   ');
   qryCotacao.Sql.Add('        C.IDFORCLI,                                      ');
   qryCotacao.Sql.Add('        C.PROPOSTA,                                      ');
   qryCotacao.Sql.Add('        SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)) AS MENORVALORF,   ');
   Case RgTipo.ItemIndex Of
      0 : qryCotacao.Sql.Add('        SUM(DECODE(C.PRECOAVALORPRES,NULL,0,C.PRECOAVALORPRES)*C.QTDEFORNECIDA) AS VALTOTPREF, ');
      1 : qryCotacao.Sql.Add('        SUM(DECODE(C.PRECO,NULL,0,C.PRECO)*C.QTDEFORNECIDA) AS VALTOTPREF, ');
      2 : qryCotacao.Sql.Add('        SUM(DECODE(C.PRECO,NULL,0,C.PRECO)) AS VALTOTPREF, ');
   End;
   Case RgTipo.ItemIndex Of
      0 : qryCotacao.Sql.Add('        DECODE((SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR))),0,0,(((SUM(DECODE(C.PRECOAVALORPRES,NULL,0,C.PRECOAVALORPRES)*C.QTDEFORNECIDA)/SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)))-1)*100)) AS PERCMIXIDEAL ');
      1 : qryCotacao.Sql.Add('        DECODE((SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR))),0,0,(((SUM(DECODE(C.PRECO,NULL,0,C.PRECO)*C.QTDEFORNECIDA)/SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)))-1)*100)) AS PERCMIXIDEAL ');
      2 : qryCotacao.Sql.Add('        DECODE((SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR))),0,0,(((SUM(DECODE(C.PRECO,NULL,0,C.PRECO)*C.QTDEFORNECIDA)/SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)))-1)*100)) AS PERCMIXIDEAL ');
   End;
   qryCotacao.Sql.Add('    FROM                          ');
   qryCotacao.Sql.Add('        COTACOES C,               ');
   qryCotacao.Sql.Add('       (SELECT C.IDPROCXART,      ');
   Case RgTipo.ItemIndex Of
      0 : qryCotacao.Sql.Add('               SUM((C.PRECOAVALORPRES*C.QTDEFORNECIDA))/N.NUMVEN AS MENORVALOR ');
      1 : qryCotacao.Sql.Add('               SUM((C.PRECO*C.QTDEFORNECIDA))/N.NUMVEN AS MENORVALOR ');
      2 : qryCotacao.Sql.Add('               SUM((C.PRECO*C.QTDEFORNECIDA))/N.NUMVEN AS MENORVALOR ');
   End;
   qryCotacao.Sql.Add('        FROM ');
   qryCotacao.Sql.Add('               COTACOES C, ');
   qryCotacao.Sql.Add('              (SELECT C.IDPROCXART, COUNT(*) AS NUMVEN ');
   qryCotacao.Sql.Add('               FROM                                    ');
   qryCotacao.Sql.Add('                    COTACOES C                         ');
   qryCotacao.Sql.Add('               WHERE                                   ');
   qryCotacao.Sql.Add('                  (C.CODPROCESSO  = :pCODPROCESSO) AND ');
   qryCotacao.Sql.Add('                  ((C.STATUS = ''S'') OR (C.STATUS = ''C'')) ');
   qryCotacao.Sql.Add('               GROUP BY IDPROCXART) N                        ');
   qryCotacao.Sql.Add('        WHERE                                                ');
   qryCotacao.Sql.Add('              (C.CODPROCESSO  = :pCODPROCESSO) AND           ');
   qryCotacao.Sql.Add('              ((C.STATUS = ''S'') OR (C.STATUS = ''C'')) AND ');
   qryCotacao.Sql.Add('              (C.IDPROCXART = N.IDPROCXART)                  ');
   qryCotacao.Sql.Add('        GROUP BY C.IDPROCXART, N.NUMVEN) MV                  ');
   qryCotacao.Sql.Add('    WHERE                                                    ');
   qryCotacao.Sql.Add('           (C.CODPROCESSO  = :pCODPROCESSO)                  ');
   qryCotacao.Sql.Add('       AND (C.IDPROCXART = MV.IDPROCXART)                    ');
   qryCotacao.Sql.Add('    GROUP BY C.CODPROCESSO, C.IDFORCLI, C.PROPOSTA) TF,      ');
   qryCotacao.Sql.Add('   (SELECT C.IDPROCXART,                                     ');
   Case RgTipo.ItemIndex Of
      0 : qryCotacao.Sql.Add('           SUM((C.PRECOAVALORPRES*C.QTDEFORNECIDA))/N.NUMVEN AS MENORVALOR ');
      1 : qryCotacao.Sql.Add('           SUM((C.PRECO*C.QTDEFORNECIDA))/N.NUMVEN AS MENORVALOR ');
      2 : qryCotacao.Sql.Add('           SUM((C.PRECO))/N.NUMVEN AS MENORVALOR ');
   End;
   qryCotacao.Sql.Add('    FROM                         ');
   qryCotacao.Sql.Add('           COTACOES C,           ');
   qryCotacao.Sql.Add('           (SELECT C.IDPROCXART, COUNT(*) AS NUMVEN ');
   qryCotacao.Sql.Add('            FROM                                    ');
   qryCotacao.Sql.Add('                 COTACOES C                         ');
   qryCotacao.Sql.Add('            WHERE                                   ');
   qryCotacao.Sql.Add('               (C.CODPROCESSO  = :pCODPROCESSO) AND ');
   qryCotacao.Sql.Add('               ((C.STATUS = ''S'') OR (C.STATUS = ''C'')) ');
   qryCotacao.Sql.Add('            GROUP BY IDPROCXART) N                        ');
   qryCotacao.Sql.Add('    WHERE                                                 ');
   qryCotacao.Sql.Add('         (C.CODPROCESSO  = :pCODPROCESSO) AND             ');
   qryCotacao.Sql.Add('         ((C.STATUS = ''S'') OR (C.STATUS = ''C'')) AND   ');
   qryCotacao.Sql.Add('         (C.IDPROCXART = N.IDPROCXART)                    ');
   qryCotacao.Sql.Add('    GROUP BY C.IDPROCXART, N.NUMVEN                       ');
   qryCotacao.Sql.Add('    ) MV                                                  ');
   qryCotacao.Sql.Add('WHERE                                                     ');
   qryCotacao.Sql.Add('      (C.CODPROCESSO  = :pCODPROCESSO)                    ');
   qryCotacao.Sql.Add('  AND (PXA.CODPROCESSO = C.CODPROCESSO)                   ');
   qryCotacao.Sql.Add('  AND (PXA.IDPROCXART = C.IDPROCXART)                     ');
   qryCotacao.Sql.Add('  AND (C.IDPROCXART = MV.IDPROCXART)                      ');
   qryCotacao.Sql.Add('  AND (C.CODPROCESSO = TF.CODPROCESSO)                    ');
   qryCotacao.Sql.Add('  AND (C.IDFORCLI = TF.IDFORCLI)                          ');
   qryCotacao.Sql.Add('  AND (C.PROPOSTA = TF.PROPOSTA)                          ');
   qryCotacao.Sql.Add('ORDER BY PXA.IDPROCXART, C.IDFORCLI, C.PROPOSTA           ');
End;

Procedure TFrmParamCotProdxForn.FazRel;
Var
   x : Byte;
Begin
  x := 0;
  SetValor;
  qryFornCot.Close;
  qryFornCot.Params[0].AsInteger := StrToInt( dblcProc.LookupValue );
  qryFornCot.Open;
  qryFornCot.First;
  //
  qryCotacao.Close;
  qryCotacao.Params[0].AsInteger := StrToInt( dblcProc.LookupValue );
  qryCotacao.Open;
  DtmRelCompras.memForn.Lines.Clear;
  While (Not qryFornCot.EOF ) And ( x <= MaxForn ) Do
     Begin
        Inc(x);
        DtmRelCompras.memForn.Lines.Add( IntToStr( x )+'  - Prop. Nº '+ IntToStr(qryFornCotPROPOSTA.AsInteger) +'  '+qryFornCotRAZAOSOCIAL.AsString);
        // Marca na query quem são os fornecedores selecionados
        qryCotacao.Filtered := False;
        qryCotacao.Filter   := 'IDFORCLI = '+IntToStr(qryFornCotIDFORCLI.AsInteger);
        qryCotacao.Filtered := True;
        qryCotacao.First;
        While Not qryCotacao.EOF Do
           Begin
              qryCotacao.Edit;
              qryCotacaoPOS.AsInteger     := x;
              qryCotacaoTELEFONE.AsString := qryFornCotTELEFONE.AsString;
              qryCotacaoCONDPAG.AsString  := CalcPrazo('P',qryFornCotIDFORCLI.AsInteger,StrToInt( dblcProc.LookupValue ),qryFornCotPROPOSTA.AsInteger);
              qryCotacaoPRAZOENT.AsString := CalcPrazo('E',qryFornCotIDFORCLI.AsInteger,StrToInt( dblcProc.LookupValue ),qryFornCotPROPOSTA.AsInteger);
              qryCotacao.Post;
              qryCotacao.Next;
           End;
        qryFornCot.Next;
     End;
     iNumForn := x;
     // Atualizando a qurey do Relatório
     qryCotacao.Filtered := False;
     qryCotacao.Filter   := '';
     qryCotacao.First;
     With DtmRelCompras Do
        Begin
              qryCotProdxForn.Close;
              qryCotProdxForn.ParamByName('CODPROCESSO').AsInteger     := StrToInt( dblcProc.LookupValue );
              qryCotProdxForn.ParamByName('CODALMOXARIFADO').AsInteger := Modulo.iCodAlmoxa;
              qryCotProdxForn.ParamByName('IDPESSOA').AsInteger        := Sistema.IdEmpresa;
              qryCotProdxForn.Open;
              qryCotProdxForn.First;
              While Not qryCotProdxForn.EOF Do
                 Begin
                    qryCotacao.Filtered := False;
                    qryCotacao.Filter   := 'IDPROCXART = '+IntToStr(qryCotProdxFornIDPROCXART.AsInteger);
                    qryCotacao.Filtered := True;
                    qryCotacao.First;
                    While Not qryCotacao.EOF Do
                       Begin
                          Case qryCotacaoPOS.AsInteger Of
                              1 : Begin
                                     qryCotProdxForn.Edit;
                                     qryCotProdxFornFORN1.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                                     qryCotProdxFornTELEFONE1.AsString := qryCotacaoTELEFONE.asString;
                                     qryCotProdxFornCONDPAG1.AsString  := qryCotacaoCONDPAG.AsString;
                                     qryCotProdxFornPRAZOENT1.AsString := qryCotacaoPRAZOENT.AsString;
                                     // Percentual em relação ao mix idel (menor valor)
                                     qryCotProdxFornPERCMIX1.AsFloat   := (StrToFloat(Format('%20.2f',[(qryCotProdxFornFORN1.AsFloat/qryCotacaoMENORVALOR.AsFloat)]))-1) * 100;

                                     qryCotProdxFornVALTOT1.AsFloat    := qryCotacaoVALTOT.AsFloat;
                                     qryCotProdxFornVALUNIT1.AsFloat   := qryCotacaoVALUNIT.AsFloat;

                                     qryCotProdxForn.Post;
                                  End;
                              2 : Begin
                                     qryCotProdxForn.Edit;
                                     qryCotProdxFornFORN2.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                                     qryCotProdxFornTELEFONE2.AsString := qryCotacaoTELEFONE.asString;
                                     qryCotProdxFornCONDPAG2.AsString  := qryCotacaoCONDPAG.AsString;
                                     qryCotProdxFornPRAZOENT2.AsString := qryCotacaoPRAZOENT.AsString;
                                     // Percentual em relação ao mix idel (menor valor)
                                     qryCotProdxFornPERCMIX2.AsFloat   := (StrToFloat(Format('%20.2f',[(qryCotProdxFornFORN2.AsFloat/qryCotacaoMENORVALOR.AsFloat)])) -1) * 100;

                                     qryCotProdxFornVALTOT2.AsFloat    := qryCotacaoVALTOT.AsFloat;
                                     qryCotProdxFornVALUNIT2.AsFloat   := qryCotacaoVALUNIT.AsFloat;

                                     qryCotProdxForn.Post;
                                  End;
                              3 : Begin
                                     qryCotProdxForn.Edit;
                                     qryCotProdxFornFORN3.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                                     qryCotProdxFornTELEFONE3.AsString := qryCotacaoTELEFONE.asString;
                                     qryCotProdxFornCONDPAG3.AsString  := qryCotacaoCONDPAG.AsString;
                                     qryCotProdxFornPRAZOENT3.AsString := qryCotacaoPRAZOENT.AsString;
                                     // Percentual em relação ao mix idel (menor valor)
                                     qryCotProdxFornPERCMIX3.AsFloat   := (StrToFloat(Format('%20.2f',[(qryCotProdxFornFORN3.AsFloat/qryCotacaoMENORVALOR.AsFloat)])) -1) * 100;

                                     qryCotProdxFornVALTOT3.AsFloat    := qryCotacaoVALTOT.AsFloat;
                                     qryCotProdxFornVALUNIT3.AsFloat   := qryCotacaoVALUNIT.AsFloat;

                                     qryCotProdxForn.Post;
                                  End;
                              4 : Begin
                                     qryCotProdxForn.Edit;
                                     qryCotProdxFornFORN4.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                                     qryCotProdxFornTELEFONE4.AsString := qryCotacaoTELEFONE.asString;
                                     qryCotProdxFornCONDPAG4.AsString  := qryCotacaoCONDPAG.AsString;
                                     qryCotProdxFornPRAZOENT4.AsString := qryCotacaoPRAZOENT.AsString;
                                     // Percentual em relação ao mix idel (menor valor)
                                     qryCotProdxFornPERCMIX4.AsFloat   := (StrToFloat(Format('%20.2f',[(qryCotProdxFornFORN4.AsFloat/qryCotacaoMENORVALOR.AsFloat)])) -1) * 100;

                                     qryCotProdxFornVALTOT4.AsFloat    := qryCotacaoVALTOT.AsFloat;
                                     qryCotProdxFornVALUNIT4.AsFloat   := qryCotacaoVALUNIT.AsFloat;

                                     qryCotProdxForn.Post;
                                  End;
                              5 : Begin
                                     qryCotProdxForn.Edit;
                                     qryCotProdxFornFORN5.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                                     qryCotProdxFornTELEFONE5.AsString := qryCotacaoTELEFONE.asString;
                                     qryCotProdxFornCONDPAG5.AsString  := qryCotacaoCONDPAG.AsString;
                                     qryCotProdxFornPRAZOENT5.AsString := qryCotacaoPRAZOENT.AsString;
                                     // Percentual em relação ao mix idel (menor valor)
                                     qryCotProdxFornPERCMIX5.AsFloat   := (StrToFloat(Format('%20.2f',[(qryCotProdxFornFORN5.AsFloat/qryCotacaoMENORVALOR.AsFloat)])) -1) * 100;

                                     qryCotProdxFornVALTOT5.AsFloat    := qryCotacaoVALTOT.AsFloat;
                                     qryCotProdxFornVALUNIT5.AsFloat   := qryCotacaoVALUNIT.AsFloat;

                                     qryCotProdxForn.Post;
                                  End;
                              6 : Begin
                                     qryCotProdxForn.Edit;
                                     qryCotProdxFornFORN6.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                                     qryCotProdxFornTELEFONE6.AsString := qryCotacaoTELEFONE.asString;
                                     qryCotProdxFornCONDPAG6.AsString  := qryCotacaoCONDPAG.AsString;
                                     qryCotProdxFornPRAZOENT6.AsString := qryCotacaoPRAZOENT.AsString;
                                     // Percentual em relação ao mix idel (menor valor)
                                     qryCotProdxFornPERCMIX6.AsFloat   := (StrToFloat(Format('%20.2f',[(qryCotProdxFornFORN6.AsFloat/qryCotacaoMENORVALOR.AsFloat)])) -1) * 100;

                                     qryCotProdxFornVALTOT6.AsFloat    := qryCotacaoVALTOT.AsFloat;
                                     qryCotProdxFornVALUNIT6.AsFloat   := qryCotacaoVALUNIT.AsFloat;

                                     qryCotProdxForn.Post;
                                  End;
                          End;
                          If (qryCotacaoSTATUS.AsString = 'C') or (qryCotacaoSTATUS.AsString = 'U') Then
                              Begin
                                 qryCotProdxForn.Edit;
                                 qryCotProdxFornNUNVENC.AsInteger := qryCotacaoPOS.AsInteger;
                                 qryCotProdxForn.Post;
                              End;
                          qryCotProdxForn.Edit;
                          qryCotProdxFornVLRMENOR.AsFloat := qryCotacaoMENORVALOR.AsFloat;
                          qryCotProdxForn.Post;
                          qryCotacao.Next;
                       End;
                    qryCotProdxForn.Next;
                 End;
              qryCotProdxForn.First;
        End;
  DtmRelCompras.Lbforn1.Visible   := False;
  DtmRelCompras.Lbforn2.Visible   := False;
  DtmRelCompras.Lbforn3.Visible   := False;
  DtmRelCompras.Lbforn4.Visible   := False;
  DtmRelCompras.Lbforn5.Visible   := False;
  DtmRelCompras.Lbforn6.Visible   := False;
  //
  DtmRelCompras.lnCol2.Visible    := False;
  DtmRelCompras.lnCol3.Visible    := False;
  DtmRelCompras.lnCol4.Visible    := False;
  DtmRelCompras.lnCol5.Visible    := False;
  DtmRelCompras.lnCol6.Visible    := False;
  //
  DtmRelCompras.LnSumCol2.Visible := False;
  DtmRelCompras.LnSumCol3.Visible := False;
  DtmRelCompras.LnSumCol4.Visible := False;
  DtmRelCompras.LnSumCol5.Visible := False;
  DtmRelCompras.LnSumCol6.Visible := False;
  //
  DtmRelCompras.lbPercMix1.Visible := False;
  DtmRelCompras.lbPercMix2.Visible := False;
  DtmRelCompras.lbPercMix3.Visible := False;
  DtmRelCompras.lbPercMix4.Visible := False;
  DtmRelCompras.lbPercMix5.Visible := False;
  DtmRelCompras.lbPercMix6.Visible := False;

  For x := 1 To iNumForn Do
    Begin
        Case x Of
           1 : Begin
                  DtmRelCompras.LbForn1.Visible    := True;
                  DtmRelCompras.lbPercMix1.Visible := True;
               End;
           2 : Begin
                  DtmRelCompras.LbForn2.Visible    := True;
                  DtmRelCompras.lnCol2.Visible     := True;
                  DtmRelCompras.LnSumCol2.Visible  := True;
                  DtmRelCompras.lbPercMix2.Visible := True;
               End;
           3 : Begin
                  DtmRelCompras.LbForn3.Visible    := True;
                  DtmRelCompras.lnCol3.Visible     := True;
                  DtmRelCompras.LnSumCol3.Visible  := True;
                  DtmRelCompras.lbPercMix3.Visible := True;
               End;
           4 : Begin
                  DtmRelCompras.LbForn4.Visible    := True;
                  DtmRelCompras.lnCol4.Visible     := True;
                  DtmRelCompras.LnSumCol4.Visible  := True;
                  DtmRelCompras.lbPercMix4.Visible := True;
               End;
           5 : Begin
                  DtmRelCompras.LbForn5.Visible    := True;
                  DtmRelCompras.lnCol5.Visible     := True;
                  DtmRelCompras.LnSumCol5.Visible  := True;
                  DtmRelCompras.lbPercMix5.Visible := True;
               End;
           6 : Begin
                  DtmRelCompras.LbForn6.Visible    := True;
                  DtmRelCompras.lnCol6.Visible     := True;
                  DtmRelCompras.LnSumCol6.Visible  := True;
                  DtmRelCompras.lbPercMix6.Visible := True;
               End;
        End;
    End;

  DtmRelCompras.LbCodProc.Caption  := dblcProc.LookupValue;
  DtmRelCompras.RgCotPxF1.Visible  := False;
  DtmRelCompras.RgCotPxF2.Visible  := False;
  DtmRelCompras.RgCotPxF3.Visible  := False;
  DtmRelCompras.RgCotPxF4.Visible  := False;
  DtmRelCompras.RgCotPxF5.Visible  := False;
  //
  If Trim(Edit1.Text) <> '' Then
     Begin
        DtmRelCompras.RgCotPxF1.Visible  := True;
        DtmRelCompras.LbCarimbo1.Caption := Edit1.Text;
     End;
  If Trim(Edit2.Text) <> '' Then
     Begin
        DtmRelCompras.RgCotPxF2.Visible  := True;
        DtmRelCompras.LbCarimbo2.Caption := Edit2.Text;
     End;
  If Trim(Edit3.Text) <> '' Then
     Begin
        DtmRelCompras.RgCotPxF3.Visible  := True;
        DtmRelCompras.LbCarimbo3.Caption := Edit3.Text;
     End;
  If Trim(Edit4.Text) <> '' Then
     Begin
        DtmRelCompras.RgCotPxF4.Visible  := True;
        DtmRelCompras.LbCarimbo4.Caption := Edit4.Text;
     End;
  If Trim(Edit5.Text) <> '' Then
     Begin
        DtmRelCompras.RgCotPxF5.Visible  := True;
        DtmRelCompras.LbCarimbo5.Caption := Edit5.Text;
     End;
End;


procedure TFrmParamCotProdxForn.FormShow(Sender: TObject);
begin
  inherited;
   Edit1.Text := Modulo.sAssinatura1;
   Edit2.Text := Modulo.sAssinatura2;
   Edit3.Text := Modulo.sAssinatura3;
end;

procedure TFrmParamCotProdxForn.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcProc.Text) = '' Then
     Begin
         ModalResult := mrNone;
         MsgDlg('Processo não selecionado','Erro',mtError,[mbOk],0);
         dblcProc.SetFocus;
     End
  Else
     Begin
        FazRel;
        ModalResult := mrOK;
     End;

end;



end.

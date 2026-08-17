unit uCtrlGeraArqDarfJud;

interface

Uses sysutils, uCmControlObject, uSistema, DB, uDataBase, DbClient, JclStrings, fProgresso, Forms,
     ComCtrls, uCMMath,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraArqDarfJud = Class(TCmControlObject)

    private
      CdsDarfJud : TClientDataSet;

      wAno,
      wMes,
      wDia       : Word;
      ArqDarfJud : TextFile;

    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      procedure GeraArquivo(DataLancamentos: OleVariant; psNomeArqDarfJud: String);
      procedure GravaCabecalho;
      procedure GravaDetalhe(Var piQtdDarf: Integer; Var prValorDarf: Double);
      procedure GravaRodape(piQtdDarf: Integer; pdVlrDarf: Double);
      function ListaDarfs(bAbreCdsVazio,bFiltroVencimento: boolean; dDtInicial, dDtFinal: TDAteTime; pbBuscaDocBaixado: Boolean ): OleVariant;

    protected

    End;

implementation

{ TCtrlGeraArqDarfJud }

procedure TCtrlGeraArqDarfJud.AfterInitialize;
begin
  inherited;

end;

constructor TCtrlGeraArqDarfJud.Create;
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  CdsDarfJud := TClientDataSet.Create(Nil);

end;

destructor TCtrlGeraArqDarfJud.Destroy;
begin
  inherited;
  CdsDarfJud.Free;
end;

procedure TCtrlGeraArqDarfJud.DoChangeDataBase;
begin
  inherited;

end;

procedure TCtrlGeraArqDarfJud.GeraArquivo(DataLancamentos: OleVariant; psNomeArqDarfJud: String);
Var
  iQtdDarf : Integer;
  rVlrDarf : Double;

begin
  CdsDarfJud.Data := DataLancamentos;
  frmProgresso.MostraFormProgresso('Processando',True,False,True,0,CdsDarfJud.RecordCount);

  If Trim(psNomeArqDarfJud) <> '' Then
  Begin
    AssignFile(ArqDarfJud, psNomeArqDarfJud);
    ReWrite(ArqDarfJud);
  End;

  If Trim(psNomeArqDarfJud) <> '' Then
  Begin
    GravaCabecalho;
    GravaDetalhe(iQtdDarf, rVlrDarf);
    GravaRodape(iQtdDarf, rVlrDarf);
  End;
  frmProgresso.EscondeFormProgresso;

  If Trim(psNomeArqDarfJud) <> '' Then
    CloseFile(ArqDarfJud);
end;

procedure TCtrlGeraArqDarfJud.GravaCabecalho;
Var
  sLinha : String;

begin
  sLinha := '1';                                         //Campo 1 - Valor fixo "1"
  sLinha := sLinha + '0975';                             //Campo 2 - Agência da Funcef
  sLinha := sLinha + '0';                                //Campo 3 - Dígito verificador da agência da Funcef
  sLinha := sLinha + StrPadRight('', 21, ' ');           //Campo 4 - Espaços em branco
  sLinha := sLinha +
            StrPadLeft(IntToStr(wDia), 2, '0') +
            StrPadLeft(IntToStr(wMes), 2, '0') +
            IntToStr(wAno);                              //Campo 5 - Data de geração do arquivo

  sLinha := sLinha + '03';                               //Campo 6 - Valor Fixo "03"
  sLinha := sLInha + StrPadRight('', 163, ' ');          //Campo 7 - Espaços em branco

  Writeln(ArqDarfJud, sLinha);
end;

procedure TCtrlGeraArqDarfJud.GravaDetalhe(Var piQtdDarf: Integer; Var prValorDarf: Double);
Var
  sLinha,
  sNumProc,
  sMatric    : String;
  rValor     : Double;
  iUltIdDarf : Integer;

begin
  piQtdDarf   := 0;
  prValorDarf := 0;
  iUltIdDarf  := 0;

  cdsDarfJud.First;
  while not cdsDarfJud.Eof do
  begin
    If cdsDarfJud.FieldByName('FLGEXCLUI').AsString = 'S' Then
    Begin
      If (iUltIdDarf <> cdsDarfJud.FieldByName('IDDARF').AsInteger) or
         (cdsDarfJud.Eof) Then
      Begin
        iUltIdDarf  := cdsDarfJud.FieldByName('IDDARF').AsInteger;
        prValorDarf := prValorDarf + cdsDarfJud.FieldByName('VLRTOTAL').AsFloat;
        Inc(piQtdDarf);
        frmProgresso.AndaFormProgresso(piQtdDarf);

        sLinha := '3';                                         //Campo 1 - Valor fixo "3"
        sLinha := sLinha + '0975';                             //Campo 2 - Agência do contribuinte
        sLinha := sLinha + '0';                                //Campo 3 - Dígito verificador da agência do contribuinte
        sLinha := sLinha + '0001';                             //Campo 4 - Valor fixo "0001"
        sLinha := sLinha + '000000';                           //Campo 5 - Valor fixo "000000"
        sLinha := sLinha + '0';                                //Campo 6 - Calor fixo "0"
        sLinha := sLinha + '7';                                //Campo 7 - Valor fixo "7"
        sLinha := sLInha +
                  StrPadLeft(cdsDarfJud.FieldByName('CPF').AsString, 14, '0'); //Campo 8 - CPF/CGC

        sNumProc := StringReplace(cdsDarfJud.FieldByName('NUMEROPROCESSO').AsString, '.', '', [rfReplaceAll]);
        sNumProc := StringReplace(sNumProc, '-', '', [rfReplaceAll]);

        sLinha := sLinha + StrPadLeft(Copy(sNumProc, 1, 18), 18, '0');           //Campo 9 - Número Processo
        sLinha := sLinha + '7416';                             //Campo 10- Código da natureza

        rValor := cdsDarfJud.FieldByName('VLRIRRF').AsFloat;
        If Pos(',', FloatToStr(rValor)) > 0 Then
          sLinha := sLinha +
                    StrPadLeft(Copy(FloatToStr(rValor),1,Pos(',', FloatToStr(rValor))-1), 12, '0')+
                    StrPadRight(Copy(FloatToStr(rValor),Pos(',', FloatToStr(rValor))+1, 2), 2, '0')
        Else
          sLinha := sLinha + StrPadLeft(FloatToStr(rValor) + '00', 14, '0');  //Campo 11- Valor principal

        rValor := cdsDarfJud.FieldByName('VLRMULTA').AsFloat;
        If Pos(',', FloatToStr(rValor)) > 0 Then
          sLinha := sLinha +
                    StrPadLeft(Copy(FloatToStr(rValor),1,Pos(',', FloatToStr(rValor))-1), 12, '0')+
                    StrPadRight(Copy(FloatToStr(rValor),Pos(',', FloatToStr(rValor))+1, 2), 2, '0')
        Else
          sLinha := sLinha + StrPadLeft(FloatToStr(rValor) + '00', 14, '0');  //Campo 12- Valor Multa

        rValor := cdsDarfJud.FieldByName('VLRJUROS').AsFloat;
        If Pos(',', FloatToStr(rValor)) > 0 Then
          sLinha := sLinha +
                    StrPadLeft(Copy(FloatToStr(rValor),1,Pos(',', FloatToStr(rValor))-1), 12, '0')+
                    StrPadRight(Copy(FloatToStr(rValor),Pos(',', FloatToStr(rValor))+1, 2), 2, '0')
        Else
          sLinha := sLinha + StrPadLeft(FloatToStr(rValor) + '00', 14, '0');  //Campo 13- Valor do juro

        rValor := cdsDarfJud.FieldByName('VLRTOTAL').AsFloat;
        If Pos(',', FloatToStr(rValor)) > 0 Then
          sLinha := sLinha +
                    StrPadLeft(Copy(FloatToStr(rValor),1,Pos(',', FloatToStr(rValor))-1), 12, '0')+
                    StrPadRight(Copy(FloatToStr(rValor),Pos(',', FloatToStr(rValor))+1, 2), 2, '0')
        Else
          sLinha := sLinha + StrPadLeft(FloatToStr(rValor) + '00', 14, '0');  //Campo 14- Valor total

        sLinha := sLinha + StrPadRight('', 14, '0');           //Campo 15- Valor em cheque - preencher com brancos
        sLinha := sLinha + '1';                                //Campo 16- Valor fixo "1"

        sLinha := sLinha +
                  FormatDateTime('ddmmyyyy', cdsDarfJud.FieldByName('DATAVENCDARF').AsDateTime); //Campo 17- Data de arrecadação

        sLinha := sLinha +
                  FormatDateTime('ddmmyyyy', cdsDarfJud.FieldByName('DATAVENCDARF').AsDateTime); //Campo 18- Data de vencimento

        sLinha := sLinha +
                  FormatDateTime('ddmmyyyy', cdsDarfJud.FieldByName('DATAFINALAPURACAO').AsDateTime); //Campo 19- Data de apuração

        sLinha := sLinha +
                  StrPadLeft(copy(copy(cdsDarfJud.FieldByName('NUMAGENCIA').AsString, 1, Length(cdsDarfJud.FieldByName('NUMAGENCIA').AsString) -1) +
                                  cdsDarfJud.FieldByName('CONTACORRENTE').AsString, 1, 16), 16, '0'); //Campo 20- conta do governo sem dv da ag

        rValor := cdsDarfJud.FieldByName('VLRBASECALCULO').AsFloat;
        If Pos(',', FloatToStr(rValor)) > 0 Then
          sLinha := sLinha +
                    StrPadLeft(Copy(FloatToStr(rValor),1,Pos(',', FloatToStr(rValor))-1), 12, '0')+
                    StrPadRight(Copy(FloatToStr(rValor),Pos(',', FloatToStr(rValor))+1, 2), 2, '0')
        Else
          sLinha := sLinha + StrPadLeft(FloatToStr(rValor) + '00', 14, '0');  //Campo 21- Valor de Base de Cálculo

        rValor := cdsDarfJud.FieldByName('PERCIRRF').AsFloat;
        If Pos(',', FloatToStr(rValor)) > 0 Then
          sLinha := sLinha +
                    StrPadLeft(Copy(FloatToStr(rValor),1,Pos(',', FloatToStr(rValor))-1), 3, '0')+
                    StrPadRight(Copy(FloatToStr(rValor),Pos(',', FloatToStr(rValor))+1, 2), 2, '0')
        Else
          sLinha := sLinha + StrPadLeft(FloatToStr(rValor) + '00', 5, '0'); //Campo 22- Alíquota

        sMatric := StringReplace(cdsDarfJud.FieldByName('MATRICULA').AsString, '-', '', [rfReplaceAll]);

        sLinha := sLinha + StrPadLeft(sMatric + StrPadLeft(IntToStr(piQtdDarf), 6, '0'), 13, '0');           //Campo 23- Nº de referência
        sLinha := sLinha + StrPadRight('', 3, ' ');            //Campo 24- Espaços em branco

        Writeln(ArqDarfJud, sLinha);
      End;
    End;
    cdsDarfJud.Next;
  end;
end;

procedure TCtrlGeraArqDarfJud.GravaRodape(piQtdDarf: Integer; pdVlrDarf: Double);
Var
  sLinha : String;
  rValor: Double;

begin
  sLinha := '9';                                         //Campo 1 - Valor fixo "9"
  sLinha := sLinha + '0975';                             //Campo 2 - Agência da Funcef
  sLinha := sLinha + '0';                                //Campo 3 - Dígito verificador da agência da Funcef
  sLinha := sLinha + StrPadRight('', 15, '9');           //Campo 4 - Valor fixo preencher com "9"
  sLinha := sLinha +
            StrPadLeft(IntToStr(piQtdDarf), 4, '0');     //Campo 5 - Quantidade de Darf´s gravados

  rValor := pdVlrDarf;
  If Pos(',', FloatToStr(rValor)) > 0 Then
    sLinha := sLinha +
              StrPadLeft(Copy(FloatToStr(rValor),1,Pos(',', FloatToStr(rValor))-1), 12, '0')+
              StrPadRight(Copy(FloatToStr(rValor),Pos(',', FloatToStr(rValor))+1, 2), 2, '0')
  Else
    sLinha := sLinha + StrPadLeft(FloatToStr(rValor) + '00', 14, '0');  //Campo 6 - Valor Total de Darf´s gravados

  sLinha := sLInha + StrPadRight('', 161, ' ');          //Campo 7 - Espaços em branco

  Writeln(ArqDarfJud, sLinha);
end;

function TCtrlGeraArqDarfJud.ListaDarfs(bAbreCdsVazio,bFiltroVencimento: boolean;
  dDtInicial, dDtFinal: TDAteTime; pbBuscaDocBaixado: Boolean ): OleVariant;
var
 sSQL: string;

begin
  sSQL := 'SELECT DISTINCT '                                               + #13 +
          '   PES.NOME AS FAVORECIDO, '                                    + #13 +
          '   DECODE(CON.NOME,NULL,''Entrada Manual'',CON.NOME) AS CONTRIBUINTE, ' + #13 +
          '   CON.NUMDOCUMENTO AS CPF, '                                   + #13 +
          '   DRF.VLRMULTA, '                                              + #13 +
          '   DRF.VLRJUROS, '                                              + #13 +
          '   DRF.VLRIRRF, '                                               + #13 +
          '   DRF.PERCIRRF, '                                              + #13 +
          '   DRF.VLRBASECALCULO, '                                        + #13 +
          '   DRF.DATAINIAPURACAO, '                                       + #13 +
          '   DRF.DATAFINALAPURACAO, '                                     + #13 +
          '   PRJ.NUMEROPROCESSO, '                                        + #13 +
          '   AGB.NUMAGENCIA, '                                            + #13 +
          '   CTB.CONTACORRENTE, '                                         + #13 +
          '   DRF.IDDARF, '                                                + #13 +
          '   DRF.DATAEMISDARF, '                                          + #13 +
          '   DRF.CODDOCUMENTO, '                                          + #13 +
          '   DRF.VLRTOTAL, '                                              + #13 +
          '   DRF.DATAVENCDARF, '                                          + #13 +
          '   ''S'' AS FLGEXCLUI, '                                        + #13 +
          '   DRF.CODNATUREZA, '                                           + #13 +
          '   DEP.MATRICULA '                                              + #13 +
          'FROM '                                                          + #13 +
          '   PESSOA PES, '                                                + #13 +
          '   PESSOA CON, '                                                + #13 +
          '   DOCUMENTO DOC, '                                             + #13 +
          '   DARF DRF, '                                                  + #13 +
          '   LANCIRRF LIR, '                                              + #13 +
          '   PROCJUD PRJ, '                                               + #13 +
          '   CONTABANCARIA CTB, '                                         + #13 +
          '   AGENCIABANCARIA AGB, '                                       + #13 +
          '   DEPENTIT DEP '                                               + #13 +
          'WHERE '                                                         + #13 +
          '      PES.IDPESSOA          = DOC.IDFORCLI '                    + #13 +
          'AND   LIR.IDBENEFIRRF       = CON.IDPESSOA(+) '                 + #13 +
          'AND   DOC.CODDOCUMENTO      = DRF.CODDOCUMENTO '                + #13 +
          'AND   DRF.CODNATUREZA      IN (7416, 7431) '                    + #13 +
          'AND   DRF.IDDARF            = LIR.IDDARF(+) '                   + #13 +
          'AND   PRJ.IDPESSOA          = LIR.IDBENEFIRRF '                 + #13 +
          'AND   PRJ.IDAGENCIABANCARIA = AGB.IDPESSOA '                    + #13 +
          'AND   PRJ.IDCBANCARIA       = CTB.IDCBANCARIA '                 + #13 +
          'AND   PRJ.SITPROCESSO       = 0 '                               + #13 +
          'AND   PRJ.IDPESSOA          = DEP.IDPESSOA '                    + #13 +
          'AND   DRF.VLRTOTAL         >= 0 '                               + #13 +
          'AND   DEP.MATRICULA        IS NOT NULL '                        + #13 ;


  if bAbreCdsVazio then
    sSQL := sSQL + ' AND DRF.IDDARF = -1 '
  else
  begin
    if bFiltroVencimento then
      sSQL := sSQL + 'AND DRF.DATAVENCDARF BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDtInicial)) +',''DD/MM/YYYY'') ' + #13 +
                     '                         AND TO_DATE('+ QuotedStr(DateToStr(dDtFinal))   +',''DD/MM/YYYY'') '

    else
      sSQL := sSQL + 'AND DRF.DATAEMISDARF BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDtInicial)) +',''DD/MM/YYYY'') ' + #13 +
                     '                         AND TO_DATE('+ QuotedStr(DateToStr(dDtFinal))   +',''DD/MM/YYYY'') ';
  end;

  If pbBuscaDocBaixado Then
    sSql := sSql +
          'AND   DOC.STATUS      <> ''2'' '                                + #13 +
          'AND   NOT EXISTS (SELECT 1 FROM LANCTODOCUM X '               + #13 +
          '                  WHERE  D.CODDOCUMENTO = X.CODDOCUMENTO '    + #13 +
          '                  AND X.OPERACAO = ''5'') ';

  sSql := sSql +
          ' ORDER BY CONTRIBUINTE, DEP.MATRICULA ';

  Result := GetDataPacket(sSQL);
end;



end.
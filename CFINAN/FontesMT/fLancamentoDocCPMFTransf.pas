unit fLancamentoDocCPMFTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, CMDBLookupCombo, wwdblook, DBTables, Wwquery,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, TREdit, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TfrmLancamentoDocCPMFTransf = class(TfrmOkCancelar)
    Label5: TLabel;
    DtProgBaixaF: TCMDateTimePicker;
    Bevel1: TBevel;
    Label1: TLabel;
    RevalCpmf: TRealEdit;
    SQL: TCMSqlParams;
    Cds: TCMClientDataSet;
    QryAux: TwwQuery;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sSql :string;
    sNomeCentroResponPadrao, sCodCentroResponPadrao: String;

    function OraNumero(sNumero: String): String;
    function LancaDocumento :LongInt;
    { Private declarations }
  public
    Idfavorecido: LongInt;
    sIDImpostoRetido     : String;
    NumDocLancado: LongInt;
    { Public declarations }
    procedure MontaDados(sIDAProcessar: String);

  end;

var
  frmLancamentoDocCPMFTransf: TfrmLancamentoDocCPMFTransf;

const sHistorico = 'Lancto de CPMF sobre transferência';


implementation

{$R *.DFM}

Uses uSistema, uintegraback, uFuncaoGeral, uDataBase, dBaseDados, uMensErro,
     uDocumento, uLancContab;


procedure TfrmLancamentoDocCPMFTransf.bbtnCancelarClick(Sender: TObject);
begin
  ModalResult := MrCancel;
  inherited;

end;

procedure TfrmLancamentoDocCPMFTransf.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   NumDocLancado := -1;
   Try
     NumDocLancado := LancaDocumento;

     {**
       Marca o documento lançado com o FLGTIPODOCUMENTO = 2 indicando que é um
       lançamento de arredondamento de CPMF
     **}
     If NumDocLancado > 0 Then
     Begin
       If QryAux.Active Then QryAux.Close;
       QryAux.Sql.Text := 'UPDATE DOCUMENTO SET FLGTIPODOCUMENTO = ''2'' WHERE CODDOCUMENTO = ' + IntToStr(NumDocLancado);
       QryAux.ExecSQL;
     End;

     ModalResult := MrOk;
   Except
     ModalResult := MrCancel;
   End;
end;

function TfrmLancamentoDocCPMFTransf.LancaDocumento: LongInt;
Var
   iNumLancto :Integer;
   sDebCre, sMens, sContaD, sContaCliFor, sCCustoCliFor, sUnidNegocCliFor: String;
   liEmpresa, liExercicio, liPeriodo, iPlnCodigo, iPlnCodigoP, iSubContaCliFor: LongInt;
   rValorLancto: Double;
begin
   Result := -1;
   sContaCliFor := '';
   sCCustoCliFor := '';
   sUnidNegocCliFor := '';

   With TwwQuery.Create(nil) Do
   Try
     DataBaseName := 'BaseDados';
//     Sql.Text := 'SELECT CONTACFORN, CODCENTROCUSTO, UNIDNEGOC, CODSUBCONTA FROM EMPRESAFORN WHERE IDFORCLI = ' + IntToStr(Idfavorecido) + ' AND IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);

     // Alex 11/03/05 pegar a conta do  tipo de desembolso primeiro
     Sql.Text :=
     'SELECT PLACONTACREDITO,CODSUBCONTACRE, CODTIPRECDES '+ #13 +
     'FROM   TIPORECEBDESEMB '+ #13 +
     'WHERE  CODTIPRECDES = '+ QuotedStr(dblcTipoRD.LookupValue) + #13 +
     'AND    RECPAG = ''P'' ';
     Open;

     if Fields[0].AsString <> '' then begin
       sContaCliFor := Fields[0].AsString;
       iSubContaCliFor := Fields[1].AsInteger;

     end else begin
       Close;

       Sql.Text :=
       'SELECT DISTINCT ' + #13 +
       '    PLACONTA, ' + #13 +
       '    CODCENTROCUSTO, ' + #13 +
       '    UNIDNEGOC, ' + #13 +
       '    CODSUBCONTA ' + #13 +
       'FROM ' + #13 +
       '    PORTADORCONTA ' + #13 +
       'WHERE ' + #13 +
       '    CODPORTADOR = (SELECT DISTINCT CODPORTADOR FROM IMPOSTORETIDO WHERE IDIMPOSTORETIDO in (' + sIDImpostoRetido + ') )' + #13;

       Open;

       sContaCliFor := Fields[0].AsString;
       iSubContaCliFor := Fields[3].AsInteger;
     end;

     sCCustoCliFor := CmbCentCusto.LookupValue;
     sUnidNegocCliFor := dblcUnidNegoc.LookupValue;

     Close;
   finally
     free;
   end;

   NumDocLancado := Documento.GetCodigo(nil);

   if NumDocLancado <= 0 then
     raise EDataBaseError.Create('Não Foi Possível Gerar CodDocumento.');

   rValorLancto := RevalCpmf.Value;

   sDebCre := CdsTipoDoc.FieldByName('DEBCRE').AsString;

   cds.Close;
   sSQL :=
   'SELECT * '                                            + #13 +
   'FROM   RATEIOIMPOSTORETIDO '                          + #13 +
   'WHERE  IDIMPOSTORETIDO IN (' + sIDImpostoRetido + ')' + #13;

   SQL.SQL.Text := sSQL;
   SQL.Open;

   //Contabiliza Documento
   iPlnCodigo := 0;
   if IntegraBack.Contabilidade = 'S' then begin
      liEmpresa := Sistema.idEmpresa;
      if TestaPeriodo(true,'BaseDados',DtProgBaixaF.Text,IntToStr(Sistema.idModulo),
                   liExercicio,liPeriodo,liEmpresa,sMens) <> 0 then Abort;
      sContaD := Documento.BuscaContaContabil(StrToInt(CmbPrograma.LookupValue),
                 dblcTipoRD.LookupValue,CmbCentCusto.LookupValue);

      while not cds.Eof do
      begin
         try
         iPlnCodigo := LancaContab(true,
                                   'BaseDados',
                                   DtProgBaixaF.Text,
                                   IntToStr(Sistema.idModulo),
                                   '2',
                                   sDebCre,
                                   '',
                                   '',
                                   '',
                                   '',
                                   '',
                                   '',
                                   '',
                                   '',
                                   '',
                                   '',
                                   FloatToStr(NumDocLancado),
                                   sHistorico,
                                   '',
                                   '',
                                   '',
                                   '',
                                   '03',
                                   CmbCentCusto.LookupValue,
                                   sContaD,
                                   sCCustoCliFor,
                                   sContaCliFor,
                                   liExercicio,
                                   liPeriodo,
                                   liEmpresa,
                                   Sistema.idUsuario,
                                   IntegraBack.Plano,
                                   cds.FieldByName('VLRCPMF').AsFloat,
                                   0,
                                   0,
                                   0,
                                   0,
                                   0,
                                   0,
                                   0,
                                   0,
                                   dblcUnidNegoc.LookupValue,
                                   false,
                                   0,
                                   0,
                                   IntToStr(iSubContaCliFor),
                                   IntToStr(iSubContaCliFor),
                                   '',
                                   '',
                                   iPlnCodigo,
                                   sMens,
                                   IntegraBack.MascaraPlano,
                                   true,
                                   0,
                                   cds.FieldByName('IDPLANOPREV').AsInteger,
                                   cds.FieldByName('IDPATRO').AsInteger,
                                   Sistema.UsaPlanoPatro);
         except
            NumDocLancado := -1;
         end;
         cds.Next;
      end;
   end;
   if iPlnCodigo > 0 then
      iPlncodigoP := iPlnCodigo
   else
      iPlncodigoP := -1;
   //Lança Documento

   Result := NumDocLancado;

   if Result = -1 then
      Exit;

   Documento.Inserir(QryAux,
                     NumDocLancado,
                     IntToStr(Sistema.IdModulo),
                     InttoStr(IntegraBack.Plano),
                     sContaCliFor,
                     sCCustoCliFor,
                     0,
                     StrToInt(sUnidNegocCliFor),
                     Sistema.IdEmpresa,
                     Idfavorecido,
                     StrToInt(dblcTipoDoc.LookupValue),
                     -1,
                     IntegraBack.RecPag,
                     NumDocLancado,
                     '',
                     DtProgBaixaF.Text,
                     DtProgBaixaF.Text,
                     DtProgBaixaF.Text,
                     '0',
                     0,
                     '2',
                     Sistema.IdUsuario,
                     iSubContaCliFor,
                     -1 ,
                     '',
                     '',
                     False,
                     -1,
                     -1,
                     -1);

   //Cria Lançamento
   iNumLancto := Documento.GerarNumLancto(nil, NumDocLancado);

   if iNumLancto <= 0 then
     raise EDataBaseError.Create('Não Foi Possível Gerar NumLancto.');

   if iPlnCodigo > 0 then
     iPlnCodigoP := iPlnCodigo
   else
     iPlnCodigoP := -1;

   Documento.CriarLanctoDoc(QryAux,
                            NumDocLancado,
                            iNumLancto,
                            -1,
                            iPlnCodigoP,
                            DtProgBaixaF.Text,
                            rValorLancto,
                            0,
                            -1,
                            sDebCre,
                            '2',
                            Copy(Trim(sHistorico),1,40),
                            Sistema.idUsuario,
                            False,
                            -1,
                            '');

   cds.First;
   while not cds.Eof do
   begin
      //Lança Rateio
      Documento.Rateio.Inserir(NumDocLancado,
                               dblcTipoRD.LookupValue,
                               IntegraBack.RecPag,
                               dblcCentroRespon.LookupValue,
                               Sistema.IdEmpresa,
                               cds.FieldByName('VLRCPMF').AsFloat,
                               0,
                               Sistema.IdUsuario,
                               StrToInt(dblcUnidNegoc.lookupvalue),
                               0,
                               CmbCentCusto.lookupvalue,
                               cds.FieldByName('IDPATRO').AsInteger,
                               StrToFloat(CmbPrograma.lookupvalue),
                               cds.FieldByName('IDPLANOPREV').AsInteger);


      // CCBAIXASXDOCUM
      with qryAux do
      begin
         Sql.Text :=
         'INSERT INTO CCBAIXASXDOCUM(IDCCBAIXASXDOCUM, IDPATRO, UNIDNEGOC, IDPLANOPREV, IDPESSOA, CODDOCUMENTO, VALOR, PLANO, PLACONTA) ' + #13 +
         'VALUES (SEQCCBAIXASXDOCUM.NEXTVAL, ' + #13 +
                  cds.FieldByName('IDPATRO').AsString + ',' +
                  dblcUnidNegoc.lookupvalue + ',' +
                  cds.FieldByName('IDPLANOPREV').AsString + ',' +
                  IntToStr(Sistema.IdEmpresa) + ',' +
                  FloatToStr(NumDocLancado) + ',' +
                  OraNumero(cds.FieldByName('VLRCPMF').AsString) + ',' +
                  InttoStr(IntegraBack.Plano) + ',' +
                  QuotedStr(sContaD) + ')';
         ExecSQL;
      end;

      cds.Next;
   end;


end;

procedure TfrmLancamentoDocCPMFTransf.MontaDados(sIDAProcessar: String);
begin
   inherited;
   sIDImpostoRetido := sIDAProcessar;
   sSQL :=
   'SELECT SUM(VLRRETIDO) AS VLRTOTAL ' + #13 +
   'FROM   IMPOSTORETIDO '              + #13 +
   'WHERE  IDIMPOSTORETIDO IN (' + sIDImpostoRetido + ')' + #13;

   SQL.SQL.Text := sSQL;
   SQL.Open;
   RevalCpmf.Value := cds.FieldByname('VLRTOTAL').AsFloat;

   If Not CdsProgramaPrev.Active Then
   Begin
      SQLProgramaPrev.Open;
      SQLPatroPrev.Open;
      SQLPlanoPrev.Open;

      ssql:='  SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
            '  FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
            ' WHERE a.RECPAG =  ''P'''+
            ' and not exists (select 1 from UsuarioxTpdocto b where recpag='+#39+Integraback.recpag+#39+' and b.idusuario='+Inttostr(sistema.IdUsuario)+') '+
            ' union SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
            ' FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
            ' WHERE a.RECPAG =  ''P'' and  exists '+
            ' (select 1 from UsuarioxTpdocto b where recpag='+#39+Integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc  '+
            ' and b.idusuario='+Inttostr(sistema.IdUsuario)+') ORDER BY DEBCRE DESC,DESCRICAO  ';

      SQLTipoDoc.SQL.Text := ssql;
      SQLTipoDoc.Open;

      SQLCentroRespon.SQL.Text :=
        'SELECT CEN.CODCENTRORESPON,CEN.NOME,CEN.ANALITICOSINTET,CEN.CODCENTROCUSTO '+
        'FROM CENTRESPON CEN, PESSOAXCRESP PES '+
        'WHERE (CEN.IDPESSOA = '+InttoStr(Sistema.idempresa)+') AND '+
        '(CEN.CODCENTRORESPON <> ''9999999999'') AND '+
        '(CEN.ATIVO=''S'') AND '+
        '(CEN.CODCENTRORESPON=PES.CODCENTRORESPON) AND '+
        '(PES.IDPESSOAACESSO='+InttoStr(Sistema.IdUsuario)+') '+
        'ORDER BY CEN.CODCENTRORESPON,CEN.ANALITICOSINTET,CEN.NOME';
      SQLCentroRespon.Open;

      if CdsCentroRespon.IsEmpty then
      begin
        SQLCentroRespon.SQL.Text := 'SELECT CODCENTRORESPON,NOME,ANALITICOSINTET, CODCENTROCUSTO FROM CENTRESPON WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' AND CODCENTRORESPON = ''9999999999''  and ativo=''S''';
        SQLCentroRespon.Open;

        sNomeCentroResponPadrao := CdsCentroRespon.FieldByName('NOME').AsString;
        sCodCentroResponPadrao  := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;

        SQLCentroRespon.SQL.Text :=
          'SELECT CEN.CODCENTRORESPON,CEN.NOME,CEN.ANALITICOSINTET,CEN.CODCENTROCUSTO '+
          'FROM CENTRESPON CEN '+
          'WHERE (CEN.IDPESSOA = '+InttoStr(Sistema.idempresa)+') AND '+
          '(CEN.CODCENTRORESPON <> ''9999999999'') AND '+
          '(CEN.ATIVO=''S'') '+
          'ORDER BY CEN.CODCENTRORESPON,CEN.ANALITICOSINTET,CEN.NOME';
      end;

      SQLUnidNegoc.Prepare;
      SQLUnidNegoc.ParamByName('IDPESSOA').AsFloat := Sistema.idempresa;
      SQLUnidNegoc.Open;

      CdsUnidNegoc.FieldByName('UNECODIGO').EditMask := IntegraBack.MascaraUnidNegoc + ';0;_';
      CdsCentroRespon.FieldByName('CODCENTRORESPON').EditMask := IntegraBack.MascaraCr + ';0;_';


      SQLTipoRD.SQL.Text := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                            'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                            'TIPORECEBDESEMB T, FORNXDESEMB F ' +
                            ' WHERE (T.ANASINT = ''A'') AND ' +
                            '       (T.RECPAG        = ''' + IntegraBack.RecPag + ''') AND  ' +
                            '       (T.IDPESSOA      = ' + InttoStr(Sistema.idempresa) + ') AND ' +
                            '       (F.IDPESSOA      = ' + IntToStr(Idfavorecido) + ') AND ' +
                            '       (F.RECPAG        = T.RECPAG) AND  ' +
                            '       (F.IDEMPRESAPROP = T.IDPESSOA) AND ' +

                            { DAVID - 28/08/2003 - Pendência 14458
                              Filtragem dos tipos de desembolso pelo campo ATIVO }
                            '       (T.ATIVO <> ''N'') and ' +

                            '       (F.CODTIPRECDES  = T.CODTIPRECDES) ' +
                            ' ORDER BY T.DESCRICAO';
      SQLTipoRD.Open;

      if CdsTipoRD.IsEmpty then
      begin
         SQLTipoRD.SQL.Text := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                                    'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                                    'TIPORECEBDESEMB T, RAMOXDESEMB R ' +
                                    ' WHERE (T.ANASINT = ''A'') AND ' +
                                    '       (T.RECPAG           = '''+IntegraBack.RecPag+''') AND  ' +
                                    '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') AND ' +
                                    '       (R.IDRAMOFORNECEDOR IN (SELECT IDRAMOFORNECEDOR FROM FORNXRAMO WHERE IDPESSOA = ' + IntToStr(Idfavorecido) + ')) AND ' +
                                    '       (R.RECPAG           = T.RECPAG)   AND ' +
                                    '       (R.IDPESSOA         = T.IDPESSOA) AND ' +

                                    { DAVID - 28/08/2003 - Pendência 14458
                                      Filtragem dos tipos de desembolso pelo campo ATIVO }
                                    '       (T.ATIVO <> ''N'') and ' +

                                    '       (R.CODTIPRECDES     = T.CODTIPRECDES) ' +
                                    ' ORDER BY T.DESCRICAO';
         SQLTipoRD.Open;

         if CdsTipoRd.IsEmpty then
         begin
            SQLTipoRD.SQL.Text :=  'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, DESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO, HITCODHIST ' +
                                   'FROM TIPORECEBDESEMB WHERE (ANASINT = ''A'') AND (RECPAG = ''' + IntegraBack.RecPag +
                                   ''') AND (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ' +

                                   { DAVID - 28/08/2003 - Pendência 14458
                                     Filtragem dos tipos de desembolso pelo campo ATIVO }
                                   ' and (ATIVO <> ''N'') ' +

                                   'ORDER BY DESCRICAO';
            SQLTipoRD.Open;
         end;
      end;
      MontaCentroDeCusto;
   end;

   sSQL :=
   'SELECT ' + #13 +
   '    CODTIPDOC, CODCENTRORESPON, UNIDNEGOC, CODTIPRECDES ' + #13 +
   'FROM ' + #13 +
   '    TIPOAGRE ' + #13 +
   'WHERE CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC) ' + #13;

   cds.Close;
   SQL.SQL.Text := sSQL;
   SQL.Open;

   dblcTipoDoc.LookupValue      := cds.FieldByName('CODTIPDOC').AsString;
   dblcCentroRespon.LookupValue := cds.FieldByName('CODCENTRORESPON').AsString;
   dblcUnidNegoc.LookupValue    := cds.FieldByName('UNIDNEGOC').AsString;
   dblcTipoRD.LookupValue       := cds.FieldByName('CODTIPRECDES').AsString;

   cds.Close;
   { Alex 25/02/2005 18359 Pegar o programa e o centro de custos do parâmetro do sistema financeiro,
     da maneira que era feito o sistema retornava diversos registros na query, pegando aleatoriamente
     o programa e centro de custos.
   sSQL :=
   'SELECT ' + #13 +
   '    CODCENTROCUSTO, IDPROGRAMA ' + #13 +
   'FROM ' + #13 +
   '    TIPRECDESXTIPAGRE ' + #13 +
   'WHERE CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC) ' + #13;}
   sSql := 'SELECT IDPROGRAMA, CODCENTROCUSTO FROM PARAMFINANC WHERE IDPESSOA = ' + IntToStr (Sistema.IdEmpresa);

   SQL.SQL.Text := sSQL;
   SQL.Open;

   // Alex 25/02/2005 18359 - se o programa e o centro de custos não forem parametrizados dar uma mensagem de erro
   if (cds.FieldByName('CODCENTROCUSTO').IsNull) or (cds.FieldByName('IDPROGRAMA').IsNull) then
      raise Exception.Create ('Para lançar o documento da CPMF de tansferência bancária, é necessário a parametrização do "Programa" e do "Centro de Custos" na tela de parâmetros do Controle Financeiro!');

   CmbCentCusto.LookupValue := cds.FieldByName('CODCENTROCUSTO').AsString;
   CmbPrograma.LookupValue  := cds.FieldByName('IDPROGRAMA').AsString;
end;


function TfrmLancamentoDocCPMFTransf.OraNumero(sNumero: String): String;
var
   i              : Integer;
   sResult, sOra  : String;
   bPrimPonto     : Boolean;
begin
   sOra := '';
   bPrimPonto := False;

   for i := length(Trim(sNumero)) downto 1 do
   begin
      if sNumero[i] = ',' then
      begin
         if not bPrimPonto then
         begin
            sOra        := sOra + '.';
            bPrimPonto  := True;
         end
         else
         begin
            sOra := sOra;
         end;
      end
      else
      begin
         if sNumero[i] <> '.' then
         begin
            sOra := sOra + sNumero[i]
         end
         else
         begin
            if not bPrimPonto then
            begin
               sOra := sOra + '.';
               bPrimPonto := True;
            end
            else
            begin
               sOra := sOra;
            end;
         end;  // if sNumero[i] <> '.'
      end;  // if sNumero[i] = ','
   end;  // for i downto

   sResult := '';

   for i := length(sOra) downto 1 do
   begin
      sResult := sResult + sOra[i];
   end;

   Result := sResult;
end;


end.

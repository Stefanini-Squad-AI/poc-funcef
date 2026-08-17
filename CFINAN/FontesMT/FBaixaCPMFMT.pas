unit FBaixaCPMFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit,
  Db, DBTables, Wwquery, CMDBLookupCombo, wwdblook, uCmSqlParams, DBClient,
  uCMClientDataSet;

type
  TFrmBaixaCPMFMT = class(TfrmOkCancelar)
    Label5: TLabel;
    DtProgBaixaF: TCMDateTimePicker;
    Label1: TLabel;
    RevalCpmf: TRealEdit;
    CkbArredonda: TCheckBox;
    Bevel1: TBevel;
    GbLancaAjuste: TGroupBox;
    lblUnidNegoc: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    lblCentroRespon: TLabel;
    dblcCentroRespon: TwwDBLookupCombo;
    lblTipoRD: TLabel;
    dblcTipoRD: TwwDBLookupCombo;
    CmbCentCusto: TwwDBLookupCombo;
    Label6: TLabel;
    lblValorDet: TLabel;
    dbeValorDet: TRealEdit;
    Label11: TLabel;
    CmbPlano: TCMDBLookupCombo;
    CmbPatro: TCMDBLookupCombo;
    Label12: TLabel;
    CmbPrograma: TCMDBLookupCombo;
    Label13: TLabel;
    dblcTipoDoc: TwwDBLookupCombo;
    lblTipoDocum: TLabel;
    lblHistorico: TLabel;
    EdtHistorico: TEdit;
    QryAux: TwwQuery;
    CdsTipoDoc: TCMClientDataSet;
    CdsUnidNegoc: TCMClientDataSet;
    CdsCentroRespon: TCMClientDataSet;
    CdsTipoRD: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    CdsProgramaPrev: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatroPrev: TCMClientDataSet;
    SQLTipoDoc: TCMSqlParams;
    SQLUnidNegoc: TCMSqlParams;
    SQLCentroRespon: TCMSqlParams;
    SQLTipoRD: TCMSqlParams;
    SQLCentroCusto: TCMSqlParams;
    SQLProgramaPrev: TCMSqlParams;
    SQLPlanoPrev: TCMSqlParams;
    SQLPatroPrev: TCMSqlParams;
    Cds: TCMClientDataSet;
    SQL: TCMSqlParams;
    procedure CkbArredondaClick(Sender: TObject);
    procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    sNomeCentroResponPadrao, sCodCentroResponPadrao: String;
    procedure MontaCentroDeCusto;
    function LancaDocumento :LongInt;
    { Private declarations }
  public
    Idfavorecido: LongInt;
    NumDocLancado: LongInt;
    { Public declarations }
  end;

var
  FrmBaixaCPMFMT: TFrmBaixaCPMFMT;

implementation

Uses uSistema, uintegraback, uFuncaoGeral, uDataBase, dBaseDados, uMensErro,
     uDocumento, uLancContab;

{$R *.DFM}

procedure TFrmBaixaCPMFMT.CkbArredondaClick(Sender: TObject);
Var
  sSql :String;
begin
  inherited;
  GbLancaAjuste.Enabled := CkbArredonda.Checked;

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
                                   '       (R.CODTIPRECDES     = T.CODTIPRECDES) ' +
                                   ' ORDER BY T.DESCRICAO';
        SQLTipoRD.Open;

        if CdsTipoRd.IsEmpty then
        begin
           SQLTipoRD.SQL.Text :=  'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, DESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO, HITCODHIST ' +
                                  'FROM TIPORECEBDESEMB WHERE (ANASINT = ''A'') AND (RECPAG = ''' + IntegraBack.RecPag +
                                  ''') AND (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ORDER BY DESCRICAO';
           SQLTipoRD.Open;
        end;
     end;
        
     MontaCentroDeCusto;
  end;
end;

procedure TFrmBaixaCPMFMT.MontaCentroDeCusto;
var
  sSql :string;
begin
  //Se não Integrar com a contabilidade pega todos os CC ativos;
  //Se a contabil do TD não obriga CC pega todos os CC ativos;
  //Se a contabil do TD obriga CC pega os CC do conas x CC;
  //Se a contabil do TD estiver vazia pega da TRDxCCxCONTAxPLANO
  //   sem considerar a CONTA e considerando o programa caso Informado;

  dblcTipoRD.LookupValue := dblcTipoRD.LookupValue;

  if (IntegraBack.Contabilidade <> 'S') then
  begin
     SQLCentroCusto.SQL.Text := 'SELECT DISTINCT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE ATIVO = ''S'' AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' ORDER BY CODCENTROCUSTO, STATUSGRUPOCDC DESC';
     SQLCentroCusto.Open;
  end
  else
  begin
     if not CdsTipoRD.FieldByName('PLACONTA').IsNull then
     begin
       SQL.SQL.Text := 'SELECT PLACCUST FROM PLANOCONTA WHERE PLANO = ' + IntToStr(IntegraBack.Plano) +
                                  ' AND PLACONTA = ''' + Trim(CdsTipoRD.FieldByName('PLACONTA').AsString) + '''';
       SQL.Open;

       if Cds.FieldByName('PLACCUST').AsString = 'S' then
          sSql := 'SELECT DISTINCT CENT.CODCENTROCUSTO,CENT.NOME, CENT.STATUSGRUPOCDC, CENT.IDPROGRAMA FROM CENTCUST CENT '+
                          'WHERE CENT.ATIVO = ''S'' AND CODCENTROCUSTO IN (SELECT CODCENTROCUSTO FROM CONTASxCC CONT '+
                          'WHERE CONT.IDEMPRESA = CENT.IDEMPRESA   AND '+
                          '      CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO   AND ' +
                          '      CONT.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa) + ' AND ' +
                          '      CONT.PLANO = ' + InttoStr(IntegraBack.Plano) + ' AND ' +
                          '      RTRIM(CONT.PLACONTA) = '''+ Trim(CdsTipoRD.FieldByName('PLACONTA').AsString) + ''') ORDER BY CENT.CODCENTROCUSTO, CENT.STATUSGRUPOCDC DESC'
       else
          sSql := 'SELECT DISTINCT CODCENTROCUSTO,NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE ATIVO = ''S'' AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' ORDER BY CODCENTROCUSTO, STATUSGRUPOCDC DESC';

       SQLCentroCusto.SQL.Text := sSql;
       SQLCentroCusto.Open;

       if Not CdsCentroCusto.IsEmpty then
       begin
         if (not CdsCentroRespon.FieldByName('CODCENTROCUSTO').IsNull) Then 
         begin
           if CdsCentroCusto.Locate('CODCENTROCUSTO', CdsCentroRespon.FieldByName('CODCENTROCUSTO').AsString,[]) then
           begin
             CmbCentCusto.LookupValue      := CdsCentroRespon.FieldByName('CODCENTROCUSTO').AsString;
             CmbCentCusto.DisplayValue     := CdsCentroCusto.FieldByName('NOME').AsString;
           end
           else
             CmbCentCusto.Clear;
         end
         else
         begin
           if (CmbCentCusto.Text <> '') then
           begin
             CmbCentCusto.LookupValue      := CdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
             CmbCentCusto.DisplayValue     := CdsCentroCusto.FieldByName('NOME').AsString;
           end;
         end;
       end
       else
       begin
         SQLCentroCusto.SQL.Text := 'SELECT DISTINCT CODCENTROCUSTO,NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE 1=2';
         SQLCentroCusto.Open;

         if (CmbCentCusto.Text <> '') then
         begin
           CmbCentCusto.LookupValue      := CdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
           CmbCentCusto.DisplayValue     := CdsCentroCusto.FieldByName('NOME').AsString;
         end
         else
           CmbCentCusto.Clear;
       end;
     end
     else
     begin
       sSql := ' SELECT DISTINCT C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC, C.IDPROGRAMA FROM TIPORDXCCXCONTA T, CENTCUST C WHERE C.ATIVO = ''S'' AND ' +
                                      ' (T.RECPAG = ''' + IntegraBack.RecPag + ''') AND ' +
                                      ' (T.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND  ' +
                                      ' (RTRIM(T.CODTIPRECDES) = ''' + Trim(dblcTipoRD.LookupValue) + ''') AND ' +
                                      FuncaoGeral.Decode(CmbPrograma.LookupValue,'','',' (T.IDPROGRAMA = ' +  CmbPrograma.LookupValue + ') AND ') +
                                      ' (T.IDPESSOA = C.IDEMPRESA) AND  ' +
                                      ' (C.CODCENTROCUSTO = T.CODCENTROCUSTO) ORDER BY C.CODCENTROCUSTO, C.STATUSGRUPOCDC DESC';

       SQLCentroCusto.SQl.Text := sSql;
       SQLCentroCusto.Open;

       if CdsCentroCusto.IsEmpty then
       begin
          SQLCentroCusto.SQl.Text := 'SELECT DISTINCT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE ATIVO = ''S'' AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' ORDER BY CODCENTROCUSTO, STATUSGRUPOCDC DESC';
          SQLCentroCusto.Open;

          if (CmbCentCusto.Text <> '') then
          begin
            CmbCentCusto.LookupValue      := CdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
            CmbCentCusto.DisplayValue     := CdsCentroCusto.FieldByName('NOME').AsString;
          end
          else
            CmbCentCusto.Clear;
       end;
     end;
  end;
end;


procedure TFrmBaixaCPMFMT.dblcTipoRDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  MontaCentroDeCusto;
end;

procedure TFrmBaixaCPMFMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := MrCancel;
end;

procedure TFrmBaixaCPMFMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If CkbArredonda.Checked And
     ((dblcTipoDoc.Text = '') Or
      (dblcUnidNegoc.Text = '') Or
      (dblcCentroRespon.Text = '') Or
      (dblcTipoRD.Text = '') Or
      (CmbCentCusto.Text = '') Or
      (dbeValorDet.Text = '') Or
      (CmbPatro.Text = '') Or
      (CmbPlano.Text = '') Or
      (CmbPrograma.Text = '')) Then
      MsgDlg('Todos os Dados são obrigatórios para o lançamento do Arredondamento da CPMF','Atenção',MtInformation,[MbOk],0)
  Else
     If (DtProgBaixaF.Text = '') Then
        MsgDlg('Favor Informar a Data Programada de Baixa da CPMF','Atenção',MtInformation,[MbOk],0)
     Else
     Begin
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
     End;
end;

function TFrmBaixaCPMFMT.LancaDocumento: LongInt;
Var
  iNumLancto :Integer;
  sDebCre, sMens, sContaD, sContaCliFor, sCCustoCliFor, sUnidNegocCliFor: String;
  liEmpresa, liExercicio, liPeriodo, iPlnCodigo, iPlnCodigoP, iSubContaCliFor: LongInt;
  rValorLancto: Double;
begin
  Result := -1;
  If CkbArredonda.Checked Then
  Begin
      sContaCliFor := '';
      sCCustoCliFor := '';
      sUnidNegocCliFor := '';

      With TwwQuery.Create(nil) Do
        Try
          DataBaseName := 'BaseDados';
          Sql.Text := 'SELECT CONTACFORN, CODCENTROCUSTO, UNIDNEGOC, CODSUBCONTA FROM EMPRESAFORN WHERE IDFORCLI = ' + IntToStr(Idfavorecido) + ' AND IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
          Open;

          sContaCliFor := Fields[0].AsString;
          sCCustoCliFor := Fields[1].AsString;
          sUnidNegocCliFor := IntToStr(Fields[2].AsInteger);
          iSubContaCliFor := Fields[3].AsInteger;

          Close;
        finally
          free;
        end;

      NumDocLancado := Documento.GetCodigo(nil);

      if NumDocLancado <= 0 then
        raise EDataBaseError.Create('Não Foi Possível Gerar CodDocumento.');

      {
      Invertendo o lanctodocum e gravando sempre positivo:
      
      rValorLancto := Abs(dbeValorDet.Value);

      If dbeValorDet.Value < 0 Then
      Begin
         If qryTipoDocDEBCRE.AsString = 'D' Then
            sDebCre := 'C'
         Else
            sDebCre := 'D';
      End
      Else
         sDebCre := qryTipoDocDEBCRE.AsString;

      }

      rValorLancto := dbeValorDet.Value;
      sDebCre := CdsTipoDoc.FieldByName('DEBCRE').AsString;
      
      //Contabiliza Documento
      iPlnCodigo := 0;
      if IntegraBack.Contabilidade = 'S' then begin
         liEmpresa := Sistema.idEmpresa;
         if TestaPeriodo(true,'BaseDados',DtProgBaixaF.Text,IntToStr(Sistema.idModulo),
                      liExercicio,liPeriodo,liEmpresa,sMens) <> 0 then Abort;
         sContaD := Documento.BuscaContaContabil(StrToInt(CmbPrograma.LookupValue),
                    dblcTipoRD.LookupValue,CmbCentCusto.LookupValue);

         iPlnCodigo := LancaContab(true,'BaseDados', DtProgBaixaF.Text,IntToStr(Sistema.idModulo),'2',
                     sDebCre,'','','','','','','','','','',FloatToStr(NumDocLancado),
                     'ARREDONDAMENTO DE CPMF','','','','','03',CmbCentCusto.LookupValue,
                     sContaD,sCCustoCliFor, sContaCliFor,liExercicio, liPeriodo,
                     liEmpresa,Sistema.idUsuario,IntegraBack.Plano, rValorLancto,0,
                     0,0,0,0,0,0,0,dblcUnidNegoc.LookupValue,false,0,0,IntToStr(iSubContaCliFor),
                     IntToStr(iSubContaCliFor),'','',iPlnCodigo,sMens,IntegraBack.MascaraPlano,
                     true,0,StrToInt(CmbPlano.LookupValue),StrToInt(CmbPatro.LookupValue),
                     Sistema.UsaPlanoPatro);

         if iPlnCodigo <= 0 then
            Abort;
      end;
      if iPlnCodigo > 0 then
         iPlncodigoP := iPlnCodigo
      else
         iPlncodigoP := -1;
      //Lança Documento

      Result := NumDocLancado;

      Documento.Inserir(
        QryAux,
        NumDocLancado,
        IntToStr(Sistema.IdModulo),
        InttoStr(InteGraBack.Plano),
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
        -1,-1,-1);

      //Cria Lançamento
      iNumLancto := Documento.GerarNumLancto(nil, NumDocLancado);

      if iNumLancto <= 0 then
        raise EDataBaseError.Create('Não Foi Possível Gerar NumLancto.');

      if iPlnCodigo > 0 then
        iPlnCodigoP := iPlnCodigo
      else
        iPlnCodigoP := -1;

      Documento.CriarLanctoDoc(
        QryAux,
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
        Copy(Trim(EdtHistorico.Text),1,40),
        Sistema.idUsuario,
        False,
        -1,
        '');

      //Lança Rateio
      Documento.Rateio.Inserir(
        NumDocLancado,
        dblcTipoRD.LookupValue,
        IntegraBack.RecPag,
        dblcCentroRespon.LookupValue,
        Sistema.IdEmpresa,
        dbeValorDet.Value,
        0,
        Sistema.IdUsuario,
        StrToInt(dblcUnidNegoc.lookupvalue),
        0,
        CmbCentCusto.lookupvalue,
        StrToFloat(CmbPatro.lookupvalue),
        StrToFloat(CmbPrograma.lookupvalue),
        StrToFloat(CmbPlano.lookupvalue));

  End;
end;

end.

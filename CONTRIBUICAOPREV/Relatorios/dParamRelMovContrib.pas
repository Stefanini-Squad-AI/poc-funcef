// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Darivaldo Alencar
// SOL.253577/18061 ppm.1238748
// Data        : 15.02.2016
// Alteração   : Desenvolvimento do form - dParamRelMovContrib  para gerar
// movimentação de contribuição
// -----------------------------------------------------------------------------
unit dParamRelMovContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppModule, raCodMod, uMensErro, ppParameter, FAguarde,
  daDataModule,CheckLst,IniFiles, ppStrtch, ppMemo,uSistema;

type
   TTipoTotal           = ( ttEsperado, ttAlterador, ttRecebido );
   TTipoFiltro          = ( tpPrefixo , tpData );
  TdtmParamRelMovContrib = class(TdtmReports)
    qryRel: TwwQuery;
    dsRel: TwwDataSource;
    pplRel: TppBDEPipeline;
    rpRel: TppReport;
    ppParameterList1: TppParameterList;
    qryRelGRUPO: TFloatField;
    qryRelPRIMEIRO: TStringField;
    qryRelSITRECEBIMENTO: TStringField;
    qryRelMATRICULA: TStringField;
    qryRelNODOCUMENTO: TFloatField;
    qryRelCONTRIBUICAO: TStringField;
    qryRelMESREFERENCIA: TStringField;
    qryRelMESCOBRANCA: TStringField;
    qryRelDATAPREVISAORECE: TDateTimeField;
    qryRelDATARECEBIMENTO: TDateTimeField;
    qryRelNOME: TStringField;
    qryRelVALORRECEBIDO: TFloatField;
    qryRelFLGDEVOLUCAO: TFloatField;
    qryRelIDPLANPREVCONTAB: TFloatField;
    qryRelIDPLANOPREV: TFloatField;
    qryRelVALORESPERADO: TFloatField;
    qryRelTRGDTINCLUSAO: TDateTimeField;
    qryRelNUMRECEBIMENTO: TFloatField;
    qryRelNUMRECEBIMENTOPAI: TFloatField;
    qryRelTRGDTALTERACAO: TDateTimeField;
    qryRelDTCOBRANCA: TDateTimeField;
    qryRelDATAEMISSCOB: TDateTimeField;
    qryRelSOMAALTERADORES: TFloatField;
    qryRelTOTALRECEBIDO: TFloatField;
    qryRelFORMARECEBIMENTO: TStringField;
    raCodeModule1: TraCodeModule;
    ppParameterList2: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    LabTituloDataBase: TppLabel;
    LabTituloPatrocinadoras: TppLabel;
    LabTituloAnoMesReferencia: TppLabel;
    LabPeriodoReferencia: TppLabel;
    LabPatrocinadoras: TppLabel;
    ppLabel37: TppLabel;
    ppImage2: TppImage;
    ppLabel16: TppLabel;
    ppLabel28: TppLabel;
    ppLabel41: TppLabel;
    lbl_Titulo: TppLabel;
    LabDatabase: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine16: TppLine;
    ppDBText2: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppDBText8: TppDBText;
    ppLine15: TppLine;
    ppLine17: TppLine;
    ppLine19: TppLine;
    ppDBText10: TppDBText;
    ppLine20: TppLine;
    ppLine23: TppLine;
    ppDBText12: TppDBText;
    ppLine29: TppLine;
    LabDataOriginal: TppLabel;
    LabSituacaoAtual: TppLabel;
    ppDBText6: TppDBText;
    ppLine14: TppLine;
    ppLine31: TppLine;
    ppDBMemo2: TppDBMemo;
    ppDBText1: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLine34: TppLine;
    ppLabel12: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    lbl_Rodape: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    LabTotalEsp: TppLabel;
    LabTotalAlt: TppLabel;
    labTotalRecebido: TppLabel;
    ppLabel27: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    LinhaSuperiorHeader: TppLine;
    LinhaHeaderEsquerda: TppLine;
    LinhaDireita: TppLine;
    ppLabGrupo: TppLabel;
    LinhaInferiorHeader: TppLine;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppLine2: TppLine;
    ppLabel9: TppLabel;
    ppLine3: TppLine;
    ppLabel10: TppLabel;
    ppLine4: TppLine;
    ppLabel11: TppLabel;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLabel14: TppLabel;
    ppLine18: TppLine;
    ppLabel4: TppLabel;
    ppLine21: TppLine;
    ppLabel5: TppLabel;
    ppLine22: TppLine;
    ppLabel18: TppLabel;
    ppLabel1: TppLabel;
    ppLine28: TppLine;
    ppLabel2: TppLabel;
    LabGrupo: TppLabel;
    ppLabel3: TppLabel;
    ppLine6: TppLine;
    ppLine30: TppLine;
    ppLabel6: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    procedure ppGroupHeaderBand1BeforeGenerate(Sender: TObject);
    procedure ppGroupFooterBand1BeforeGenerate(Sender: TObject);
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure ppHeaderBand1BeforeGenerate(Sender: TObject);

  private
    iValor               : Integer;
    sMatricula           : String;
    sNome                : String;
    sPeriodoCobranca     : String;
    sPeriodoReferencia   : String;
    dTotalPorPlano       : Double;
    dtADataBase          : TDate;
    dTotalRecebido       : Double;
    dTotalAlterador      : Double;
    dTotalEsperado       : Double;
    FidPlanPrev          : Integer;
    qryFiltro            : TwwQuery;
    FslTituloPlano       : TStringList;
    arDadosPatro         : Array of String;
    arDadosPlanos        : Array of String;
    arDadosSituacoes     : Array of String;
    arDadosContribuicoes : Array of String;
    Function iif(bCondicao: Boolean; SeVerdadeiro,SeFalso: Variant): Variant;
    Function LerStrings(strStringRead: String; intPosicao: Integer): String;
    Function GetDataInclusaoDaContribOriginal(sNumRecebimentoPai: String; sDataInclusao: String):String;
    Function LocalizouTitulo(idTitulo: integer; slLista: TStringList):Boolean;
    Function GetTitulo(idTitulo: integer; slLista: TStringList):string;
    Function GetPlanoPrev(intId: Integer): String;
    Function GetTotalPlano(intIdPlano: Integer; TipoDeTotal : TTipoTotal):Double;
    Function GetQryFiltro:TwwQuery;
    Function GetMatriculaNome(sMatricula: string):string;
    function TrataData(dt: TDate):tDate;

    function VerificaSeASituacaoEAtrasadaEJaTratada(sSituacao: String; dtBaseTela,dtTrgAlteracao: TDate ):String;

    { Verfica se possui data de recebimento }
    Function VerificaSeContribuicaoPossuiDataRecebimento(dtDataRecebimento: TDate):Boolean;

    { Verfica se possui data de cobrança }
    Function VerificaSeContribuicaoPossuiDataDeEmissaoDeCobranca(dtDataCobranca: TDate):Boolean;

    { Passar a data base e a data do recebimento, valor recebido e valor esperado }
    function VerificaSeADataBaseEMaiorOuIgualDataRecebimento( dtBaseTela,dtRecebimento : TDate; dValorRecebido,dValorEsperado: Double ): String;

    { Passar a data base e a data de cobrança }
    function VerificaSeADataBaseEMaiorOuIgualDataEmissaoCobranca(dtDataBase,dtEmissaoCobranca : TDate): String;

    { Passar data base e data de inclusão }
    Function VerificaSeADatabaseEMaiorQueDataDeInclusao(dtDataBase,dtDataInclusao: TDate):String;

    procedure CarregaDadosArray (oCheck: TCheckListBox );
    Procedure GravaDados(strSessao: String; strChave: String; strValor: String);
    procedure PosicionaTopELeft(lab1:TppLabel; dTop : Double; lab2: TppLabel = Nil);

    { Private declarations }
  public
    function MostraParam(Form: string): boolean; override;
    { Public declarations }
  published
    Property idPlanPrev   : Integer     Read FidPlanPrev;
    Property slTituloPlano: TStringList Read FslTituloPlano;
  end;

var
  dtmParamRelMovContrib: TdtmParamRelMovContrib;

implementation

uses FParamRelMovContrib;

{$R *.DFM}

Function TdtmParamRelMovContrib.GetMatriculaNome(sMatricula: string):string;
var
   sResult : string;
   aQry    : TwwQuery;
begin
  sResult := '';
  Try
    aQry := TwwQuery.Create(Self);
    aQry.DatabaseName := 'BaseDados';
    aQry.SQL.Clear;
    aQry.sql.Add(' SELECT P.NOME, E.MATRICULA FROM PESSOA P INNER JOIN ELEGPATRO E ON ');
    aQry.sql.Add('((P.IDPESSOA = E.IDPESSOA) AND (E.MATRICULA = '+ QuotedStr(sMatricula) + '))');
    aQry.Open;
    sResult   := aQry.FieldByName('MATRICULA').AsString + ' - ' + aQry.FieldByName('NOME').AsString;
    aQry.Close;
  Finally
    if Assigned(aQry) then
      FreeAndNil(aQry);
   end;
  Result := sResult;
end;


function TdtmParamRelMovContrib.iif(bCondicao: Boolean; SeVerdadeiro,
  SeFalso: Variant): Variant;
begin
  if bCondicao then
    Result := SeVerdadeiro
  else
    Result := SeFalso;
end;

procedure TdtmParamRelMovContrib.CarregaDadosArray(oCheck: TCheckListBox );
var
  iCount   : Integer;
  intIndice: Integer;
begin
  intIndice  := -1;
  { Limpa os arrays caso já tenham sido preenchidos }
       if oCheck.Name = 'chkListPatro' then
        begin
          if Length(arDadosPatro) > 0 then  Finalize(arDadosPatro);
        end
  else if oCheck.Name = 'chkListPlanos' then
    begin
      if Length(arDadosPlanos) > 0    then Finalize(arDadosPlanos);
    end
  else if oCheck.Name = 'chkListSituacoes' then
    begin
      if Length(arDadosSituacoes) > 0 then Finalize(arDadosSituacoes);
    end
  else
  begin
    if Length(arDadosContribuicoes) > 0 then Finalize(arDadosContribuicoes);
  end;


  For iCount := 0 to oCheck.Items.Count -1 do
    begin
      if oCheck.Checked[iCount] then
        begin
          Inc(intIndice);

                if oCheck.Name = 'chkListPatro' then
                   begin
                     SetLength(arDadosPatro,Length(arDadosPatro) + 1);
                     arDadosPatro[intIndice] := LerStrings(oCheck.Items[iCount],1);
                   end
           else if oCheck.Name = 'chkListPlanos' then
                   begin
                     SetLength(arDadosPlanos,Length(arDadosPlanos) + 1);
                     arDadosPLanos[intIndice] := LerStrings(oCheck.Items[iCount],1);
                   end
           else if oCheck.Name = 'chkListSituacoes' then
                   begin
                     SetLength(arDadosSituacoes,Length(arDadosSituacoes) + 1);
                     arDadosSituacoes[intIndice] := LerStrings(oCheck.Items[iCount],1);
                   end
           else begin
                     SetLength(arDadosContribuicoes,Length(arDadosContribuicoes) + 1);
                     arDadosContribuicoes[intIndice] := LerStrings(oCheck.Items[iCount],1);
                end;

        end;
    end;
end;


Procedure TdtmParamRelMovContrib.GravaDados(strSessao: String; strChave: String; strValor: String);
var
  iniArq  :  TIniFile;
begin
  iniArq := TInifile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\sSQL.ini');
  iniArq.WriteString(strSessao,strChave,strValor);
  iniArq.UpdateFile;
  iniArq.Free;
end;



//{Objetivo: Ler o item da String }
function TdtmParamRelMovContrib.LerStrings(strStringRead: String; intPosicao: Integer): String;
var
  slLoadString: TStringList;
begin
  slLoadString := TStringList.Create;
  slLoadString.CommaText := strStringRead;

  if intPosicao > slLoadString.Count - 1 then
    Result := ''
  else
    Result := slLoadString[intPosicao];

  FreeAndNil(slLoadString);
end;

function TdtmParamRelMovContrib.MostraParam(Form: string): boolean;
var
  bResult       : Boolean;
  Frm           : TForm;
  sSQL          : string;
  sNovoSQL      : string;
  sPeriodo      : string;
  sApresentacao : string;
  s2047         : string;
  s2048         : string;
  s2049         : string;
  slSql         : TStringList;
  function GetDadosArray(arIn: Array of String): String;
  var
    sResult : string;
    iCount  : Integer;
  begin
    sResult := '';

    For iCount := 0 to Length(arIn) -1 do
       if iCount = 0 then
         sResult := arIn[iCount] + ', '
       else
         sResult := sResult + arIn[iCount] +', ';

    if Length(Trim(sResult)) > 0 then
     sResult := Copy(sResult,1,Length(sResult) - 2);

    Result := sResult;
  end;

begin
   bResult := False;

   if (UPPERCASE(Form) = 'PARAMRELMOVCONTRIB') then
    begin
       frm := TParamRelMovContrib.Create(Self);
       if Frm.ShowModal = mrOk then
         begin
            bResult := True;         
            FidPlanPrev := 0;

            if Assigned(FslTituloPlano) then
              FreeAndNil(FslTituloPlano);

           { Período Referência }
           sPeriodoReferencia := TParamRelMovContrib(Frm).GetPeriodos(TParamRelMovContrib(Frm).CbMesInicio,TParamRelMovContrib(Frm).seAnoInicio.Value) + ' à '+ TParamRelMovContrib(Frm).GetPeriodos(TParamRelMovContrib(Frm).CbMesFim,TParamRelMovContrib(Frm).seAnoFim.Value);
           qryRel.SQL.Clear;
           qryRel.Params.Clear;
           qryRel.Fields.Clear;           
           iValor := TParamRelMovContrib(Frm).Selecao;
           sSQL   := TParamRelMovContrib(Frm).GetSQLImpressao(iValor);
           qryRel.Sql.Add(sSQL);

           { Usado no export do arquivo excel em fMostrarelat}
           slSql := TStringList.Create;
           slSql.Add(sSQL);
           slSql.SavetoFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\sqlResult.txt');
           FreeAndNil(slSql);

           frmAguarde.pbAguarde.Visible := False;
           frmAguarde.Mostra('Aguarde...'+chr(13)+'Filtrando dados de '+ sPeriodoReferencia);
           qryRel.Prepare;
           qryRel.Open;
           FrmAguarde.Apaga;
           FrmAguarde.pbAguarde.Visible := True;
           if qryRel.IsEmpty then
           begin
              qryRel.Close;
              qryRel.SQL.Clear;
              qryRel.Params.Clear;
              MsgDlg( 'Não existem dados a serem apresentados!', 'Atenção', mtWarning, [mbOk], 0)
           end else
           begin

             if Assigned(qryFiltro) then
                FreeAndNil(qryFiltro);

             sApresentacao := iif(TParamRelMovContrib(Frm).Selecao = 0,'Por Plano','Por Participante');

             dtADataBase := TParamRelMovContrib(Frm).DataBase;
             { Patrocinadoras, planos, situações, contribuições }
             CarregaDadosArray(TParamRelMovContrib(Frm).chkListPatro);
             CarregaDadosArray(TParamRelMovContrib(Frm).chkListPlanos);
             CarregaDadosArray(TParamRelMovContrib(Frm).chkListSituacoes);
             CarregaDadosArray(TParamRelMovContrib(Frm).chkListContribuicoes);

             { Matricula }
             GravaDados('Periodo do Relatorio','PeriodoCobranca','');
             GravaDados('Periodo do Relatorio','PeriodoReferencia',sPeriodoReferencia);
             GravaDados('Selecionados','Patro',GetDadosArray(arDadosPatro));
             GravaDados('Selecionados','PLanosContabeis',GetDadosArray(arDadosPlanos));
             GravaDados('Selecionados','SituacaoDosParticipantes',GetDadosArray(arDadosSituacoes));
             GravaDados('Selecionados','Contribuições',GetDadosArray(arDadosContribuicoes));
             GravaDados('Beneficiario','Matricula',TParamRelMovContrib(Frm).EdtMatricula.Text);
             GravaDados('Beneficiario','Nome',TParamRelMovContrib(Frm).EdtNome.Text);
             GravaDados('Tela','Datas',DateToStr(TParamRelMovContrib(Frm).DataBase));
             GravaDados('Tela','Apresentacao',sApresentacao);

             sMatricula := TParamRelMovContrib(Frm).EdtMatricula.Text;
             sNome      := TParamRelMovContrib(Frm).EdtNome.Text;


             sMatricula := TParamRelMovContrib(Frm).EdtMatricula.Text;
           end;

         end;
       qryRel.Close;
    end;
   Result := bResult;
end;

procedure TdtmParamRelMovContrib.PosicionaTopELeft(lab1:TppLabel; dTop : Double; lab2: TppLabel = Nil);
var
   dPosicao  : Double;
const
    dLefth_1 = 0.1979;
    dLefth_2 = 1.9479;
begin
  lab1.AutoSize := True;
  lab1.Left := dLefth_1;
  lab1.Top  := dTop;
  if Assigned(lab2) then
    begin
      lab2.Left := dLefth_2;
      lab2.Top  := dTop;
    end;
end;

Function TdtmParamRelMovContrib.GetPlanoPrev(intId: Integer): String;
var
   aQry    : TwwQuery;
   sResult : string;
begin
 sResult := '';
  try
    aQry := TwwQuery.Create(Self);
    aQry.DatabaseName := 'BaseDados';
    aQry.SQL.Clear;
    aQry.sql.Add(' SELECT PPC.NOME FROM PLANPREVCONTABIL PPC WHERE PPC.IDPLANOPREV = '+ IntToStr(intId));
    aQry.Open;
    sResult := aQry.FieldByName('NOME').AsString;
  finally
    if Assigned(aQry) then
      begin
       aQry.Close;
       FreeAndNil(aQry);
      end;
  end;
  Result := sResult;
end;


function TdtmParamRelMovContrib.GetDataInclusaoDaContribOriginal(sNumRecebimentoPai: String; sDataInclusao: String):String;
var
   aQry              : TwwQuery;
   sDataResult       : string;
   sNumRecebPaiClone : string;
   bTemPai           : Boolean;
begin
  sDataResult       := sDataInclusao;
  sNumRecebPaiClone := sNumRecebimentoPai;

  if Length(Trim(sNumRecebimentoPai)) > 0 then
    begin
      try
        aQry := TwwQuery.Create(Self);
        aQry.DatabaseName := 'BaseDados';
        bTemPai := True;
        while bTemPai do
          begin
             if aQry.Active then
               aQry.Close;

             aQry.sql.Clear;
             { passa nº do recebimentoPai para NumeroRecebimento, depois verifica se a linha possui numeroRecebimentoPai }
             aQry.SQL.Add('SELECT HST.TRGDTINCLUSAO, HST.NUMRECEBIMENTO, HST.NUMRECEBIMENTOPAI FROM HSTCONTRIBPREV HST WHERE HST.NUMRECEBIMENTOPAI = ' + sNumRecebPaiClone);
             aQry.Open;
             if not aQry.IsEmpty then
               begin
                 aQry.Close;
                 aQry.sql.Clear;
                 aQry.SQL.Add('SELECT HST.TRGDTINCLUSAO, HST.NUMRECEBIMENTO, HST.NUMRECEBIMENTOPAI FROM HSTCONTRIBPREV HST WHERE HST.NUMRECEBIMENTO = ' + sNumRecebPaiClone);
                 aQry.Open;
                 if Length(Trim(aQry.FieldByName('NUMRECEBIMENTOPAI').AsString)) = 0 then
                   begin
                     bTemPai := False;
                     sDataResult       := DateToStr(aQry.FieldByName('TRGDTINCLUSAO').AsDateTime);
                   end else
                   sNumRecebPaiClone := aQry.FieldByName('NUMRECEBIMENTO').AsString;
               end else
               begin
                 bTemPai := False;
                 sDataResult       := sDataInclusao;
               end;
          end;
        aQry.Close;
      finally
        if Assigned(aQry) then
          FreeAndNil(aQry);
      end;
    end;
    Result := sDataResult;
end;

function TdtmParamRelMovContrib.TrataData(dt: TDate):TDate;
var
   data: String;
begin
   data:= FormatDateTime('dd/mm/yyyy', dt);
   dt:= StrToDate(data);
   result:= dt;
end;

function TdtmParamRelMovContrib.VerificaSeASituacaoEAtrasadaEJaTratada(
  sSituacao: String; dtBaseTela, dtTrgAlteracao: TDate): String;
begin
  if trim(sSituacao) = trim('4')then
    Result := iif(TrataData(dtBaseTela) >= TrataData(dtTrgAlteracao),'Atrasada e já tratada','')
  else
    Result := '';
end;

function TdtmParamRelMovContrib.VerificaSeContribuicaoPossuiDataRecebimento(
  dtDataRecebimento: TDate): Boolean;
begin
  if TrataData(dtDataRecebimento) <> StrToDate('30/12/1899') then
    Result := True
  else
    Result := False;
end;

function TdtmParamRelMovContrib.VerificaSeContribuicaoPossuiDataDeEmissaoDeCobranca(
  dtDataCobranca: TDate): Boolean;
begin
 if TrataData(dtDataCobranca) <> StrToDate('30/12/1899') then
    Result := True
  else
    Result := False;
end;

function TdtmParamRelMovContrib.VerificaSeADataBaseEMaiorOuIgualDataRecebimento(
  dtBaseTela, dtRecebimento: TDate; dValorRecebido,dValorEsperado: Double ): String;
begin
   if TrataData(dtBaseTela) >= TrataData(dtRecebimento) then
      Result := iif(dValorRecebido <> dValorEsperado,'Recebida com divergência','Recebida corretamente')
   else
      Result := '';
end;

function TdtmParamRelMovContrib.VerificaSeADataBaseEMaiorOuIgualDataEmissaoCobranca(
  dtDataBase, dtEmissaoCobranca: TDate): String;
begin
   Result := iif(TrataData(dtDataBase) >= TrataData(dtEmissaoCobranca),'Enviada e não recebida',
   VerificaSeADatabaseEMaiorQueDataDeInclusao(dtADataBase,qryRel.FieldByName('TRGDTINCLUSAO').AsDatetime));
end;

function TdtmParamRelMovContrib.VerificaSeADatabaseEMaiorQueDataDeInclusao(dtDataBase, dtDataInclusao: TDate): String;
begin
   Result := iif(TrataData(dtDataBase) >= TrataData(dtDataInclusao),'Não enviada para cobrança','Contribuição Inexistente');
end;

procedure TdtmParamRelMovContrib.ppGroupHeaderBand1BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  Case iValor of
     0:begin
          if qryRel.Fields[0].DataType = FtString then
             LabGrupo.Caption := GetMatriculaNome(qryRel.FieldByName('MATRICULA').AsString)
          else
             LabGrupo.Caption := qryRel.FieldByName('NOME').AsString;
       end;
     1:   LabGrupo.Caption := sMatricula + ' - ' + sNome;
  end;



end;

function TdtmParamRelMovContrib.GetTotalPlano(intIdPlano: Integer;
  TipoDeTotal: TTipoTotal): Double;
var
  dValor   : Double;
  bNaoConta: Boolean;
begin
  bNaoConta := False;
  if not Assigned(qryFiltro)  then
     QryFiltro := GetQryFiltro;
     QryFiltro.Filtered := False;
     QryFiltro.Filter   := '(IDPLANPREVCONTAB = ' + IntToStr(intIdPlano)+')';
     QryFiltro.Filtered := True;
     dTotalPorPlano := 0;
  While not QryFiltro.Eof do
    begin
      case Integer(TipoDeTotal) of
         0:dValor := QryFiltro.FieldByName('VALORESPERADO').AsCurrency;
         1:dValor := QryFiltro.FieldByName('SOMAALTERADORES').AsCurrency;
         2:dValor := QryFiltro.FieldByName('TOTALRECEBIDO').AsCurrency;
      end;

      if dTotalPorPlano = 0 then
        begin
          dTotalPorPlano := dValor;
          bNaoConta      := True;
        end else
        bNaoConta := False;

      if Not bNaoConta then
          dTotalPorPlano := dTotalPorPlano + (dValor);
      QryFiltro.Next;
    end;
  Result := dTotalPorPlano;

end;

function TdtmParamRelMovContrib.GetQryFiltro: TwwQuery;
var
 qryResult: TwwQuery;
begin
   qryResult := TwwQuery.Create(Self);
   qryResult.DatabaseName := 'BaseDados';
   qryResult.SQL.Clear;

   qryResult.SQL.Add(qryRel.Sql.GetText);
   qryResult.Open;
   Result := qryResult;
end;


function TdtmParamRelMovContrib.LocalizouTitulo(idTitulo: Integer;slLista: TStringList): Boolean;
var
  bResult  : Boolean;
  intCount : Integer;
begin
  bResult := False;
  For intCount := 0 to slLista.Count -1 do
    begin
      if Copy(slLista[intCount],1,Pos('<%',slLista[intCount])-2) = IntToStr(idTitulo) then
        begin
          bResult := True;
          Break;
        end else
        Continue;
    end;
  Result := bResult;
end;

function TdtmParamRelMovContrib.GetTitulo(idTitulo: integer;
  slLista: TStringList): string;
var
  sResult  : String;
  intCount : Integer;
  sTitulo  : string;
begin
  sResult := '';
  For intCount := 0 to slLista.Count -1 do
    begin
      sTitulo := Copy(slLista[intCount],Pos('<%',slLista[intCount])+2,Length(slLista[intCount]));
      if Copy(slLista[intCount],1,Pos('<%',slLista[intCount])-1) = IntToStr(idTitulo) then
        begin
          sResult := sTitulo;
          Break;
        end else
        Continue;
    end;
  Result := sResult;
end;

procedure TdtmParamRelMovContrib.ppDetailBand1BeforeGenerate(
  Sender: TObject);
var
   sResult : string;
begin
  inherited;
  if qryRel.IsEmpty then
    begin
      LabSituacaoAtual.Caption := '';
      LabDataOriginal.Caption  := '';
      Exit;
    end;

    LabDataOriginal.Caption   := GetDataInclusaoDaContribOriginal(IntToStr(qryRel.FieldByName('NUMRECEBIMENTOPAI').AsInteger),DateToStr(qryRel.FieldByName('TRGDTINCLUSAO').AsDateTime));
    sResult := '';

   sResult := VerificaSeASituacaoEAtrasadaEJaTratada(qryRel.FieldByName('SITRECEBIMENTO').AsString,dtADataBase,StrToDate(DateToStr(qryRel.FieldByName('TRGDTALTERACAO').AsDateTime)));
    if Trim(sResult) = '' then
    begin
      if VerificaSeContribuicaoPossuiDataRecebimento(qryRel.FieldByName('DATARECEBIMENTO').AsDateTime) then
          begin
             sResult := VerificaSeADataBaseEMaiorOuIgualDataRecebimento( dtADataBase,qryRel.FieldByName('DATARECEBIMENTO').AsDateTime,qryRel.FieldByName('VALORRECEBIDO').AsFloat,qryRel.FieldByName('VALORESPERADO').AsFloat);
          end;
	 if sResult= '' then
	    begin
	         if VerificaSeContribuicaoPossuiDataDeEmissaoDeCobranca(qryRel.FieldByName('DATAEMISSCOB').AsDateTime) then
		      begin
			 sResult:= VerificaSeADataBaseEMaiorOuIgualDataEmissaoCobranca(dtADataBase,qryRel.FieldByName('DATAEMISSCOB').AsDateTime);
                      end
		      else
		        begin
			  sResult := VerificaSeADatabaseEMaiorQueDataDeInclusao(dtADataBase,qryRel.FieldByName('TRGDTINCLUSAO').AsDatetime);
                        end;
		end;
	end;
  LabSituacaoAtual.Caption := sResult;
end;

procedure TdtmParamRelMovContrib.ppGroupFooterBand1BeforeGenerate( Sender: TObject);
begin
  inherited;
     if ((idPlanPrev <> qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger) and (qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger > 0 )) then
         begin
            FidPlanPrev              :=  qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger;
            LabTotalEsp.Caption      :=  FormatFloat('#,#0.00',GetTotalPlano(qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger,ttEsperado));
            LabTotalAlt.Caption      :=  FormatFloat('#,#0.00',GetTotalPlano(qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger,ttAlterador));
            labTotalRecebido.Caption :=  FormatFloat('#,#0.00',GetTotalPlano(qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger,ttRecebido));
          end
end;

procedure TdtmParamRelMovContrib.ppHeaderBand1BeforeGenerate(
  Sender: TObject);
Const
    dLinha   = 0.1562;
    oHeigth  = 0.1283;
var
   iCount       : Integer;
   iSubCount    : Integer;
   dTop         : Double;
   dHeigtPadrao : Double;
   sLength      : string;
   bResult      : Boolean;
   sLinhaTeste  : string;
   intCalcPos   : Integer;
   intCalcFat   : Integer;
   bMudou       : Boolean;

   Function MudouLinha(labVer : TppLabel; var sLinha : String; var intPosicao,intFator: Integer ): Boolean;
   begin
      bResult := False;
      labVer.Width := 9.1458;
      if ( Length(Trim(sLinha)) = 0) and ( Length(labVer.Caption) >= 200 ) then
        begin
           labVer.Height := labVer.Height + oHeigth;
           sLinha := labVer.Caption;
           intPosicao := 200; { começa com 0  }
           Inc(intFator);     { Ccomeça com 1 }
           bResult := True;
        end else
        begin
          if Length(sLinha) > 0 then
          begin
            sLinha := Copy(labVer.Caption,intPosicao + 1,200);
            if Length(sLinha) = 200 then
              begin
                labVer.Height := labVer.Height + oHeigth;
                intPosicao := intPosicao * intFator;
                Inc(intFator);
                bResult := True;
              end;
          end;
        end;
       Result := bResult;
   end;
begin
  inherited;
  { identificando o grupo }
  ppLabGrupo.Caption := iif(qryRel.Fields[0].DataType = ftFloat,'Matricula','Plano Contábil');
  dTop         := 1.2708;
  { Sempre tem esse valor }
  if Length(Trim(sPeriodoReferencia)) > 0 then
    begin
      dTop := dTop + dLinha;
      PosicionaTopELeft(LabTituloAnoMesReferencia,dTop,LabPeriodoReferencia,);
      LabTituloAnoMesReferencia.Caption := 'Ano/Mês Inclusão : ';
      LabPeriodoReferencia.Caption      := sPeriodoReferencia;
    end else
    begin
      LabTituloAnoMesReferencia.Caption := '';
      LabPeriodoReferencia.Caption      := '';
    end;

  { Carregando os captions do título }
  For iCount := 0 to 1 do
    begin
      Case iCount of
        0: begin
             bMudou := False;
             dTop := dTop + dLinha;
             sLinhaTeste := '';
             intCalcPos := 0;
             intCalcFat := 1;
             PosicionaTopELeft(LabTituloPatrocinadoras,dTop,LabPatrocinadoras);
             dHeigtPadrao := LabPatrocinadoras.Height;
             For iSubCount := 0 to Length(arDadosPatro) - 1 do
               begin
                 if iSubCount = 0 then
                    LabPatrocinadoras.Caption := arDadosPatro[iSubCount]
                 else
                   LabPatrocinadoras.Caption := LabPatrocinadoras.Caption +', '+arDadosPatro[iSubCount];

                 application.processmessages;
                 if MudouLinha(LabPatrocinadoras, sLinhaTeste, intCalcPos, intCalcFat) then
                   begin
                      dTop   := dTop + dLinha;
                      bMudou := True;
                   end;
               end;
               if not bMudou then
                 dTop := dTop + dLinha;
           end;
        1:begin
             { Data Base }
             LabDatabase.Caption       := DateToStr(dtADataBase);
             if Length(Trim(LabDatabase.Caption)) > 0 then
               PosicionaTopELeft(LabTituloDataBase,dTop,LabDatabase);
          end;
      end;
    end;
end;



end.

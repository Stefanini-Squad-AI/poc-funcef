// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Darivaldo Alencar
// SOL.253577/18061 ppm.1238748
// Data        : 15.02.2016
// Alteração   : Conclusão deste Modulo de Relatórios  dParamRelFinanc  para
// gerar relatorio de movimentação financeira 
// -----------------------------------------------------------------------------

unit dParamRelFinanc;
                                                                  
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppModule, raCodMod, uMensErro, ppParameter, FAguarde,
  daDataModule,CheckLst,IniFiles, ppStrtch, ppMemo, ppRichTx,uSistema;

type
  TdtmParamRelFinanc = class(TdtmReports)
    qryRel: TwwQuery;
    dsRel: TwwDataSource;
    pplRel: TppBDEPipeline;
    rpRel: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel16: TppLabel;
    ppLabel28: TppLabel;
    ppLabel37: TppLabel;
    ppLabel41: TppLabel;
    lbl_Titulo: TppLabel;
    ppImage2: TppImage;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    LinhaDetail_0: TppLine;
    LinhaDetail_1: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    LinhaDetail_2: TppLine;
    LinhaDetail_3: TppLine;
    LinhaDetail_4: TppLine;
    LinhaDetail_6: TppLine;
    ppDBText7: TppDBText;
    LinhaDetailBase: TppLine;
    LinhaDetail_11: TppLine;
    LinhaDetail_8: TppLine;
    ppDBText10: TppDBText;
    LinhaDetail_9: TppLine;
    LinhaDetail_10: TppLine;
    ppDBText12: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    LabTituloAnoMesCobranca: TppLabel;
    LabTituloAnoMesReferencia: TppLabel;
    LabTituloPatrocinadoras: TppLabel;
    LinhaSuperiorHeader: TppLine;
    LinhaHeaderEsquerda: TppLine;
    LinhaDireita: TppLine;
    ppLabel7: TppLabel;
    LinhaInferiorHeader: TppLine;
    LinhaHeaderTitulo_0: TppLine;
    ppLabel8: TppLabel;
    LinhaHeaderTitulo_1: TppLine;
    ppLabel9: TppLabel;
    LinhaHeaderTitulo_2: TppLine;
    ppLabel10: TppLabel;
    LinhaHeaderTitulo_3: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine6: TppLine;
    ppLabel13: TppLabel;
    LabPeriodoCobranca: TppLabel;
    LabPeriodoReferencia: TppLabel;
    LabTituloMatricula: TppLabel;
    LabMatricula: TppLabel;
    ppLine18: TppLine;
    ppLabel1: TppLabel;
    ppLine21: TppLine;
    ppLabel2: TppLabel;
    ppLine22: TppLine;
    ppLabel4: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLabel5: TppLabel;
    ppLine26: TppLine;
    ppLine27: TppLine;
    LabTotalPlano: TppLabel;
    LabPatrocinadoras: TppLabel;
    ppLine59: TppLine;
    ppDBText11: TppDBText;
    raCodeModule1: TraCodeModule;
    ppDBMemo1: TppDBMemo;
    LabPlanoPrev: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    lbl_Rodape: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    qryRelSITRECEBIMENTO: TStringField;
    qryRelMATRICULA: TStringField;
    qryRelNODOCUMENTO: TFloatField;
    qryRelCONTRIBUICAO: TStringField;
    qryRelMESREFERENCIA: TStringField;
    qryRelMESCOBRANCA: TStringField;
    qryRelDATAPREVISAORECE: TDateTimeField;
    qryRelDATARECEBIMENTO: TDateTimeField;
    qryRelVALORRECEBIDO: TFloatField;
    qryRelNOME: TStringField;
    qryRelIDPLANPREVCONTAB: TFloatField;
    qryRelIDPLANOPREV: TFloatField;
    qryRelVALORESPERADO: TFloatField;
    qryRelSOMAALTERADORES: TFloatField;
    qryRelTOTALRECEBIDO: TFloatField;
    qryRelFORMARECEBIMENTO: TStringField;
    ppLine2: TppLine;
    ppLine3: TppLine;
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppGroupFooterBand1BeforeGenerate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppGroupHeaderBand1BeforeGenerate(Sender: TObject);

  private
    sMatricula           : String;
    sNome                : String;
    sPeriodoCobranca     : String;
    sPeriodoReferencia   : String;
    dTotalPorPlano       : Double;
    sContribuicao        : String;
    FidPlanPrev          : Integer;
    FslTituloPlano       : TStringList;
    qryFiltro            : TwwQuery;
    arDadosPatro         : Array of String;
    arDadosPlanos        : Array of String;
    arDadosSituacoes     : Array of String;
    arDadosContribuicoes : Array of String;
    Function iif(bCondicao: Boolean; SeVerdadeiro,SeFalso: Variant): Variant;
    Function LerStrings(strStringRead: String; intPosicao: Integer): String;
    Function GetDataInclusaoDaContribOriginal(sNumRecebimentoPai: String; dtDataInclusao: TDate):String;
    Function GetPlanoPrev(intId: Integer):String;
    Function GetTotalPlano(intIdPlano: Integer):Double;
    function GetQryFiltro:TwwQuery;
    Function LocalizouTitulo(idTitulo: integer; slLista: TStringList):Boolean;
   

    procedure CarregaDadosArray (oCheck: TCheckListBox );
    Procedure GravaDados(strSessao: String; strChave: String; strValor: String);
    procedure PosicionaTopELeft(lab1:TppLabel; dTop : Double; lab2: TppLabel = Nil);

    { Private declarations }
  public
    function MostraParam(Form: string): boolean; override;
  published
     Property idPlanPrev   : Integer     Read FidPlanPrev;
     Property slTituloPlano: TStringList Read FslTituloPlano;

    { Public declarations }
  end;

var
  dtmParamRelFinanc: TdtmParamRelFinanc;
  DLinha           : Double;

implementation

uses FParamRelFinanc;

{$R *.DFM}

{ TdtmParamRelFinanc }

procedure TdtmParamRelFinanc.CarregaDadosArray(oCheck: TCheckListBox );
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

function TdtmParamRelFinanc.iif(bCondicao: Boolean; SeVerdadeiro,
  SeFalso: Variant): Variant;
begin
  if bCondicao then
    Result := SeVerdadeiro
  else
    Result := SeFalso;
end;



Procedure TdtmParamRelFinanc.GravaDados(strSessao: String; strChave: String; strValor: String);
var
  iniArq  :  TIniFile;
begin
  iniArq := TInifile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\sSQL.ini');
  iniArq.WriteString(strSessao,strChave,strValor);
  iniArq.UpdateFile;
  iniArq.Free;
end;


//{Objetivo: Ler o item da String }
function TdtmParamRelFinanc.LerStrings(strStringRead: String; intPosicao: Integer): String;
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

function TdtmParamRelFinanc.MostraParam(Form: string): boolean;
var
  bResult : Boolean;
  Frm     : TForm;
  sSQL    : string;
  sNovoSQL: string;
  sPeriodo: string;
  s2047   : string;
  s2048   : string;
  slSQL   : TStringList;
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

   if (UPPERCASE(Form) = 'PARAMRELFINANC') then
    begin
      frm := TParamRelFinanc.Create(Self);
      if Frm.ShowModal = mrOk then
        begin
          bResult := True;
          FidPlanPrev := 0;

          if Assigned(FslTituloPlano) then
            FreeAndNil(FslTituloPlano);

          { Carrega período de cobrança }
          sPeriodoCobranca := TParamRelFinanc(Frm).EdtCobranca1.Text + ' à ' + TParamRelFinanc(Frm).EdtCobranca2.Text;
          { Período Referência }

          if Length(Trim(TParamRelFinanc(Frm).FiltraTexto(TParamRelFinanc(Frm).EdtReferencia1.Text,tpData))) > 0 then
             sPeriodoReferencia := TParamRelFinanc(Frm).EdtReferencia1.Text + ' à ' + TParamRelFinanc(Frm).EdtReferencia2.Text
          else
             sPeriodoReferencia := '';

          qryRel.SQL.Clear;
          qryRel.Params.Clear;
          sSQL := TParamRelFinanc(Frm).GetSQLImpressao;
          qryRel.Sql.Add(sSQL);

          { Usado no export do arquivo excel em fMostrarelat}
          slSql := TStringList.Create;
          slSql.Add(sSQL);
          slSql.SavetoFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\sqlResult.txt');
          FreeAndNil(slSql);

          frmAguarde.pbAguarde.Visible := False;
          frmAguarde.Mostra('Aguarde...'+chr(13)+'Filtrando dados de '+ sPeriodoCobranca);

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

            { Patrocinadoras, planos, situações, contribuições }
            CarregaDadosArray(TParamRelFinanc(Frm).chkListPatro);
            CarregaDadosArray(TParamRelFinanc(Frm).chkListPlanos);
            CarregaDadosArray(TParamRelFinanc(Frm).chkListSituacoes);
            CarregaDadosArray(TParamRelFinanc(Frm).chkListContribuicoes);

            { Matricula }
            GravaDados('Periodo do Relatorio','PeriodoCobranca',sPeriodoCobranca);
            GravaDados('Periodo do Relatorio','PeriodoReferencia',sPeriodoReferencia);
            GravaDados('Selecionados','Patro',GetDadosArray(arDadosPatro));
            GravaDados('Selecionados','PLanosContabeis',GetDadosArray(arDadosPlanos));
            GravaDados('Selecionados','SituacaoDosParticipantes',GetDadosArray(arDadosSituacoes));
            GravaDados('Selecionados','Contribuições',GetDadosArray(arDadosContribuicoes));
            GravaDados('Beneficiario','Matricula',TParamRelFinanc(Frm).EdtMatricula.Text);
            GravaDados('Beneficiario','Nome',TParamRelFinanc(Frm).EdtNome.Text);
            sMatricula := TParamRelFinanc(Frm).EdtMatricula.Text;
            sNome      := TParamRelFinanc(Frm).EdtNome.Text;
            sMatricula := TParamRelFinanc(Frm).EdtMatricula.Text;
          end;

        end;
         qryRel.Close;
     end;
   Result := bResult;
end;

procedure TdtmParamRelFinanc.PosicionaTopELeft(lab1:TppLabel; dTop : Double; lab2: TppLabel = Nil);
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

procedure TdtmParamRelFinanc.ppHeaderBand1BeforePrint(Sender: TObject);
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
  dTop         := 1.2396;
  { Sempre tem esse valor }

  LabPeriodoCobranca.Caption := sPeriodoCobranca;
  if Length(Trim(sPeriodoReferencia)) > 0 then
    begin
      dTop := dTop + dLinha;
      PosicionaTopELeft(LabTituloAnoMesReferencia,dTop,LabPeriodoReferencia,);
      LabTituloAnoMesReferencia.Caption := 'Ano/Mês Referência : ';
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
             { Matricula }
             LabMatricula.Caption       := sMatricula;
             if Length(Trim(LabMatricula.Caption)) > 0 then
               begin
                 PosicionaTopELeft(LabTituloMatricula,dTop,LabMatricula);
                 LabTituloMatricula.Caption := iif(Length(Trim(LabMatricula.Caption)) > 0,'Matrícula :','');
                 LabMatricula.Caption := LabMatricula.Caption + ' - ' + sNome;
               end else
               begin
                 LabTituloMatricula.Caption := '';
                 LabMatricula.Caption       := '';
               end;
          end;
      end;

    end;
end;

function TdtmParamRelFinanc.GetDataInclusaoDaContribOriginal(sNumRecebimentoPai: String; dtDataInclusao: TDate):String;
var
   aQry              : TwwQuery;
   sDataResult       : string;
   sNumRecebPaiClone : string;
   bTemPai           : Boolean;
begin
  sDataResult       := DateToStr(dtDataInclusao);
  sNumRecebPaiClone := sNumRecebimentoPai;

  if Length(Trim(sNumRecebimentoPai)) > 0 then
    begin
      try
        aQry := TwwQuery.Create(Self);
        aQry.DatabaseName := 'BaseDados';
        { passa nº do recebimentoPai para NumeroRecebimento, depois verifica se a linha possui numeroRecebimentoPai }
        aQry.SQL.Add('SELECT HST.TRGDTINCLUSAO, HST.NUMRECEBIMENTO, HST.NUMRECEBIMENTOPAI FROM HSTCONTRIBPREV HST WHERE HST.NUMRECEBIMENTO = ' + sNumRecebPaiClone);
        bTemPai := True;
        while bTemPai do
          begin
             if aQry.Active then aQry.Close;

             aQry.Open;
             if Length(Trim(aQry.FieldByName('NUMRECEBIMENTOPAI').AsString)) > 0 then
               begin
                 sNumRecebPaiClone := aQry.FieldByName('NUMRECEBIMENTOPAI').AsString;
                 sDataResult       := DateToStr(aQry.FieldByName('TRGDTINCLUSAO').AsDateTime);
               end else
               bTemPai := False;
          end;
        aQry.Close;
      finally
        if Assigned(aQry) then
          FreeAndNil(aQry);
      end;
    end;
    Result := sDataResult;
end;

procedure TdtmParamRelFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  dLinha := 0;
end;

function TdtmParamRelFinanc.GetPlanoPrev(intId: Integer): String;
var
   aQry    : TwwQuery;
   sResult : string;
begin
 sResult := '';
  try
    aQry := TwwQuery.Create(Self);
    aQry.DatabaseName := 'BaseDados';
    aQry.SQL.Clear;
    aQry.sql.Add('SELECT PPC.NOME FROM PLANPREVCONTABIL PPC WHERE PPC.IDPLANOPREV ='+ IntToStr(intId));
    aQry.Open;
    if aQry.IsEmpty then
      ShowMessage('vazio');
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

function TdtmParamRelFinanc.GetTotalPlano(intIdPlano: Integer): Double;
var
   intIdPlanoPrevContab : Integer;
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
      if dTotalPorPlano = 0 then
        begin
          dTotalPorPlano := QryFiltro.FieldByName('TOTALRECEBIDO').AsCurrency;
          bNaoConta      := True;
        end else
        bNaoConta := False;

      if Not bNaoConta then
          dTotalPorPlano := dTotalPorPlano + (QryFiltro.FieldByName('TOTALRECEBIDO').AsCurrency);
      QryFiltro.Next;
    end;
  Result := dTotalPorPlano;
end;

procedure TdtmParamRelFinanc.ppGroupFooterBand1BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  if qryRel.IsEmpty then
    begin
      LabPlanoPrev.Caption := '';
      LabTotalPlano.Caption := '0,00';
    end;
  if ((idPlanPrev <> qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger) and (qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger > 0 )) then
    begin
      FidPlanPrev           := qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger;
      LabPlanoPrev.Caption  := GetPlanoPrev(qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger);
      LabTotalPlano.Caption := FormatFloat('#,#0.00',GetTotalPlano(qryRel.FieldByName('IDPLANPREVCONTAB').AsInteger));
    end
end;


function TdtmParamRelFinanc.GetQryFiltro: TwwQuery;
var
   qryResult : TwwQuery;
begin
   qryResult := TwwQuery.Create(Self);
   qryResult.DatabaseName := 'BaseDados';
   qryResult.SQL.Clear;
   qryResult.SQL.Add(qryRel.Sql.GetText);
   qryResult.Open;
   Result := qryResult;
end;

procedure TdtmParamRelFinanc.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(qryFiltro) then
    begin
      if qryFiltro.Active then
        qryFiltro.Close;
      FreeAndNil(qryFiltro);
    end;
end;

procedure TdtmParamRelFinanc.ppGroupHeaderBand1BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  LabPlanoPrev.Caption := qryRel.FieldByName('NOME').AsString;
end;

function TdtmParamRelFinanc.LocalizouTitulo(idTitulo: Integer;slLista: TStringList): Boolean;
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

end.

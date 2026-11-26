{
================================================================================
Pendência: MIGRACAO-ORACLE
Analista : edilaine
Data     : 13/10/2025
Solução  : remover concatenaçao de espaços nas contas contábeis
           mudança de CHAR para VARCHAR2 na migração
================================================================================
Rotina............: Destroy
N. Sol.............: 103843
N. Kintana......: 464129
Data...............: 02/02/2009
Responsável...: Ricardo Alves
Descrição........: Modificado código para que os objetos sejam corretamente liberados
					da memória após sua utilização.
}
(*==============================================================================
Analista : André Tavares
Rotina   :
Data     : 24/05/2005
Pendência: 15342
Solução  : filtrar o centro de custo pelo campo idplancentcust e colocar o campo codexterno no select.
==============================================================================*)

unit uCtrlContaContabil;
                                    
interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,
     provider, uCMTypes ,uCMSqlParams, uCtrlParamIntegra, dBaseDados, uSistema;

Type
  { tcSoSinteticaC => Somente as contas sintéticas
    tcSoAnaliticaC => Somente as contas analíticas
    tcAmbasC => Ambos os tipos (Analíticas e Sintéticas)
  }
  TTipoConta       = (tcSoSinteticaC, tcSoAnaliticaC, tcAmbasC);
  TTipoCentroCusto = (tccSoSinteticaCC, tccSoAnaliticaCC, tccAmbasCC);
  TTipoOrdenacao   = (toCodigo,toNome);
  TCtrlContaContabil = class(TCmControlObject)

  Protected
      procedure AfterInitialize;override;

  private
    _ParamIntegra: TCtrlParamIntegra;
    FObrigaCentroCusto: String;
    FObrigaSubConta: String;
    FMascaraConta: String;
    FTipoContaContabil: String;
    FAceitaAlteraContab: String;
    FContaBloqueada: String;
    FDataBloqueio: TDateTime;
    FMoedaHistorica: Double;
    FTipoConvGeren: String;
    FTipoConvOfi: String;
    FTipoConvGeren1: String;
    FTipoConvGeren2: String;
    FContaContabilPara: String;
    FCentroCustoPara: String;
    FNomeConta: String;
    procedure SetObrigaCentroCusto(const Value: String);
    procedure SetObrigaSubConta(const Value: String);
    procedure SetMascaraConta(const Value: String);
    procedure SetTipoContaContabil(const Value: String);
    procedure SetAceitaAlteraContab(const Value: String);
    procedure SetContaBloqueada(const Value: String);
    procedure SetDataBloqueio(const Value: TDateTime);
    procedure SetMoedaHistorica(const Value: Double);
    procedure SetTipoConvGeren(const Value: String);
    procedure SetTipoConvGeren1(const Value: String);
    procedure SetTipoConvGeren2(const Value: String);
    procedure SetTipoConvOfi(const Value: String);
    procedure SetContaContabilPara(const Value: String);
    procedure SetCentroCustoPara(const Value: String);
    procedure SetNomeConta(const Value: String);

  public

      Property ContaBloqueada : String read FContaBloqueada write SetContaBloqueada;
      Property NomeConta : String read FNomeConta write SetNomeConta;
      Property DataBloqueio : TDateTime read FDataBloqueio write SetDataBloqueio;
      Property AceitaAlteraContab : String read FAceitaAlteraContab write SetAceitaAlteraContab;
      Property ObrigaCentroCusto : String read FObrigaCentroCusto write SetObrigaCentroCusto;
      Property ObrigaSubConta : String read FObrigaSubConta write SetObrigaSubConta;
      Property TipoContaContabil : String read FTipoContaContabil write SetTipoContaContabil;
      Property MascaraConta : String read FMascaraConta write SetMascaraConta;
      Property MoedaHistorica : Double read FMoedaHistorica write SetMoedaHistorica;
      Property TipoConvOfi    : String read FTipoConvOfi write SetTipoConvOfi;
      Property TipoConvGeren  : String read FTipoConvGeren write SetTipoConvGeren;
      Property TipoConvGeren1 : String read FTipoConvGeren1 write SetTipoConvGeren1;
      Property TipoConvGeren2 : String read FTipoConvGeren2 write SetTipoConvGeren2;
      Property ContaContabilPara : String read FContaContabilPara write SetContaContabilPara;
      Property CentroCustoPara : String read FCentroCustoPara write SetCentroCustoPara;
      Constructor Create; Override;
      Destructor  Destroy;Override;

      {Esta função tem como testar se a conta é valida e retornar seus parametros }
      Function TestaContaContabilProc(IdPlano,IdEmpresa,iPeriodo, iExercicio: Double; sPlaConta: String; bAceitaSintetica, bAceitaInativa: Boolean): Boolean;
      Function TestaContaContabil(IdPlano,IdEmpresa,iPeriodo, iExercicio: Double; sPlaConta: String; bAceitaSintetica, bAceitaInativa: Boolean): Boolean;
      {Esta função tem como testar se o centro de custo é valido para a conta contabil }
      Function TestaContaxCC(idPlano, idEmpresa: Double; sPlaConta, sCentroCusto : String ): Boolean;

      {Esta função tem como testar se a subconta é valida para a conta contabil }
      Function TestaContaxSC(idPlano, idEmpresa,iSubConta: Double; sPlaConta : String ): Boolean;

      {Esta função tem como objetivo retornar a mascara do plano de contas }
      Function BuscaMascaraConta(IdPlano: Double): Boolean;

      {Esta função tem como objetivo selecionar as contas de determinado plano}
      Function SelecionaContas(idPlano: Double; TipoConta: TTipoConta; bContaInativa: Boolean): OleVariant;

      {Estas funções movimentam  a base planoconta}
      Function FazDeParaConta(idEmpresa, iPlanoDE, iPlanoPARA : Double; sContaDE, sCCustoDE : String): Boolean;

      {Esta funcao tem como objetivo verificar se um determinado plano tem conta}
      function PlanoTemContaContabil(dPlano :Double):Boolean;

      {Esta funcao tem como objetivo verificar se um determinado grupo tem conta}
      function SubGrupoTemContaContabil(iPlaSubGrp :Integer):Boolean;

      { Esta função tem como objetivo buscar sequence da tabela subconta }
      function LeUltimoRegSubConta(iIdPessoa:Integer) :Double;

      {Esta função retorna a(s) subconta(s) de uma determinada conta}
      function ListContasxSC(idPlano, idEmpresa,iSubConta: Double; sPlaConta : String;TipoOrdenacao : TTipoOrdenacao) :OleVariant;

      {Esta função tem como objetivo retornar os planos contabeis para cadastro de contas}
      function ListPlanosContas(iIdEmpresa :Integer) :OleVariant;

      {Esta função Retorna os centros de custo de uma determinada conta}
      function ListContasxCC(idPlano, idEmpresa: Double; sPlaConta, sCentroCusto : String;
               TipoCentroCusto : TTipoCentroCusto;TipoOrdenacao : TTipoOrdenacao): OleVariant;

      {Esta função tem como objetivo retornas o plano de contas}
      function ListContas(dPlano: Double; TipoConta: TTipoConta; bContaInativa: Boolean;sConta:string) :OleVariant;


      function SelecionaPlanoContaPer(iPeriodo, iExercicio, idEmpresa: Double): String;


  end;

implementation

function TCtrlContaContabil.ListPlanosContas(iIdEmpresa :Integer) :OleVariant;
var
  sSql, sOrdena :string;
begin
     sSql := 'SELECT U.PLANO, U.DESCPLANO, U.MASCARA  ' +
             'FROM ' +
             '(( ' +
             'SELECT PC.PLANO, P.DESCPLANO, P.MASCARA ' +
             'FROM ' +
             '  PARAMCONTAB PC, ' +
             '  PLANO P         ' +
             'WHERE ' +
             '   (P.PLANO = PC.PLANO) AND ' +
             '   (PC.IDPESSOA = '+ FloatToStr(iIdEmpresa) + ') ' +
             ') ' +
             'UNION ' +
             '( ' +
             'SELECT  PD.PLANO, P.DESCPLANO, P.MASCARA ' +
             'FROM ' +
             '    PLANODATA PD, PLANO P '+
             'WHERE ' +
             '  (P.PLANO     = PD.PLANO) AND '+
             '  (PD.IDPESSOA = '+ FloatToStr(iIdEmpresa) + ') ' +
             ')) U ';

     sOrdena := 'ORDER BY U.DESCPLANO ';

     sSql := sSql + sOrdena;

     Result := GetDataPacket(sSql);

end;

function TCtrlContaContabil.ListContas(dPlano: Double; TipoConta: TTipoConta; bContaInativa: Boolean;sConta:string) :OleVariant;
var
  ssql, sfiltro,sordena :string;
begin
      { bContaInativa = True => Inclui as contas inativas
        bContaInativa = False => Não inclui as contas inativas
      }

      ssql := 'SELECT  ' +
              '  PLACONTASEGREG,        ' +
              '  PLANO,                 ' +
              '  PLACONTA,              ' +
              '  IDUSUARIOINCLUSAO,     ' +
              '  PLATIPO,               ' +
              '  PLAGRUPO,              ' +
              '  PLAGRAU,               ' +
              '  PLANOME,               ' +
              '  PLANOMEOUTLING,        ' +
              '  PLASUBGR1,             ' +
              '  PLASUBGR2,             ' +
              '  PLASUBGR3,             ' +
              '  PLASUBGR4,             ' +
              '  PLAREDUZ,              ' +
              '  PLACCUST,              ' +
              '  PLAORDALF,             ' +
              '  PLATIPCONVGER,         ' +
              '  PLATIPCONVGEREN1,      ' +
              '  PLATIPCONVGEREN2,      ' +
              '  PLATIPCONVOFICIAL,     ' +
              '  PLAALTERA,             ' +
              '  PLAINATIVA,            ' +
              '  PLANATUREZA,           ' +
              '  PLASUMARIZA,           ' +
              '  PLASECRETARIA,         ' +
              '  PLAMOEDAHISTORICA,     ' +
              '  PLASUBCONTA,           ' +
              '  PLAMUTACOES,           ' +
              '  PLACONCILIA,           ' +
              '  PLABLOQUE,             ' +
              '  PLABLOQUEDATA,         ' +
              '  PLACONCORRESP,         ' +
              '  PLARATEIOAP,           ' +
              '  IDRATEIOAPEXTRA,       ' +
              '  PLACONTRAPARTIDA,      ' +
              '  PLACONTRAPTXJUROS,     ' +
              '  PLATXJUROS,            ' +
              '  PLAIMPRELATEVOL,       ' +
              '  FLGESTATCOMLANC        ' +
             'FROM  ' +
              '   PLANOCONTA ';
      //----------------------------------------------------------
      sfiltro := '';
      If (dPlano <> 0) Then
         sfiltro :=  'WHERE (PLANO = '+FloatToStr(dPlano)+ ') ';
     //-----------------------------------------------------------
      If sConta <> '' Then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (RTRIM(PLACONTA) = ' + Trim(sConta) + ') '
         Else
            sFiltro := sFiltro +  'AND (RTRIM(PLACONTA) = ' + Trim(sConta) + ') ';
      End;
     //-----------------------------------------------------------
      Case TipoConta of
         tcSoSinteticaC : sSql := sSql + '  AND (PLATIPO = ''S'') ';
         tcSoAnaliticaC : sSql := sSql + '  AND (PLATIPO = ''A'') ';
      end;
     //-----------------------------------------------------------
      If Not bContaInativa Then
      //início - andre tavares - pendência 22712 - 07/05/2007 - sem este acerto não posso desenvolver esta pendência
         sFiltro := sFiltro + '  AND ((PLAINATIVA = ''A'') OR (PLAINATIVA IS NULL)) ';
      //fim - andre tavares - pendência 22712 - 07/05/2007 - sem este acerto não posso desenvolver esta pendência
     //-----------------------------------------------------------

      sOrdena := 'ORDER BY PLACONTA ';

      sSql := sSql + sfiltro + sOrdena;

     Result := GetDataPacket(sSql);
end;

function TCtrlContaContabil.BuscaMascaraConta(IdPlano: Double): Boolean;
begin
      Result := True;
      _Cds.Data := GetDataPacket('SELECT MASCARA  ' +
                                 'FROM PLANO ' +
                                 'WHERE (PLANO = '+FloatToStr(IdPlano)+')');
      if _Cds.isEmpty then begin
         Result        := False;
         FMascaraConta := '';
         MessageInfo   := 'Plano Não Cadastrado';
      end else begin
         FMascaraConta := _Cds.FieldByName('MASCARA').AsString;
         MessageInfo   := '';
      end;
      
      _Cds.Close;
end;

procedure TCtrlContaContabil.SetMascaraConta(const Value: String);
begin
  FMascaraConta := Value;
end;

procedure TCtrlContaContabil.SetObrigaCentroCusto(const Value: String);
begin
  FObrigaCentroCusto := Value;
end;

procedure TCtrlContaContabil.SetObrigaSubConta(const Value: String);
begin
  FObrigaSubConta := Value;
end;


procedure TCtrlContaContabil.SetTipoContaContabil(const Value: String);
begin
  FTipoContaContabil := Value;
end;

function TCtrlContaContabil.TestaContaContabilProc(IdPlano,IdEmpresa,iPeriodo, iExercicio: Double;
  sPlaConta: String; bAceitaSintetica, bAceitaInativa: Boolean): Boolean;
var sSql : String;
begin
   Result := True;
   {** GUSTAVO VIEGAS 23/04/2002 **}
   if iExercicio = 0 then begin
      sSql :='SELECT PLATIPO, PLANOME, PLACCUST, PLASUBCONTA, PLAINATIVA,                ' +
             '       PLAALTERA, PLABLOQUE, PLABLOQUEDATA, PLAMOEDAHISTORICA,             ' +
             '       PLATIPCONVOFICIAL, PLATIPCONVGER, PLATIPCONVGEREN1,PLATIPCONVGEREN2 ' +
             'FROM PLANOCONTA  ' +
             'WHERE (PLANO = '+FloatToStr(IdPlano)+')' +
             //'  AND (PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')';    //MIGRACAO-ORACLE
             '  AND (PLACONTA = '+QuotedStr(trim(sPlaConta))+')';                              //MIGRACAO-ORACLE
   end else begin
      sSql :='SELECT DECODE(PD.PLATIPO, NULL, C.PLATIPO, PD.PLATIPO) AS PLATIPO, '+
             '       DECODE(PD.PLANOME, NULL, C.PLANOME, PD.PLANOME) AS PLANOME, '+
             '       DECODE(PD.PLAINATIVA, NULL, C.PLAINATIVA, PD.PLAINATIVA) AS PLAINATIVA, '+
             '       C.PLACCUST, C.PLASUBCONTA,               ' +
             '       C.PLAALTERA, C.PLABLOQUE, C.PLABLOQUEDATA, C.PLAMOEDAHISTORICA,             ' +
             '       C.PLATIPCONVOFICIAL, C.PLATIPCONVGER, C.PLATIPCONVGEREN1,C.PLATIPCONVGEREN2 ' +
             'FROM PLANOCONTA C,  ';
      sSql := sSql +SelecionaPlanoContaPer(iPeriodo,iExercicio,idEmpresa)+' PD ';
      sSql := sSql +'WHERE (C.PLANO = '+FloatToStr(IdPlano)+')' +
                    //'  AND (C.PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')'+    //MIGRACAO-ORACLE
                    '  AND (C.PLACONTA = '+Quotedstr(trim(sPlaConta))+')'+                              //MIGRACAO-ORACLE
                    '  AND (C.PLACONTA = PD.PLACONTA(+))'+
                    '  AND (C.PLANO = PD.PLANO(+))';
   end;
   OpenDataSet(sSql);
   if _lDataSet.IsEmpty then begin
      Result := False;
      FNomeConta         := '';
      FObrigaCentroCusto := '';
      FObrigaSubConta    := '';
      FTipoContaContabil := '';
      FAceitaAlteraContab:= '';
      FContaBloqueada    := '';
      FDataBloqueio      := Date;
      FMoedaHistorica    := 0;
      FTipoConvOfi       := '';
      FTipoConvGeren     := '';
      FTipoConvGeren1    := '';
      FTipoConvGeren2    := '';
      MessageInfo := 'Não Cadastrada';
   end else begin
      FNomeConta         := _lDataSet.FieldByName('PLANOME').AsString;
      FObrigaCentroCusto := _lDataSet.FieldByName('PLACCUST').AsString;
      FObrigaSubConta    := _lDataSet.FieldByName('PLASUBCONTA').AsString;
      FTipoContaContabil := _lDataSet.FieldByName('PLATIPO').AsString;
      FAceitaAlteraContab:= _lDataSet.FieldByName('PLAALTERA').AsString;
      FContaBloqueada    := _lDataSet.FieldByName('PLABLOQUE').AsString;
      FDataBloqueio      := _lDataSet.FieldByName('PLABLOQUEDATA').AsDateTime;
      FMoedaHistorica    := _lDataSet.FieldByName('PLAMOEDAHISTORICA').AsFloat;
      FTipoConvOfi       := _lDataSet.FieldByName('PLATIPCONVOFICIAL').AsString;
      FTipoConvGeren     := _lDataSet.FieldByName('PLATIPCONVGER').AsString;
      FTipoConvGeren1    := _lDataSet.FieldByName('PLATIPCONVGEREN1').AsString;
      FTipoConvGeren2    := _lDataSet.FieldByName('PLATIPCONVGEREN2').AsString;
      if (not bAceitaSintetica) and (_lDataSet.FieldByName('PLATIPO').AsString = 'S') then begin
         Result := False;
         MessageInfo := 'Sintética';
      end;
      if (not bAceitaInativa) and (_lDataSet.FieldByName('PLAINATIVA').AsString <> 'A') then begin
         Result := False;
         MessageInfo := 'Inativa';
      end;
   end;

   If _lDataSet.Active Then _lDataSet.Close;
end;


function TCtrlContaContabil.SelecionaContas( idPlano : Double; TipoConta : TTipoConta; bContaInativa : Boolean  ) : OleVariant;
begin
      { bContaInativa = True => Inclui as contas inativas
        bContaInativa = False => Não inclui as contas inativas
      }
    Result := True;
    With TCMSqlParams.Create(nil) Do
       Try
          ControlObject := Self;
          SQL.Clear;
          SQL.Add('SELECT PLACONTA, PLANOME, PLATIPO, PLAGRUPO, PLAGRAU   ');
          SQL.Add('FROM PLANOCONTA ');
          SQL.Add('WHERE (PLANO = '+FloatToStr(idPlano)+')                ');
          Case TipoConta of
             tcSoSinteticaC : SQL.Add('  AND (PLATIPO = ''S'')            ');
             tcSoAnaliticaC : SQL.Add('  AND (PLATIPO = ''A'')            ');
          end;
          if not bContaInativa then
             SQL.Add('  AND ((PLAINATIVA = ''A'') OR (PLAINATIVA IS NULL))');

          SQL.Add('ORDER BY PLACONTA ');

          Result := Data;

       Finally
         Free;
       End;
end;

function TCtrlContaContabil.LeUltimoRegSubConta(iIdPessoa:Integer) :Double;
begin
      _cds.Data :=  GetDataPacket('SELECT MAX(CODSUBCONTA) AS PROXIMA FROM SUBCONTA ' +
                                  'WHERE IDPESSOA = ' + FloatToStr(iIdPessoa));

      Result := _cds.FieldByName('PROXIMA').AsFloat;
end;


constructor TCtrlContaContabil.Create;
begin
  inherited;
  // início - André Tavares - pendência 15342 - 20/05/2005
  _ParamIntegra := TCtrlParamIntegra.create;
  _ParamIntegra.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  // fim - André Tavares - pendência 15342 - 20/05/2005
end;

destructor TCtrlContaContabil.Destroy;
begin
  // Ricardo A. SOL: 103843 KTN: 464129
  FreeAndNil( _ParamIntegra );
  inherited;
end;

procedure TCtrlContaContabil.SetAceitaAlteraContab(const Value: String);
begin
  FAceitaAlteraContab := Value;
end;

procedure TCtrlContaContabil.SetContaBloqueada(const Value: String);
begin
  FContaBloqueada := Value;
end;

procedure TCtrlContaContabil.SetDataBloqueio(const Value: TDateTime);
begin
  FDataBloqueio := Value;
end;

procedure TCtrlContaContabil.SetMoedaHistorica(const Value: Double);
begin
  FMoedaHistorica := Value;
end;

procedure TCtrlContaContabil.SetTipoConvGeren(const Value: String);
begin
  FTipoConvGeren := Value;
end;

procedure TCtrlContaContabil.SetTipoConvGeren1(const Value: String);
begin
  FTipoConvGeren1 := Value;
end;

procedure TCtrlContaContabil.SetTipoConvGeren2(const Value: String);
begin
  FTipoConvGeren2 := Value;
end;

procedure TCtrlContaContabil.SetTipoConvOfi(const Value: String);
begin
  FTipoConvOfi := Value;
end;

function TCtrlContaContabil.ListContasxCC(idPlano, idEmpresa: Double; sPlaConta, sCentroCusto : String;
               TipoCentroCusto : TTipoCentroCusto; TipoOrdenacao : TTipoOrdenacao ): OleVariant;
var
  sSql, sFiltro :string;
begin
    sSql := 'SELECT '+
            '   C.CODCENTROCUSTO,    '+
            '   C.NOME,              '+
            '   C.STATUSGRUPOCDC,    '+
            '   CC.PLANO,            '+
            '   CC.IDEMPRESA,        '+
            '   CC.PLACONTA,         '+
            '   CC.IDUSUARIOINCLUSAO, '+
            '   C.CODEXTERNO         '+  //andré tavares - pendência 15342 - 20/05/2005
            'FROM                    '+
            '   CENTCUST C,          '+
            '   CONTASXCC CC         '+
            'WHERE                   '+
            '      (CC.PLANO = ' + FloatToStr(IdPlano)+') ' +
            '  AND (RTRIM(CC.PLACONTA) = ''' + Trim(sPlaConta)+''') ' +
            '  AND (CC.IDEMPRESA = ' + FloatToStr(IdEmpresa)+') ';

    // início André Tavares - pendência 15342 - 20/05/2005
    _ParamIntegra.GetParams(trunc(IdEmpresa), 0, 'INTEGRACONTAB','PARAMCAP',tiCAP);
    sSql := sSql + '  AND (C.IDPLANCENTCUST = ' + intToStr(_ParamIntegra.PlanoCentroCusto)+') ';
    // fim André Tavares - pendência 15342 - 20/05/2005

    If sCentroCusto <> '' Then
       sSql := sSql + ' AND (CC.CODCENTROCUSTO = ''' + Trim(sCentroCusto) + ''') ';


    Case TipoCentroCusto of
         tccSoSinteticaCC : sSql := sSql + '  AND (C.STATUSGRUPOCDC = ''S'') ';
         tccSoAnaliticaCC : sSql := sSql + '  AND (C.STATUSGRUPOCDC = ''A'') ';
    end;

    sSql := sSql + ' AND ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL))  ' +
                   ' AND (CC.CODCENTROCUSTO = C.CODCENTROCUSTO)  ' +
                   ' AND (CC.IDEMPRESA = C.IDEMPRESA) ';

    Case TipoOrdenacao of
         toCodigo : sSql := sSql + ' ORDER BY C.CODCENTROCUSTO ';
         toNome   : sSql := sSql + ' ORDER BY C.NOME           ';
    end;


   sSql := sSql + sFiltro;

   Result := GetDataPacket(sSql);


end;

function TCtrlContaContabil.ListContasxSC(idPlano, idEmpresa,iSubConta: Double;
 sPlaConta : String;TipoOrdenacao : TTipoOrdenacao) :OleVariant;
var
  sSql :string;
begin
   sSql :='SELECT '+
         '   S.NOMESUBCONTA, '+
         '   S.CODSUBCONTA,  '+
         '   C.IDUSUARIO, ' +
         '   C.IDPESSOA, ' +
         '   C.PLACONTA, ' +
         '   C.PLANO ' +
         'FROM CONTASXSUBC C, SUBCONTA S '+
         //'WHERE (C.PLACONTA   = '''+copy(sPlaConta + '                  ',1,18)+''')   AND '+      //MIGRACAO-ORACLE
         'WHERE (C.PLACONTA   = '+QuotedStr(trim(sPlaConta)) +')   AND '+                            //MIGRACAO-ORACLE
         '      (C.PLANO      = '+FloatToStr(idPlano)+')   AND '+
         '      (S.IDPESSOA   = '+FloatToStr(idEmpresa)+') AND ';

   if iSubConta <> 0 then
      sSql := sSql + '  (C.CODSUBCONTA = '+FloatToStr(iSubConta)+') AND ';

   sSql := sSql + '      (C.CODSUBCONTA = S.CODSUBCONTA) AND '+
                  '      (C.IDPESSOA = S.IDPESSOA) ';

   Case TipoOrdenacao of
       toCodigo : sSql := sSql + 'ORDER BY S.CODSUBCONTA  ';
       toNome   : sSql := sSql + 'ORDER BY S.NOMESUBCONTA ';
   end;

   Result:=GetDataPacket(sSql);

end;




function TCtrlContaContabil.TestaContaxCC(idPlano, idEmpresa: Double;
  sPlaConta, sCentroCusto: String): Boolean;
  var cdsAux : TClientDataset;
Begin

      Result := True;
      OpenDataSet('SELECT                                       ' +
                  '   C.CODCENTROCUSTO                          ' +
                  'FROM                                         ' +
                  '   CENTCUST C,                               ' +
                  '   CONTASXCC CC                              ' +
                  'WHERE (CC.PLANO = '+FloatToStr(IdPlano)+')   ' +
                  //MIGRACAO-ORACLE : inicio
                  //'  AND (CC.PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')' +
                  //'  AND (CC.CODCENTROCUSTO = '''+Copy(trim(sCentroCusto)+'                 ',1,10)+''')' +
                  '  AND (CC.PLACONTA = '+Quotedstr(trim(sPlaConta))+')' +
                  '  AND (CC.CODCENTROCUSTO = '+QuotedStr(trim(sCentroCusto))+')' +
                  //MIGRACAO-ORACLE : fim
                  '  AND (CC.IDEMPRESA = '+FloatToStr(IdEmpresa)+')   ' +
                  '  AND ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL))     ' +
                  '  AND (CC.CODCENTROCUSTO = C.CODCENTROCUSTO)       ' +
                  '  AND (CC.IDEMPRESA = C.IDEMPRESA)                 ');

      if _lDataSet.isEmpty then
      begin
           //Ewerton Beltramini - 26/06/2020 - SIG99485 - Inicio...
           cdsAux := TClientDataset.Create( nil );
           cdsAux.Data := GetDataPacket(' SELECT CODCENTROCUSTO, CODEXTERNO, NOME, ' +
                       ' DECODE (ATIVO, ' + QuotedStr('S') + ', ' + QuotedStr('Ativo') + ', ' + QuotedStr('N') + ', ' + QuotedStr('Inativo') + ') AS Status ' +
                       ' FROM CM.CENTCUST WHERE CODCENTROCUSTO = ' + QuotedStr(sCentroCusto) );

            if not (cdsAux.isEmpty) then
            begin
                Result := False;
                MessageInfo := 'O centro de custo ' + cdsAux.FieldByName('CODEXTERNO').asString + ' - ' + cdsAux.FieldByName('Nome').asString + ' (' + cdsAux.FieldByName('Status').asString + ')'
                             + ' não pode ser usado pela Conta Contábil '+trim(sPlaConta);
            end
            else
            begin
                Result := False;
                MessageInfo := 'O centro de custo '+trim(sCentroCusto)+' não pode ser usado pela Conta Contábil '+trim(sPlaConta);
            end;
            cdsAux.close; 
            cdsAux.Free;
         //Ewerton Beltramini - 26/06/2020 - SIG99485 - Innicio...
      end;

end;

function TCtrlContaContabil.TestaContaxSC(idPlano, idEmpresa,
  iSubConta: Double; sPlaConta: String): Boolean;
begin
      Result := True;
      {** GUSTAVO VIEGAS 23/04/2002 **}
      OpenDataSet('SELECT CODSUBCONTA                           ' +
                  'FROM                                         ' +
                  '   CONTASXSUBC                               ' +
                  'WHERE (PLANO = '+FloatToStr(IdPlano)+')      ' +
                  //'  AND (PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')' +       //MIGRACAO-ORACLE
                  '  AND (PLACONTA = '+QuotedStr(trim(sPlaConta))+')' +                                 //MIGRACAO-ORACLE
                  '  AND (CODSUBCONTA = '+FloatToStr(iSubConta)+') ' +
                  '  AND (IDPESSOA = '+FloatToStr(IdEmpresa)+')    ');

      if _lDataSet.isEmpty then begin
         Result := False;
         MessageInfo := 'A subconta '+FloatToStr(iSubConta)+' não pode ser usada pela Conta Contábil '+trim(sPlaConta);
      end;
end;

procedure TCtrlContaContabil.SetContaContabilPara(const Value: String);
begin
  FContaContabilPara := Value;
end;

procedure TCtrlContaContabil.SetCentroCustoPara(const Value: String);
begin
  FCentroCustoPara := Value;
end;

function TCtrlContaContabil.FazDeParaConta(idEmpresa, iPlanoDE,
  iPlanoPARA: Double; sContaDE, sCCustoDE: String): Boolean;
Var
  sSql: String;
begin
   Result := False;

   {** GUSTAVO VIEGAS 23/04/2002 **}
   sSql :=
       'SELECT                                     ' +
       '   CONTA2, CENTROCUSTO2                    ' +
       'FROM                                       ' +
       '   PLANODEPARA                             ' +
       'WHERE (PLANO1 = '+FloatToStr(iPlanoDE)+')  ' +
       '  AND (PLANO2 = '+FloatToStr(iPlanoPARA)+')' +
       //'  AND (CONTA1 = '''+Copy(trim(sContaDE)+'                 ',1,18)+''')';     //MIGRACAO-ORACLE
       '  AND (CONTA1 = '+Quotedstr(trim(sContaDE))+')';                               //MIGRACAO-ORACLE

   if sCCustoDE <> '' then begin
      //sSql := sSql + '  AND (CENTROCUSTO1 = '''+Copy(trim(sCCustoDE)+'                 ',1,10)+''')' +    //MIGRACAO-ORACLE
      sSql := sSql + '  AND (CENTROCUSTO1 = '+QuotedStr(trim(sCCustoDE))+')' +                              //MIGRACAO-ORACLE
                     '  AND (IDEMPRESA1 = '+FloatToStr(IdEmpresa)+')   ';
   end else begin
      sSql := sSql + '  AND (CENTROCUSTO1 IS NULL)' +
                     '  AND (CENTROCUSTO2 IS NULL)';
   end;

   _Cds.Data := GetDataPacket(sSql);

   if not _Cds.isEmpty then begin
      Result := True;
      FContaContabilPara := _Cds.FieldByName('CONTA2').AsString;
      FCentroCustoPara   := _Cds.FieldByName('CENTROCUSTO2').AsString;
   end else begin
      if sCCustoDE <> '' then begin
         _Cds.Data := GetDataPacket( 'SELECT                                     ' +
                                     '   CONTA2, CENTROCUSTO2                    ' +
                                     'FROM                                       ' +
                                     '   PLANODEPARA                             ' +
                                     'WHERE (PLANO1 = '+FloatToStr(iPlanoDE)+')  ' +
                                     '  AND (PLANO2 = '+FloatToStr(iPlanoPARA)+')' +
                                     //'  AND (CONTA1 = '''+Copy(trim(sContaDE)+'                 ',1,18)+''')' +  //MIGRACAO-ORACLE
                                     '  AND (CONTA1 = '+Quotedstr(trim(sContaDE))+')' +                            //MIGRACAO-ORACLE
                                     '  AND (CENTROCUSTO1 IS NULL)' +
                                     '  AND (CENTROCUSTO2 IS NULL)');

         if not _Cds.isEmpty then begin
            Result := True;
            FContaContabilPara := _Cds.FieldByName('CONTA2').AsString;
            FCentroCustoPara   := _Cds.FieldByName('CENTROCUSTO2').AsString;
         end;
      end;
   end;
end;

procedure TCtrlContaContabil.SetNomeConta(const Value: String);
begin
  FNomeConta := Value;
end;

function TCtrlContaContabil.SubGrupoTemContaContabil(iPlaSubGrp :Integer):Boolean;
begin
      _cds.Data := GetDataPacket('SELECT  PLACONTA  ' +
                                 'FROM PLANOCONTA '+
                                 ' WHERE  (PLASUBGR1 = ' + IntToStr(iPlaSubGrp) + ') ' +
                                 ' OR     (PLASUBGR2 = ' + IntToStr(iPlaSubGrp) + ') ' +
                                 ' OR     (PLASUBGR3 = ' + IntToStr(iPlaSubGrp) + ') ' +
                                 ' OR     (PLASUBGR4 = ' + IntToStr(iPlaSubGrp) + ')');
     If _cds.isEmpty Then Begin
        Result := False;
     End Else Begin
        Result := True;
     End;

end;
function TCtrlContaContabil.PlanoTemContaContabil(dPlano :Double):Boolean;
begin

      _cds.Data := GetDataPacket('SELECT PLACONTA '  +
                                 'FROM  PLANOCONTA ' +
                                 'WHERE (PLANO  =  ' + FloatToStr(dPlano)+ ') ' );

     If _cds.isEmpty Then Begin
        Result := False;
     End Else Begin
        Result := True;
     End;

end;

function TCtrlContaContabil.TestaContaContabil(IdPlano,IdEmpresa,iPeriodo, iExercicio: Double;
  sPlaConta: String; bAceitaSintetica, bAceitaInativa: Boolean): Boolean;
var sSql : String;
begin
   Result := True;
   {** GUSTAVO VIEGAS 23/04/2002 **}

   if iExercicio = 0 then begin
      sSql :='SELECT PLATIPO, PLANOME, PLACCUST, PLASUBCONTA, PLAINATIVA,                ' +
             '       PLAALTERA, PLABLOQUE, PLABLOQUEDATA, PLAMOEDAHISTORICA,             ' +
             '       PLATIPCONVOFICIAL, PLATIPCONVGER, PLATIPCONVGEREN1,PLATIPCONVGEREN2 ' +
             'FROM PLANOCONTA  ' +
             'WHERE (PLANO = '+FloatToStr(IdPlano)+')' +
             //'  AND (PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')';     //MIGRACAO-ORACLE
             '  AND (PLACONTA = '+Quotedstr(trim(sPlaConta))+')';                               //MIGRACAO-ORACLE
   end else begin
      sSql :='SELECT DECODE(PD.PLATIPO, NULL, C.PLATIPO, PD.PLATIPO) AS PLATIPO, '+
             '       DECODE(PD.PLANOME, NULL, C.PLANOME, PD.PLANOME) AS PLANOME, '+
             '       DECODE(PD.PLAINATIVA, NULL, C.PLAINATIVA, PD.PLAINATIVA) AS PLAINATIVA, '+
             '       C.PLACCUST, C.PLASUBCONTA,               ' +
             '       C.PLAALTERA, C.PLABLOQUE, C.PLABLOQUEDATA, C.PLAMOEDAHISTORICA,             ' +
             '       C.PLATIPCONVOFICIAL, C.PLATIPCONVGER, C.PLATIPCONVGEREN1,C.PLATIPCONVGEREN2 ' +
             'FROM PLANOCONTA C,  ';
      sSql := sSql +SelecionaPlanoContaPer(iPeriodo,iExercicio,idEmpresa)+' PD ';
      sSql := sSql +'WHERE (C.PLANO = '+FloatToStr(IdPlano)+')' +
                    //'  AND (C.PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')'+   //MIGRACAO-ORACLE
                    '  AND (C.PLACONTA = '+Quotedstr(trim(sPlaConta))+')'+                             //MIGRACAO-ORACLE
                    '  AND (C.PLACONTA = PD.PLACONTA(+))'+
                    '  AND (C.PLANO = PD.PLANO(+))';
   end;
   _Cds.Data := GetDataPacket(sSql);
   if _Cds.isEmpty then begin
      Result := False;
      FNomeConta         := '';
      FObrigaCentroCusto := '';
      FObrigaSubConta    := '';
      FTipoContaContabil := '';
      FAceitaAlteraContab:= '';
      FContaBloqueada    := '';
      FDataBloqueio      := Date;
      FMoedaHistorica    := 0;
      FTipoConvOfi       := '';
      FTipoConvGeren     := '';
      FTipoConvGeren1    := '';
      FTipoConvGeren2    := '';
      MessageInfo := 'Não Cadastrada';
   end else begin
      FNomeConta         := _Cds.FieldByName('PLANOME').AsString;
      FObrigaCentroCusto := _Cds.FieldByName('PLACCUST').AsString;
      FObrigaSubConta    := _Cds.FieldByName('PLASUBCONTA').AsString;
      FTipoContaContabil := _Cds.FieldByName('PLATIPO').AsString;
      FAceitaAlteraContab:= _Cds.FieldByName('PLAALTERA').AsString;
      FContaBloqueada    := _Cds.FieldByName('PLABLOQUE').AsString;
      FDataBloqueio      := _Cds.FieldByName('PLABLOQUEDATA').AsDateTime;
      FMoedaHistorica    := _Cds.FieldByName('PLAMOEDAHISTORICA').AsFloat;
      FTipoConvOfi       := _Cds.FieldByName('PLATIPCONVOFICIAL').AsString;
      FTipoConvGeren     := _Cds.FieldByName('PLATIPCONVGER').AsString;
      FTipoConvGeren1    := _Cds.FieldByName('PLATIPCONVGEREN1').AsString;
      FTipoConvGeren2    := _Cds.FieldByName('PLATIPCONVGEREN2').AsString;
      if (not bAceitaSintetica) and (_Cds.FieldByName('PLATIPO').AsString = 'S') then begin
         Result := False;
         MessageInfo := 'Sintética';
      end;
      if (not bAceitaInativa) and (_Cds.FieldByName('PLAINATIVA').AsString <> 'A') then begin
         Result := False;
         MessageInfo := 'Inativa';
      end;
   end;
end;

procedure TCtrlContaContabil.AfterInitialize;
begin
  inherited;
end;

function TCtrlContaContabil.SelecionaPlanoContaPer(iPeriodo, iExercicio,
  idEmpresa: Double): String;
var sDataRef : String;
begin
   if iPeriodo < 10 then
      sDataRef := FloatToStr(iExercicio)+'0'+FloatToStr(iPeriodo)
   else
      sDataRef := FloatToStr(iExercicio)+FloatToStr(iPeriodo);
   Result := '(SELECT P.PLATIPO, P.PLAINATIVA,P.PLANOME, P.PLACONTA, P.PLANO '+
             '  FROM  PLANOCONTAPER P, '+
             '            (SELECT PLACONTA, PLANO, MIN(TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)),1,''0''||TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0)))) AS PERNUMERO '+
             '             FROM PLANOCONTAPER '+
             '             WHERE (TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)),1,''0''||TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0))) >= '''+sDataRef+''') '+
             '               AND (IDPESSOA = '+FloatToStr(idEmpresa)+') '+
             '             GROUP BY  PLACONTA, PLANO) PX '+
             '  WHERE (P.PLACONTA = PX.PLACONTA) '+
             '    AND (P.PLANO = PX.PLANO)       '+
             '    AND (P.IDPESSOA = '+FloatToStr(idEmpresa)+') '+
             '    AND (TO_CHAR(P.PEREXERCICIO)||DECODE(LENGTH(NVL(P.PERNUMERO,0)),1,''0''||TO_CHAR(NVL(P.PERNUMERO,0)),TO_CHAR(NVL(P.PERNUMERO,0))) = PX.PERNUMERO)) ';
end;

end.




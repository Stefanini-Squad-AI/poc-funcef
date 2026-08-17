unit uCtrlContaContabil;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,uSistema, wwQuery,
     uDbPlanoConta, provider;

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
      procedure DoChangeDataBase; Override;
  private
    FObrigaCentroCusto: String;
    FObrigaSubConta: String;
    FMascaraConta: String;
    FTipoContaContabil: String;
    FdspContaContabil: TDataSetProvider;
    FqryContaContabil: TwwQuery;
    FAceitaAlteraContab: String;
    FContaBloqueada: String;
    FDataBloqueio: TDateTime;
    FMoedaHistorica: Double;
    FTipoConvGeren: String;
    FTipoConvOfi: String;
    FTipoConvGeren1: String;
    FTipoConvGeren2: String;
    FdspContaxCC: TDataSetProvider;
    FdspContaxSC: TDataSetProvider;
    FqryContaxCC: TwwQuery;
    FqryContaxSC: TwwQuery;
    FContaContabilPara: String;
    FCentroCustoPara: String;
    FNomeConta: String;
    procedure SetObrigaCentroCusto(const Value: String);
    procedure SetObrigaSubConta(const Value: String);
    procedure SetMascaraConta(const Value: String);
    procedure SetTipoContaContabil(const Value: String);
    procedure SetdspContaContabil(const Value: TDataSetProvider);
    procedure SetqryContaContabil(const Value: TwwQuery);
    procedure SetAceitaAlteraContab(const Value: String);
    procedure SetContaBloqueada(const Value: String);
    procedure SetDataBloqueio(const Value: TDateTime);
    procedure SetMoedaHistorica(const Value: Double);
    procedure SetTipoConvGeren(const Value: String);
    procedure SetTipoConvGeren1(const Value: String);
    procedure SetTipoConvGeren2(const Value: String);
    procedure SetTipoConvOfi(const Value: String);
    procedure SetdspContaxCC(const Value: TDataSetProvider);
    procedure SetdspContaxSC(const Value: TDataSetProvider);
    procedure SetqryContaxCC(const Value: TwwQuery);
    procedure SetqryContaxSC(const Value: TwwQuery);
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
      Property qryContaContabil : TwwQuery read FqryContaContabil write SetqryContaContabil;
      Property dspContaContabil : TDataSetProvider read FdspContaContabil write SetdspContaContabil;
      Property qryContaxCC : TwwQuery read FqryContaxCC write SetqryContaxCC;
      Property dspContaxCC : TDataSetProvider read FdspContaxCC write SetdspContaxCC;
      Property qryContaxSC : TwwQuery read FqryContaxSC write SetqryContaxSC;
      Property dspContaxSC : TDataSetProvider read FdspContaxSC write SetdspContaxSC;
      Constructor Create; Override;
      Destructor  Destroy;Override;

      {Esta função tem como testar se a conta é valida e retornar seus parametros }
      Function TestaContaContabil(IdPlano: Double; sPlaConta: String; bAceitaSintetica, bAceitaInativa: Boolean): Boolean;

      {Esta função tem como testar se o centro de custo é valido para a conta contabil }
      Function TestaContaxCC(idPlano, idEmpresa: Double; sPlaConta, sCentroCusto : String ): Boolean;

      {Esta função tem como testar se a subconta é valida para a conta contabil }
      Function TestaContaxSC(idPlano, idEmpresa,iSubConta: Double; sPlaConta : String ): Boolean;

      {Esta função tem como objetivo retornar a mascara do plano de contas }
      Function BuscaMascaraConta(IdPlano: Double): Boolean;

      {Esta função tem como objetivo selecionar as contas de determinado plano}
      Function SelecionaContas(idPlano: Double; TipoConta: TTipoConta; bContaInativa: Boolean): Boolean;

      {Esta função tem como objetivo selecionar os centros de custo de determinada conta}
      Function SelecionaContasxCC(idPlano, idEmpresa: Double; sPlaConta, sCentroCusto : String;
               TipoCentroCusto : TTipoCentroCusto; TipoOrdenacao : TTipoOrdenacao  ): Boolean;

      {Esta função tem como objetivo selecionar as subcontas de determinada conta}
      Function SelecionaContasxSC(idPlano, idEmpresa,iSubConta : Double; sPlaConta : String;TipoOrdenacao : TTipoOrdenacao ): Boolean;

      {Estas funções movimentam  a base planoconta}
      Function FazDeParaConta(idEmpresa, iPlanoDE, iPlanoPARA : Double; sContaDE, sCCustoDE : String): Boolean;

      {Esta funcao tem como objetivo verificar se um determinado plano tem conta}
      function PlanoTemContaContabil(dPlano :Double):Boolean;

      {Esta funcao tem como objetivo verificar se um determinado grupo tem conta}
      function SubGrupoTemContaContabil(iPlaSubGrp :Integer):Boolean;

      { Esta função tem como objetivo buscar sequence da tabela subconta }
      function LeUltimoRegSubConta(iIdPessoa:Integer) :Double;

      {Esta função retorna a(s) subconta(s) de uma determinada conta}
      function ListContasxSC(idPlano, idEmpresa,iSubConta: Double; sPlaConta : String) :OleVariant;

      {Esta função tem como objetivo retornar os planos contabeis para cadastro de contas}
      function ListPlanosContas(iIdEmpresa :Integer) :OleVariant;

      {Esta função Retorna os centros de custo de uma determinada conta}
      function ListContasxCC(idPlano, idEmpresa: Double; sPlaConta, sCentroCusto : String;
               TipoCentroCusto : TTipoCentroCusto): OleVariant;

      {Esta função tem como objetivo retornas o plano de contas}
      function ListContas(dPlano: Double; TipoConta: TTipoConta; bContaInativa: Boolean):OleVariant;

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

function TCtrlContaContabil.ListContas(dPlano: Double; TipoConta: TTipoConta; bContaInativa: Boolean) :OleVariant;
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
      Case TipoConta of
         tcSoSinteticaC : sSql := sSql + '  AND (PLATIPO = ''S'') ';
         tcSoAnaliticaC : sSql := sSql + '  AND (PLATIPO = ''A'') ';
      end;
     //-----------------------------------------------------------
      If Not bContaInativa Then
         sSql := sSql + '  AND ((PLAINATIVA = ''A'') OR (PLAINATIVA IS NULL)) ';
     //-----------------------------------------------------------

      sOrdena := 'ORDER BY PLACONTA ';

      sSql := sSql + sfiltro + sOrdena;

     Result := GetDataPacket(sSql);
end;

function TCtrlContaContabil.BuscaMascaraConta(IdPlano: Double): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.BuscaMascaraConta(IdPlano, FMascaraConta);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      Result := True;
      _qrysql.Close;
      _qrysql.SQL.Clear;
      _qrysql.SQL.Add('SELECT MASCARA  ');
      _qrysql.SQL.Add('FROM PLANO ');
      _qrysql.SQL.Add('WHERE (PLANO = '+FloatToStr(IdPlano)+')');
      _qrysql.Open;
      if _qrysql.isEmpty then begin
         Result        := False;
         FMascaraConta := '';
         MessageInfo   := 'Plano Não Cadastrado';
      end else begin
         FMascaraConta := _qrysql.FieldByName('MASCARA').AsString;
         MessageInfo   := '';
      end;
     //
   end;
end;

procedure TCtrlContaContabil.DoChangeDataBase;
begin
  inherited;
  _qrysql.DatabaseName           := DataBaseName;
  FqryContaContabil.DataBaseName := DataBaseName;
  FqryContaxCC.DataBaseName      := DataBaseName;
  FqryContaxSC.DataBaseName      := DataBaseName;

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

function TCtrlContaContabil.TestaContaContabil(IdPlano: Double;
  sPlaConta: String; bAceitaSintetica, bAceitaInativa: Boolean): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.TestaContaContabil(IdPlano, sPlaConta, bAceitaSintetica,
                bAceitaInativa, FNomeConta, FObrigaCentroCusto, FObrigaSubConta, FTipoContaContabil,
                FAceitaAlteraContab, FContaBloqueada, FDataBloqueio,  FMoedaHistorica,
                FTipoConvOfi, FTipoConvGeren, FTipoConvGeren1, FTipoConvGeren2);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      Result := True;
      _qrysql.Close;
      _qrysql.SQL.Clear;
      _qrysql.SQL.Add('SELECT PLATIPO, PLANOME, PLACCUST, PLASUBCONTA, PLAINATIVA,                ');
      _qrysql.SQL.Add('       PLAALTERA, PLABLOQUE, PLABLOQUEDATA, PLAMOEDAHISTORICA,             ');
      _qrysql.SQL.Add('       PLATIPCONVOFICIAL, PLATIPCONVGER, PLATIPCONVGEREN1,PLATIPCONVGEREN2 ');
      _qrysql.SQL.Add('FROM PLANOCONTA ');
      _qrysql.SQL.Add('WHERE (PLANO = '+FloatToStr(IdPlano)+')');
      _qrysql.SQL.Add('  AND (PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')');
      _qrysql.Open;
      if _qrysql.isEmpty then begin
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
         FNomeConta         := _qrysql.FieldByName('PLANOME').AsString;
         FObrigaCentroCusto := _qrysql.FieldByName('PLACCUST').AsString;
         FObrigaSubConta    := _qrysql.FieldByName('PLASUBCONTA').AsString;
         FTipoContaContabil := _qrysql.FieldByName('PLATIPO').AsString;
         FAceitaAlteraContab:= _qrysql.FieldByName('PLAALTERA').AsString;
         FContaBloqueada    := _qrysql.FieldByName('PLABLOQUE').AsString;
         FDataBloqueio      := _qrysql.FieldByName('PLABLOQUEDATA').AsDateTime;
         FMoedaHistorica    := _qrysql.FieldByName('PLAMOEDAHISTORICA').AsFloat;
         FTipoConvOfi       := _qrysql.FieldByName('PLATIPCONVOFICIAL').AsString;
         FTipoConvGeren     := _qrysql.FieldByName('PLATIPCONVGER').AsString;
         FTipoConvGeren1    := _qrysql.FieldByName('PLATIPCONVGEREN1').AsString;
         FTipoConvGeren2    := _qrysql.FieldByName('PLATIPCONVGEREN2').AsString;
         if (not bAceitaSintetica) and (_qrysql.FieldByName('PLATIPO').AsString = 'S') then begin
            Result := False;
            MessageInfo := 'Sintética';
         end;
         if (not bAceitaInativa) and (_qrysql.FieldByName('PLAINATIVA').AsString <> 'A') then begin
            Result := False;
            MessageInfo := 'Inativa';
         end;
      end;
     //
   end;
end;

function TCtrlContaContabil.SelecionaContas( idPlano : Double; TipoConta : TTipoConta; bContaInativa : Boolean  ) : Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.SelecionaContas(idPlano,Integer(TipoConta),bContaInativa);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      Result := True;
      { bContaInativa = True => Inclui as contas inativas
        bContaInativa = False => Não inclui as contas inativas
      }
      FqryContaContabil.Close;
      FqryContaContabil.SQL.Clear;
      FqryContaContabil.SQL.Add('SELECT PLACONTA, PLANOME, PLATIPO, PLAGRUPO, PLAGRAU ');
      FqryContaContabil.SQL.Add('FROM PLANOCONTA ');
      FqryContaContabil.SQL.Add('WHERE (PLANO = '+FloatToStr(idPlano)+')');
      Case TipoConta of
         tcSoSinteticaC : FqryContaContabil.SQL.Add('  AND (PLATIPO = ''S'')                  ');
         tcSoAnaliticaC : FqryContaContabil.SQL.Add('  AND (PLATIPO = ''A'')                  ');
      end;
      if not bContaInativa then
         FqryContaContabil.SQL.Add('  AND ((PLAINATIVA = ''A'') OR (PLAINATIVA IS NULL))');
      FqryContaContabil.SQL.Add('ORDER BY PLACONTA ');
   end;
end;


procedure TCtrlContaContabil.SetdspContaContabil(
  const Value: TDataSetProvider);
begin
  FdspContaContabil := Value;
end;

function TCtrlContaContabil.LeUltimoRegSubConta(iIdPessoa:Integer) :Double;
begin
      _cds.Data :=  GetDataPacket('SELECT MAX(CODSUBCONTA) AS PROXIMA FROM SUBCONTA ' +
                                  'WHERE IDPESSOA = ' + FloatToStr(iIdPessoa));

      Result := _cds.FieldByName('PROXIMA').AsFloat;
end;

procedure TCtrlContaContabil.SetqryContaContabil(const Value: TwwQuery);
begin
  FqryContaContabil := Value;
end;

constructor TCtrlContaContabil.Create;
begin
  inherited;

  FqryContaContabil:= Twwquery.Create(nil);
  FqryContaxCC     := Twwquery.Create(nil);
  FqryContaxSC     := Twwquery.Create(nil);
  FdspContaContabil:= TDataSetProvider.Create(nil);
  FdspContaxCC     := TDataSetProvider.Create(nil);
  FdspContaxSC     := TDataSetProvider.Create(nil);
  FdspContaContabil.DataSet := FqryContaContabil;
  FdspContaxCC.DataSet      := FqryContaxCC;
  FdspContaxSC.DataSet      := FqryContaxSC;

end;

destructor TCtrlContaContabil.Destroy;
begin
  inherited;
  FdspContaContabil.DataSet := nil;
  FdspContaContabil.Free;
  FqryContaContabil.Free;
  //
  FdspContaxCC.DataSet := nil;
  FdspContaxCC.Free;
  FqryContaxCC.Free;
  //
  FdspContaxSC.DataSet := nil;
  FdspContaxSC.Free;
  FqryContaxSC.Free;

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

function TCtrlContaContabil.SelecionaContasxCC(idPlano, idEmpresa: Double; sPlaConta, sCentroCusto : String;
               TipoCentroCusto : TTipoCentroCusto; TipoOrdenacao : TTipoOrdenacao  ): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.SelecionaContasxCC(idPlano, idEmpresa, sPlaConta, sCentroCusto,
                                     Integer(TipoCentroCusto), Integer(TipoOrdenacao));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      Result := True;
      FqryContaxCC.Close;
      FqryContaxCC.SQL.Clear;
      FqryContaxCC.SQL.Add('SELECT                                        ');
      FqryContaxCC.SQL.Add('   C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC ');
      FqryContaxCC.SQL.Add('FROM                                          ');
      FqryContaxCC.SQL.Add('   CENTCUST C,                                ');
      FqryContaxCC.SQL.Add('   CONTASXCC CC                               ');
      FqryContaxCC.SQL.Add('WHERE (CC.PLANO = '+FloatToStr(IdPlano)+')    ');
      FqryContaxCC.SQL.Add('  AND (CC.PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')');
      FqryContaxCC.SQL.Add('  AND (CC.IDEMPRESA = '+FloatToStr(IdEmpresa)+')   ');
      if sCentroCusto <> '' then begin
         FqryContaxCC.SQL.Add('  AND (CC.CODCENTROCUSTO = '''+Copy(trim(sCentroCusto)+'                 ',1,10)+''')');
      end;
      FqryContaxCC.SQL.Add('  AND ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL))     ');
      FqryContaxCC.SQL.Add('  AND (CC.CODCENTROCUSTO = C.CODCENTROCUSTO)       ');
      FqryContaxCC.SQL.Add('  AND (CC.IDEMPRESA = C.IDEMPRESA)                 ');
      Case TipoCentroCusto of
         tccSoSinteticaCC : FqryContaxCC.SQL.Add('  AND (C.STATUSGRUPOCDC = ''S'')  ');
         tccSoAnaliticaCC : FqryContaxCC.SQL.Add('  AND (C.STATUSGRUPOCDC = ''A'')  ');
      end;
      Case TipoOrdenacao of
         toCodigo : FqryContaxCC.SQL.Add('ORDER BY C.CODCENTROCUSTO ');
         toNome   : FqryContaxCC.SQL.Add('ORDER BY C.NOME           ');
      end;
   end;
end;

function TCtrlContaContabil.ListContasxCC(idPlano, idEmpresa: Double; sPlaConta, sCentroCusto : String;
               TipoCentroCusto : TTipoCentroCusto ): OleVariant;
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
            '   CC.IDUSUARIOINCLUSAO '+
            'FROM                    '+
            '   CENTCUST C,          '+
            '   CONTASXCC CC         '+
            'WHERE                   '+
            '      (CC.PLANO = ' + FloatToStr(IdPlano)+') ' +
            '  AND (RTRIM(CC.PLACONTA) = ''' + Trim(sPlaConta)+''') ' +
            '  AND (CC.IDEMPRESA = ' + FloatToStr(IdEmpresa)+') ';

    If sCentroCusto <> '' Then
       sSql := sSql + ' AND (CC.CODCENTROCUSTO = ''' + Trim(sCentroCusto) + ''') ';


    Case TipoCentroCusto of
         tccSoSinteticaCC : sSql := sSql + '  AND (C.STATUSGRUPOCDC = ''S'') ';
         tccSoAnaliticaCC : sSql := sSql + '  AND (C.STATUSGRUPOCDC = ''A'') ';
    end;

    sSql := sSql + ' AND ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL))  ' +
                   ' AND (CC.CODCENTROCUSTO = C.CODCENTROCUSTO)  ' +
                   ' AND (CC.IDEMPRESA = C.IDEMPRESA) ';

   sFiltro := 'ORDER BY C.NOME ';

   sSql := sSql + sFiltro;

   Result := GetDataPacket(sSql);


end;

function TCtrlContaContabil.SelecionaContasxSC(idPlano, idEmpresa,iSubConta: Double; sPlaConta : String;TipoOrdenacao : TTipoOrdenacao ): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.SelecionaContasxSC(idPlano,idEmpresa,iSubConta,
                     sPlaConta , Integer(TipoOrdenacao));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      Result := True;
      FqryContaxSC.Close;
      FqryContaxSC.SQL.Clear;
      FqryContaxSC.SQL.Add('SELECT S.CODSUBCONTA, S.NOMESUBCONTA         ');
      FqryContaxSC.SQL.Add('FROM                                         ');
      FqryContaxSC.SQL.Add('   SUBCONTA S, CONTASXSUBC SC                ');
      FqryContaxSC.SQL.Add('WHERE (SC.PLANO = '+FloatToStr(IdPlano)+')   ');
      FqryContaxSC.SQL.Add('  AND (SC.PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')');
      FqryContaxSC.SQL.Add('  AND (SC.IDPESSOA = '+FloatToStr(IdEmpresa)+')      ');
      if iSubConta <> 0 then begin
         FqryContaxSC.SQL.Add('  AND (SC.CODSUBCONTA = '+FloatToStr(iSubConta)+')   ');
      end;
      FqryContaxSC.SQL.Add('  AND (SC.CODSUBCONTA = S.CODSUBCONTA)   ');
      FqryContaxSC.SQL.Add('  AND (SC.IDPESSOA = S.IDPESSOA)         ');
      Case TipoOrdenacao of
         toCodigo : FqryContaxSC.SQL.Add('ORDER BY S.CODSUBCONTA  ');
         toNome   : FqryContaxSC.SQL.Add('ORDER BY S.NOMESUBCONTA ');
      end;
   end;
end;

function TCtrlContaContabil.ListContasxSC(idPlano, idEmpresa,iSubConta: Double; sPlaConta : String) :OleVariant;
var
  sSql,  sOrdena :string;
begin
   sSql:='SELECT '+
         '   S.NOMESUBCONTA, '+
         '   S.CODSUBCONTA,  '+
         '   C.IDUSUARIO, ' +
         '   C.IDPESSOA, ' +
         '   C.PLACONTA, ' +
         '   C.PLANO ' +
         'FROM CONTASXSUBC C, SUBCONTA S '+
         'WHERE (RTRIM(C.PLACONTA) = '''+Trim(sPlaConta)+''') AND '+
         '      (C.PLANO = '+FloatToStr(idPlano)+') AND '+
         '      (S.IDPESSOA = '+FloatToStr(idEmpresa)+') AND ';

   if iSubConta <> 0 then
      sSql := sSql + '  (C.CODSUBCONTA = '+FloatToStr(iSubConta)+') AND ';

   sSql := sSql + '      (C.CODSUBCONTA = S.CODSUBCONTA) AND '+
                  '      (C.IDPESSOA = S.IDPESSOA) ';

   sOrdena := 'ORDER BY S.NOMESUBCONTA ';

   sSql := sSql + sOrdena;

   Result:=GetDataPacket(sSql);

end;

procedure TCtrlContaContabil.SetdspContaxCC(const Value: TDataSetProvider);
begin
  FdspContaxCC := Value;
end;

procedure TCtrlContaContabil.SetdspContaxSC(const Value: TDataSetProvider);
begin
  FdspContaxSC := Value;
end;

procedure TCtrlContaContabil.SetqryContaxCC(const Value: TwwQuery);
begin
  FqryContaxCC := Value;
end;

procedure TCtrlContaContabil.SetqryContaxSC(const Value: TwwQuery);
begin
  FqryContaxSC := Value;
end;

function TCtrlContaContabil.TestaContaxCC(idPlano, idEmpresa: Double;
  sPlaConta, sCentroCusto: String): Boolean;
Begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.TestaContaxCC(idPlano, idEmpresa, sPlaConta, sCentroCusto);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      Result := True;
      _qrysql.Close;
      _qrysql.SQL.Clear;
      _qrysql.SQL.Add('SELECT                                       ');
      _qrysql.SQL.Add('   C.CODCENTROCUSTO                          ');
      _qrysql.SQL.Add('FROM                                         ');
      _qrysql.SQL.Add('   CENTCUST C,                               ');
      _qrysql.SQL.Add('   CONTASXCC CC                              ');
      _qrysql.SQL.Add('WHERE (CC.PLANO = '+FloatToStr(IdPlano)+')   ');
      _qrysql.SQL.Add('  AND (CC.PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')');
      _qrysql.SQL.Add('  AND (CC.CODCENTROCUSTO = '''+Copy(trim(sCentroCusto)+'                 ',1,10)+''')');
      _qrysql.SQL.Add('  AND (CC.IDEMPRESA = '+FloatToStr(IdEmpresa)+')   ');
      _qrysql.SQL.Add('  AND ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL))     ');
      _qrysql.SQL.Add('  AND (CC.CODCENTROCUSTO = C.CODCENTROCUSTO)       ');
      _qrysql.SQL.Add('  AND (CC.IDEMPRESA = C.IDEMPRESA)                 ');
      _qrysql.Open;
      if _qrysql.isEmpty then begin
         Result := False;
         MessageInfo := 'O centro de custo '+trim(sCentroCusto)+' não pode ser usado pela Conta Contábil '+trim(sPlaConta);
      end;
   end;
end;

function TCtrlContaContabil.TestaContaxSC(idPlano, idEmpresa,
  iSubConta: Double; sPlaConta: String): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.TestaContaxSC(idPlano, idEmpresa, iSubConta, sPlaConta);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      Result := True;
      _qrysql.Close;
      _qrysql.SQL.Clear;
      _qrysql.SQL.Add('SELECT CODSUBCONTA                           ');
      _qrysql.SQL.Add('FROM                                         ');
      _qrysql.SQL.Add('   CONTASXSUBC                               ');
      _qrysql.SQL.Add('WHERE (PLANO = '+FloatToStr(IdPlano)+')   ');
      _qrysql.SQL.Add('  AND (PLACONTA = '''+Copy(trim(sPlaConta)+'                 ',1,18)+''')');
      _qrysql.SQL.Add('  AND (CODSUBCONTA = '+FloatToStr(iSubConta)+')   ');
      _qrysql.SQL.Add('  AND (IDPESSOA = '+FloatToStr(IdEmpresa)+')   ');
      _qrysql.Open;
      if _qrysql.isEmpty then begin
         Result := False;
         MessageInfo := 'A subconta '+FloatToStr(iSubConta)+' não pode ser usada pela Conta Contábil '+trim(sPlaConta);
      end;
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
begin
   Result := False;
   _qrysql.Close;
   _qrysql.SQL.Clear;
   _qrysql.SQL.Add('SELECT                                     ');
   _qrysql.SQL.Add('   CONTA2, CENTROCUSTO2                    ');
   _qrysql.SQL.Add('FROM                                       ');
   _qrysql.SQL.Add('   PLANODEPARA                             ');
   _qrysql.SQL.Add('WHERE (PLANO1 = '+FloatToStr(iPlanoDE)+')  ');
   _qrysql.SQL.Add('  AND (PLANO2 = '+FloatToStr(iPlanoPARA)+')');
   _qrysql.SQL.Add('  AND (CONTA1 = '''+Copy(trim(sContaDE)+'                 ',1,18)+''')');
   if sCCustoDE <> '' then begin
      _qrysql.SQL.Add('  AND (CENTROCUSTO1 = '''+Copy(trim(sCCustoDE)+'                 ',1,10)+''')');
      _qrysql.SQL.Add('  AND (IDEMPRESA1 = '+FloatToStr(IdEmpresa)+')   ');
   end else begin
      _qrysql.SQL.Add('  AND (CENTROCUSTO1 IS NULL)');
      _qrysql.SQL.Add('  AND (CENTROCUSTO2 IS NULL)');
   end;
   _qrysql.Open;
   if not _qrysql.isEmpty then begin
      Result := True;
      FContaContabilPara := _qrysql.FieldByName('CONTA2').AsString;
      FCentroCustoPara   := _qrysql.FieldByName('CENTROCUSTO2').AsString;
   end else begin
      if sCCustoDE <> '' then begin
         _qrysql.Close;
         _qrysql.SQL.Clear;
         _qrysql.SQL.Add('SELECT                                     ');
         _qrysql.SQL.Add('   CONTA2, CENTROCUSTO2                    ');
         _qrysql.SQL.Add('FROM                                       ');
         _qrysql.SQL.Add('   PLANODEPARA                             ');
         _qrysql.SQL.Add('WHERE (PLANO1 = '+FloatToStr(iPlanoDE)+')  ');
         _qrysql.SQL.Add('  AND (PLANO2 = '+FloatToStr(iPlanoPARA)+')');
         _qrysql.SQL.Add('  AND (CONTA1 = '''+Copy(trim(sContaDE)+'                 ',1,18)+''')');
         _qrysql.SQL.Add('  AND (CENTROCUSTO1 IS NULL)');
         _qrysql.SQL.Add('  AND (CENTROCUSTO2 IS NULL)');
         _qrysql.Open;
         if not _qrysql.isEmpty then begin
            Result := True;
            FContaContabilPara := _qrysql.FieldByName('CONTA2').AsString;
            FCentroCustoPara   := _qrysql.FieldByName('CENTROCUSTO2').AsString;
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



end.




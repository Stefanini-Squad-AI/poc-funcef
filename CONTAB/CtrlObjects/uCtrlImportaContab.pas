unit uCtrlImportaContab;

//***************************************************************************************
//Rotina: ImportaLancamentos
//Nº SOL: 124569-503
//Nº KINTANA: 668793
//Data da Alteração: 18/03/2010
//Responsável: Ricardo A.
//Descrição: Importação de lançamentos com segregação para financiamento habitacional.
//**************************************************************************************

{==========================================================
  Autor     : Rodolpho da Silva
  Data      : 05/09/2005
  Pemdência : 20048
  Rotina    : CarregaRegistro
  Descrição : Implementar qry para trazer o código do centro
              de custo através do código externo
==========================================================}

interface

uses DB, uDataBase, uCmControlObject, dbclient, uCMTypes, sysutils, Provider, uMidasUtil,
     uCtrlGeral, uCtrlContab, ComCtrls, Classes, uCtrlPeriodo, uCtrlContaContabil, mask,
     uFuncaoGeral, uCtrlLancamento, uCtrlHistoContab, uCtrlListTerceiros, uCtrlSubConta,
     uCtrlPlanilha, uCtrlPadroes, JclMath, dBaseDados, uSistema, uCtrlProcessaContab,
     uCtrlSegregacao;
type
  TObjContabil = record
                   sTipoLanc: char;   // 0, 1 e 2
                   iUnidNegoc,iSubContaD,iSubContaC,
                   iPlanPrev, iPatro, iPlnCodigo, iPlanilha: integer;
                   sDataLanc,sNumDoc, sHist1, sHist2, sHist3, sHist4, sHist5,
                   sCCustD,sContaD,sCCustC,sContaC,sHistorico,
                   scodHistPadrao, sOrigApl, sUneCodigo, sPlnCodigoExt: string;
                   dValLanc : Extended;
                   iIdSegregaCriter: integer;
                   dDataSegregaCriter: TDateTime;
                 end;


  TCtrlImportaContab = class(TCmControlObject)

  Protected
    procedure OnCreateAppServer;override;

  private

    Lancamento     : TCtrlLancamento;
    HistoContab    : TCtrlHistoContab;
    ListTerceiros  : TCtrlListTerceiros;
    SubConta       : TCtrlSubConta;
    Planilha       : TCtrlPlanilha;
    _Padroes       : TCtrlPadroes;

    // Ricardo A. SOL 124569-503 KTN 679624
    CtrlProcessaContab: TCtrlProcessaContab;
    CtrlSegregacao: TCtrlSegregacao;
    CdsCriterio: TClientDataSet;
    CdsAux: TClientDataSet;
    // FIM Ricardo A. SOL 124569-503 KTN 679624

    FProgresso: Integer;
    FsMensAPS_Log: String;
    FsMensAdd: String;
    FLinhaTexto: string;

    procedure SetProgresso(const Value: Integer);
    procedure SetsMensAPS_Log(const Value: String);
    function RemoveChar(S: String; C:Char): String;
    procedure SetsMensAdd(const Value: String);
    procedure SetLinhaTexto(const Value: string);

    function ZeraRegistro: TObjContabil;
    function CarregaRegistro(const slinha: string;
                             const iEmpresa: integer;
                             const bUsaPlanoPatro: boolean;
                             var reg: TObjContabil; iplanpocentrocusto: integer): boolean;
    function TestaMudancaPlanilha(const reg, regAux: TObjContabil): TObjContabil;
    procedure TestaIgualdades(var reg: TObjContabil; var regaux: TObjContabil;
              const sLinha: string; const iEmpresa: integer; const bUsaPlanoPatro: boolean);
  public
      Property sMensAdd : String read FsMensAdd write SetsMensAdd;
      Property sMensAPS_Log : String read FsMensAPS_Log write SetsMensAPS_Log;
      Property Progresso: Integer read FProgresso write SetProgresso;
      Property LinhaTexto : string read FLinhaTexto write SetLinhaTexto;

      Constructor Create; Override;
      Destructor  Destroy;Override;
      Function ImportaLancamentos(ArquivoTexto:TStringList;iEmpresa,iPlano,iUsuario,
                                  iModulo,iNumCommit:Integer;sTipoOper, sCaminho:string;
                                  bTestaConta,bHistCheked, bUsaPPatro:Boolean; iplanpocentrocusto: integer) : Boolean;

  end;

implementation

{ TCtrlImportaContab }


constructor TCtrlImportaContab.Create;
begin
  inherited;
  Lancamento    := TCtrlLancamento.Create;
  Lancamento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil);

  HistoContab   := TCtrlHistoContab.Create;
  HistoContab.Initializeas(Lancamento);

  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initializeas(Lancamento);

  SubConta      := TCtrlSubConta.Create;
  SubConta.Initializeas(Lancamento);

  Planilha      := TCtrlPlanilha.Create;
  Planilha.Initializeas(Lancamento);

  _Padroes       := TCtrlPadroes.Create;
  _Padroes.Initializeas(Lancamento);

  // Ricardo A. SOL 124569-503 KTN 679624
  CdsAux := TClientDataSet.Create( nil );
  CdsAux.Data := Lancamento.SelecionaLancamentosEsp( -1 );

  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initializeas( Lancamento );

  CdsCriterio := TClientDataSet.Create( nil );

  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.Initializeas( Lancamento );
  CtrlSegregacao.GetParams( Sistema.IdEmpresa );
  // FIM Ricardo A. SOL 124569-503 KTN 679624
end;

destructor TCtrlImportaContab.Destroy;
begin
  Lancamento.Free;
  HistoContab.free;
  ListTerceiros.free;
  SubConta.free;
  Planilha.free;
  _Padroes.free;

  // Ricardo A. SOL 124569-503 KTN 679624
  CdsAux.Free;
  CdsCriterio.Free;
  CtrlProcessaContab.Free;
  // FIM Ricardo A. SOL 124569-503 KTN 679624  

  inherited destroy;
end;


procedure TCtrlImportaContab.OnCreateAppServer;
begin
  inherited;

end;

// este método atribui os campos
//    reg.sDataLanc  /  reg.iPlnCodigo   /   result.sPlnCodigoExt

function TCtrlImportaContab.TestaMudancaPlanilha(const reg, regAux: TObjContabil): TObjContabil;
begin
  result := reg;

  // abrir nova planilha (datas diferentes(col 1) e número de planilha diferente(col 376)) conforme layout
  // a data somente será reatribuida se for diferente dentro do arquivo
  if result.sDataLanc = '' then
  begin
    result.sDataLanc     := regAux.sDataLanc;
    result.iPlnCodigo    := 0;
    result.sPlnCodigoExt := regAux.sPlnCodigoExt;
    exit;
  end;

  if (regAux.sDataLanc = reg.sDataLanc) and (regAux.sPlnCodigoExt = reg.sPlnCodigoExt) then
    Exit;


  // AQUI AS DATAS OU PLANILHAS SÃO DIFERENTES

  if (regAux.sTipoLanc = '0') or (regAux.sTipoLanc = '1') then begin
    Result.iPlnCodigo := 0;
    Result.sDataLanc  := regAux.sDataLanc;
    result.sPlnCodigoExt := regAux.sPlnCodigoExt;
  end
  else begin  // aqui nós temos uma partida dobrada
    // se a conta a debito e a conta a crédito do registro forem brancas é primeira passagem
    // neste caso a planilha pode ser alterada
    if (reg.sContaD = '') and (reg.sContaC = '') then  begin
      Result.iPlnCodigo := 0;
      Result.sDataLanc  := regAux.sDataLanc;
      result.sPlnCodigoExt := regAux.sPlnCodigoExt;
    end else begin
       raise exception.Create ('Partida Dobrada, o processo detectou a tentativa de mudança de planilha, ou pela data ( col. 1) ou pelo número da planilha (col. 376). ' + #13 +
                               'Os lançamentos de partida dobrada tem que pertencer à mesma planilha, verifique ainda a linha anterior!');
    end;//else
  end;//else

end;




function TCtrlImportaContab.CarregaRegistro(const slinha: string;
                                            const iEmpresa: integer;
                                            const bUsaPlanoPatro: boolean;
                                            var reg: TObjContabil; iplanpocentrocusto: integer): boolean;
var regAux : TObjContabil;
    sTipoLanc : string;
    AuxDec: Char;
    cdsLocal: TClientDataSet;

begin
  try
    result := true;

    regAux := zeraRegistro;

    AuxDec           := DecimalSeparator;
    DecimalSeparator := '.';

    try
      regAux.sTipoLanc := sLinha[11];
      if regAux.sTipoLanc = '' then
        raise exception.Create ('Divergência coluna 11 - Tipo de Lançamento - valor nulo. ')
      else
      begin
         if (reg.sTipoLanc = '2') and (regAux.sTipoLanc <> '2') then   // linha anterior partida dobrada
            raise exception.Create ('Divergência coluna 11 - Tipo de Lançamento. Verificar também linha anterior!')
         else
           reg.sTipoLanc := regAux.sTipoLanc;

         if not ((reg.sTipoLanc >= '0') and (reg.sTipoLanc <= '2')) then
           raise exception.Create ('Divergência coluna 11 - Tipo de Lançamento - valor diferente de: "0", "1" ou "2"')
      end;

      // testar consistência do tipo de lançamento 0,1,2 e D,C
      sTipoLanc := Trim(copy(sLinha,12,1));
      if (sTipoLanc <> 'D') and (sTipoLanc <> 'C') then
        raise exception.Create ('Divergência coluna 12 - valores válidos "D" e "C" - valor passado: "' + sTipoLanc + '"')
      else
        if ((reg.sTipoLanc = '0') and (sTipoLanc ='C')) or ((reg.sTipoLanc = '1') and (sTipoLanc ='D')) then
          raise exception.Create ('Divergência no campo "Tipo de Lançamento" entre a coluna 11 e 12 - valores passados ' + reg.sTipoLanc + ' / ' + regAux.sTipoLanc )
        else
          if reg.sTipoLanc = '2' then
            if ((sTipoLanc = 'D') and (reg.sContaD <> '')) or ((sTipoLanc = 'C') and (reg.sContaC <> '')) then
              raise exception.Create ('Partida Dobrada, divergência no campo "Tipo de Lançamento" entre a coluna 11 e 12 - o tipo de lançamento deve conter um lançamento a credito e um a débito, verifique também a linha anterior.');

      // este bloco de código deve ser chamado antes da atribuição da conta contábil
      regAux.sPlnCodigoExt := Trim(copy(sLinha,376,8));
      regAux.sDataLanc     := Trim(copy(sLinha,1,10));
      regAux.sNumDoc       := Trim(copy(sLinha,14,15));

      reg := TestaMudancaPlanilha(reg, regAux);

     try
        cdsLocal      := TClientDataSet.Create(nil);

        cdsLocal.Data := GetDataPacket('SELECT CODCENTROCUSTO FROM CENTCUST WHERE CODEXTERNO = ' + QuotedStr(Trim(copy(sLinha,229,10))) +
                                     ' AND IDPLANCENTCUST = '+ intToStr(iplanpocentrocusto) );

        if (sTipoLanc = 'C') then
         begin
           reg.iSubContaC     := StrToIntDef(Trim(copy(sLinha,367,5)), 0);
           reg.sContaC        := Trim(copy(sLinha,239,18));
           reg.sCCustC        := Trim(cdsLocal.FieldByName('CODCENTROCUSTO').AsString);
         end else begin
           reg.iSubContaD     := StrToIntDef (Trim(copy(sLinha,367,5)), 0);
           reg.sContaD        := Trim(copy(sLinha,239,18));
           reg.sCCustD        := Trim(cdsLocal.FieldByName('CODCENTROCUSTO').AsString);
         end;

     finally
         FreeAndNil(cdsLocal);
     end;

     // testar igualdadades
     TestaIgualdades(reg, regaux, sLinha, iEmpresa, bUsaPlanoPatro);

    except
       on e:Exception do begin
          MessageInfo := e.Message;
          result := false;
       end;
    end;
  finally
     DecimalSeparator := AuxDec;
  end;
end; //


function TCtrlImportaContab.ImportaLancamentos(ArquivoTexto:TStringList;
                   iEmpresa, iPlano,iUsuario,iModulo,iNumCommit:Integer; sTipoOper,
                   sCaminho:string;bTestaConta,bHistCheked,bUsaPPatro:Boolean; iplanpocentrocusto: integer) : Boolean;
var
  iPlnCodigo, iContaCommit, iContaLinha : integer;
  sMens, sHistCompleto, sHistorico, sMascaraHist : string;
  regLin1: TObjContabil;

  dValorTotal, dValor, dValorSoma: Double;
  iOrdemLancaRateadoSeq, iOrdemLancaRatTemp, iidSegregaCriter: Integer;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaLancamentos(StringlistToVariant(ArquivoTexto),
                                iEmpresa,iPlano,iUsuario,iModulo,iNumCommit, sTipoOper,
                                sCaminho,bTestaConta,bHistCheked,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
      Begin
         FsMensAPS_Log := Connection.AppServer.MessageInfo2;
      End;

   End Else
   Begin
     result := true;

     //Inicializa as variáveis
     iContaLinha      := 0;
     FProgresso       := 0;
     sMens            := '';
     sMensAPS_Log     := '';
     FLinhaTexto := '';
     iContaCommit     := 0;

     //Loop de Varredura do Arquivo Texto
     regLin1 := ZeraRegistro;
     regLin1.iPlnCodigo := 0;
     regLin1.sDataLanc  := '';
     iPlnCodigo := 0;

     // Ricardo A. SOL 124569-503 KTN 679624
     iOrdemLancaRateadoSeq := 0;

     Try
       While (ArquivoTexto.Count <>  iContaLinha)  do
       Begin
         If ((iContaLinha Mod iNumCommit) = 0) Then
           StartTransaction;

           if not CarregaRegistro(ArquivoTexto[iContaLinha], iEmpresa, bUsaPPatro, regLin1, iplanpocentrocusto) then
             raise exception.create(MessageInfo);

           sHistCompleto := trim(regLin1.sHist1) +' '+ trim(regLin1.sHist2) +' '+ trim(regLin1.sHist3) +' '+ trim(regLin1.sHist4) +' '+ trim(regLin1.sHist5);
           If (regLin1.sHistorico <> '0000') AND (regLin1.sHistorico <> '') then
           Begin
             If bHistCheked Then
             Begin
               _cds.Data := HistoContab.ListHistoContab(iEmpresa,tohCodigo,sHistorico);
               If not _cds.isEmpty Then
               Begin
                 sMascaraHist  := Trim(_cds.FieldByName('HITDESCR1').asString);
                 sMascaraHist  := RemoveChar(sMascaraHist,#35);
                 sHistCompleto := sMascaraHist + sHistCompleto;
               End;
             End;
           End;
           HistoContab.ArrumaHistorico(sHistCompleto);

           //*** insere os lancamentos ***
           if ((regLin1.sTipoLanc = '2') and (regLin1.sContaD <> '') and (regLin1.sContaC <> '')) or
              (regLin1.sTipoLanc in ['0','1'] ) then
           begin

             // Ricardo A. SOL 124569-503 KTN 679624
             if not CtrlSegregacao.SegregaVirtual then
             begin
               CdsCriterio.Data := CtrlProcessaContab.GetCriterioSegrega(
                        regLin1.iIdSegregaCriter,
                        regLin1.sDataLanc
                        );
             end;

             dValorTotal := regLin1.dValLanc;
             dValor := 0;
             dValorSoma := 0;
             CdsAux.EmptyDataSet;
             if CdsCriterio.IsEmpty then
             begin
               iOrdemLancaRatTemp := -1;
               iidSegregaCriter := regLin1.iIdSegregaCriter;

               CdsAux.Append;
               CdsAux.FieldByName( 'IDPATRO' ).AsInteger := regLin1.iPatro;
               CdsAux.FieldByName( 'IDPLANOPREV' ).AsInteger := regLin1.iPlanPrev;
               CdsAux.FieldByName( 'LACVALOR' ).AsFloat := dValorTotal;
               CdsAux.Post;
             end
             else
             begin
               iidSegregaCriter := -1;
               Inc( iOrdemLancaRateadoSeq );
               iOrdemLancaRatTemp := iOrdemLancaRateadoSeq;
               CdsCriterio.First;
               while not CdsCriterio.Eof do
               begin
                 CdsAux.Append;
                 CdsAux.FieldByName( 'IDPATRO' ).AsInteger := CdsCriterio.FieldByName('IDPATRO').AsInteger;
                 CdsAux.FieldByName( 'IDPLANOPREV' ).AsInteger := CdsCriterio.FieldByName('IDPLANOPREV').AsInteger;
                 CdsAux.FieldByName( 'IDSEGREGACRITER' ).AsInteger := -1;

                 if CdsCriterio.RecNo = CdsCriterio.RecordCount then
                   dValor := dValorTotal - dValorSoma
                 else
                   dValor := StrToFloat( FormatFloat( '##.00', ( dValorTotal * CdsCriterio.FieldByName( 'COTACAO' ).AsFloat ) /100 ) );

                 CdsAux.FieldByName( 'LACVALOR' ).AsFloat := dValor;
                 dValorSoma := dValorSoma + dValor;
                 CdsAux.Post;

                 CdsCriterio.Next;
               end;

             end;

             CdsAux.First;
             while not CdsAux.Eof do
             begin

               Lancamento.lcTestaConta := bTestaConta;
               If Not Lancamento.InsereLancaContab (
                                                regLin1.sTipoLanc,
                                                iEmpresa,
                                                iModulo,
                                                iUsuario,
                                                iPlano,
                                                regLin1.iUnidNegoc,
                                                regLin1.iSubContaD,
                                                regLin1.iSubContaC,
                                                CdsAux.FieldByName( 'IDPLANOPREV' ).AsInteger,
                                                CdsAux.FieldByName( 'IDPATRO' ).AsInteger,
                                                regLin1.iPlnCodigo,
                                                0,
                                                regLin1.sDataLanc,
                                                regLin1.sNumDoc,
                                                HistoContab.Hist1,
                                                HistoContab.Hist2,
                                                HistoContab.Hist3,
                                                HistoContab.Hist4,
                                                HistoContab.Hist5,
                                                sTipoOper,
                                                regLin1.sCCustD,
                                                regLin1.sContaD,
                                                regLin1.sCCustC,
                                                regLin1.sContaC,
                                                regLin1.sHistorico,
                                                CdsAux.FieldByName( 'LACVALOR' ).AsFloat,
                                                False,
                                                bUsaPPatro,
                                                iidSegregaCriter,
                                                StrToDate( regLin1.sDataLanc ),
                                                //regLin1.dDataSegregaCriter,
                                                -1,
                                                True,
                                                -1,
                                                False,
                                                iOrdemLancaRatTemp
                                                ) then

               begin
                 sMensAdd := sMensAdd + MessageInfo + chr(13);
                 MessageInfo := Lancamento.MessageInfo;
                 raise Exception.Create(Lancamento.MessageInfo);

               end
               else
                 regLin1.iPlnCodigo := trunc(Lancamento.RetornoPlnCodigo);

               CdsAux.Next;
             end;

               regLin1 := ZeraRegistro;

               _cds.Data := Planilha.ListPlanilhas(0, regLin1.iPlnCodigo);

               If iPlnCodigo <> regLin1.iPlnCodigo Then
               Begin
                  sMens := IntToStr(_cds.FieldByName('PLNPLANIL').asInteger) + ' em: ' + regLin1.sDataLanc;
                  sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                  iPlnCodigo := regLin1.iPlnCodigo;
                  FLinhaTexto := FLinhaTexto + #13 + sMens;
               End;
           end; // if contabiliza

           iContaLinha := iContaLinha + 1;
           FProgresso  := FProgresso + 1;
           MessageInfo := '*';

           If ((iContaLinha Mod iNumCommit) = 0) or (icontaLinha  = ArquivoTexto.Count) Then
           Begin
             If not _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario, 'Importa Lançamentos Externos - Lançamentos',False) then
               Raise Exception.Create( _Padroes.MessageInfo );
             Commit;
             iContaCommit := iContaLinha;
             if icontaLinha  = ArquivoTexto.Count then
               MessageInfo := 'Importação efetuda com sucesso.'
           End;


       End; // while

     Except
       RollBack;
       sMens :='Houve erros na importação. ' + CHR(13) + CHR(13) +
               'A linha nº ' + IntToStr(iContaLinha+1) + ' do arquivo importado está com problemas.'+ CHR(13) +
               'Foi importado até a linha nº ' + IntToStr(iContaCommit) +'.'+ CHR(13) +
               'Apague do seu TXT as linhas já importadas. ' + CHR(13) +
               'Verifique os Lançamentos com inconsistências.';

       MessageInfo := MessageInfo + '. ' +sMens;
       sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
       Result := False;
       Exit;
     End;
   End;// else
end;





procedure TCtrlImportaContab.SetProgresso(const Value: Integer);
begin
  FProgresso := Value;
end;

procedure TCtrlImportaContab.SetsMensAPS_Log(const Value: String);
begin
  FsMensAPS_Log := Value;
end;



function TCtrlImportaContab.RemoveChar(S: String; C: Char): String;
var x : Integer;
begin
   For x:= 1 To Length(S) do
   Begin
      if s[x] = C Then
      Begin
         Delete(S,x,1);
      End;
   End;
   Result := S;
end;

procedure TCtrlImportaContab.SetsMensAdd(const Value: String);
begin
  FsMensAdd := Value;
end;

procedure TCtrlImportaContab.SetLinhaTexto(const Value: string);
begin
  FLinhaTexto := Value;
end;

function TCtrlImportaContab.ZeraRegistro: TObjContabil;
begin
    result.sTipoLanc      := ' ';
    result.iSubContaC     := 0;
    result.iSubContaD     := 0;
    result.iPlanPrev      := 0;
    result.iPatro         := 0;
    result.sNumDoc        := '';
    result.sContaC        := '';
    result.sContaD        := '';
    result.sCCustC        := '';
    result.sCCustD        := '';
    result.sHistorico     := '';
    Result.sHist1         := '';
    Result.sHist2         := '';
    Result.sHist3         := '';
    Result.sHist4         := '';
    Result.sHist5         := '';
    result.sCodHistPadrao := '';
    result.sOrigApl       := '';
    result.dValLanc       := 0;
end;

procedure TCtrlImportaContab.TestaIgualdades(var reg: TObjContabil; var regaux: TObjContabil;
                                            const sLinha: string; const iEmpresa: integer; const bUsaPlanoPatro: boolean);
begin
  regAux.sHist1         := RemoveChar(Trim(copy(sLinha,29, 40)),#39);
  regAux.sHist2         := RemoveChar(Trim(copy(sLinha,69, 40)),#39);
  regAux.sHist3         := RemoveChar(Trim(copy(sLinha,109,40)),#39);
  regAux.sHist4         := RemoveChar(Trim(copy(sLinha,149,40)),#39);
  regAux.sHist5         := RemoveChar(Trim(copy(sLinha,189,40)),#39);
  regAux.sHistorico     := Trim(copy(sLinha,372,4));
  regAux.sCodHistPadrao := Trim(copy(sLinha,372,4));
  regAux.sOrigApl       := Trim(copy(sLinha,13,1));

  regAux.iIdSegregaCriter := StrToIntDef(Trim(copy(sLinha,412,10)), -1);

  if (reg.sTipoLanc = '2') and (reg.iIdSegregaCriter <> 0) and (regAux.iIdSegregaCriter <> regAux.iIdSegregaCriter) then
    raise exception.Create ('Partida Dobrada, Os critérios de segregação a crédito e a débito tem que ser iguais')
  else begin
    reg.iIdSegregaCriter := regAux.iIdSegregaCriter;
  end;

  reg.sHist1         := RemoveChar(Trim(copy(sLinha,29, 40)),#39);
  reg.sHist2         := RemoveChar(Trim(copy(sLinha,69, 40)),#39);
  reg.sHist3         := RemoveChar(Trim(copy(sLinha,109,40)),#39);
  reg.sHist4         := RemoveChar(Trim(copy(sLinha,149,40)),#39);
  reg.sHist5         := RemoveChar(Trim(copy(sLinha,189,40)),#39);
  reg.sHistorico     := Trim(copy(sLinha,372,4));

  if (reg.sTipoLanc = '2') and (trim(reg.sCodHistPadrao) <> '') and (trim(regAux.sCodHistPadrao) <> trim(regAux.sCodHistPadrao)) then
    raise exception.Create ('Partida Dobrada, Os histtóricos padrão de lançamento a crédito e a débito tem que ser iguais')
  else if trim(reg.sCodHistPadrao) = '' then
    reg.sCodHistPadrao := Trim(copy(sLinha,372,4));

  if trim(reg.sOrigApl) = '' then
    reg.sOrigApl       := Trim(copy(sLinha,13,1));
  if reg.iIdSegregaCriter = 0 then
    reg.iIdSegregaCriter    := StrToIntDef(Trim(copy(sLinha,412,10)), -1);

  //testa valor
  regAux.dValLanc := strToFloat(Trim(copy(sLinha,257,19)));
  if isFloatZero(reg.dValLanc) then
  begin
    reg.dValLanc := regAux.dValLanc;
    if (isFloatZero(reg.dValLanc)) then
      raise exception.Create ('O valor do lançamento não pode ser zero.');
  end
  else if not((reg.sTipoLanc = '2') and (FloatsEqual(reg.dValLanc, regAux.dValLanc))) then
    raise exception.Create ('Partida Dobrada, os valores dos lançamento a débito e a crédito tem que ser iguais.');

  regAux.sUneCodigo := trim(copy(sLinha,342,8));
  //testa atividade/projeto
  if (reg.sTipoLanc = '2') and (reg.sUneCodigo <> regAux.sUneCodigo) and
     (trim(reg.sUneCodigo) <> '') then
  begin
    raise exception.Create ('Partida Dobrada, atividade/projeto tem que ser iguais nos lançamentos a débito e a crédito.');
  end else if reg.sUneCodigo = '' then
  begin
    reg.sUneCodigo := regAux.sUneCodigo;

    //Pega a Unidade de Negócio
    _cds.Data := ListTerceiros.ListAtivProj(iEmpresa,0,reg.sUneCodigo,tapAmbos,toapCodigo);
    If _cds.isEmpty Then
      reg.iUnidNegoc := 0
    Else
      reg.iUnidNegoc := _cds.FieldByName('UNIDNEGOC').AsInteger;
  end;

  if bUsaPlanoPatro then
  begin
    regAux.iPlanPrev := StrToIntDef(Trim(copy(sLinha,392,10)), 0);
    regAux.iPatro    := StrToIntDef(Trim(copy(sLinha,402,10)), 0);
    if regAux.iPlanPrev = 0 then
      raise exception.Create ('Plano Previdenciário é obrigatório.');

    if regAux.iPatro = 0 then
      raise exception.Create ('Patrocinadora é obrigatório.');

    if (reg.sTipoLanc = '2') and (reg.iPlanPrev <> 0) and (reg.iPlanPrev <> regAux.iPlanPrev) then
      raise exception.Create ('Partida dobrada, a coluna 392 (Plano Previdenciário) deve ser igual - valores passados ' + inttostr(reg.iPlanPrev) + ' / ' + inttostr(regAux.iPlanPrev))
    else if reg.iPlanPrev = 0 then
      reg.iPlanPrev := regAux.iPlanPrev;

    if (reg.sTipoLanc = '2') and (reg.iPatro <> 0) and (reg.iPatro <> regAux.iPatro) then
      raise exception.Create ('Partida dobrada, a coluna 402 (Patrocinadora) deve ser igual - valores passados ' + inttostr(reg.iPatro) + ' / ' + inttostr(regAux.iPatro))
    else
      reg.iPatro := regAux.iPatro;
  end;

  if (regAux.sTipoLanc = '2') and
     ((regAux.sNumDoc <> reg.sNumDoc) and (reg.sNumDoc <> '')) then
    raise exception.Create ('Partida Dobrada, Divergência entre a coluna 376 e 384 - valores passados ' + reg.sNumDoc + ' / ' + regAux.sNumDoc + #13 +
                            'Os lançamentos de partida dobrada tem que para o mesmo documento.')
  else if trim(reg.sNumDoc) = '' then
    reg.sNumDoc := regAux.sNumDoc;

end;

end.

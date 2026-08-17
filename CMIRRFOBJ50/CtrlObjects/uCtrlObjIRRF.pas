unit uCtrlObjIrrf;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaIRRF_Ext
Autor(a)  : Edilaine
Data      : 10/03/2026
Pendencia : WO32047
Alteração : No cálculo do IR Exterior aplicar a tab progressiva sem deduções/reduções
----------------------------------------------------------------------------------------------------
Rotina    : CarregaFaixasIRRF, CalculaIRRF
Autor(a)  : Edilaine
Data      : 17/12/2025
Pendencia : WO29025
Alteração : Novo cálculo da tabela de IRRF
----------------------------------------------------------------------------------------------------
Rotina    : CarregaFaixasIRRF
Autor(a)  : Edilaine
Data      : 07/02/2024
Pendencia : WO7766
Alteração : Tratamento de casa decimais desc. simplificado
----------------------------------------------------------------------------------------------------
Rotina    : CalculaIRRF
Autor(a)  : Andre Imakawa
Data      : 26/02/2024
Pendencia : WO7973
Alteração : Ajuste no Desconto Simplificado MP 1171
--------------------------------------------------------------------------------------------------
Rotina    : CalculaIRRF, DeducaoSimplificadaIRRF
Autor(a)  : Edilaine
Data      : 07/07/2023
Pendencia : 136670
Alteração : Criação parametros para Desconto Simplificado MP 1171
--------------------------------------------------------------------------------------------------
Rotina    : CalculoIdade
Data      : 06/10/2015
Autor     : Fernando Xavier
Pendência : SOL 262719 PPM 1099944
Descrição : Sistema realiza o cálculo incorreto do imposto de renda
----------------------------------------------------------------------------------------------------
Rotina    : Correções de Calculo do IR Regressivo
Data      : 27/05/2014
Autor     : Helio Lima Custodio
Pendência : SOL Nº 151061-10442 KINTANA Nº 1720319
Descrição : Correção da Aliquota
----------------------------------------------------------------------------------------------------
Rotina    : CalculaIRRFRegressivoContinuado e AtualizaPrazoAcumulacao
Data      : 22/05/2007
Autor     : André Pontes
Pendência : 25432
Descrição : Gravação do log para cálculo de IR regressivo de benefício continuado
----------------------------------------------------------------------------------------------------
Rotina    : CalculaIRRFRegressivoResgate e CalculaIRRFRegressivoContinuado
Data      : 18/01/2007
Autor     : André Pontes
Pendência : 24234
Descrição : Verificação do tamanho do vetor que armazena a tabela regressiva, para evitar Access
            Violation se esta estiver vazia.
----------------------------------------------------------------------------------------------------
Rotina    : AtualizaValorIRFinal
Data      : 24/10/2006
Autor     : André Pontes
Pendência : 18949
Descrição : Criação de rotina para gravar o valor final abatido (na prévia utiliza-se um valor
            "provisório"
----------------------------------------------------------------------------------------------------
Rotina    : AtualizaPrazoAcumulacao
Data      : 11/10/2006 a
Autor     : André Pontes
Pendência : 18949
Descrição : Criação de rotina para atualizar o fator de permanência
----------------------------------------------------------------------------------------------------
Rotina    : CarregaTabelaRegressiva, CarregaCotas, CalculaIRRFRegressivoResgate,
            CalculaIRRFRegressivoContinuado
Data      : 04/10/2006 a 10/10/2006
Autor     : André Pontes
Pendência : 18949
Descrição : Implementação de novas rotinas para cálculo do IR pela tabela regressiva
---------------------------------------------------------------------------------------------------}


interface

uses
  sysutils, uCmControlObject, uCmDbObject, uDbIRRF, DB, uDataBase, uSistema,
  DbClient, wwQuery, Classes, Forms, uCMClientDataSet, uDiasUteis,

  uCMFileUtils, shellapi, Windows,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};


  type

    ObjFaixa = class(TObject)
                 Faixa_IRRF,
                 Aliquota_IRRF,
                 ParcDeduzIRRF : Double;
                 ParcDeduzSimpl_Irf : Double;         //edilaine SIG136670 {aplica desconto simplificado MP 1171}
               End;

    //edilaine WO29025 : inicio
    ObjReducao = class(TObject)
                 Faixa_Trib_Ini,
                 Faixa_Trib_Fim,
                 ReducaoIRRF   : double;
                 FatorIRRF     : double;
               End;
    //edilaine WO29025 : fim

    // ---------------------------------------------------------------------------------------------

    TLogTotalPrev = Record
      IDLogTotalPrev  : Int64;
      IDModulo        : Int64;
      IDImpostoRetido : Int64;
      IDLancIRRF      : Int64;
      CodPlanDoc      : Extended;
      Origem          : Integer;
      IDUsuario       : Int64;
      Data            : TDateTime;
      DataIni         : TDateTime;
      DataFim         : TDateTime;
      Versao          : string;
      Operacao        : string
    end;

    // ---------------------------------------------------------------------------------------------

    TTabRegressiva = record
      iPrazo      : Integer;
      fAliquota   : Currency;
      fVlrFaixa   : Currency;
    end;

    TTabCotas = record
      iMoeda   : Integer;
      fCotacao : Currency;
    end;

    // ---------------------------------------------------------------------------------------------

    TCtrlObjIrrf = Class(TCmControlObject)
    private
      FDbObjIrrf       : TDbIRRF;
      FCdsObjIrrf      : TClientDataSet;
      FVlrIdoso        : Double;
      FPercIrrfExt     : Double;
      FIdade           : Integer;
      FVlrDependente   : Double;
      CdsAux           : TCMClientDataSet;
      FaixasL          : TStrings;
      FaixaIRRF        : ObjFaixa;
      dParcDeduzir     : Double;
      FDataPagamento   : string;
      vTabRegressiva   : array of TTabRegressiva;
      vTabCotas        : array of TTabCotas;
      FVlrDeduzidoIRSimplif: double;
      //edilaine WO29025 : inicio
      FFlgDeduzDescSimplIdade: string;
      FFlgDeduzDescSimplDepen: string;
      FaixaReducao     : ObjReducao;
      FaixasRed        : TStrings;
      //edilaine WO29025 : fim

      procedure SetDbObjIrrf(const Value: TDbIRRF);
      procedure SetCdsObjIrrf(const Value: TClientDataSet);
      procedure SetVlrIdoso(const Value: Double);
      procedure SetPercIrrfExt(const Value: Double);
      procedure SetIdade(const Value: Integer);
      procedure SetVlrDependente(const Value: Double);
      function CalcIdade(dataref:string;dDataNasc:TDateTime):integer;
      function BuscaFaixa(pBase:Double):boolean;
      procedure SetDataPagamento(const Value: string);
      procedure SetVlrDeduzidoIRSimplif(const Value: double);

      function LogToFile(const sLog   : String;
                         const sArq   : String;
                         const bHora  : Boolean = True
                        ): Boolean;

      //edilaine WO29025 : inicio
      procedure SetFlgDeduzDescSimplDepen(const Value: string);
      procedure SetFlgDeduzDescSimplIdade(const Value: string);

      function  BuscaFaixaReducao(pBaseTrib: Double): boolean;
      procedure LiberaFaixasReducao;
      //edilaine WO29025 : fim

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      // manipulação de Strings --------------------------------------------------------------------
      function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
      function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
      // -------------------------------------------------------------------------------------------

      property CdsObjIrrf: TClientDataSet read FCdsObjIrrf    write SetCdsObjIrrf;
      property DbObjIrrf: TDbIRRF         read FDbObjIrrf     write setDbObjIrrf;
      property VlrIdoso: Double           read FVlrIdoso      write SetVlrIdoso;
      property PercIrrfExt: Double        read FPercIrrfExt   write SetPercIrrfExt;
      property Idade: Integer             read FIdade         write SetIdade;
      property VlrDep: Double             read FVlrDependente write SetVlrDependente;
      property DataPagamento: string      read FDataPagamento write SetDataPagamento;
      property VlrDeduzidoIRSimplif : double read FVlrDeduzidoIRSimplif write SetVlrDeduzidoIRSimplif;

      property FlgDeduzDescSimplDepen : string read FFlgDeduzDescSimplDepen write SetFlgDeduzDescSimplDepen;
      property FlgDeduzDescSimplIdade : string read FFlgDeduzDescSimplIdade write SetFlgDeduzDescSimplIdade;


      procedure LiberaFaixasIRRF;
      procedure CarregaFaixasIRRF(DataPesq: String = '');

      function CalculaIRRF_Ext(pBase:double; DataRef: string):double;     overload;                                   //edilaine WO32047
      function CalculaIRRF_Ext(pBase: double; DataRef: string; Tipo:LongInt;
                               Var pPercentual:Double;
                               Var pVlrReducao : Double;
                               bCalcDeducaoSimplif_Irrf : boolean = false) : double;   overload;   //edilaine WO32047

      function ListFaixaIR(FaixaIRRF, sDtLanc : string) : OleVariant;
      function CalculaIRRF(pNumDepen:integer;dtDataNasc:TDateTime;
                           Var pBase,pPercentual:Double;
                           var pVlrReducao : double;       //edilaine WO29025
                           DataRef:String;
                           Tipo:LongInt;
                           rVlrPA : double = 0;                           //edilaine SIG136670
                           bCalcDeducaoSimplif_Irrf : boolean = true;     //edilaine SIG136670
                           pVlrTributavel : double = 0                    //edilaine WO29025
                           ):double;   overload;


      function CalculaIRRF(pNumDepen: integer;
                           dtDataNasc: TDateTime; var pBase, pPercentual: Double;
                           DataRef: String;
                           Tipo: Integer;
                           rVlrPA : double = 0; bCalcDeducaoSimplif_Irrf : boolean = true    //edilaine SIG136670
                          ): double;   OVERLOAD;

      //edilaine SIG136670 : inicio
      function DeducaoSimplificadaIRRF(pNumDepen : integer; dtDataNasc : TDateTime;
                                       pDataRef  : string;  pVlrPA : double
                                       ) : double;
      //edilaine SIG136670 : fim

      // -------------------------------------------------------------------------------------------

      procedure CarregaTabelaRegressiva(const dData: TDateTime);
      procedure CarregaCotas(const dData: TDateTime);
      function CalculaIRRFRegressivoResgate(const IDPessoa     : Integer;
                                            const IDPlanoPrev  : Integer;
                                            const fVlrBase     : Currency;
                                            const dDataRef     : TDateTime
                                           ): Currency;

      function AtualizaValorIRFinal(const IDPessoa     : Integer;
                                    const IDPlanoPrev  : Integer;
                                    const fVlrBase     : Currency;
                                    const dDataRef     : TDateTime
                                   ): Currency;

      function CalculaIRRFRegressivoContinuado(const IDPessoa     : Integer;
                                               const IDPlanoPrev  : Integer;
                                               const fVlrBase     : Currency;
                                               const dDataRef     : TDateTime
                                              ): Currency;

      function NumeroIngles(fValor: Extended): String;

      function AtualizaPrazoAcumulacao(const IDPessoa     : Integer;
                                       const IDPlanoPrev  : Integer;
                                       const sArq         : string; 
                                       const bRecalculo   : Boolean = True
                                      ): Double;


      // -------------------------------------------------------------------------------------------

      procedure LimpaRegistroLog(var Registro: TLogTotalPrev);

      // -------------------------------------------------------------------------------------------

    End;

implementation

{ TCtrlObjIrrf }

constructor TCtrlObjIrrf.Create;
begin
  inherited;
  FDbObjIrrf := TDbIrrf.Create(Self);
  FaixasL    := TStringList.Create;
  CdsAux     := TCMClientDataSet.Create(Nil);
  FaixasRed  := TStringList.Create;           //edilaine WO29025
  
  CarregaFaixasIRRF(formatdatetime('dd/mm/yyyy', now));
end;

destructor TCtrlObjIrrf.Destroy;
begin
  
  LiberaFaixasIRRF;
  LiberaFaixasReducao;            //edilaine WO29025

  FDbObjIrrf.Free;
  cdsAux.Free;
  FaixasL.Free;
  FaixasRed.Free;                 //edilaine WO29025
  
  If isAppServer Then FCdsObjIrrf.Free;
  inherited;
end;

procedure TCtrlObjIrrf.DoChangeDataBase;
begin
  inherited;
  DbObjIrrf.DataBaseName := DataBaseName;
end;

procedure TCtrlObjIrrf.SetCdsObjIrrf(const Value: TClientDataSet);
begin
  FCdsObjIrrf := Value;
end;

procedure TCtrlObjIrrf.SetDbObjIrrf(const Value: TDbIRRF);
begin
  FDbObjIrrf := Value;
end;

procedure TCtrlObjIrrf.OnCreateAppServer;
begin
  inherited;
  FcdsObjIrrf := TClientDataSet.Create(nil);
end;

function TCtrlObjIrrf.ListFaixaIR(FaixaIRRF, sDtLanc: String): OleVariant;
Var
  sSql : String;

begin
  Ssql   := ' SELECT '+
              ' FAIXA_IRRF, '+
              ' ALIQUOTA_IRRF, '+
              ' PARCDEDUZIRRF, '+
              ' DATAINIVIGENCIA '+
            ' FROM '+
              ' IRRF '+
            ' WHERE '+
              ' DATAINIVIGENCIA = (SELECT '+
                                   ' MAX(DATAINIVIGENCIA) '+
                                 ' FROM '+
                                   ' IRRF '+
                                 ' WHERE '+
                                   ' DATAINIVIGENCIA <= '+QuotedStr(sDtLanc)+') AND '+
              ' FAIXA_IRRF >= '+FaixaIRRF+' AND '+
              ' ROWNUM = 1 '+
            ' ORDER BY '+
              ' FAIXA_IRRF ';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlObjIrrf.CarregaFaixasIRRF(DataPesq: String);
Var
  sSql : String;
  qryAux : TwwQuery;
  dFaixaZero_irrf   : double;           //edilaine SIG136670
  bCalcDeducaoSimplif_Irrf : boolean;   //edilaine SIG136670
  rVlrDeducaoSimplif_Irrf  : double;    //edilaine SIG136670
begin
  If DataPesq = '' Then DataPesq := DateToStr(Date);
  qryAux := TwwQuery.Create(nil);        //edilaine WO29025
  qryAux.DataBaseName := 'BaseDados';
  LiberaFaixasIRRF;
  LiberaFaixasReducao;                   //edilaine WO29025

  //edilaine SIG136670 : inicio
  {busca parametros para deducao simplificada MP 1171/23}
  sSql := 'SELECT '+
          '    (SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGDESCSIMPLESIRRF'')   AS FLGDESCSIMPLIF, '+
          '    (SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGDESCSIMPLESIDADE'')  AS FLGDEDUZIDADE,  '+   //edilaine WO29025
          '    (SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGDESCSIMPLESDEPEND'') AS FLGDEDUZDEPEND, '+   //edilaine WO29025
          //'    (SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''DEDUCAODESCSIMPLES'') AS DEDUCAODESCSIMPLIF '+                      //edilaine WO7766
          //'    (SELECT REPLACE(VALORPARAM, ''.'', '','') FROM PARAMFOLHA WHERE NOMEPARAM = ''DEDUCAODESCSIMPLES'') AS DEDUCAODESCSIMPLIF '+ //edilaine WO7766
          '    (SELECT TO_NUMBER(REPLACE(VALORPARAM, ''.'', '','')) FROM PARAMFOLHA WHERE NOMEPARAM = ''DEDUCAODESCSIMPLES'') AS DEDUCAODESCSIMPLIF '+  //edilaine B_MIGRACAO_ORACLE_2025
          '  FROM DUAL ';

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSql);
  qryAux.Open;
  bCalcDeducaoSimplif_Irrf := qryAux.FieldByName('FLGDESCSIMPLIF').AsString = '1';
  if qryAux.FieldByName('DEDUCAODESCSIMPLIF').AsString <> '' then
    rVlrDeducaoSimplif_Irrf  := qryAux.FieldByName('DEDUCAODESCSIMPLIF').AsFloat
  else
    rVlrDeducaoSimplif_Irrf  :=  0;
  //edilaine SIG136670 : fim
  FlgDeduzDescSimplDepen := qryAux.FieldByName('FLGDEDUZDEPEND').AsString;    //edilaine WO29025
  FlgDeduzDescSimplIdade := qryAux.FieldByName('FLGDEDUZIDADE').AsString;     //edilaine WO29025

  sSql := 'SELECT H.IDADEIDOSO, H.VLRIDOSO, H.VLRDEPENDENTE, H.PERCIRRFEXTERIOR '+
          'FROM HSTPARAMIRRF H, '+
               '(SELECT MAX(DATAINIVIGENCIA) AS DATA '+
                'FROM IRRF '+
                'WHERE DATAINIVIGENCIA <= TO_DATE('+
                       QuotedStr(DataPesq)+',''DD/MM/YYYY'') '+
                ') T '+
          'WHERE H.DATAINIVIGENCIA = T.DATA';
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSql);
  qryAux.Open;
  Idade       := qryAux.FieldByName('IDADEIDOSO').AsInteger;
  VlrIdoso    := qryAux.FieldByName('VLRIDOSO').AsFloat;
  VlrDep      := qryAux.FieldByName('VLRDEPENDENTE').AsFloat;
  PercIrrfExt := qryAux.FieldByName('PERCIRRFEXTERIOR').AsFloat;

  sSql := 'SELECT '+
          '       I.IDIRRF, I.FAIXA_IRRF, I.ALIQUOTA_IRRF, I.PARCDEDUZIRRF, I.DATAINIVIGENCIA '+
          '  FROM IRRF I, (SELECT MAX(DATAINIVIGENCIA) AS DATA '+
          '                 FROM IRRF WHERE DATAINIVIGENCIA <= TO_DATE('+
                                  QuotedStr(DataPesq)+',''DD/MM/YYYY'') '+
          '               ) T '+
          ' WHERE '+
          '   T.DATA = I.DATAINIVIGENCIA '+
          'ORDER BY I.FAIXA_IRRF ';

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSql);
  qryAux.Open;

  While Not qryAux.Eof Do
  Begin
    FaixaIRRF  := ObjFaixa.Create;
    FaixaIRRF.Faixa_Irrf    := qryAux.FieldByName('faixa_irrf').AsFloat;
    FaixaIRRF.Aliquota_Irrf := qryAux.FieldByName('aliquota_irrf').AsFloat;
    FaixaIRRF.ParcDeduzIrrf := qryAux.FieldByName('parcdeduzirrf').AsFloat;

    //edilaine SIG136670 : inicio
    {desconto simplificado MP 1171}
    if (bCalcDeducaoSimplif_Irrf) then
       FaixaIRRF.ParcDeduzSimpl_Irf := rVlrDeducaoSimplif_Irrf
    else
       FaixaIRRF.ParcDeduzSimpl_Irf := 0;
    //edilaine SIG136670 : fim

    FaixasL.AddObject('',FaixaIRRF);
    qryAux.Next;
  End;
  qryAux.Close;

  //edilaine WO29025 : inicio
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT I.FAIXA_TRIBUTAVEL, I.REDUCAO, I.FATOR, ');
  qryAux.Sql.Add('       CASE                                    ');
  qryAux.Sql.Add('         WHEN LAG(I.FAIXA_TRIBUTAVEL) OVER (ORDER BY I.FAIXA_TRIBUTAVEL) IS NULL THEN 0  ');
  qryAux.Sql.Add('         ELSE LAG(I.FAIXA_TRIBUTAVEL) OVER (ORDER BY I.FAIXA_TRIBUTAVEL) + 0.01          ');
  qryAux.Sql.Add('       END AS FAIXA_TRIBUTAVEL_LINHA_ANTERIOR ');
  qryAux.Sql.Add('  FROM IRRF_REDUCAO I,                        ');
  qryAux.Sql.Add('       (SELECT MAX(M.DATAINIVIGENCIA) AS DATA ');
  qryAux.Sql.Add('          FROM IRRF_REDUCAO M                 ');
  qryAux.Sql.Add('         WHERE M.DATAINIVIGENCIA <= TO_DATE('+QuotedStr(DataPesq)+',''DD/MM/YYYY'') ');
  qryAux.Sql.Add('       ) T ');
  qryAux.Sql.Add(' WHERE ');
  qryAux.Sql.Add('   T.DATA = I.DATAINIVIGENCIA ');
  qryAux.Sql.Add('ORDER BY I.FAIXA_TRIBUTAVEL   ');
  qryAux.Open;

  While Not qryAux.Eof Do
  Begin
    FaixaReducao := ObjReducao.Create;
    FaixaReducao.Faixa_Trib_Ini := qryAux.FieldByName('FAIXA_TRIBUTAVEL_LINHA_ANTERIOR').AsFloat;
    FaixaReducao.Faixa_Trib_Fim := qryAux.FieldByName('FAIXA_TRIBUTAVEL').AsFloat;
    FaixaReducao.ReducaoIrrf    := qryAux.FieldByName('REDUCAO').AsFloat;
    FaixaReducao.FatorIrrf      := qryAux.FieldByName('FATOR').AsFloat;

    FaixasRed.AddObject('',FaixaReducao);
    qryAux.Next;
  End;
  qryAux.Close;
  //edilaine WO29025 : fim

  qryAux.Free;

  DataPagamento:=DataPesq;
end;


function TCtrlObjIrrf.CalculaIRRF(pNumDepen: integer;
  dtDataNasc: TDateTime; var pBase, pPercentual: Double;
  DataRef: String;
  Tipo: Integer;
  rVlrPA : double = 0; bCalcDeducaoSimplif_Irrf : boolean = true    //edilaine SIG136670
  ): double;
begin
  if DataRef <> DataPagamento then
    CarregaFaixasIRRF(DataRef);

  //edilaine SIG136670 : inicio
  VlrDeduzidoIRSimplif := 0;

  //pBase := pBase - VlrDep * pNumDepen;

  If CalcIdade(DataRef, dtDataNasc) >= Idade Then
    pBase := pBase - VlrIdoso;

  BuscaFaixa(pBase - VlrDep * pNumDepen); //WO7973 - Andre Imakawa

  if (bCalcDeducaoSimplif_Irrf) and
     (DeducaoSimplificadaIRRF(pNumDepen, dtDataNasc, DataRef, rVlrPA) > 0) and
     (FaixaIRRF.Aliquota_IRRF > 0) then //WO7973 - Andre Imakawa
     VlrDeduzidoIRSimplif := FaixaIRRF.ParcDeduzSimpl_Irf;

  if VlrDeduzidoIRSimplif = 0 then
     pBase := pBase - VlrDep * pNumDepen
  else
     pBase := (pBase + rVlrPA) - VlrDeduzidoIRSimplif; {acrescenta a PA de volta na base e aplica o desconto}
  //edilaine SIG136670 : fim

  If BuscaFaixa(pBase) Then
  Begin
    pPercentual:= FaixaIRRF.Aliquota_Irrf;
    //Caso seja 0 - Imposto Devido;
    Result     := pPercentual/100 * pBase - FaixaIRRF.ParcDeduzIrrf;

    Case Tipo Of
      1 : Result := pPercentual;             //Caso seja Aliquota IRRF
      2 : Result := FaixaIRRF.ParcDeduzIrrf; //Caso seja PARCDEDUZIRRF
    End;
  End
  Else
  Begin
    pPercentual:=0;
    Result     :=0;
  End;
end;


function TCtrlObjIrrf.CalculaIRRF(pNumDepen: integer;
  dtDataNasc: TDateTime; var pBase, pPercentual: Double;
  var pVlrReducao : double;       //edilaine WO29025
  DataRef: String;
  Tipo: Integer;
  rVlrPA : double = 0; bCalcDeducaoSimplif_Irrf : boolean = true;    //edilaine SIG136670
  pVlrTributavel : double = 0                                        //edilaine WO29025
  ): double;
begin
  if DataRef <> DataPagamento then
    CarregaFaixasIRRF(DataRef);

  //edilaine SIG136670 : inicio
  VlrDeduzidoIRSimplif := 0;

  //pBase := pBase - VlrDep * pNumDepen;

  If CalcIdade(DataRef, dtDataNasc) >= Idade Then
  begin
    pBase := pBase - VlrIdoso;

    pVlrTributavel := pVlrTributavel - VlrIdoso;      //edilaine WO29025
  end;

  BuscaFaixa(pBase - VlrDep * pNumDepen); //WO7973 - Andre Imakawa

  if (bCalcDeducaoSimplif_Irrf) and
     (DeducaoSimplificadaIRRF(pNumDepen, dtDataNasc, DataRef, rVlrPA) > 0) and
     (FaixaIRRF.Aliquota_IRRF > 0) then //WO7973 - Andre Imakawa
     VlrDeduzidoIRSimplif := FaixaIRRF.ParcDeduzSimpl_Irf;

  if VlrDeduzidoIRSimplif = 0 then
     pBase := pBase - VlrDep * pNumDepen
  else
     pBase := (pBase + rVlrPA) - VlrDeduzidoIRSimplif; {acrescenta a PA de volta na base e aplica o desconto}
  //edilaine SIG136670 : fim

  If BuscaFaixa(pBase) Then
  Begin
    pPercentual:= FaixaIRRF.Aliquota_Irrf;
    //Caso seja 0 - Imposto Devido;
    Result     := pPercentual/100 * pBase - FaixaIRRF.ParcDeduzIrrf;

    //edilaine WO29025 : inicio
    pVlrReducao := 0;
    If BuscaFaixaReducao(pVlrTributavel) Then
    begin
      //se for a 1a faixa de reducao entao a renda é isenta de imposto
      if FaixaReducao.Faixa_Trib_Ini = 0 then
         Result := 0
      else if FaixaReducao.FatorIRRF > 0 then
         pVlrReducao := (FaixaReducao.ReducaoIRRF - (FaixaReducao.FatorIRRF * pVlrTributavel))
      else
         pVlrReducao := FaixaReducao.ReducaoIRRF;
    end;

    Result := Result - pVlrReducao;

    if Result < 0 then
       Result := 0;
    //edilaine WO29025 : fim

    Case Tipo Of
      1 : Result := pPercentual;             //Caso seja Aliquota IRRF
      2 : Result := FaixaIRRF.ParcDeduzIrrf; //Caso seja PARCDEDUZIRRF
    End;
  End
  Else
  Begin
    pPercentual:=0;
    Result     :=0;
  End;
end;


// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------


procedure TCtrlObjIrrf.CarregaTabelaRegressiva(const dData: TDateTime);
var
   sSQL        : String;
   sData       : String;
   iContador   : Integer;
begin
   
   vTabRegressiva := nil;

   sData := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dData)) + ', ''DD/MM/YYYY'')';

   
   sSQL :=
   'SELECT '                           + #13 +      
   '   IRR.PRAZOACUM, IRR.ALIQUOTA '   + #13 +   

   'FROM '                             + #13 +   
   '   IRRFREGRESSIVA IRR, '           + #13 +
   '   ( '                             + #13 +
   '   SELECT '                        + #13 +
   '      MAX(DATAVIGENCIA) AS DATA '  + #13 +
   '   FROM '                          + #13 +
   '      IRRFREGRESSIVA '             + #13 +
   '   WHERE '                         + #13 +
   '      DATAVIGENCIA <= ' + sData    + #13 +
   '   ) DTA '                         + #13 +

   'WHERE '                            + #13 +
   '   IRR.DATAVIGENCIA = DTA.DATA '   + #13 +

   'ORDER BY '                         + #13 +
   '   IRR.PRAZOACUM ';

   cdsAux.Close;
   cdsAux.Data := GetDataPacket(sSQL);

   // ----------------------------------------------------------------------------------------------

   // Carrega a tabela no vetor

   iContador := 0;
   while not(cdsAux.EOF) do
   begin
      SetLength(vTabRegressiva, iContador + 1);

      vTabRegressiva[iContador].iPrazo    := cdsAux.FieldByName('PRAZOACUM').AsInteger;
      vTabRegressiva[iContador].fAliquota := cdsAux.FieldByName('ALIQUOTA').AsCurrency;

      inc(iContador);
      cdsAux.Next;
   end;

   // ----------------------------------------------------------------------------------------------
end;



procedure TCtrlObjIrrf.CarregaCotas(const dData: TDateTime);
var
   sSQL        : String;
   sData       : String;
   sMoeda      : String;
   iContador   : Integer;
   cdsCotacao  : TCMClientDataSet;
begin
   // ----------------------------------------------------------------------------------------------

   // cria o cds que conterá as cotas que devem ter a cotação buscada
   cdsCotacao  := TCMClientDataSet.Create(nil);

   // zera o vetor de cotações
   vTabCotas   := nil;

   sData       := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dData)) + ', ''DD/MM/YYYY'')';

   // ----------------------------------------------------------------------------------------------

   try
      // -------------------------------------------------------------------------------------------

      // Seleciona todos os indexadores de reservas

      sSQL :=
      'SELECT DISTINCT '                     + #13 +                   
      '   RXP.INDICEREAJUSTE '               + #13 +
      'FROM '                                + #13 +
      '   RESERVAXPLANO RXP '                + #13 +
      'WHERE '                               + #13 +
      '   RXP.INDICEREAJUSTE IS NOT NULL '   + #13 +
      'ORDER BY '                            + #13 +
      '   RXP.INDICEREAJUSTE ';              

      cdsAux.Close;
      cdsAux.Data := GetDataPacket(sSQL);

      // -------------------------------------------------------------------------------------------

      // Para cada um dos indexadores selecionados, busca a última cotação cadastrada antes da data
      // do processo

      iContador := 0;
      while not(cdsAux.EOF) do
      begin
         sMoeda := FormatFloat('#0', cdsAux.FieldByName('INDICEREAJUSTE').AsInteger);

         sSQL :=
         'SELECT '                           + #13 +
         '   CTM.COTVALOR '                  + #13 +
         'FROM '                             + #13 +
         '   COTACAOMOEDA CTM, '             + #13 +
         '   ( '                             + #13 +
         '   SELECT '                        + #13 +
         '      MAX(COTDATA) AS DATA '       + #13 +
         '   FROM '                          + #13 +
         '      COTACAOMOEDA '               + #13 +
         '   WHERE '                         + #13 +
         '      COTDATA <= ' + sData         + #13 +
         '   ) DTA '                         + #13 +
         'WHERE '                            + #13 +
         '       CTM.MOECODIGO = ' + sMoeda  + #13 +
         '   AND CTM.COTDATA   = DTA.DATA ';

         cdsCotacao.Close;
         cdsCotacao.Data := GetDataPacket(sSQL);

         // ----------------------------------------------------------------------------------------

         // Alimenta o vetor de cotações

         SetLength(vTabCotas, iContador + 1);

         vTabCotas[iContador].iMoeda   := cdsAux.FieldByName('INDICEREAJUSTE').AsInteger;
         vTabCotas[iContador].fCotacao := cdsCotacao.FieldByName('COTVALOR').AsCurrency;

         inc(iContador);
         cdsAux.Next;

         // ----------------------------------------------------------------------------------------
      end;

   finally
      cdsCotacao.Free;
   end;
end;



function TCtrlObjIrrf.CalculaIRRFRegressivoResgate(const IDPessoa     : Integer;
                                                   const IDPlanoPrev  : Integer;
                                                   const fVlrBase     : Currency;
                                                   const dDataRef     : TDateTime
                                                  ): Currency;
var
  sArq          : String;
  sSQL          : String;
  sTexto        : String;
  iContador     : Integer;
  fDias         : Single;
  fAnos         : Single;
  fVlrRestante  : Currency;
  fVlrImposto   : Currency;
  fVlrCota      : Currency;
  fVlrReserva   : Currency;
  fVlrUpdate    : Currency;
  fDataReserva  : TDateTime;
  fDataOriginal : TDateTime;
begin
   sArq := 'IR-Resgate' + '-' + FormatFloat('#0', IDPessoa) + '-' + FormatFloat('#0', IDPlanoPrev) + '.log';

   LogToFile('Processo de cálculo de IR pela tabela regressiva referente ao resgate de reserva', sArq, False);
   LogToFile(' ', sArq, False);
   LogToFile('IDPessoa : ' + FormatFloat('#0', IDPessoa), sArq, False);
   LogToFile('IDPlano  : ' + FormatFloat('#0', IDPlanoPrev), sArq, False);
   LogToFile(' ', sArq, False);

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   // 1º - Carrega as aliquotas/faixas na data (apenas se já não estiver carregada)
   //      Carrega o valor das cotas na data (apenas se já não estiver carregada)

   // Limpa o valor acumulado por faixa
   if (vTabRegressiva <> nil) and (length(vTabRegressiva) > 0) then
   begin
      LogToFile('Limpa tabela regressiva anteriormente carregada', sArq);
      for iContador := 0 to length(vTabRegressiva) - 1 do
      begin
         vTabRegressiva[iContador].fVlrFaixa := 0;
      end;
   end;

   // Essa verificação é feita comparando-se dDataRef com DataPagamento, que é uma propriedade do
   // TCtrlObjIrrf
   if FormatFloat('DD/MM/YYYY', dDataRef) <> DataPagamento then
   begin
      LogToFile('Antes de carregar tabela regressiva', sArq);
      CarregaTabelaRegressiva(dDataRef);
      LogToFile('Após carregar tabela regressiva', sArq);
      LogToFile('Antes de carregar cotas', sArq);
      CarregaCotas(dDataRef);
      LogToFile('Após carregar cotas', sArq);

      DataPagamento := FormatDateTime('DD/MM/YYYY', dDataRef);
   end;


   LogToFile('Data de referência: ', sArq);



   // Se a tabela regressiva estiver vazia, o vetor não será alimentado
   // Para evitar Access Violation nesses casos, sai da função com resultado ZERO
   if (vTabRegressiva = nil) or (length(vTabRegressiva) <= 0) then
   begin
      LogToFile('Tabela regressiva vazia', sArq);
      Result := 0;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   // 2º - Busca as reservas por data de entrada

   sSQL :=
   'SELECT '                                                                                          + #13 +
   '   HMR.IDHISTRESERVA, HMR.IDPLANOPREV, HMR.IDTIPORESERVA, HMR.IDPESSJUR, HMR.IDCONTRIBUICAO, '    + #13 +
   '   HMR.DATAALIMENTACAO, HMR.DATAMOV, '                                                            + #13 +
   '   HMR.VLRREAL, HMR.VLRCOTAS, HMR.SALDOREAL, HMR.SALDOREALCONT, HMR.SALDOCOTAS, HMR.FLGENTRADA, ' + #13 +
   '   HMR.VALORINDICE, HMR.MESREFERENCIA, HMR.VLRCOTASIRPREVIA, HMR.VLRCOTASIR, '                    + #13 +
   '   NVL(HMR.VLRCOTASIR, HMR.VLRCOTASIRPREVIA) AS VALOR_COTAS_IR, '                                 + #13 +
   '   RXP.INDICEREAJUSTE '                                                                           + #13 +

   'FROM '                                                                                            + #13 +
   '   HISTMOVRESERVA HMR, '                                                                          + #13 +
   '   RESERVAXPLANO  RXP  '                                                                          + #13 +

   'WHERE '                                                                                           + #13 +
   '       HMR.IDPESSOA       = ' + FormatFloat('#0', IDPessoa)                                       + #13 +
   '   AND HMR.IDPLANOPREV    = ' + FormatFloat('#0', IDPlanoPrev)                                    + #13 +
   '   AND RXP.IDPLANOPREV    = ' + FormatFloat('#0', IDPlanoPrev)                                    + #13 +

   // Filtra apenas as movimentações oriundas de contribuições, e apenas as entradas,
   // não considerando padrão de movimentação de reserva e resgates.
   // O objetivo é apenas determinar a "idade" dos aportes
   '   AND HMR.IDCONTRIBUICAO IS NOT NULL '                                                           + #13 +
   '   AND HMR.FLGENTRADA     = 1 '                                                                   + #13 +

   // Apenas as reservas "não utilizadas", comparando o valor utilizado nos resgates anteriores
   // com o valor original da entrada de reserva (por contribuição)
   '   AND ( '                                                                                        + #13 +
   '       HMR.VLRCOTASIR     IS NULL OR '                                                            + #13 +
   '       (ABS(NVL(HMR.VLRCOTAS, 0) - NVL(HMR.VLRCOTASIR, 0)) > 0.01) '                              + #13 +
   '       ) '                                                                                        + #13 +

   // Considera apenas as reservas marcadas como "usar para regressiva"
   '   AND RXP.FLGREGRESSIVA  = 1 '                                                                   + #13 +

   '   AND HMR.IDPLANOPREV    = RXP.IDPLANOPREV '                                                     + #13 +
   '   AND HMR.IDTIPORESERVA  = RXP.IDTIPORESERVA '                                                   + #13 +

   'ORDER BY '                                                                                        + #13 +
   '   HMR.DATAALIMENTACAO ';

   LogToFile('Antes de buscar reservas', sArq);

   cdsAux.Close;
   cdsAux.Data := GetDataPacket(sSQL);

   LogToFile('Após buscar reservas', sArq);

   if cdsAux.IsEmpty then
     LogToFile('Não foi localizada reserva', sArq);

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   // 3º - Itera pelas reservas, calculando o tempo de acumulação de cada registro e totalizando o
   //      valor para cada prazo de acumulação

   fVlrRestante := fVlrBase;

   LogToFile('Valor base: ' + FormatFloat('#,#0.00', fVlrBase), sArq);
   LogToFile(' ', sArq, False);

   if not(cdsAux.IsEmpty) then
   begin
     LogToFile('Reservas: ', sArq, False);
     LogToFile(' ', sArq, False);

     LogToFile('ID Reserva Data Alim  Data Cons  Idade  Valor        ', sArq, False);
     LogToFile('---------- ---------- ---------- ------ -------------', sArq, False);
   end;

   while not(cdsAux.EOF) and (fVlrRestante > 0) do
   begin
      // -------------------------------------------------------------------------------------------
      // Encontra o valor da cota (na data de referência) referente à movimentação corrente

      fVlrCota := 0;
      for iContador := 0 to length(vTabRegressiva) -1 do
      begin
         if vTabCotas[iContador].iMoeda = cdsAux.FieldByName('INDICEREAJUSTE').AsInteger then
         begin
            fVlrCota := vTabCotas[iContador].fCotacao;
            Break;
         end;
      end;

      // -------------------------------------------------------------------------------------------

      // Calcula a "idade" (em anos) daquela entrada de reserva
      fDataOriginal := cdsAux.FieldByName('DATAALIMENTACAO').AsDateTime;
      fDataReserva  := cdsAux.FieldByName('DATAALIMENTACAO').AsDateTime;

      // mas a contagem só começa a partir de 01/01/2005
      if fDataReserva < StrToDate('01/01/2005') then fDataReserva := StrToDate('01/01/2005');

      // -------------------------------------------------------------------------------------------

      fAnos       := DiasUteis.IntervaloMeses(fDataReserva, dDataRef) / 12;

      // Por conta da interpretação da CBS, aqui será necessário ler um parâmetro (a ser criado),
      // que indica se deve-se considerar o mês de entrada da reserva na contagem
      if Sistema.TipoCliente = 19981 then
        fAnos     := ( DiasUteis.IntervaloMeses(fDataReserva, dDataRef) + 1 ) / 12;

      // -------------------------------------------------------------------------------------------

      // Traz a valor corrente o valor em cotas "restante" de reserva
      fVlrReserva    := (cdsAux.FieldByName('VLRCOTAS').AsCurrency * fVlrCota) -
                        (cdsAux.FieldByName('VLRCOTASIR').AsCurrency * fVlrCota);

      // Decide quanto vai utilizar daquela entrada de reserva
      if fVlrRestante > fVlrReserva then
         fVlrUpdate := fVlrReserva
      else
         fVlrUpdate := fVlrRestante;

      // Grava na entrada de reserva quanto foi utilizado (em cotas)
      if cdsAux.FieldByName('IDHISTRESERVA').AsInteger > 0 then
      begin
         sSQL := 'UPDATE HISTMOVRESERVA SET VLRCOTASIRPREVIA = ' + NumeroIngles(fVlrUpdate / fVlrCota) + 'WHERE IDHISTRESERVA = ' + FormatFloat('#0', cdsAux.FieldByName('IDHISTRESERVA').AsInteger);
         ExecSQL(sSQL);
      end;

      // Abate do valor "restante" a resgatar o valor daquela entrada de reserva
      fVlrRestante   := fVlrRestante - fVlrUpdate;

      // -------------------------------------------------------------------------------------------

      sTexto := CompletaInicio(FormatFloat('#0', cdsAux.FieldByName('IDHISTRESERVA').AsInteger), ' ', 10)   + ' ' +
                FormatDateTime('dd/mm/yyyy', fDataOriginal)                                                 + ' ' +
                FormatDateTime('dd/mm/yyyy', fDataReserva)                                                  + ' ' +
                CompletaInicio(FormatFloat('#0.00', fAnos), ' ', 6)                                         + ' ' +
                CompletaInicio(FormatFloat('#,#0.00', (cdsAux.FieldByName('VLRCOTAS').AsCurrency * fVlrCota)), ' ', 13);

      LogToFile(sTexto, sArq, False);

      // -------------------------------------------------------------------------------------------

      // Verifica em que faixa deve entrar o valor utilizada daquela entrada de reserva
      for iContador := 0 to length(vTabRegressiva) -1 do
      begin
         if fAnos <= vTabRegressiva[iContador].iPrazo then Break;
      end;

      vTabRegressiva[iContador].fVlrFaixa := vTabRegressiva[iContador].fVlrFaixa + fVlrUpdate;

      // -------------------------------------------------------------------------------------------

      cdsAux.Next;
   end;

   // Verifica se sobrou algum valor, ie, há mais valor a resgatar que o total de entradas de
   // reservas no histórico. Nesse caso, esse valor cai na faixa de menor tempo de acumulação

   if fVlrRestante > 0 then
   begin
      vTabRegressiva[0].fVlrFaixa := vTabRegressiva[0].fVlrFaixa + fVlrRestante;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   // 4º - Uma vez acumulado o valor total para cada faixa de prazo de acumulação, calcula o imposto
   //      para cada faixa e totaliza, retornando para a Folha

   fVlrImposto := 0;
   for iContador := 0 to length(vTabRegressiva) - 1 do
   begin
      fVlrImposto := fVlrImposto + vTabRegressiva[iContador].fVlrFaixa * vTabRegressiva[iContador].fAliquota / 100;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   LogToFile(' ', sArq, False);
   LogToFile(' ', sArq, False);
   LogToFile('Valores consolidados: ', sArq, False);
   LogToFile(' ', sArq, False);

   LogToFile('Alíquota Valor        ', sArq, False);
   LogToFile('-------- -------------', sArq, False);

   for iContador := 0 to length(vTabRegressiva) - 1 do
   begin
      sTexto := CompletaInicio(FormatFloat('#0 "%"', vTabRegressiva[iContador].fAliquota), ' ', 8)   + ' ' +
                CompletaInicio(FormatFloat('#,#0.00', (vTabRegressiva[iContador].fVlrFaixa)), ' ', 13);

      LogToFile(sTexto, sArq, False);
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   LogToFile(' ', sArq, False);
   LogToFile('Imposto total calculado: ' + FormatFloat('#,#0.00', fVlrImposto), sArq, False);

   LogToFile(' ', sArq, False);
   LogToFile(' ', sArq, False);
   LogToFile('Término do processo', sArq, True);

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   Result := fVlrImposto;
end;



function TCtrlObjIrrf.AtualizaValorIRFinal(const IDPessoa     : Integer;
                                           const IDPlanoPrev  : Integer;
                                           const fVlrBase     : Currency;
                                           const dDataRef     : TDateTime
                                          ): Currency;
var
   sSQL           : String;
   iContador      : Integer;
   fVlrRestante   : Currency;
   fVlrImposto    : Currency;
   fVlrCota       : Currency;
   fVlrReserva    : Currency;
   fVlrUpdate     : Currency;
begin
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   // Essa verificação é feita comparando-se dDataRef com DataPagamento, que é uma propriedade do
   // TCtrlObjIrrf
   if FormatFloat('DD/MM/YYYY', dDataRef) <> DataPagamento then
   begin
      CarregaCotas(dDataRef);

      DataPagamento := FormatDateTime('DD/MM/YYYY', dDataRef);
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   // 2º - Busca as reservas por data de entrada

   sSQL :=
   'SELECT '                                                                                          + #13 +
   '   HMR.IDHISTRESERVA, HMR.IDPLANOPREV, HMR.IDTIPORESERVA, HMR.IDPESSJUR, HMR.IDCONTRIBUICAO, '    + #13 +
   '   HMR.DATAALIMENTACAO, HMR.DATAMOV, '                                                            + #13 +
   '   HMR.VLRREAL, HMR.VLRCOTAS, HMR.SALDOREAL, HMR.SALDOREALCONT, HMR.SALDOCOTAS, HMR.FLGENTRADA, ' + #13 +
   '   HMR.VALORINDICE, HMR.MESREFERENCIA, HMR.VLRCOTASIRPREVIA, HMR.VLRCOTASIR, '                    + #13 +
   '   NVL(HMR.VLRCOTASIR, HMR.VLRCOTASIRPREVIA) AS VALOR_COTAS_IR, '                                 + #13 +
   '   RXP.INDICEREAJUSTE '                                                                           + #13 +

   'FROM '                                                                                            + #13 +
   '   HISTMOVRESERVA HMR, '                                                                          + #13 +
   '   RESERVAXPLANO  RXP  '                                                                          + #13 +

   'WHERE '                                                                                           + #13 +
   '       HMR.IDPESSOA       = ' + FormatFloat('#0', IDPessoa)                                       + #13 +
   '   AND HMR.IDPLANOPREV    = ' + FormatFloat('#0', IDPlanoPrev)                                    + #13 +
   '   AND RXP.IDPLANOPREV    = ' + FormatFloat('#0', IDPlanoPrev)                                    + #13 +

   // Filtra apenas as movimentações oriundas de contribuições, e apenas as entradas,
   // não considerando padrão de movimentação de reserva e resgates.
   // O objetivo é apenas determinar a "idade" dos aportes
   '   AND HMR.IDCONTRIBUICAO IS NOT NULL '                                                           + #13 +
   '   AND HMR.FLGENTRADA     = 1 '                                                                   + #13 +

   // Apenas as reservas "não utilizadas", comparando o valor utilizado nos resgates anteriores
   // com o valor original da entrada de reserva (por contribuição)
   '   AND ( '                                                                                        + #13 +
   '       HMR.VLRCOTASIR     IS NULL OR '                                                            + #13 +
   '       (ABS(NVL(HMR.VLRCOTAS, 0) - NVL(HMR.VLRCOTASIR, 0)) > 0.01) '                              + #13 +
   '       ) '                                                                                        + #13 +

   // Considera apenas as reservas marcadas como "usar para regressiva"
   '   AND RXP.FLGREGRESSIVA  = 1 '                                                                   + #13 +

   '   AND HMR.IDPLANOPREV    = RXP.IDPLANOPREV '                                                     + #13 +
   '   AND HMR.IDTIPORESERVA  = RXP.IDTIPORESERVA '                                                   + #13 +

   'ORDER BY '                                                                                        + #13 +
   '   HMR.DATAALIMENTACAO ';

   cdsAux.Close;
   cdsAux.Data := GetDataPacket(sSQL);

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   // 3º - Itera pelas reservas, calculando o tempo de acumulação de cada registro e totalizando o
   //      valor para cada prazo de acumulação

   fVlrRestante := fVlrBase;

   while not(cdsAux.EOF) and (fVlrRestante > 0) do
   begin
      // -------------------------------------------------------------------------------------------
      // Encontra o valor da cota (na data de referência) referente à movimentação corrente

      fVlrCota := 0;
      for iContador := 0 to length(vTabRegressiva) -1 do
      begin
         if vTabCotas[iContador].iMoeda = cdsAux.FieldByName('INDICEREAJUSTE').AsInteger then
         begin
            fVlrCota := vTabCotas[iContador].fCotacao;
            Break;
         end;
      end;

      // -------------------------------------------------------------------------------------------

      // Traz a valor corrente o valor em cotas "restante" de reserva
      fVlrReserva    := (cdsAux.FieldByName('VLRCOTAS').AsCurrency * fVlrCota) -
                        (cdsAux.FieldByName('VLRCOTASIR').AsCurrency * fVlrCota);

      // Decide quanto vai utilizar daquela entrada de reserva
      if fVlrRestante > fVlrReserva then
         fVlrUpdate := fVlrReserva
      else
         fVlrUpdate := fVlrRestante;

      // Grava na entrada de reserva quanto foi utilizado (em cotas)
      if cdsAux.FieldByName('IDHISTRESERVA').AsInteger > 0 then
      begin
         sSQL := 'UPDATE HISTMOVRESERVA SET VLRCOTASIR = ' + NumeroIngles(fVlrUpdate / fVlrCota) + 'WHERE IDHISTRESERVA = ' + FormatFloat('#0', cdsAux.FieldByName('IDHISTRESERVA').AsInteger);
         ExecSQL(sSQL);
      end;

      // Abate do valor "restante" a resgatar o valor daquela entrada de reserva
      fVlrRestante   := fVlrRestante - fVlrUpdate;

      // -------------------------------------------------------------------------------------------

      cdsAux.Next;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
end;



function TCtrlObjIrrf.CalculaIRRFRegressivoContinuado(const IDPessoa     : Integer;
                                                      const IDPlanoPrev  : Integer;
                                                      const fVlrBase     : Currency;
                                                      const dDataRef     : TDateTime
                                                     ): Currency;
var
  sSQL      : string;
  sArq      : string;
  sTexto    : string;
  fAnos     : Single;
  iContador : Integer;
begin
   sArq := 'IR-Continuado' + '-' + FormatFloat('#0', IDPessoa) + '-' + FormatFloat('#0', IDPlanoPrev) + '.log';

   LogToFile('Processo de cálculo de IR pela tabela regressiva referente a benefício continuado', sArq, False);
   LogToFile(' ', sArq, False);
   LogToFile('IDPessoa : ' + FormatFloat('#0', IDPessoa), sArq, False);
   LogToFile('IDPlano  : ' + FormatFloat('#0', IDPlanoPrev), sArq, False);
   LogToFile(' ', sArq, False);

   // ----------------------------------------------------------------------------------------------

   // 1º - Carrega as aliquotas/faixas na data (apenas se já não estiver carregada)
   //      Carrega o valor das cotas na data (apenas se já não estiver carregada)

   // Essa verificação é feita comparando-se dDataRef com DataPagamento, que é uma propriedade do
   // TCtrlObjIrrf, e é atribuída exatamente na função CarregaTabelaRegressiva(...)

   if FormatFloat('DD/MM/YYYY', dDataRef) <> DataPagamento then
   begin
      LogToFile('Antes de carregar tabela regressiva', sArq);
      CarregaTabelaRegressiva(dDataRef);
      LogToFile('Após carregar tabela regressiva', sArq);

      DataPagamento := FormatDateTime('DD/MM/YYYY', dDataRef);
   end;

   // ----------------------------------------------------------------------------------------------


   // Se a tabela regressiva estiver vazia, o vetor não será alimentado
   // Para evitar Access Violation nesses casos, sai da função com resultado ZERO
   if (vTabRegressiva = nil) or (length(vTabRegressiva) <= 0) then
   begin
      LogToFile('Tabela regressiva vazia', sArq);

      Result := 0;
      Exit;
   end;

   //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319
   // ----------------------------------------------------------------------------------------------
   {
   sSQL :=
   'SELECT '                                                         + #13 +
   '   PPP.PRAZOACUMULACAO  '                                        + #13 +
   'FROM '                                                           + #13 +
   '   PARTPREVPLAN PPP '                                            + #13 +
   'WHERE '                                                          + #13 +
   '      PPP.IDPESSOA      = ' + FormatFloat('#0', IDPessoa)        + #13 +
   '  AND PPP.IDPLANOPREV   = ' + FormatFloat('#0', IDPlanoPrev);

   cdsAux.Close;
   cdsAux.Data := GetDataPacket(sSQL);

   LogToFile('Prazo de acumulação buscado: ' + FormatFloat('#,#0.00000000', cdsAux.FieldByName('PRAZOACUMULACAO').AsFloat), sArq);

   // ----------------------------------------------------------------------------------------------

   LogToFile('Antes de atualizar prazo de acumulação', sArq);
   fAnos := AtualizaPrazoAcumulacao(IDPessoa, IDPlanoPrev, sArq);

   LogToFile(' ', sArq, False);
   LogToFile(' ', sArq, False);
   LogToFile('Prazo de acumulação: ' + FormatFloat('#,#0.00000000', fAnos), sArq);

   // ----------------------------------------------------------------------------------------------

   // Verifica em que faixa deve entrar o valor utilizada daquela entrada de reserva
   for iContador := 0 to length(vTabRegressiva) - 1 do
   begin
      if fAnos <= vTabRegressiva[iContador].iPrazo then Break;
   end;

   // ----------------------------------------------------------------------------------------------

   Result := vTabRegressiva[iContador].fAliquota * fVlrBase / 100;
   }

   //----------------------OBTEM A ALIQUOTA-------------------------------
   sSQL :=
     '  SELECT I.ALIQUOTA '               + #13 +
     '  FROM IRRFREGRESSIVA I '           + #13 +
     '  WHERE I.PRAZOACUM =  '            + #13 +
     '      (SELECT MIN(I.PRAZOACUM) '    + #13 +
     '       FROM IRRFREGRESSIVA I  '     + #13 +
     '       WHERE I.PRAZOACUM >  '       + #13 +
     '  		   (SELECT DISTINCT (((TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ') - B.DATAINICIOFUND) / 365) + ' + #13 +
     '  				   H.PRAZOMEDIOPONDERADO) PMP  '                                  + #13 +
     '  			  FROM HSTCALCULOPMPFOLHA H, BENEFBFCIARIO B, PARTPREVPLAN PP '           + #13 +
     '  			 WHERE B.IDPESSOA = H.IDPESSOA '                                          + #13 +
     '  			   AND H.IDTITULAR = B.IDTITULAR '                                        + #13 +
     '  			   AND PP.IDPESSOA = B.IDTITULAR '                                        + #13 +
     '  			   AND PP.IDPLANOPREV = B.IDPLANOPREV '                                   + #13 +
     '  			   AND H.IDPLANOPREV = B.IDPLANOPREV  '                                   + #13 +
     '  			   AND H.IDPESSOA = ' + FormatFloat('#0', IDPessoa)                       + #13 +
     '  			   AND H.IDPLANOPREV = ' + FormatFloat('#0', IDPlanoPrev)                 + #13 +
     '  			   AND H.FLGPROCESSADO IN (1, 2) '                                        + #13 +
     '  			   AND H.DATAFIM IS NULL '                                                + #13 +
     '  			   AND B.IDSITBENEFICIO = 1 '                                             + #13 +
     '  			   AND B.FONTEPAGADORA = 1 '                                              + #13 +
     '  			   AND PP.TIPOOPCAOIR = 2)) ';

   cdsAux.Close;
   cdsAux.Data := GetDataPacket(sSQL);
   //------------------FIM-OBTEM A ALIQUOTA-------------------------------

   Result := cdsAux.FieldByName('ALIQUOTA').AsFloat * fVlrBase / 100;
   //FIM Helio - SOL Nº 151061-10442 KINTANA Nº 1720319

   // ----------------------------------------------------------------------------------------------

   LogToFile(' ', sArq, False);
   LogToFile(' ', sArq, False);

   LogToFile('Alíquota Valor Base    Resultado    ', sArq, False);
   LogToFile('-------- ------------- -------------', sArq, False);

   sTexto := CompletaInicio(FormatFloat('#0 "%"', vTabRegressiva[iContador].fAliquota), ' ', 8)   + ' ' +
             CompletaInicio(FormatFloat('#,#0.00', fVlrBase), ' ', 13) + ' ' +
             CompletaInicio(FormatFloat('#,#0.00', Result), ' ', 13);

   LogToFile(sTexto, sArq, False);

   // ----------------------------------------------------------------------------------------------
end;



function TCtrlObjIrrf.NumeroIngles(fValor: Extended): String;
var
   cAux : char;
begin
   cAux := DecimalSeparator;
   DecimalSeparator  := '.';

   Result := FloatToStr(fValor);

   DecimalSeparator  := cAux;
end;



function TCtrlObjIrrf.AtualizaPrazoAcumulacao(const IDPessoa     : Integer;
                                              const IDPlanoPrev  : Integer;
                                              const sArq         : string;
                                              const bRecalculo   : Boolean = True
                                             ): Double;
var
  sSQL        : string;
  sTexto      : string;
  dDataAnt    : TDateTime;
  dDataAtu    : TDateTime;

  iDias       : Integer;     

  fFatorPerm  : Double;     
  fQuantCotas : Double;     
  fCotasAcum  : Double;     
  fPrazoAcum  : Double;     
begin
  LogToFile('Antes de carregar histórico de reservas', sArq);

  // -----------------------------------------------------------------------------------------------

  // 1º - Busca as reservas
  //    Essa query é parecida com a da função CalculaIRRFRegressivoResgate, mas leva em considera
  //    entradas e saídas para cálculo do prazo de acumulação

  sSQL :=
  'SELECT '                                                                                          + #13 +
  '   HMR.DATAALIMENTACAO, SUM(NVL(DECODE(HMR.FLGENTRADA, 1, HMR.VLRCOTAS, (HMR.VLRCOTAS * (-1))), 0)) AS VLRCOTAS '   + #13 +

  'FROM '                                                                                            + #13 +
  '   HISTMOVRESERVA HMR, '                                                                          + #13 +
  '   RESERVAXPLANO  RXP  '                                                                          + #13 +

  'WHERE '                                                                                           + #13 +
  '       HMR.IDPESSOA       = ' + FormatFloat('#0', IDPessoa)                                       + #13 +
  '   AND HMR.IDPLANOPREV    = ' + FormatFloat('#0', IDPlanoPrev)                                    + #13 +
  '   AND RXP.IDPLANOPREV    = ' + FormatFloat('#0', IDPlanoPrev)                                    + #13 +

  // Filtra apenas as movimentações oriundas de contribuições ou resgates (total ou parcial),
  // não considerando padrão de movimentação de reserva
  '   AND (HMR.IDCONTRIBUICAO IS NOT NULL OR HMR.IDBENEFICIO IS NOT NULL) '                          + #13 +

  // Considera apenas as reservas marcadas como "usar para regressiva"
  '   AND RXP.FLGREGRESSIVA  = 1 '                                                                   + #13 +

  '   AND HMR.IDPLANOPREV    = RXP.IDPLANOPREV '                                                     + #13 +
  '   AND HMR.IDTIPORESERVA  = RXP.IDTIPORESERVA '                                                   + #13 +

  'GROUP BY '                                                                                        + #13 +
  '   HMR.DATAALIMENTACAO '                                                                          + #13 +

  'HAVING '                                                                                          + #13 +
  '   SUM(NVL(DECODE(HMR.FLGENTRADA, 1, HMR.VLRCOTAS, (HMR.VLRCOTAS * (-1))), 0)) <> 0 '             + #13 +

  'ORDER BY '                                                                                        + #13 +
  '   HMR.DATAALIMENTACAO ';

  cdsAux.Close;
  cdsAux.Data := GetDataPacket(sSQL);

  // -----------------------------------------------------------------------------------------------

  LogToFile(' ', sArq, False);
  LogToFile(' ', sArq, False);
  LogToFile('Histórico de Reservas: ', sArq, False);
  LogToFile(' ', sArq, False);

  LogToFile('Data Alim. Dias Dif. Quant. Cotas         Cotas Acum.          Fator Perm.          Prazo Acum.         ', sArq, False);
  LogToFile('---------- --------- -------------------- -------------------- -------------------- --------------------', sArq, False);

  // -----------------------------------------------------------------------------------------------

  // 2º - Itera pelas reservas, efetuando o cálculo

  cdsAux.First;

  fFatorPerm  := 0;
  fCotasAcum  := 0;
  dDataAnt    := trunc(cdsAux.FieldByName('DATAALIMENTACAO').AsDateTime);

  while not(cdsAux.EOF) do
  begin
    // ---------------------------------------------------------------------------------------------

    // d2
    dDataAtu      := trunc(cdsAux.FieldByName('DATAALIMENTACAO').AsDateTime);

    // qt
    fQuantCotas   := cdsAux.FieldByName('VLRCOTAS').AsFloat;

    // dt
    if cdsAux.RecNo = 1 then
    begin
      fCotasAcum  := fQuantCotas;
      iDias       := 1
    end
    else
    begin
      iDias       := trunc(dDataAtu - dDataAnt);
    end;

    // ---------------------------------------------------------------------------------------------

    // FP (((QTant + dt) + qt) / 365) + FPant
    fFatorPerm    := (((fCotasAcum * iDias) + fQuantCotas) / 365 ) + fFatorPerm;

    // ---------------------------------------------------------------------------------------------

    // QT
    fCotasAcum    := fCotasAcum + fQuantCotas;

    // PA
    fPrazoAcum    := fFatorPerm / fCotasAcum;

    // ---------------------------------------------------------------------------------------------

    sTexto := CompletaFim(FormatDateTime('dd/mm/yyyy',        dDataAtu),    ' ', 10)    + ' ' +
              CompletaInicio(FormatFloat('#0',                iDias),       ' ',  9)    + ' ' +
              CompletaInicio(FormatFloat('#,#0.00000000',     fQuantCotas), ' ', 20)    + ' ' +
              CompletaInicio(FormatFloat('#,#0.00000000',     fCotasAcum),  ' ', 20)    + ' ' +
              CompletaInicio(FormatFloat('#,#0.00000000',     fFatorPerm),  ' ', 20)    + ' ' +
              CompletaInicio(FormatFloat('#,#0.000000000000', fPrazoAcum),  ' ', 20);

     LogToFile(sTexto, sArq, False);

    // ---------------------------------------------------------------------------------------------

    // d1
    dDataAnt    := dDataAtu;

    cdsAux.Next;

    // ---------------------------------------------------------------------------------------------
  end;

  // -----------------------------------------------------------------------------------------------
  // Grava o resultado na PartPrevPlan

  sSQL :=
  'UPDATE '                                                   + #13 +
  '   PARTPREVPLAN '                                          + #13 +
  'SET '                                                      + #13 +
  '   PRAZOACUMULACAO  = ' + NumeroIngles(fPrazoAcum)         + #13 +
  'WHERE '                                                    + #13 +
  '       IDPESSOA     = ' + FormatFloat('#0', IDPessoa)      + #13 +
  '   AND IDPLANOPREV  = ' + FormatFloat('#0', IDPlanoPrev);

  ExecSQL(sSQL);

  // -----------------------------------------------------------------------------------------------

  Result := fPrazoAcum;

  // -----------------------------------------------------------------------------------------------
end;


// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------


//edilaine WO32047 : inicio
function TCtrlObjIrrf.CalculaIRRF_Ext(pBase: double; DataRef: string; Tipo:LongInt;
                                      Var pPercentual: Double;
                                      Var pVlrReducao : Double;
                                      bCalcDeducaoSimplif_Irrf : boolean = false) : double;
var
  rVlrTributavel : double;
begin
  if DataRef <> DataPagamento then
    CarregaFaixasIRRF(DataRef);

  VlrDeduzidoIRSimplif := 0;

  rVlrTributavel := pBase;

  if (bCalcDeducaoSimplif_Irrf) and
     (FaixaIRRF.Aliquota_IRRF > 0) then //WO7973 - Andre Imakawa
     VlrDeduzidoIRSimplif := FaixaIRRF.ParcDeduzSimpl_Irf;

  if VlrDeduzidoIRSimplif > 0 then
     pBase := pBase - VlrDeduzidoIRSimplif;

  If BuscaFaixa(pBase) Then
  Begin
    pPercentual:= FaixaIRRF.Aliquota_Irrf;
    //Caso seja 0 - Imposto Devido;
    Result     := pPercentual/100 * pBase - FaixaIRRF.ParcDeduzIrrf;

    //edilaine WO29025 : inicio
    pVlrReducao := 0;
    If BuscaFaixaReducao(rVlrTributavel) Then
    begin
      //se for a 1a faixa de reducao entao a renda é isenta de imposto
      if FaixaReducao.Faixa_Trib_Ini = 0 then
         Result := 0
      else if FaixaReducao.FatorIRRF > 0 then
         pVlrReducao := (FaixaReducao.ReducaoIRRF - (FaixaReducao.FatorIRRF * rVlrTributavel))
      else
         pVlrReducao := FaixaReducao.ReducaoIRRF;
    end;

    Result := Result - pVlrReducao;

    if Result < 0 then
       Result := 0;
    //edilaine WO29025 : fim
  End
  Else
  Begin
    pPercentual:=0;
    Result     :=0;
  End;
end;
//edilaine WO32047 : fim

function TCtrlObjIrrf.CalculaIRRF_Ext(pBase: double; DataRef: string): double;
begin
  if DataRef <> DataPagamento then
    CarregaFaixasIRRF(DataRef);
  result:=(PercIrrfExt/100 * pBase);
end;

function TCtrlObjIrrf.CalcIdade(DataRef: string;
  dDataNasc: TDateTime): integer;
Var
  d1, m1, a1,
  d2, m2, a2 : word;
  dt         : tdatetime;
  r          : real;
  diffa      : integer;

begin
 Result := 0;  // SOL 262719 PPM 1099944
 If (Trim(DateToStr(dDataNasc)) <> '') Then // SOL 262719 PPM 1099944
   Try
     DecodeDate(dDataNasc, a1, m1, d1);
     DecodeDate(StrToDate(dataref), a2, m2, d2);
     diffa := a2 - a1 - 1;
     If diffa > 0 Then
     Begin
       If m2 > m1 Then
         inc(diffa)
       Else
         If m2 = m1 Then
         Begin
           If d2 >= d1 Then
             inc(diffa);
         End;
       Result := diffa;
     End
     Else
       diffa := 0;
   Except
     Result:=0;
   End;
end;

procedure TCtrlObjIrrf.LiberaFaixasIRRF;
Var
  Item : Integer;

begin
  For Item := 0 To FaixasL.Count-1 Do
    FaixasL.Objects[Item].Free;
  FaixasL.Clear;
end;


function TCtrlObjIrrf.BuscaFaixa(pBase: Double): boolean;
Var
  Item  : Integer;
  Achou : Boolean;

begin
  Item  := 0;
  Achou := False;
  While Not Achou And (Item < FaixasL.Count) Do
  Begin
    FaixaIRRF := ObjFaixa(FaixasL.Objects[Item]);
    Achou     := ((FaixaIRRF.Faixa_Irrf)>pBase);
    Inc(Item);
  End;
  Result := Achou
end;


//edilaine WO29025 : inicio
procedure TCtrlObjIrrf.LiberaFaixasReducao;
var
  Item : Integer;
begin
  For Item := 0 to FaixasRed.Count-1 do
     FaixasRed.Objects[Item].Free;
  FaixasRed.Clear;
end;

function TCtrlObjIrrf.BuscaFaixaReducao(pBaseTrib: Double): boolean;
Var
  Item  : Integer;
  Achou : Boolean;
begin
  Item  := 0;
  Achou := False;
  While Not Achou And (Item < FaixasRed.Count) Do
  Begin
    FaixaReducao := ObjReducao(FaixasRed.Objects[Item]);
    Achou     := ((FaixaReducao.Faixa_Trib_Fim) > pBaseTrib);
    Inc(Item);
  End;
  Result := Achou
end;
//edilaine WO29025 : fim

procedure TCtrlObjIrrf.SetPercIrrfExt(const Value: Double);
begin
  FPercIrrfExt := Value;
end;

procedure TCtrlObjIrrf.SetVlrIdoso(const Value: Double);
begin
  FVlrIdoso := Value;
end;

procedure TCtrlObjIrrf.SetIdade(const Value: Integer);
begin
  FIdade := Value;
end;

procedure TCtrlObjIrrf.SetVlrDependente(const Value: Double);
begin
  FVlrDependente := Value;
end;


procedure TCtrlObjIrrf.SetDataPagamento(const Value: string);
begin
  FDataPagamento := Value;
end;



function TCtrlObjIrrf.LogToFile(const sLog   : String;
                                const sArq   : String;
                                const bHora  : Boolean = True
                               ): Boolean;
var
   Arquivo  : TextFile;
   sPasta   : String;
   sArquivo : String;
   sLinha   : String;
begin
   // ----------------------------------------------------------------------------------------------

   if sArq = '' then
   begin
      Result := True;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   sPasta   := ExtractFilePath(Application.ExeName);
   sArquivo := sPasta + sArq;

   // ----------------------------------------------------------------------------------------------

   try
      {$I-}

      // The $I switch directive enables or disables the automatic code generation that checks the
      // result of a call to an I/O procedure. I/O procedures are described in the Object Pascal
      // Language Guide. If an I/O procedure returns a nonzero I/O result when this switch is on,
      // an EInOutError exception is raised (or the program is terminated if exception handling is
      // not enabled). When this switch is off, you must check for I/O errors by calling IOResult.

      CriaDiretorio(sPasta);
      AssignFile(Arquivo, sArquivo);

      if FileExists(sArquivo) then
         Append(Arquivo)
      else
         ReWrite(Arquivo);

      // -------------------------------------------------------------------------------------------

      sLinha := '';
      if bHora then sLinha := FormatDateTime('hh:nn:ss', Now) + ' - ';
      sLinha := sLinha + sLog;

      Writeln(Arquivo, sLinha);

      // -------------------------------------------------------------------------------------------

      CloseFile(Arquivo);

      Result := True;

      {$I+}
      Application.ProcessMessages;

   except
      Result := False;
   end;
end;



// =================================================================================================
//    Manipulação de Strings
// =================================================================================================

function TCtrlObjIrrf.CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sAux + sOriginal), (length((sAux + sOriginal)) - (iLimiteTamanho - 1)), iLimiteTamanho);
end;

function TCtrlObjIrrf.CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sOriginal + sAux), 1, iLimiteTamanho);
end;

// =================================================================================================



procedure TCtrlObjIrrf.LimpaRegistroLog(var Registro: TLogTotalPrev);
begin
  with Registro do
  begin
    IDLogTotalPrev  := -1;
    IDModulo        := -1;
    IDImpostoRetido := -1;
    IDLancIRRF      := -1;
    CodPlanDoc      := -1;
    Origem          := -1;
    IDUsuario       := -1;
    Data            := 0;
    DataIni         := 0;
    DataFim         := 0;
    Versao          := '';
    Operacao        := '';
  end;
end;


//edilaine SIG136670 : inicio
function TCtrlObjIrrf.DeducaoSimplificadaIRRF(pNumDepen: integer;
                                              dtDataNasc: TDateTime;
                                              pDataRef: string;
                                              pVlrPA: double
                                              ): double;
var
   dVlrIdoso, dVlrDepen, dVlrDedSimplif : double;
   sSQL : string;
   //qryBusca : TwwQuery;              //edilaine WO29025
begin
  //edilaine WO29025 : passado pra CarregaFaixa
  {qryBusca := TwwQuery.create(nil);
   qryBusca.DataBaseName := 'BaseDados';

  try
    qryBusca.close;
    qryBusca.SQL.Text := 'SELECT '+
                         '    (SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGDESCSIMPLESIDADE'')  AS FLGDEDUZIDADE, '+
                         '    (SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGDESCSIMPLESDEPEND'') AS FLGDEDUZDEPEND '+
                         '  FROM DUAL ';
    qryBusca.Open;
   }//edilaine WO29025 : fim

    dVlrIdoso      := 0;
    dVlrDepen      := 0;
    dVlrDedSimplif := 0;

    //if (qryBusca.Fields[0].AsString = '1') and (CalcIdade(pDataRef, dtDataNasc) >= Idade) then   //edilaine WO29025
    if (FlgDeduzDescSimplIdade = '1') and (CalcIdade(pDataRef, dtDataNasc) >= Idade) then          //edilaine WO29025
       dVlrIdoso := VlrIdoso;

    //if (qryBusca.Fields[1].AsString = '1') then                                                  //edilaine WO29025
    if (FlgDeduzDescSimplDepen = '1') then                                                         //edilaine WO29025
       dVlrDepen := VlrDep * pNumDepen;

    if ((dVlrIdoso + dVlrDepen + pVlrPA) < FaixaIRRF.ParcDeduzSimpl_Irf) then
       dVlrDedSimplif := FaixaIRRF.ParcDeduzSimpl_Irf
    else
       dVlrDedSimplif := 0;

    Result := dVlrDedSimplif;

  //edilaine WO29025 : passado pra CarregaFaixa
  {finally
    qryBusca.close;
    FreeAndNil(qryBusca);
  end;
  }//edilaine WO29025 : passado pra CarregaFaixa

end;
//edilaine SIG136670 : fim


procedure TCtrlObjIrrf.SetVlrDeduzidoIRSimplif(const Value: double);
begin
  FVlrDeduzidoIRSimplif := Value;
end;

procedure TCtrlObjIrrf.SetFlgDeduzDescSimplDepen(const Value: string);
begin
  FFlgDeduzDescSimplDepen := Value;
end;

procedure TCtrlObjIrrf.SetFlgDeduzDescSimplIdade(const Value: string);
begin
  FFlgDeduzDescSimplIdade := Value;
end;

end.





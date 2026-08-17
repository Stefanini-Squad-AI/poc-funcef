unit uCtrlCalculoIRRF;

{-----------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------- Histórico de alterações --------------------------------------------------------
//Rotina     : gravarHistoricoPrazoAcumulacao
//Nº WO......: 32251
//Inicio dev : 23/03/20026
//Responsável: LEANDRO
//Descrição..: Incluir idbeneficio ao gravar HSTPRAZOACUMULACAOFOLHA
------------------------------------------------------------------------------------------------------------------------------------
Rotina     : ProcessaPrazoAcumulacao
Nº WO......: 9102
Inicio dev : 27/03/2024
Responsável: Edilaine
Descrição..: Segregar calculo do IR entre reservas Normais / Portadas
--------------------------------------------------------------------------------
Rotina.....: Criação desta unit
Nº SIG.....: 20491
Data Merge : 24/06/2022
Data dev   : 27/02/2018
Responsável: Darivaldo Alencar
Descrição..: Desenvolver na funcionalidade de Cálculo do IR Regressivo as regras
             de retenção de percentual das contribuições
//Feita copiando ContribuicaoPrev/fCalculoIRRF.pas para centralizar código
//------------------------------------------------------------------------------
//Rotina      : tbButtonEnviarClick, gravarHistoricoCalculoPMP, gravarHistoricoPrazoAcumulacao
//              ListaPrazoAcumulacao
//Pendência   : SIG 100862
//Responsável : Edilaine Ferraresi
//Data        : 16/07/2020
//Descrição   : opção de sobrepor ou salvar novos cálculos PMP e Prazo
//------------------------------------------------------------------------------
//Rotina      : gravarHistoricoPrazoAcumulacao  (migrado do FCalculoIRRF)
//Pendência   : SIG 85804
//Responsável : Edilaine Ferraresi
//Data        : 09/05/2019
//Descrição   : Apresenta inconsistência na Base de Cálculo IR, comparado com os
//              valores que estão em analítico na aba Prazo Acumulação
//------------------------------------------------------------------------------
//Rotina      : gravarHistoricoPrazoAcumulacao
//Pendência   : SIG 131125
//Responsável : Leandro Pocebon
//Data        : 21/12/2022
//Descrição   : Ajuste para gravar datafim na tabela HSTPRAZOACUMULACAOFOLHA quando realizado
//              calculo IPRF.
-----------------------------------------------------------------------------------------------------------------------------------}

interface

Uses SysUtils, uCmControlObject, uCmDbObject,  uSistema, uCMTypes,
     uCmClientDataSet, uMidasUtil, UCMFileUtils,Wwquery,UDataBase,Dialogs,CMDateTimePicker,
     DBCtrls,StdCtrls,UMensErro,DBaseDados,Controls,
     DBTables,Forms,Db,windows,wwDBGrid,ComObj;

Type
     TTipoProcesso = (tpPrazoAcumulacao, tpCalcMedioPonderado, tpTodos);

     TFrameListaBenef = record
       ListaUsuario  : Integer;
       dbgrdPessoas  : TwwDBGrid;
       qryLista      : Twwquery;
       qryIListlista : Twwquery;
       qrybuscaLista : Twwquery;
     end;

     TMSelect = record
       sIdTitular    : String;
       sIdPessoa     : String;
     end;

     TTpPlano = record
      sIdPlano       : String;
      sNmPlano       : String;
     end;

  TCtrlCalculoIRRF = class(TCmControlObject)

  private
    { Private declarations }

  public
    { Public declarations }

    function ProcessaPrazoAcumulacao(IdPessJur, IdPessoa, iREB, iNovoPlano: Integer;
                                      sDataPrevista: String;
                                      iTipoOpcaoIR : integer;
                                      iListaBenef  : integer;
                                      sMatricula   : String;
                                      IdTitular    : Integer;
                                      iSeqResgate : integer;
                                      iTipoCalculo : integer = 2     //edilaine WO9102
                                     ) : boolean;

    function ProcessaCalcMedioPonderado(IdPessJur, IdPessoa, iPlano, iListaBenef: integer;
                                        iTipoOpcaoIr : Integer;
                                        sMatricula, sDataPrevista : String;
                                        IdTitular    : Integer;
                                        iTipoCalculo : integer = 2     //edilaine WO9102
                                        ) : boolean;


    procedure gravarHistoricoPrazoAcumulacao(vIdPessoa, vIdTitular,
                                            vIdPessoaJur, vIdPlano, vIdBeneficio: Integer); //WO32251 leandro

    procedure gravarHistoricoCalculoPMP(vIdPessoa, vIdTitular, vIdPessoaJur, vIdPlano: Integer);

    function verificaInformacoesSendoUtilizadasPrevia(vIdPessoa, vIdTitular, vIdPessoaJur, vIdPlano: Integer;
                                                      vSeqResgate : integer = -1       //edilaine WO10872
                                                      ): boolean;

    function ProcessarTodos(sDataPagto : String; var msgErro : string) : boolean;
    function Processar(tpTipo : TTipoProcesso;
                       IdPessJur, IdPessoa,
                       iREB, iNovoPlano: Integer;
                       sDataPrevista: String;
                       iTipoOpcaoIR : integer;
                       iListaBenef  : integer;
                       sMatricula   : String;
                       IdTitular    : Integer;
                       iPlano       : integer;
                       iSeqResgate  : integer;
                       var msgErro  : string;
                       iTipoCalculo : integer = 2   //edilaine WO9102
                      ) : boolean;

    function Gravar : boolean;

   { constructor create(pqryUpdHST,pQryAux: TQuery;
                       pQryParticipantes,
                       pqryConsHST,
                       pqryConsHSTAux,
                       pqryLista,
                       pqryIListlista,
                       pQryPrazoAcumulacao,
                       pQryPMP,
                       pqrybuscaLista:Twwquery;
                       pUpd,
                       pUpdPmp: tupdatesql;
                       pedtDataPagamento: TCMDateTimePicker;
                       pchkListaIndividual:TCheckBox;
                       pcboPlano: TDBLookupComboBox;
                       pgrdPrzAcumulo,
                       pgrdPrzMedio,
                       pdbgrdPessoas: TwwDBGrid;
                       iTela: Integer);

    destructor destroy;
                        }

  end;

implementation

{ TCtrlCalculoIRRF }


// MARCIO DENILSON SOL 151061 KINTANA 1105188
function TCtrlCalculoIRRF.verificaInformacoesSendoUtilizadasPrevia(vIdPessoa, vIdTitular, vIdPessoaJur, vIdPlano: Integer;
                                                                   vSeqResgate : integer = -1       //edilaine WO10872
                                                                  ): boolean;
var
  _qryAux : TwwQuery;
begin
   _qryAux := TwwQuery.create(nil);
   _qryAux.DatabaseName := 'BaseDados';

   result := false;
   try
     try
        _qryAux.Close;
        _qryAux.Sql.Clear;
        _qryAux.Sql.Add(' SELECT COUNT(IDHSTPRAZOACUMULACAOFOLHA) AS NUMREGISTROS  ');
        _qryAux.Sql.Add(' FROM CM.HSTPRAZOACUMULACAOFOLHA     ');
        _qryAux.Sql.Add(' WHERE IDPESSOA = :IDPESSOA          ');
        _qryAux.Sql.Add('   AND IDTITULAR = :IDTITULAR        ');
        _qryAux.Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV    ');
        _qryAux.Sql.Add('   AND NVL(SEQRESGATE,-1) = :SEQRESGATE ');           //edilaine WO10872
        _qryAux.Sql.Add('   AND FLGPROCESSADO = 2             ');
        _qryAux.ParamByName('IDPESSOA').AsInteger     := vIdPessoa;
        _qryAux.ParamByName('IDTITULAR').AsInteger    := vIdTitular;
        _qryAux.ParamByName('IDPLANOPREV').AsInteger  := vIdPlano;
        _qryAux.ParamByName('SEQRESGATE').AsInteger   := vSeqResgate;          //edilaine WO10872
        _qryAux.Open;

        result := (_qryAux.FieldByName('NUMREGISTROS').AsInteger > 0)

     except
        Raise;
     end;
   finally
     _qryAux.close;
     FreeAndNil(_qryAux);
   end;
end;
// MARCIO DENILSON SOL 151061 KINTANA 1105188


function TCtrlCalculoIRRF.ProcessaPrazoAcumulacao(IdPessJur, IdPessoa,
                                                  iREB, iNovoPlano: Integer;
                                                  sDataPrevista: String;
                                                  iTipoOpcaoIR: integer;
                                                  iListaBenef : integer;
                                                  sMatricula  : String;
                                                  IdTitular : Integer;
                                                  iSeqResgate : integer;
                                                  iTipoCalculo : integer     //edilaine WO9102
                                                  ) : boolean;
var
  SP_PROC : TStoredProc;
begin

  result := true;

  try
    try
      SP_PROC := TStoredProc.Create(Application);
      SP_PROC.DatabaseName  := 'BaseDados';

      SP_PROC.StoredProcName := 'PCK_CTB_CALC_PRAZOACUMULACAO.PR_CALC_PRAZO_ACUMULACAO';

      SP_PROC.Params.CreateParam(ftInteger,   'inIDPessJur',         ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inIDPessoa',          ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inlistabenef',        ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inREB',               ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inNOVOPLANO',         ptinput);
      SP_PROC.Params.CreateParam(ftDate,      'inDataPrevista',      ptinput);
      SP_PROC.Params.CreateParam(ftString ,   'inTipoOpcaoIR',       ptinput);
      // OTACILIO SOL182365 KINTANA 1698477
      SP_PROC.Params.CreateParam(ftString ,   'inMatricula',         ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inIDTitular',         ptinput); // Felipe A. Santos SOL 254124 PPM 793415
      SP_PROC.Params.CreateParam(ftString,    'OutERRO',             ptOutput);
      SP_PROC.Params.CreateParam(ftInteger,   'inSeqResgate',        ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inTipoCalculo',       ptinput);  //edilaine WO9102


      if (IdPessJur <> 0) then begin
        SP_PROC.parambyName('inIDPessJur').asInteger   := IdPessJur;
      end else begin                                                                                              
        SP_PROC.parambyName('inIDPessJur').asInteger   := 0 // SOL 180351 KINTANA 1679062
      end;

      if IdPessoa <> 0 then begin
        SP_PROC.parambyName('inIDPessoa').asInteger    := IdPessoa;
      end else begin
        SP_PROC.parambyName('inIDPessoa').asInteger    := 0;// SOL 180351 KINTANA 1679062
      end;

      SP_PROC.parambyName('inREB').asInteger           := iReb;
      SP_PROC.parambyName('inNOVOPLANO').asInteger     := iNovoPLano;

      if sDataPrevista <> '' then begin
        SP_PROC.parambyName('inDataPrevista').asDate := StrToDate(sDataPrevista);
      end else begin
        SP_PROC.parambyName('inDataPrevista').asDate := 0 ;// SOL 180351 KINTANA 1679062
      end;

      if iListaBenef <> 0 then begin
        SP_PROC.parambyName('inlistabenef').asInteger  := iListaBenef;
      end else begin
        SP_PROC.parambyName('inlistabenef').asInteger  := 0;// SOL 180351 KINTANA 1679062
      end;

      if iTipoOpcaoIr = 1 then begin
        SP_PROC.parambyName('inTipoOpcaoIR').asString    := 'P';
      end else if iTipoOpcaoIr = 2 then begin
        SP_PROC.parambyName('inTipoOpcaoIR').asString    := 'R';
      end else begin
        //SP_PROC.parambyName('inTipoOpcaoIR').Clear; // SOL 180351 KINTANA 1679062
      end;

      // OTACILIO SOL182365 KINTANA 1698477
      SP_PROC.parambyName('inMatricula').asString    := sMatricula;
      SP_PROC.parambyName('inIDTitular').asInteger   := IdTitular;            // Felipe A. Santos SOL 254124 PPM 793415
      SP_PROC.parambyName('inSeqResgate').asInteger  := iSeqResgate;
      SP_PROC.parambyName('inTipoCalculo').asInteger := iTipoCalculo;         //edilaine WO9102
      SP_PROC.Prepare;
      SP_PROC.ExecProc;

      if SP_PROC.parambyName('OutERRO').asString <> 'OK' then
         result := false;

    except
      result := false;
    end;
  finally
    SP_PROC.Destroy;
  end;
end;


function TCtrlCalculoIRRF.ProcessaCalcMedioPonderado(IdPessJur, IdPessoa,
  iPlano, iListaBenef: integer; iTipoOpcaoIr : Integer; sMatricula, sDataPrevista : String;
  IdTitular    : Integer;
  iTipoCalculo : integer = 2     //edilaine WO9102
  ) : boolean;
var
  SP_PROC : TStoredProc;
 iReb, InovoPlano : Integer;
begin
  result := true;

  iReb       :=0;
  InovoPlano :=0;

  try
    try
      SP_PROC := TStoredProc.Create(Application);
      SP_PROC.DatabaseName  := 'BaseDados';

      SP_PROC.StoredProcName := 'PCK_CTB_CALC_PRAZOMEDIOPOND.PR_CALC_PMP';

      SP_PROC.Params.CreateParam(ftInteger,   'inIDPessJur',         ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inIDPessoa',          ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inListaBenef',        ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inREB',               ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inNOVOPLANO',         ptinput);
      SP_PROC.Params.CreateParam(ftString ,   'inTipoOpcaoIR',       ptinput);
      SP_PROC.Params.CreateParam(ftDate   ,   'inDataPagamento',     ptinput);
      // OTACILIO SOL182365 KINTANA 1698477
      SP_PROC.Params.CreateParam(ftString ,   'inMatricula',         ptinput);
      SP_PROC.Params.CreateParam(ftString,    'OutERRO',             ptOutput);
      SP_PROC.Params.CreateParam(ftInteger,   'inIDTitular',         ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inTipoCalculo',       ptinput);  //edilaine WO9102

      if iPLano <> 0 then begin
        if iPLano = 66 then begin
          iReb        := 1;
          iNovoPLano  := 0;
        end else if iPLano = 74 then begin
          iReb        := 0;
          iNovoPLano  := 1;
        end;
      end;

      if (IdPessJur <> 0) then begin
        SP_PROC.parambyName('inIDPessJur').asInteger   := IdPessJur;
      end else begin
        SP_PROC.parambyName('inIDPessJur').asInteger   := 0; // SOL 180351 KINTANA 1679062
      end;

      if IdPessoa <> 0 then begin
        SP_PROC.parambyName('inIDPessoa').asInteger    := IdPessoa;
      end else begin
        SP_PROC.parambyName('inIDPessoa').asInteger    := 0; // SOL 180351 KINTANA 1679062
      end;

      SP_PROC.parambyName('inREB').asInteger           := iReb;
      SP_PROC.parambyName('inNOVOPLANO').asInteger     := iNovoPLano;

      if iListaBenef <> 0 then begin
        SP_PROC.parambyName('inlistabenef').asInteger  := iListaBenef;
      end else begin
        SP_PROC.parambyName('inlistabenef').asInteger  := 0; // SOL 180351 KINTANA 1679062
      end;

      if iTipoOpcaoIr = 1 then begin
        SP_PROC.parambyName('inTipoOpcaoIR').asString    := 'P';
      end else if iTipoOpcaoIr = 2 then begin
        SP_PROC.parambyName('inTipoOpcaoIR').asString    := 'R';
      end else begin
        //SP_PROC.parambyName('inTipoOpcaoIR').Clear;  // SOL 180351 KINTANA 1679062
      end;

      SP_PROC.parambyName('inDataPagamento').AsDate := StrToDate(sDataPrevista);

      // OTACILIO SOL182365 KINTANA 1698477
      SP_PROC.parambyName('inMatricula').asString    := sMatricula;
      SP_PROC.parambyName('inIDTitular').asInteger   := IdTitular;   //edilaine 20491

      SP_PROC.parambyName('inTipoCalculo').asInteger := iTipoCalculo;         //edilaine WO9102

      SP_PROC.Prepare;
      SP_PROC.ExecProc;

      if SP_PROC.parambyName('OutERRO').asString <> 'OK' then
         Result := false;

    except
      Result := false;
    end;

  finally
    SP_PROC.Destroy;
  end;
end;


function TCtrlCalculoIRRF.Processar(tpTipo : TTipoProcesso;
                                    IdPessJur, IdPessoa,
                                    iREB, iNovoPlano: Integer;
                                    sDataPrevista: String;
                                    iTipoOpcaoIR : integer;
                                    iListaBenef  : integer;
                                    sMatricula   : String;
                                    IdTitular    : Integer;
                                    iPlano       : integer;
                                    iSeqResgate  : integer;
                                    var msgErro  : string;
                                    iTipoCalculo : integer = 2   //edilaine WO9102
                                   ) : boolean;
begin

  try
    result := true;

    if (tpTipo = tpPrazoAcumulacao) or (tpTipo = tpTodos) then
    begin
      if not ProcessaPrazoAcumulacao(0,0, iREB, iNovoPlano, sDataPrevista, iTipoOpcaoIR,
                                     iListaBenef, sMatricula, IdTitular, iSeqResgate,
                                     iTipoCalculo   //edilaine WO9102
                                     ) then
      begin
        msgErro := 'Erro ao calcular IRRF';
        result := false;
      end;
    end;

    if (Result) and ( (tpTipo = tpCalcMedioPonderado) or (tpTipo = tpTodos) ) then
    begin
      if (not ProcessaCalcMedioPonderado(0,0, iPlano, iListaBenef, iTipoOpcaoIR, sMatricula, sDataPrevista, IdTitular) ) then   //edilaine 20491
      begin
        msgErro := 'Erro no Calculo Médio Ponderado';
        result := false;
      end;
    end;

  except
    result := false;
  end;

end;


function TCtrlCalculoIRRF.Gravar: boolean;
begin

end;


function TCtrlCalculoIRRF.ProcessarTodos(sDataPagto : String; var msgErro : string) : boolean;
begin
  try
    result := true;

		if not ProcessaPrazoAcumulacao(0,0,0,0,sDataPagto,2,0, '', 0,-1) then
    begin
      msgErro := 'Erro ao calcular IRRF';
      result := false;
    end;

    if Result then
    begin
      if not ProcessaCalcMedioPonderado(0,0,0,0,2, '', sDataPagto, 0) then   //edilaine SIG20491
      begin
        msgErro := 'Erro no Calculo Médio Ponderado';
        result := false;
      end;
    end;

  except
    result := false;
  end;
end;


procedure TCtrlCalculoIRRF.gravarHistoricoPrazoAcumulacao(vIdPessoa, vIdTitular,
                                                          vIdPessoaJur, vIdPlano, vIdBeneficio: Integer);
var
  iCodigo     : Integer;
  _qryUpdHST  : TwwQuery;
  _qryConsHST : TwwQuery;
  _qryConsHSTAux : TwwQuery;
  iSeqResgate    : integer;             //edilaine SIG20491
begin

   _qryUpdHST  := TwwQuery.create(nil);
   _qryConsHST := TwwQuery.create(nil);
   _qryConsHSTAux := TwwQuery.create(nil);

   try
     try
       _qryUpdHST.DataBaseName := 'BaseDados';
       _qryConsHST.DataBaseName := 'BaseDados';
       _qryConsHSTAux.DataBaseName := 'BaseDados';

       //edilaine SIG20491 : inicio
       iSeqResgate := -1;

       _qryUpdHST.Close;
       _qryUpdHST.Sql.Clear;
       _qryUpdHST.Sql.Add(' SELECT NVL(SEQRESGATE, -1) AS SEQRESGATE ');
       _qryUpdHST.Sql.Add('   FROM CM.PRAZOACUMULACAO                ');
       _qryUpdHST.Sql.Add(' WHERE IDPESSOA = ' +  IntToStr(vIdPessoa) );
       _qryUpdHST.Sql.Add('   AND IDPLANOPREV = ' +  IntToStr(vIdPlano) );
       _qryUpdHST.Sql.Add('   AND VLRIRRF  IS NULL                     ');
       _qryUpdHST.open;
       if not _qryUpdHST.Eof then
          iSeqResgate := _qryUpdHST.Fields[0].AsInteger;
       //edilaine SIG20491 : fim


       _qryUpdHST.Close;
       _qryUpdHST.Sql.Clear;
       _qryUpdHST.Sql.Add(' UPDATE CM.PRAZOACUMULACAO                      ');
       _qryUpdHST.Sql.Add(' SET VLRIRRF = (VLRVALOR*PERCENTUALIR)/100      ');
       _qryUpdHST.Sql.Add(' WHERE IDPESSOA = ' +  IntToStr(vIdPessoa) );
       _qryUpdHST.Sql.Add('   AND IDPLANOPREV = ' +  IntToStr(vIdPlano) );
       _qryUpdHST.Sql.Add('   AND VLRIRRF  IS NULL                         ');
       _qryUpdHST.ExecSQL;

       _qryUpdHST.Close;
       _qryUpdHST.Sql.Clear;
       _qryUpdHST.Sql.Add(' UPDATE CM.HSTPRAZOACUMULACAOFOLHA   ');
       _qryUpdHST.Sql.Add(' SET DATAFIM = SYSDATE -1            ');
       _qryUpdHST.Sql.Add(' WHERE IDPESSOA = :IDPESSOA          ');
       _qryUpdHST.Sql.Add('   AND IDTITULAR = :IDTITULAR        ');
       _qryUpdHST.Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV    ');
       _qryUpdHST.Sql.Add('   AND DATAFIM IS NULL               ');
       //edilaine SIG100862 : inicio
       _qryUpdHST.Sql.Add('   AND (FLGPROCESSADO = 1            ');    // MARCIO DENILSON SOL 151061 KINTANA 1105188
       _qryUpdHST.Sql.Add('    OR  IDHSTPRAZOACUMULACAOFOLHA in ( (SELECT IDHSTPRAZOACUMULACAOFOLHA  ');
       _qryUpdHST.Sql.Add('                                          FROM CM.HSTPRAZOACUMULACAOFOLHA ');
       _qryUpdHST.Sql.Add('                                         WHERE IDPESSOA = :IDPESSOA       ');
       _qryUpdHST.Sql.Add('                                           AND IDTITULAR = :IDTITULAR     ');
       _qryUpdHST.Sql.Add('                                           AND IDPLANOPREV = :IDPLANOPREV ');
       _qryUpdHST.Sql.Add('                                           AND FLGPROCESSADO = 3          ');
       _qryUpdHST.Sql.Add('                                           AND DATAFIM IS NULL            ');
       _qryUpdHST.Sql.Add('                                     ) )                                  ');
       _qryUpdHST.Sql.Add('       ) ');
       //edilaine SIG100862 : fim

       //Leandro Pocebon SIG131125 : Inicio
       //if iSeqResgate > 0 then                                                     //edilaine SIG20491
       //   _qryUpdHST.Sql.Add('   AND SEQRESGATE = '+IntToStr(iSeqResgate) );       //edilaine SIG20491
       //Leandro Pocebon SIG131125 : Fim

       _qryUpdHST.Prepare;
       _qryUpdHST.ParamByName('IDPESSOA').AsInteger     := vIdPessoa;
       _qryUpdHST.ParamByName('IDTITULAR').AsInteger    := vIdTitular;
       _qryUpdHST.ParamByName('IDPLANOPREV').AsInteger  := vIdPlano;
       _qryUpdHST.ExecSql;


       _qryConsHST.Close;
       _qryConsHST.Sql.Clear;
       _qryConsHST.Sql.Add(' SELECT IDPRAZOACUM                             ');
       _qryConsHST.Sql.Add('      , IDPESSJUR                               ');
       _qryConsHST.Sql.Add('      , IDPESSOA                                ');
       _qryConsHST.Sql.Add('      , IDPLANOPREV                             ');
       _qryConsHST.Sql.Add('      , TIPOOPCAOIR                             ');
       _qryConsHST.Sql.Add('      , DESCRICAOFAIXA                          ');
       _qryConsHST.Sql.Add('      , VLRCOTA                                 ');
       _qryConsHST.Sql.Add('      , VLRVALOR                                ');
       _qryConsHST.Sql.Add('      , PERCENTUALIR                            ');
       _qryConsHST.Sql.Add('      , INDICE                                  ');
       _qryConsHST.Sql.Add('      , VLRIRRF                                 ');
       _qryConsHST.Sql.Add('      ,(VLRVALOR*PERCENTUALIR)/100 AS IRRF      ');
       _qryConsHST.Sql.Add('      , SEQRESGATE                              ');     //edilaine SIG20491
       _qryConsHST.Sql.Add('      , IDBENEFICIO                             ');     //edilaine WO9102
       _qryConsHST.Sql.Add(' FROM CM.PRAZOACUMULACAO                        ');
       _qryConsHST.Sql.Add(' WHERE IDPESSOA = ' +  IntToStr(vIdPessoa) );
       _qryConsHST.Sql.Add('   AND IDPLANOPREV = ' +  IntToStr(vIdPlano) );

       if iSeqResgate > 0 then                                                      //edilaine SIG20491
          _qryConsHST.Sql.Add('   AND SEQRESGATE = '+IntToStr(iSeqResgate) );       //edilaine SIG20491

       _qryConsHST.Sql.Add(' ORDER BY IDPRAZOACUM DESC                      ');
       _qryConsHST.Open;


       While not _qryConsHST.EOF do
       begin
          iCodigo := 0;

          _qryConsHSTAux.Close;
          _qryConsHSTAux.Sql.Clear;
          _qryConsHSTAux.Sql.Add(' SELECT MAX(IDHSTPRAZOACUMULACAOFOLHA) AS IDHSTPRAZOACUMULACAOFOLHA  ');
          _qryConsHSTAux.Sql.Add(' FROM CM.HSTPRAZOACUMULACAOFOLHA     ');
          _qryConsHSTAux.Sql.Add(' WHERE IDPESSOA = :IDPESSOA          ');
          _qryConsHSTAux.Sql.Add('   AND IDTITULAR = :IDTITULAR        ');
          _qryConsHSTAux.Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV    ');
          _qryConsHSTAux.Sql.Add('   AND PERCENTUALIR = :PERCENTUALIR  ');
    //      Sql.Add('   AND DATAFIM IS NULL               ');   // MARCIO DENILSON SOL 151061 KINTANA 1105188
          _qryConsHSTAux.Sql.Add('   AND FLGPROCESSADO = 1             ');
          _qryConsHSTAux.Sql.Add('   AND IDHSTFOLHABENEF IS NULL       ');     //edilaine - SIG85804

          //edilaine SIG20491 : inicio
          if iSeqResgate > 0 then
             _qryConsHSTAux.Sql.Add('   AND SEQRESGATE = '+IntToStr(iSeqResgate) );
          //edilaine SIG20491 : fim

          _qryConsHSTAux.ParamByName('IDPESSOA').AsInteger     := vIdPessoa;
          _qryConsHSTAux.ParamByName('IDTITULAR').AsInteger    := vIdTitular;
          _qryConsHSTAux.ParamByName('IDPLANOPREV').AsInteger  := vIdPlano;
          _qryConsHSTAux.ParamByName('PERCENTUALIR').AsInteger := _qryConsHST.FieldByName('PERCENTUALIR').AsInteger;
          _qryConsHSTAux.Open;
          if not _qryConsHSTAux.IsEmpty then
             iCodigo := _qryConsHSTAux.FieldByName('IDHSTPRAZOACUMULACAOFOLHA').AsInteger;
          _qryConsHSTAux.Close;


          if iCodigo > 0 then
          begin
             _qryUpdHST.Close;
             _qryUpdHST.Sql.Clear;
             _qryUpdHST.Sql.Add(' UPDATE CM.HSTPRAZOACUMULACAOFOLHA        ');
             _qryUpdHST.Sql.Add(' SET DATAINICIO = SYSDATE                 ');
             _qryUpdHST.Sql.Add('    ,VLRIRRF = :VLRIRRF                   ');
             _qryUpdHST.Sql.Add('    ,VLRVALOR = :VLRVALOR                 ');
             _qryUpdHST.Sql.Add('    ,SEQRESGATE = :SEQRESGATE             ');         //edilaine SIG20491
             _qryUpdHST.Sql.Add('    ,DATAFIM = NULL                       ');         //edilaine - SIG85804
             _qryUpdHST.Sql.Add('    ,IDBENEFICIO = :IDBENEFICIO           ');         //edilaine WO9102
             _qryUpdHST.Sql.Add(' WHERE IDHSTPRAZOACUMULACAOFOLHA = :IDHSTPRAZOACUMULACAOFOLHA ');
             _qryUpdHST.ParamByName('VLRIRRF').AsFloat        := _qryConsHST.FieldByName('IRRF').AsFloat;
             _qryUpdHST.ParamByName('VLRVALOR').AsFloat       := _qryConsHST.FieldByName('VLRVALOR').AsFloat;
             _qryUpdHST.ParamByName('SEQRESGATE').AsString    := _qryConsHST.FieldByName('SEQRESGATE').AsString;  //edilaine SIG20491 //leandro wo32251
             //_qryUpdHST.ParamByName('IDBENEFICIO').AsString   := _qryConsHST.FieldByName('IDBENEFICIO').AsString; //edilaine WO9102
             _qryUpdHST.ParamByName('IDBENEFICIO').AsString   := IntToStr(vIdBeneficio) ; //leandro wo32251
             _qryUpdHST.ParamByName('IDHSTPRAZOACUMULACAOFOLHA').AsInteger  := iCodigo;
             _qryUpdHST.ExecSql;
          end
          Else
          begin
             _qryUpdHST.Close;
             _qryUpdHST.Sql.Clear;
             _qryUpdHST.Sql.Add(' INSERT INTO CM.HSTPRAZOACUMULACAOFOLHA   ');
             _qryUpdHST.Sql.Add(' ( IDHSTPRAZOACUMULACAOFOLHA              ');
             _qryUpdHST.Sql.Add('  ,IDTITULAR                              ');
             _qryUpdHST.Sql.Add('  ,IDPESSOA                               ');
             _qryUpdHST.Sql.Add('  ,IDPLANOPREV                            ');
             _qryUpdHST.Sql.Add('  ,DATAINICIO                             ');
             _qryUpdHST.Sql.Add('  ,DATAFIM                                ');
             _qryUpdHST.Sql.Add('  ,PERCENTUALIR                           ');
             _qryUpdHST.Sql.Add('  ,VLRIRRF                                ');
             _qryUpdHST.Sql.Add('  ,VLRVALOR                               ');
             _qryUpdHST.Sql.Add('  ,SEQRESGATE                             ');     //edilaine SIG20491
             _qryUpdHST.Sql.Add('  ,FLGPROCESSADO                          ');
             _qryUpdHST.Sql.Add('  ,IDBENEFICIO                            ');     //edilaine WO9102
             _qryUpdHST.Sql.Add(' )                                        ');
             _qryUpdHST.Sql.Add(' VALUES                                   ');
             _qryUpdHST.Sql.Add(' ( CM.SEQHSTPRAZOACUMULACAOFOLHA.NextVal  ');
             _qryUpdHST.Sql.Add('  ,:IDTITULAR                             ');
             _qryUpdHST.Sql.Add('  ,:IDPESSOA                              ');
             _qryUpdHST.Sql.Add('  ,:IDPLANOPREV                           ');
             _qryUpdHST.Sql.Add('  ,SYSDATE                                ');
             _qryUpdHST.Sql.Add('  ,NULL                                   ');
             _qryUpdHST.Sql.Add('  ,:PERCENTUALIR                          ');
             _qryUpdHST.Sql.Add('  ,:VLRIRRF                               ');
             _qryUpdHST.Sql.Add('  ,:VLRVALOR                              ');
             _qryUpdHST.Sql.Add('  ,:SEQRESGATE                            ');     //edilaine SIG20491
             _qryUpdHST.Sql.Add('  ,1                                      ');
             _qryUpdHST.Sql.Add('  ,:IDBENEFICIO                           ');     //edilaine WO9102
             _qryUpdHST.Sql.Add(' )                                        ');
             _qryUpdHST.ParamByName('IDPESSOA').AsInteger     := vIdPessoa;
             _qryUpdHST.ParamByName('IDTITULAR').AsInteger    := vIdTitular;
             _qryUpdHST.ParamByName('IDPLANOPREV').AsInteger  := vIdPlano;
             _qryUpdHST.ParamByName('PERCENTUALIR').AsInteger := _qryConsHST.FieldByName('PERCENTUALIR').AsInteger;
             _qryUpdHST.ParamByName('VLRIRRF').AsFloat        := _qryConsHST.FieldByName('IRRF').AsFloat;
             _qryUpdHST.ParamByName('VLRVALOR').AsFloat       := _qryConsHST.FieldByName('VLRVALOR').AsFloat;
             _qryUpdHST.ParamByName('SEQRESGATE').AsString    := _qryConsHST.FieldByName('SEQRESGATE').AsString;  //edilaine SIG20491
             //_qryUpdHST.ParamByName('IDBENEFICIO').AsString   := _qryConsHST.FieldByName('IDBENEFICIO').AsString; //edilaine WO9102 //WO32251 Leandro
             _qryUpdHST.ParamByName('IDBENEFICIO').AsString   := IntToStr(vIdBeneficio); //WO32251 Leandro
             _qryUpdHST.ExecSql;
          end;

          _qryConsHST.Next;
        end;

      except
        Raise;
      end;

   finally
      _qryConsHST.Close;
      _qryUpdHST.close;
      _qryConsHSTAux.close;

      FreeAndNil(_qryConsHST);
      FreeAndNil(_qryUpdHST);
      FreeAndNil(_qryConsHSTAux);
   end;
end;


procedure TCtrlCalculoIRRF.gravarHistoricoCalculoPMP(vIdPessoa, vIdTitular, vIdPessoaJur, vIdPlano: Integer);
var
  iCodigo : Integer;
  _qryUpdHST  : TwwQuery;
  _qryConsHST : TwwQuery;
  _qryConsHSTAux : TwwQuery;
begin

   _qryUpdHST  := TwwQuery.create(nil);
   _qryConsHST := TwwQuery.create(nil);
   _qryConsHSTAux := TwwQuery.create(nil);

   try
     try
       _qryUpdHST.DataBaseName := 'BaseDados';
       _qryConsHST.DataBaseName := 'BaseDados';
       _qryConsHSTAux.DataBaseName := 'BaseDados';

       _qryUpdHST.Close;
       _qryUpdHST.Sql.Clear;
       _qryUpdHST.Sql.Add(' UPDATE CM.HSTCALCULOPMPFOLHA        ');
       _qryUpdHST.Sql.Add(' SET DATAFIM = SYSDATE -1            ');
       _qryUpdHST.Sql.Add(' WHERE IDPESSOA = :IDPESSOA          ');
       _qryUpdHST.Sql.Add('   AND IDTITULAR = :IDTITULAR        ');
       _qryUpdHST.Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV    ');
       _qryUpdHST.Sql.Add('   AND DATAFIM IS NULL               ');
       //edilaine SIG100862 : inicio
       _qryUpdHST.Sql.Add('   AND (FLGPROCESSADO = 1            ');  // MARCIO DENILSON SOL 151061 KINTANA 1105188
       _qryUpdHST.Sql.Add('    OR  IDHSTCALCULOPMPFOLHA in ( (SELECT IDHSTCALCULOPMPFOLHA      ');
       _qryUpdHST.Sql.Add('                                     FROM CM.HSTCALCULOPMPFOLHA     ');
       _qryUpdHST.Sql.Add('                                    WHERE IDPESSOA = :IDPESSOA      ');
       _qryUpdHST.Sql.Add('                                      AND IDTITULAR = :IDTITULAR    ');
       _qryUpdHST.Sql.Add('                                      AND IDPLANOPREV = :IDPLANOPREV');
       _qryUpdHST.Sql.Add('                                      AND FLGPROCESSADO = 3         ');
       _qryUpdHST.Sql.Add('                                      AND DATAFIM IS NULL           ');
       _qryUpdHST.Sql.Add('                                ) )                                 ');
       _qryUpdHST.Sql.Add('       ) ');
       //edilaine SIG100862 : FIM

       _qryUpdHST.ParamByName('IDPESSOA').AsInteger     := vIdPessoa;
       _qryUpdHST.ParamByName('IDTITULAR').AsInteger    := vIdTitular;
       _qryUpdHST.ParamByName('IDPLANOPREV').AsInteger  := vIdPlano;
       _qryUpdHST.ExecSql;


       _qryConsHST.Close;
       _qryConsHST.Sql.Clear;
       _qryConsHST.Sql.Add(' SELECT IDHSTCALCULOPMP                         ');
       _qryConsHST.Sql.Add('       ,MESREFERENCIA                           ');
       _qryConsHST.Sql.Add('       ,IDPESSOA                                ');
       _qryConsHST.Sql.Add('       ,IDPLANOPREV                             ');
       _qryConsHST.Sql.Add('       ,SALDOACUMULADO                          ');
       _qryConsHST.Sql.Add('       ,FATORPERMANENCIA                        ');
       _qryConsHST.Sql.Add('       ,PRAZOMEDIOPONDERADO                     ');
       _qryConsHST.Sql.Add('       ,VLRCOTA                                 ');
       _qryConsHST.Sql.Add('       ,QTDCOTA                                 ');
       _qryConsHST.Sql.Add(' FROM CM.HSTCALCULOPMP                          ');
       _qryConsHST.Sql.Add(' WHERE IDPESSOA = ' +  IntToStr(vIdPessoa)       );
       _qryConsHST.Sql.Add('   AND IDPLANOPREV = ' +  IntToStr(vIdPlano)     );
       _qryConsHST.Sql.Add(' AND IDHSTCALCULOPMP =                          ');
       _qryConsHST.Sql.Add(' (                                              ');
       _qryConsHST.Sql.Add(' SELECT MAX(IDHSTCALCULOPMP)                    ');
       _qryConsHST.Sql.Add(' FROM CM.HSTCALCULOPMP                          ');
       _qryConsHST.Sql.Add(' WHERE IDPESSOA = ' +  IntToStr(vIdPessoa)       );
       _qryConsHST.Sql.Add('   AND IDPLANOPREV = ' +  IntToStr(vIdPlano)     );
       _qryConsHST.Sql.Add(' )                                              ');
       _qryConsHST.Open;


       While not _qryConsHST.EOF do
       begin
         iCodigo := 0;

         _qryConsHSTAux.Close;
         _qryConsHSTAux.Sql.Clear;
         _qryConsHSTAux.Sql.Add(' SELECT MAX(IDHSTCALCULOPMPFOLHA) AS IDHSTCALCULOPMPFOLHA  ');
         _qryConsHSTAux.Sql.Add(' FROM CM.HSTCALCULOPMPFOLHA          ');
         _qryConsHSTAux.Sql.Add(' WHERE IDPESSOA = :IDPESSOA          ');
         _qryConsHSTAux.Sql.Add('   AND IDTITULAR = :IDTITULAR        ');
         _qryConsHSTAux.Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV    ');
//         Sql.Add('   AND DATAFIM IS NULL               ');    // MARCIO DENILSON SOL 151061 KINTANA 1105188
         _qryConsHSTAux.Sql.Add('   AND FLGPROCESSADO = 1             ');
         _qryConsHSTAux.ParamByName('IDPESSOA').AsInteger     := vIdPessoa;
         _qryConsHSTAux.ParamByName('IDTITULAR').AsInteger    := vIdTitular;
         _qryConsHSTAux.ParamByName('IDPLANOPREV').AsInteger  := vIdPlano;
         _qryConsHSTAux.Open;
         if not _qryConsHSTAux.IsEmpty then
          iCodigo := _qryConsHSTAux.FieldByName('IDHSTCALCULOPMPFOLHA').AsInteger;
         _qryConsHSTAux.Close;

         if iCodigo > 0 then
         begin
            _qryUpdHST.Close;
            _qryUpdHST.Sql.Clear;
            _qryUpdHST.Sql.Add(' UPDATE CM.HSTCALCULOPMPFOLHA                       ');
            _qryUpdHST.Sql.Add(' SET DATAINICIO = SYSDATE                           ');
            _qryUpdHST.Sql.Add('    ,PRAZOMEDIOPONDERADO = :PRAZOMEDIOPONDERADO     ');
            _qryUpdHST.Sql.Add('    ,DATAFIM = NULL                                 ');     //edilaine SIG100862
            _qryUpdHST.Sql.Add(' WHERE IDHSTCALCULOPMPFOLHA = :IDHSTCALCULOPMPFOLHA ');
            _qryUpdHST.ParamByName('PRAZOMEDIOPONDERADO').AsFloat     := _qryConsHST.FieldByName('PRAZOMEDIOPONDERADO').AsFloat;
            _qryUpdHST.ParamByName('IDHSTCALCULOPMPFOLHA').AsInteger  := iCodigo;
            _qryUpdHST.ExecSql;
         end
         Else
         begin
            _qryUpdHST.Close;
            _qryUpdHST.Sql.Clear;
            _qryUpdHST.Sql.Add(' INSERT INTO CM.HSTCALCULOPMPFOLHA        ');
            _qryUpdHST.Sql.Add(' ( IDHSTCALCULOPMPFOLHA                   ');
            _qryUpdHST.Sql.Add('  ,IDTITULAR                              ');
            _qryUpdHST.Sql.Add('  ,IDPESSOA                               ');
            _qryUpdHST.Sql.Add('  ,IDPLANOPREV                            ');
            _qryUpdHST.Sql.Add('  ,DATAINICIO                             ');
            _qryUpdHST.Sql.Add('  ,DATAFIM                                ');
            _qryUpdHST.Sql.Add('  ,PRAZOMEDIOPONDERADO                    ');
            _qryUpdHST.Sql.Add('  ,FLGPROCESSADO                          ');
            _qryUpdHST.Sql.Add(' )                                        ');
            _qryUpdHST.Sql.Add(' VALUES                                   ');
            _qryUpdHST.Sql.Add(' ( CM.SEQHSTCALCULOPMPFOLHA.NextVal       ');
            _qryUpdHST.Sql.Add('  ,:IDTITULAR                             ');
            _qryUpdHST.Sql.Add('  ,:IDPESSOA                              ');
            _qryUpdHST.Sql.Add('  ,:IDPLANOPREV                           ');
            _qryUpdHST.Sql.Add('  ,SYSDATE                                ');
            _qryUpdHST.Sql.Add('  ,NULL                                   ');
            _qryUpdHST.Sql.Add('  ,:PRAZOMEDIOPONDERADO                   ');
            _qryUpdHST.Sql.Add('  ,1                                      ');
            _qryUpdHST.Sql.Add(' )                                        ');
            _qryUpdHST.ParamByName('IDPESSOA').AsInteger     := vIdPessoa;
            _qryUpdHST.ParamByName('IDTITULAR').AsInteger    := vIdTitular;
            _qryUpdHST.ParamByName('IDPLANOPREV').AsInteger  := vIdPlano;
            _qryUpdHST.ParamByName('PRAZOMEDIOPONDERADO').AsFloat := _qryConsHST.FieldByName('PRAZOMEDIOPONDERADO').AsFloat;
            _qryUpdHST.ExecSql;
         end;

         _qryConsHST.Next;
       end;
       
     except
       Raise;
     end;
   finally
      _qryConsHST.Close;
      _qryUpdHST.close;
      _qryConsHSTAux.close;

      FreeAndNil(_qryConsHST);
      FreeAndNil(_qryUpdHST);
      FreeAndNil(_qryConsHSTAux);
   end;
end;


end.

{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 132928
Data........: 15/05/2023
Responsável.: Cássio Florencio Rovaroto
Descrição...: Correções das fórmulas de cálculo da taxa de depreciação.
--------------------------------------------------------------------------------------------------
//Petri SOL 259959 PPM 1031103
Nº SOL......: 259959
Nº PPM......: 1031103
Data........: 26/08/2015
Responsável.: Petri Nocentini
Descrição...: Cadstro de Imóveis não estava alterando campo Vida Útil
--------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 240108
Nº KINTANA..: 619627
Data........: 26/12/2014
Responsável.: Fernando Xavier
Descrição...: O sistema apresenta um erro quando fazemos o processo de reavaliação utilizando um
              arquivo de importação.
--------------------------------------------------------------------------------------------------

              OBJETO DE CONTROLE DE HISTORICOVIDAUTIL  ( MT )

              Módulo          :  Comuns Imobiliário
              Autor           :  Helio Lima Custodio
              Data de Término :  08/04/2014

--------------------------------------------------------------------------------

FUNÇÕES PUBLICADAS:

   LookupHistoricoVidaUtilVigente   - Traz o registro de historico de vida util vigente.
   UpdateVigente                    - Atualiza o campo de vigente de acordo com o valor passado.
   GravaHistoricoVidaUtil           - Grava dados de vida util de acordo aos parametros passados.
   GravaHistoricoVidaUtilPorCds     - Grava dados de vida util de acordo ao id do imovel,
                                      historico do evento e dados do cds.
   ExcluiPorImovel                  - Exclui dados do historico de acordo ao id do imovel.
   VerificaSeModificaExistente      - Verifica se já existe cadastro de acordo com o id
                                      do imovel, vida útil e taxa de depreciação e se
                                      consequentemente se alteram o registro vigente.
   CalculaTaxaDepreciacaoPorAno     - De acordo a vida útil calcula a taxa de
                                      deprecição por ano.
   CalculaTaxaDepreciacaoPorMes     - De acordo a vida útil calcula a taxa de
                                      deprecição por mes.

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------

-------------------------------------------------------------------------------}

unit uCtrlHistoricoVidaUtil;

interface

uses SysUtils, dbClient, DB, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbImovel, uDbEventoImovel, uDbOutroDadoxImovel, uDbIndicadorxApur,
     uDbPlanoPatroxImovel, uDbImagens, uDbImagensXImoveis, uCtrlBem,
     uCtrlModuloImobiliario, uDbPlanoPatroxVigenciaImob, uDbPlanoPatroxVigenciaBem, uSistema,
     dbtables, classes, uDbContratoXImovel;


type
     TCtrlHistoricoVidaUtil = class(TCMControlObject)

     private
       FCdsHistoricoVidaUtil : TCMClientDataSet;

       procedure SetCdsHistoricoVidaUtil (const Value: TCMClientDataSet);


     protected
       procedure AfterInitialize;   override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       function LookupHistoricoVidaUtilVigente(const iIdImovel:Integer   = -1): OleVariant;
       function UpdateVigente(const iIdImovel: Integer; const vigente : String; const comTransaction : Boolean): Boolean;
       function GravaHistoricoVidaUtil(const iIdImovel : Integer; const vidaUtil: Integer; const txdepAno : Double; const txdepMes : Double; const histEvento : String; const comTransaction : Boolean ): Boolean;
       function GravaHistoricoVidaUtilPorCds(const iIdImovel : Integer; const histEvento : String; const comTransaction : Boolean): Boolean;
       function ExcluiPorImovel(const iIdImovel:Integer   = -1; const comTransaction : Boolean = False): Boolean;
       function VerificaSeModificaExistente( const iIdImovel : Integer;  const vidaUtil: Integer; const txdepAno : Double; const txdepMes : Double): Boolean;
       function CalculaTaxaDepreciacaoPorAno( const vidaUtil: Double ): Double;
       function CalculaTaxaDepreciacaoPorMes( const vidaUtil: Double ): Double;

       property CdsHistoricoVidaUtil   : TCMClientDataSet     read FCdsHistoricoVidaUtil            write SetCdsHistoricoVidaUtil;


     published

end;

implementation
{ TCtrlHistoricoVidaUtil }

constructor TCtrlHistoricoVidaUtil.Create;
begin
  inherited;
end;

destructor TCtrlHistoricoVidaUtil.Destroy;
begin
  FreeAndNil(FCdsHistoricoVidaUtil);
  inherited;
end;

procedure TCtrlHistoricoVidaUtil.SetCdsHistoricoVidaUtil(const Value: TCMClientDataSet);
begin
  FCdsHistoricoVidaUtil := Value;
end;


//========================================================================================
// Traz o registro de historico de vida util vigente.
// Data : 08/04/2014                            Autor: Helio Lima Custodio
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel - id do Imóvel
//
// Retorno : OLEVariant  - Conjunto de dados com o historico de vida util vigente.
//----------------------------------------------------------------------------------------
function TCtrlHistoricoVidaUtil.LookupHistoricoVidaUtilVigente(const iIdImovel: Integer): OleVariant;
var sSql, sParam: string;
begin
  // Define Parâmetros
  sParam := IntToStr(iIdImovel);
  if iIdImovel   <> -1 then sParam := sParam + ' AND VIGENTE = ' + QuotedStr('S');

  // Define Sql
  sSql := 'SELECT * FROM HISTORICOVIDAUTIL WHERE IDIMOVEL = ' + sParam;

  Result := GetDataPacket(sSql);
end;

//========================================================================================
// Atualiza o campo de vigente de acordo com o valor passado.
// Data : 08/04/2014                            Autor: Helio Lima Custodio
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel      - id do Imóvel
//       vigente        - se o registro está vigente ou não.
//                        'S' para vigente
//                        'N' para não vigente
//       comTransaction - True para que manipule transação.
//                        False para que não manipule transação.
//
// Retorno : Boolean  - True se a operação ocorreu ok ou False se teve algum erro.
//----------------------------------------------------------------------------------------
function TCtrlHistoricoVidaUtil.UpdateVigente(const iIdImovel: Integer; const vigente : String; const comTransaction : Boolean): Boolean;
var sSql, sParam : String; executouSqlOk : Boolean;
begin

     if comTransaction then  StartTransaction;

     sParam := IntToStr(iIdImovel);

     sSql := ' UPDATE HISTORICOVIDAUTIL SET VIGENTE = ' + QuotedStr(vigente) +
             ' WHERE IDIMOVEL = ' + sParam;//Petri SOL 259959 PPM 1031103
             //' WHERE IDIMOVEL in (select IDIMOVEL from IMOVELXBEM where IDBEM = ' + sParam + ')';   // SOL 240108 PPM 619627

     executouSqlOk := ExecSQL( sSql );



     if comTransaction then
     begin

         if executouSqlOk then
         begin
             Commit;
         end else
         begin
             Rollback;
         end;

     end;

     Result :=  executouSqlOk;
end;

//========================================================================================
// Grava dados de vida util de acordo aos parametros passados.
// Data : 08/04/2014                            Autor: Helio Lima Custodio
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel      - id do Imóvel
//       vidaUtil       - o valor de vida útil em meses.
//       txdepAno       - taxa de depreciação por ano.
//       txdepMes       - taxa de depreciação por mes.
//       histEvento     - Histórico do evento, informa qual tela fez a alteração.
//       comTransaction - True para que manipule transação.
//                        False para que não manipule transação.
//
// Retorno : Boolean  - True se a operação ocorreu ok ou False se teve algum erro.
//----------------------------------------------------------------------------------------
function TCtrlHistoricoVidaUtil.GravaHistoricoVidaUtil(const iIdImovel : Integer; const vidaUtil: Integer; const txdepAno : Double; const txdepMes : Double; const histEvento : String; const comTransaction : Boolean): Boolean;
var sSql : String; executouSqlOk : Boolean;
begin


     if comTransaction then  StartTransaction;

     UpdateVigente(iIdImovel, 'N', False);

     sSql := 'INSERT INTO HISTORICOVIDAUTIL ' +
             '(VIDAUTIL, TXDEP_ANO, TXDEP_MES, VIGENTE, IDIMOVEL, HIST_EVENTO)' +
             ' VALUES (' +
             IntToStr(vidaUtil) + ', ' +
             stringReplace(FloatToStr(txdepAno), ',', '.', [rfIgnoreCase, rfReplaceAll]) + ', ' +
             stringReplace(FloatToStr(txdepMes), ',', '.', [rfIgnoreCase, rfReplaceAll]) + ', ' +
             QuotedStr('S') + ', ' +
             IntToStr(iIdImovel)  + ', ' + //Petri SOL 259959 PPM 1031103
             //' (select IDIMOVEL from IMOVELXBEM where IDBEM = ' + inttostr(iIdImovel) + ') ,' +     // SOL 240108 PPM 619627
             QuotedStr(histEvento) +
             ') ';

     executouSqlOk := ExecSQL( sSql );

     if comTransaction then
     begin

         if executouSqlOk then
         begin
             Commit;
         end else
         begin
             Rollback;
         end;

     end;

     Result := executouSqlOk;
end;

//========================================================================================
// Grava dados de vida util de acordo ao id do imovel, historico do evento e dados do cds
// Data : 08/04/2014                            Autor: Helio Lima Custodio
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel      - id do Imóvel
//       histEvento     - Histórico do evento, informa qual tela fez a alteração.
//       comTransaction - True para que manipule transação.
//                        False para que não manipule transação.
//
// Retorno : Boolean  - True se a operação ocorreu ok ou False se teve algum erro.
//----------------------------------------------------------------------------------------
function TCtrlHistoricoVidaUtil.GravaHistoricoVidaUtilPorCds(const iIdImovel : Integer; const histEvento : String; const comTransaction : Boolean ): Boolean;
var vidaUtil : Integer; txdepAno, txdepMes : Double;
begin

     vidaUtil := FCdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger;
     txdepAno := FCdsHistoricoVidaUtil.FieldByName('TXDEP_ANO').AsFloat;
     txdepMes := FCdsHistoricoVidaUtil.FieldByName('TXDEP_MES').AsFloat;

     //se a taxa ao mes nao tiver sido calculada
     if txdepMes = 0 then
     begin
        txdepMes := CalculaTaxaDepreciacaoPorMes(vidaUtil) * 1.0;
     end;

     //se a taxa ao ano nao tiver sido calculada
     if txdepAno = 0 then
     begin
        txdepAno := CalculaTaxaDepreciacaoPorAno(vidaUtil) * 1.0;
     end;

     Result := GravaHistoricoVidaUtil(iIdImovel, vidaUtil, txdepAno, txdepMes, histEvento, comTransaction);
end;

//========================================================================================
// Exclui dados do historico de acordo ao id do imovel.
// Data : 08/04/2014                            Autor: Helio Lima Custodio
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel      - id do Imóvel
//       comTransaction - True para que manipule transação.
//                        False para que não manipule transação.
//
// Retorno : Boolean  - True se a operação ocorreu ok ou False se teve algum erro.
//----------------------------------------------------------------------------------------
function TCtrlHistoricoVidaUtil.ExcluiPorImovel(const iIdImovel:Integer   = -1; const comTransaction : Boolean = False): Boolean;
var sSql : String; executouSqlOk : Boolean;
begin

    if comTransaction then  StartTransaction;

    sSql := ' DELETE FROM HISTORICOVIDAUTIL ' +
            ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel);

     executouSqlOk := ExecSQL( sSql );



     if comTransaction then
     begin

         if executouSqlOk then
         begin
             Commit;
         end else
         begin
             Rollback;
         end;

     end;

     Result :=  executouSqlOk;
end;

//========================================================================================
// Verifica se já existe cadastro de acordo com o id do imovel, vida útil
// e taxa de depreciação e se consequentemente se alteram o registro vigente.
// Data : 08/04/2014                            Autor: Helio Lima Custodio
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel      - id do Imóvel
//       vidaUtil       - o valor de vida útil em meses.
//       txdepAno       - taxa de depreciação por ano.
//       txdepMes       - taxa de depreciação por mes.
//       comTransaction - True para que manipule transação.
//                        False para que não manipule transação.
//
// Retorno : Boolean  - True os dados modificam registro vigente e False se não modifica.
//----------------------------------------------------------------------------------------
function TCtrlHistoricoVidaUtil.VerificaSeModificaExistente( const iIdImovel:Integer;  const vidaUtil: Integer; const txdepAno : Double; const txdepMes : Double): Boolean;
var tempCds : TCMClientDataSet;
    strTxdepAno, strTxdepMes, strTxdepAnoRegistro, strTxdepMesRegistro : String;
begin
      tempCds := TCMClientDataSet.Create(nil);

      tempCds.Data := LookupHistoricoVidaUtilVigente(iIdImovel);

      strTxdepAno         := FloatToStr(txdepAno);
      strTxdepMes         := FloatToStr(txdepMes);
      strTxdepAnoRegistro := FloatToStr(tempCds.FieldByName('TXDEP_ANO').AsFloat);
      strTxdepMesRegistro := FloatToStr(tempCds.FieldByName('TXDEP_MES').AsFloat);

      Result := False;
      if vidaUtil <> tempCds.FieldByName('VIDAUTIL').AsInteger then
           Result := True;

      if strTxdepAno <> strTxdepAnoRegistro then
           Result := True;

      if strTxdepMes <> strTxdepMesRegistro then
           Result := True;


      //se nao trouxe nenhum registro
      //nao esta modificando nenhum registro existente
      if  tempCds.RecordCount < 1 then
           Result := False;

           
      FreeAndNil(tempCds);
end;

//========================================================================================
// De acordo a vida útil calcula a taxa de deprecição por ano.
// Data : 08/04/2014                            Autor: Helio Lima Custodio
//----------------------------------------------------------------------------------------
// Parâmetros :
//       vidaUtil       - o valor de vida útil em meses.
//
// Retorno : Double  - Valor de Taxa de Depreciação por Ano.
//----------------------------------------------------------------------------------------
function TCtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorAno( const vidaUtil: Double ): Double;
begin
    if vidaUtil <> 0 then
    begin
        //Result := 100/vidaUtil;//((vidaUtil/12)*100); //Helio verificar calculo com analista
        //Result := (100 / (vidaUtil / 12)) * 12;
        Result :=  (100/(vidaUtil/12)); //Cássio Rovaroto - SIG nº 132928
    end else
    begin
        Result := 0;
    end;
end;

//========================================================================================
// De acordo a vida útil calcula a taxa de deprecição por mes.
// Data : 08/04/2014                            Autor: Helio Lima Custodio
//----------------------------------------------------------------------------------------
// Parâmetros :
//       vidaUtil       - o valor de vida útil em meses.
//
// Retorno : Double  - Valor de Taxa de Depreciação por Ano.
//----------------------------------------------------------------------------------------
function TCtrlHistoricoVidaUtil.CalculaTaxaDepreciacaoPorMes( const vidaUtil: Double ): Double;
begin  
    if vidaUtil <> 0 then
    begin
        //Result := (100/vidaUtil)/12;
        //Result := (100 / (vidaUtil / 12));
        Result := (100 / (vidaUtil / 12)) / 12; //Cássio Rovaroto - SIG nº 132928
    end else
    begin
        Result := 0;
    end;
end;

procedure TCtrlHistoricoVidaUtil.AfterInitialize;
begin
  inherited;
end;

end.

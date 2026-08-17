{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
SOL  : 136732
Kintana: 821049
Responsável : Felipe de Oliveira
Data        : 16/08/2010
Descrição   : Acrescentada a função cria imóvel todos os campos necessários para o
              desmembramento de imóveis ser feito corretamente
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}
unit uCAF;

interface

uses
   sysUtils, uModuloInvestImob, uCtrlBem, uCtrlIndicadorImovel, Wwquery, uCtrlImovel;

type
  rGrupoBem = record
     sDescricao: string;
     sTipoGrupo: string;
     sErro     : string;
     bResult   : boolean;
  end;

  TCAF = Class(TObject)

   private
      function VerificaPlacaCAF(const iPlaca: integer): boolean;

   public

      procedure MontaHistDesmembramento(const iImovelIni: integer);
      function GrupoImobiliario(const iIdGrupo: integer; const sCodTipImovel:String): rGrupoBem;
      function GrupoExtenso(const sGrupo: string): string;
      function PlacaCaf(const iIdGrupo, iIdImovel, iIdempresa, iFlgSemPlaca, iSeq: integer): Integer;
      function CriaImovel(const sImovel,sTipoImovel: string; const iImovelMestre,iImovelOrig: int64;
                          const dConstrucao: TDateTime = -1; const dAquisicao: TDateTime = -1;
                          const vlrAquisicao: Extended = -1; const iSomaCodigo:Integer = -1 ; fPorcentagemRateio : Double = -1): int64;
      function SaldoContabilImovel(const iIdImovel, iIdImovelMestre:Integer; const dDataFim:TDateTime): Extended;

  end;

var CAF: TCAF;


implementation

uses dCAF, uFuncoesImob, uDataBase, dImobiliario, uSistema,dLookImobiliario,
     dBaseDados, uComunsImobiliario, uModuloImobiliario, uCMClientDataSet;


//=================================================================================================
// FUNÇÃO QUE MONTA UMA GRID COM TODAS OS DESMEMBRAMENTOS ORIGENS DO IMÓVEL PASSADO
// Data : 20/02/2002                            Autor: Alex Pereira
//----------------------------------------------------------------------------------------
// Parâmetros :
//               iImovelIni: Imovel origem da procura
//=================================================================================================
procedure TCAF.MontaHistDesmembramento(const iImovelIni: integer);
var
   fPercent: Extended;
   iImovel: integer;
begin
   with dtmCAF do begin
      LimpaParametros(qryDesmembramentos);
      qryDesmembramentos.Open;   // abre a qryDesmembramentos sem registros

      // PROCURAR O DESMEMBRAMENTO DO IMÓVEL ESCOLHIDO
      fPercent := 0;
      LimpaParametros(dtmCAF.qryLookDesmembramento);
      qryLookDesmembramento.ParamByName('PFLGTIPODESMEMBRA').AsString := 'D';
      qryLookDesmembramento.ParamByName('PIDIMOVELFIM').AsInteger := iImovelIni;
      qryLookDesmembramento.Open;
      while not qryLookDesmembramento.IsEmpty do begin
         qryDesmembramentos.Append;
         qryDesmembramentosIDIMOVELFIM.AsInteger := qryLookDesmembramentoIDIMOVELFIM.AsInteger;
         qryDesmembramentosIDIMOVELINI.AsInteger := qryLookDesmembramentoIDIMOVELINI.AsInteger;
         qryDesmembramentosDMRPERCENT.AsFloat    := qryLookDesmembramentoDMRPERCENT.AsFloat;
         qryDesmembramentosDMRDATA.AsDateTime    := qryLookDesmembramentoDMRDATA.AsDateTime;

         // atribuir o percentual na primeira passagem
         if fPercent = 0 then
            fPercent := (qryLookDesmembramentoDMRPERCENT.AsFloat / 100)
         else
            fPercent := fPercent * (qryLookDesmembramentoDMRPERCENT.AsFloat / 100);

         qryDesmembramentosPERC_ACUM.AsFloat     := fPercent;
         qryDesmembramentosNOME_IMOVEL.AsString  := qryLookDesmembramentoNOME_IMOVEL.AsString;
         qryDesmembramentos.Post;

         iImovel := qryLookDesmembramentoIDIMOVELINI.AsInteger;
         LimpaParametros(dtmCAF.qryLookDesmembramento);
         qryLookDesmembramento.ParamByName('PIDIMOVELFIM').AsInteger := iImovel;
         qryLookDesmembramento.Open;
      end;

   end;
end;



//========================================================================================
// Função para Determinar o Grupo Imobiliário do Bem
// Data : 08/01/2002                            Autor: Alex Pereira
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdGrupo       : id do Grupo Contábil relacionado ao bem
//       sCodTipImovel  : Código do Tipo do Imóvel
//
// Obs.: Se a query DtmLookImobiliario.qryLookTipoImovel já estiver ponteirada,
//       informar '' para o sCodTipImovel
//
// Retorno : rGrupoBem.sDescricao - Descrição do Grupo
//           rGrupoBem.sTipoGrupo - Sigla do Grupo
//           rGrupoBem.sErro      - Erro caso não encontre o grupo
//           rGrupoBem.bResult    - Erro
//----------------------------------------------------------------------------------------
function TCAF.GrupoImobiliario(const iIdGrupo: integer; const sCodTipImovel:String): rGrupoBem;
begin
   Result.bResult := True;
   Result.sErro   := '';

   // se não tiver ponteirado, abre QryLookTipoImovel
   if sCodTipImovel <> '' then begin
      with dtmLookImobiliario do begin
         if (qryLookTipoImovel.Active = False) or (qryLookTipoImovelCODTIPIMOVEL.AsString <> sCodTipImovel) then begin
            LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
            qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := sCodTipImovel;
            qryLookTipoImovel.Open;
         end;
      end;
   end;

   // Busca o Grupo
   if iIdGrupo = dtmLookImobiliario.qryLookTipoImovelIDGRUPOAR.AsInteger then begin
       Result.sDescricao := 'Ar-Condicionado';
       Result.sTipoGrupo := 'A';
   end else if iIdGrupo = dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsInteger then begin
       Result.sDescricao := 'Edificação';
       Result.sTipoGrupo := 'E';
   end else if iIdGrupo = dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.AsInteger then begin
       Result.sDescricao := 'Instalações Elétricas';
       Result.sTipoGrupo := 'L';
   end else if iIdGrupo = dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsInteger then begin
       Result.sDescricao := 'Instalações (Gerais)';
       Result.sTipoGrupo := 'I';
   end else if iIdGrupo = dtmLookImobiliario.qryLookTipoImovelIDGRUPOMAQUINA.AsInteger then begin
       Result.sDescricao := 'Máquinas e Equipamentos';
       Result.sTipoGrupo := 'M';
   end else if iIdGrupo = dtmLookImobiliario.qryLookTipoImovelIDGRUPOMOVEL.AsInteger then begin
       Result.sDescricao := 'Móveis e Utensílios';
       Result.sTipoGrupo := 'O';
   end else if iIdGrupo = dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsInteger then begin
       Result.sDescricao := 'Terreno';
       Result.sTipoGrupo := 'T';
   end else if iIdGrupo = dtmLookImobiliario.qryLookTipoImovelIDGRUPOUTILITARIO.AsInteger then begin
       Result.sDescricao := 'Utilitários';
       Result.sTipoGrupo := 'U';
   end else if iIdGrupo = dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.AsInteger then begin
       Result.sDescricao := 'Veículos';
       Result.sTipoGrupo := 'V';
   end else begin
       Result.sDescricao := '';
       Result.sTipoGrupo := '';
       Result.bResult    := False;

       LimpaParametros(dtmLookImobiliario.qryLookGrupo);
       dtmLookImobiliario.qryLookGrupo.ParamByName('PIDGRUPO').AsInteger := iIdGrupo;
       dtmLookImobiliario.qryLookGrupo.Open;
       Result.sErro      := 'Grupo ' + dtmLookImobiliario.qryLookGrupoCLASSE.AsString + ' - ' +
                            dtmLookImobiliario.qryLookGrupoNOME.AsString + ' não relacionado ao tipo ' + sCodTipImovel;
   end;
end;


//========================================================================================
// Função para Retornar o nome do Grupo por Extenso
// Data : 08/01/2002                            Autor: Alex Pereira
//----------------------------------------------------------------------------------------
// Parâmetros :
//       sGrupo  : Código do Grupo
//
// Retorno    : Descrição do Grupo
//----------------------------------------------------------------------------------------
function TCAF.GrupoExtenso(const sGrupo: string): string;
begin
   if length(trim(sGrupo)) > 0 then begin

      case sGrupo[1] of
         'A': Result := 'Ar-Condicionado';
         'E': Result := 'Edificação';
         'I': Result := 'Instalações (Gerais)';
         'L': Result := 'Instalações Elétricas';
         'M': Result := 'Máquinas e Equip.';
         'O': Result := 'Móveis e Utensílios';
         'T': Result := 'Terreno';
         'U': Result := 'Utilitários';
         'V': Result := 'Veículos';
      else
         Result := '';
      end;

   end else begin
      Result := '';
   end;
end;


//========================================================================================
// Função para Criar Placas do CAF
// Data : 08/01/2002                            Autor: Alex Pereira
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdGrupo       : id do Grupo Contábil relacionado ao bem
//       iIdImovel      : id do Imóvel relacionado ao bem
//       iIdEmpresa     : id da Empresa                  ( Sistema.iIdEmpresa )
//       iFlgSemPlaca   : Flag que indica se a placa é obrigatória ou não [0,1]
//       iSequencial    : Nr. Sequencial para não repetir a placa  ( -1 )
//                        ( usado quando desejar criar varias placas antes de fazer
//                          qualquer integração com o Ativo Fixo )
//
// Retorno : Nr. da Placa ou (-1) no caso da placa não ser obrigatória
//----------------------------------------------------------------------------------------
function TCAF.PlacaCaf(const iIdGrupo, iIdImovel, iIdempresa, iFlgSemPlaca, iSeq: integer): Integer;
var
   sPlaca: string;
begin

   if iFlgSemPlaca = 0 then begin    // placa obrigatoria

      if ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 0 then
      begin

         // contatenar idgrupo / idimovel para formar a placa
         sPlaca := IntToStr(iIdGrupo) + IntToStr(iIdImovel);

         // Concatena nr. sequencial ao final da placa
         if iSeq <> -1 then sPlaca := sPlaca + IntToStr(iSeq);

         if not VerificaPlacaCAF(StrToInt(sPlaca)) then begin
            // concatenar idempresa / idgrupo / idimovel para formar a placa
            sPlaca := IntToStr(iIdempresa) + sPlaca;

            // não consegui concatenar número de placa === vamos apelar e começar a multiplicar por 2 ate encontrar
            while not VerificaPlacaCAF (StrToInt(sPlaca)) do begin
               sPlaca := IntToStr ( StrToInt (sPlaca) * 2  );
            end;
         end;
      end
      else
      begin
         LimpaParametros(dtmCAF.qryPlacaComPrefixo);
         dtmCAF.qryPlacaComPrefixo.Open;
         sPlaca := IntToStr(dtmCAF.qryPlacaComPrefixoPLACA.AsInteger + iSeq);
      end;

      Result := StrToIntDef (sPlaca, -1);
   end else begin
      Result := -1;
   end;
end;


//========================================================================================
// Função para Verificar se a Placa já existe no CAF                       ( uso interno )
// Data : 08/01/2002                            Autor: Alex Pereira
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iPlaca     : Nr. da Placa a ser verificada
//
// Retorno : True   -  A Placa Não Existe
//           False  -  A Placa Já Existe
//----------------------------------------------------------------------------------------
function TCAF.VerificaPlacaCAF(const iPlaca: integer): boolean;
begin
   LimpaParametros(dtmCAF.qryPlaca);
   dtmCAF.qryPlaca.ParamByName('PPLACA').AsInteger := iPlaca;
   dtmCAF.qryPlaca.Open;

   if dtmCAF.qryPlacaCOUNT.AsInteger = 0 then Result := True
   else Result := False;
end;


//========================================================================================
// Função para Criar Novos Imóveis
// Data : 08/01/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       sImovel        : Nome do Imóvel
//       iImovelMestre  : id do Imóvel Mestre para o imóvel a ser criado
//       iImovelOrig    : id do Imóvel Original para migração
//       dAquisicao     : Data de Aquisição / Término da obra           ( -1 )
//       dConstrucao    : Data de início da construção                  ( -1 )
//       vlrAquisicao   : Valor de Aquisição / Valor final da obra      ( -1 )
//       iSomaCodigo    : Adiciona o valor passado ao Código do Imóvel  ( -1 )
//
// Obs.: passar (-1) para o imóvel de origem, caso não deseje migrar os dados
//       passar (-1) para o imovel mestre, para criar como mestre
//
// Retorno : id do imóvel criado ou (-1) no caso de erros
//----------------------------------------------------------------------------------------
function TCAF.CriaImovel( const sImovel,sTipoImovel: string; const iImovelMestre,iImovelOrig: int64;
                          const dConstrucao, dAquisicao: TDateTime;  const vlrAquisicao: Extended;
                          const iSomaCodigo: Integer; fPorcentagemRateio : Double): int64;
var iImovel : int64;

   cdsTemp : TCMClientDataSet;
   sSql, sSqlImagem : String;
   qry : TwwQuery;
   CtrlIndicadorImovel : TCtrlIndicadorImovel;
   CtrlImovel : TCtrlImovel;
begin

   cdsTemp := TCMClientDataSet.Create(nil);
   qry := TwwQuery.Create(nil);

   CtrlIndicadorImovel :=  TCtrlIndicadorImovel.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
   CtrlIndicadorImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   CtrlImovel := TCtrlImovel.Create;
   CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   try
     qry.DataBaseName := 'BaseDados';
     // Cria registro correspondente na tabela de imoveis
     iImovel := LeUltRegistro(nil, 'IMOVEL');
     try

       cdsTemp.Data := CtrlIndicadorImovel.LookupIndicadorXApur(iImovelOrig);

        // Abre registro com dados do imóvel original
        if iImovelOrig <> -1 then begin
           with dtmImobiliario.qryImovel do begin
              LimpaParametros(dtmImobiliario.qryImovel);
              ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
              ParamByName('PIDIMOVEL').AsInteger      := iImovelOrig;
              Open;
           end;
        end;

        // Cria o registro na tabela IMOVEL
        with dtmCAF.qryInsImovel do begin
           LimpaParametros(dtmCAF.qryInsImovel);
           ParamByName('PIDIMOVEL').AsInteger       := iImovel;
           ParamByName('PIMONOME').AsString         := sImovel;
           ParamByName('PIDPESSOA').AsInteger       := Sistema.idEmpresa;

           if iImovelMestre > 0 then begin
              ParamByName('PIDIMOVELMESTRE').AsInteger   := iImovelMestre;
              ParamByName('PFLGSTATUSOCUPACAO').AsString := 'D';
              ParamByName('PFLGTIPOIMOVEL').AsInteger    := 1;
           end else begin
              ParamByName('PFLGTIPOIMOVEL').AsInteger    := 0;
           end;

           if sTipoIMovel <> '' then begin
              ParamByName('PCODTIPIMOVEL').AsString := sTipoImovel;
           end;
           if dAquisicao <> -1 then begin
              ParamByName('PIMODATACOMPRA').AsDateTime := dAquisicao;
           end;
           if vlrAquisicao <> -1 then begin
              ParamByName('PIMOVLRCOMPRA').AsFloat     := vlrAquisicao;
              ParamByName('PIMOMOEDACOMPRA').AsInteger := Modulo.iMoedaCorrente;
           end;
           if dConstrucao <> -1 then begin
              ParamByName('PIMODATACONSTRUCAO').AsDateTime := dConstrucao;
           end;

           if iImovelOrig <> -1 then begin
              if sTipoImovel = '' then
                 ParamByName('PCODTIPIMOVEL').AsString        := dtmImobiliario.qryImovelCODTIPIMOVEL.AsString;
              if dtmImobiliario.qryImovelIDMARCA.AsInteger > 0 then
                 ParamByName('PIDMARCA').AsInteger            := dtmImobiliario.qryImovelIDMARCA.AsInteger;
              if dConstrucao = -1 then
                 ParamByName('PIMODATACONSTRUCAO').AsDateTime := dtmImobiliario.qryImovelIMODATACONSTRUCAO.AsDateTime;
              ParamByName('PFLGSTATUSOCUPACAO').AsString      := dtmImobiliario.qryImovelFLGSTATUSOCUPACAO.AsString;
              ParamByName('PIMONOMEENDERECO').AsString        := dtmImobiliario.qryImovelIMONOMEENDERECO.AsString;
              ParamByName('PIMOLOGRADOURO').AsString          := dtmImobiliario.qryImovelIMOLOGRADOURO.AsString;
              ParamByName('PIMONUMERO').AsString              := dtmImobiliario.qryImovelIMONUMERO.AsString;
              ParamByName('PIMOCOMPLEMENTO').AsString         := dtmImobiliario.qryImovelIMOCOMPLEMENTO.AsString;
              ParamByName('PIMOBAIRRO').AsString              := dtmImobiliario.qryImovelIMOBAIRRO.AsString;
              ParamByName('PIMOCEP').AsString                 := dtmImobiliario.qryImovelIMOCEP.AsString;
              if dtmImobiliario.qryImovelIDCIDADES.AsInteger > 0 then
                 ParamByName('PIDCIDADES').AsInteger          := dtmImobiliario.qryImovelIDCIDADES.AsInteger;
              if dtmImobiliario.qryImovelIDPAIS.AsInteger > 0 then
                 ParamByName('PIDPAIS').AsInteger             := dtmImobiliario.qryImovelIDPAIS.AsInteger;

              if (not dtmImobiliario.qryImovelIMOCODIGO.IsNull) and (iSomaCodigo > 0) then begin
                 ParamByName('PIMOCODIGO').AsString           := dtmImobiliario.qryImovelIMOCODIGO.AsString + '.' + IntToStr(iSomaCodigo);

  // Felipe de Oliveira Sol 136732 Kintana 821049 - Início
  // acréscimo de parte dos campos que faltavam ao criar os novos imóveis
             ParamByName('PIDADMINIMOVEL').AsString := dtmImobiliario.qryImovelIDADMINIMOVEL.AsString;
             ParamByName('PIMOMATRICULA').AsString := dtmImobiliario.qryImovelIMOMATRICULA.AsString;
             ParamByName('PIDCARTORIO').AsString := dtmImobiliario.qryImovelIDCARTORIO.AsString;
             ParamByName('PIMODATAHABITESE').AsDateTime := dtmImobiliario.qryImovelIMODATAHABITESE.AsDateTime;
             ParamByName('PIDMARCA').AsString := dtmImobiliario.qryImovelIDMARCA.AsString;
             ParamByName('PCODSUBCONTA').AsString := dtmImobiliario.qryImovelCODSUBCONTA.AsString;
             ParamByName('PIDDAIEACARTEIRA').AsString := dtmImobiliario.qryImovelIDDAIEACARTEIRA.AsString;
             ParamByName('PIDCARTEIRASPC').AsString := dtmImobiliario.qryImovelIDCARTEIRASPC.AsString;             
             ParamByName('PCODIMOVELSPC').AsString := dtmImobiliario.qryImovelCODIMOVELSPC.AsString;
             ParamByName('PIMODESCRICAO').AsString := dtmImobiliario.qryImovelIMODESCRICAO.AsString;
             ParamByName('PIMOOBSERVACAO').AsString := dtmImobiliario.qryImovelIMOOBSERVACAO.AsString;             
             ParamByName('PINDICECOMPRA').AsString := dtmImobiliario.qryImovelINDICECOMPRA.AsString;
             ParamByName('PTAXACOMPRA').AsString := dtmImobiliario.qryImovelTAXACOMPRA.AsString;

             if (fPorcentagemRateio <> -1) and (fPorcentagemRateio > 0) then
             begin
                ParamByName('PIMOAREATOTAL').AsFloat := (dtmImobiliario.qryImovelIMOAREATOTAL.AsFloat * fPorcentagemRateio)/100;
                ParamByName('PIMOAREACOMUM').AsFloat := (dtmImobiliario.qryImovelIMOAREACOMUM.AsFloat * fPorcentagemRateio)/100;
                ParamByName('PIMOAREAGERENCIAL').AsFloat:=(dtmImobiliario.qryImovelIMOAREAGERENCIAL.AsFloat * fPorcentagemRateio)/100;
                ParamByName('PIMOVLRCOMPRA').AsFloat := (dtmImobiliario.qryImovelIMOVLRCOMPRA.AsFloat * fPorcentagemRateio)/100;
                ParamByName('PIMOVLRREAVAL').AsFloat := (dtmImobiliario.qryImovelIMOVLRREAVAL.AsFloat * fPorcentagemRateio)/100;
                ParamByName('PIMOVLRMERCADO').AsFloat := (dtmImobiliario.qryImovelIMOVLRMERCADO.AsFloat * fPorcentagemRateio)/100;
                ParamByName('PIMOFRACAOIDEAL').AsFloat := (dtmImobiliario.qryImovelIMOFRACAOIDEAL.AsFloat * fPorcentagemRateio)/100;
             end;

             ParamByName('PIMODATAMERCADO').AsString := dtmImobiliario.qryImovelIMODATAMERCADO.AsString;
             ParamByName('PIMOMOEDAMERCADO').AsString := dtmImobiliario.qryImovelIMOMOEDAMERCADO.AsString;
             ParamByName('PIMOMOEDACOMPRA').AsString := dtmImobiliario.qryImovelIMOMOEDACOMPRA.AsString;
             ParamByName('PIMOMOEDAREAVAL').AsString := dtmImobiliario.qryImovelIMOMOEDAREAVAL.AsString;
             ParamByName('PIMODATACOMPRA').AsString := dtmImobiliario.qryImovelIMODATACOMPRA.AsString;
             ParamByName('PIMODATAREAVAL').AsString := dtmImobiliario.qryImovelIMODATAREAVAL.AsString;

             end;
           end;
           ExecSQL;
        end;
  // replica os indicadores dos imóveis criados
        if not cdsTemp.IsEmpty then
        sSql := '';
        begin
          cdsTemp.First;
          while not cdsTemp.eof do
          begin
             sSql := 'INSERT INTO INDICADORXAPUR (IDINDICADORIMOVEL, MESCOMPETENCIA, ANOCOMPETENCIA, VLRAPURADO, '+
                                                          ' OBSERVACAO, DATAAPURADO, FLGPREVREAL) VALUES '+
                                '(' + cdsTemp.FieldByName('IDINDICADORIMOVEL').AsString +','+ cdsTemp.FieldByName('MESCOMPETENCIA').AsString +','+
                                   cdsTemp.FieldByName('ANOCOMPETENCIA').AsString +','+ cdsTemp.FieldByName('VLRAPURADO').AsString +','+
                                   cdsTemp.FieldByName('OBSERVACAO').AsString +','+ cdsTemp.FieldByName('DATAAPURADO').AsString +','+
                                   cdsTemp.FieldByName('FLGPREVREAL').AsString + ')';

          qry.SQL.Add(sSql);
          qry.ExecSQL;
          cdsTemp.Next;
          end;
        end;

  //replica as imagens aos imóveis criados
       cdsTemp.Data := CtrlImovel.LookupImagens(iImovelOrig);
       sSqlImagem := '';
        if not cdsTemp.IsEmpty then
        begin
          cdsTemp.First;
          while not cdsTemp.eof do
          begin

             sSqlImagem := 'INSERT INTO IMAGENSXIMOVEIS (IDIMOVEL, IDIMAGEM) VALUES '+
                                '(' + IntToStr(iImovel) +','+ cdsTemp.FieldByName('IDIMAGEM').AsString + ')';
             qry.SQL.Add(sSqlImagem);
             qry.ExecSQL;
             qry.Close;

             cdsTemp.Next;
          end;
        end;
  // Felipe de Oliveira Sol 136732 Kintana 821049 - Fim

        Result := iImovel;
     except
        Result := -1;
     end;
  finally
   FreeAndNil(CtrlIndicadorImovel);
   FreeAndNil(CtrlImovel);
  end;
end;


//========================================================================================
// Função para Totalizar o Saldo Contábil do Imóvel
// Data : 28/01/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovelMestre : id do ImóvelMestre a ser totalizado ou (-1)
//       iIdImovel       : id do Imóvel a ser totalizado ou (-1)
//       dDataFim        : Data limite para busca do Saldo
//
// Retorno : Saldo Contábil do Imóvel
//----------------------------------------------------------------------------------------
function TCAF.SaldoContabilImovel(const iIdImovel, iIdImovelMestre:Integer; const dDataFim:TDateTime): Extended;
var fSaldo  : Extended;
    CtrlBem : TCtrlBem;
begin
   Result := 0;
   try
      CtrlBem := TCtrlBem.Create;
      CtrlBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                         ComunsImobiliario.MensErroMT);

      with dtmCAF.qryImovelxBem do begin
         LimpaParametros(dtmCAF.qryImovelxBem);
         if iIdImovelMestre > 0 then
              ParamByName('PIDIMOVELMESTRE').AsInteger := iIdImovelMestre
         else ParamByName('PIDIMOVEL').AsInteger := iIdImovel;
         Open;
         // Executa a função do Ativo Fixo, buscando o Saldo para cada Bem do imóvel
         while not eof do begin
            fSaldo := 0;
            fSaldo := CtrlBem.SaldoContabil( Sistema.IdEmpresa,
                                             dtmCAF.qryImovelxBemIDBEM.AsInteger,
                                             dDataFim,
                                             ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                             ModuloImobiliario.InvestImob.iIdPaisCAF );
            Result := Result + fSaldo;
            next;
         end;
      end;
   finally
      FreeAndNil( CtrlBem );
   end;
end;



end.

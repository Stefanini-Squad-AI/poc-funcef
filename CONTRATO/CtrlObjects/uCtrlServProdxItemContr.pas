{-------------------------------------------------------------------------------
------------------------ ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------      
-------------------------------------------------------------------------------------
N.WO............: WO39052
Data............: 28/05/2026
Responsável.....: Paulo Nobre
Descrição.......: .Ajustes para identificar de forma correta o Serviço/Produto
                   quando de um item novo do contrato.
-------------------------------------------------------------------------------------
N.WO............: WO31928
Data............: 03/02/2026
Responsável.....: Paulo Nobre
Descrição.......: .Ajustes para incluir o novo tipo de aditamento - "Regularização"
-------------------------------------------------------------------------------------
N.WO............: MIGRACAO-ORACLE
Data............: 10/10/2025
Responsável.....: LEANDRO POCEBON
Descrição.......: ajuste para o oracle
------------------------------------------------------------------------------------
N.WO............: B_MIGRACAO_ORACLE_2025
Data............: 02/07/2025
Responsável.....: Paulo Nobre
Descrição.......: Ajustes ORACLE - Na função: ListProdServXItem, foi retirado
                  o ORDER BY do 2º SELECT do UNION.
--------------------------------------------------------------------------------
N.WO............: WO20776
Data............: 25/04/2025
Responsável.....: Paulo Nobre
Descrição.......: Na função ListProdServXItem, incluido na descricao a ser
                  apresentada o texto "Outros" quando a FLGTIPO do aditamento
                  for = 'C' - Outros.
--------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 05/12/2024
Responsável.....: Paulo Nobre      
Descrição.......: Implementado recurso no Cadastro de Medição, para a
                  identificação de qual documento estará na combo lista de
                  Serviço/Produto: "Contrato e/ou Aditamento".
--------------------------------------------------------------------------------
N. Solicitação..: WO6785
Dt Alteração....: 01/02/2024
Responsável.....: Everson Cunha
Descrição.......: Ajuste do campo FLAGATIVO.
--------------------------------------------------------------------------------
N. Solicitação..: WO3701
Dt Alteração....: 09/10/2023
Responsável.....: Everson Cunha
Descrição.......: Inclusão do campo FLAGATIVO.
--------------------------------------------------------------------------------
Rotina.............: ListProdServXItem
N. SIG.............: 136705
Data da Alteração..: 14/06/2023
Responsável........: Marcos Lima
Descrição..........: Ajustando a geração da proxima parcela
--------------------------------------------------------------------------------
Rotina.............: ListProdServXItem
N. SIG.............: 132615
Data da Alteração..: 05/05/2023
Responsável........: Luis Ferrari
Descrição..........: corrigido o erro da tela de medições, que apresenta de
                     forma repetida o produto nas opções de seleção
--------------------------------------------------------------------------------
N. SIG.............: 130640
Data da Alteração..: 29/11/2022
Responsável........: Everson Cunha
Descrição..........: Ajuste/melhoria na contagem das parcelas na medição
--------------------------------------------------------------------------------
Rotina.............: ListRateio
N. SIG.............: 115595
Data da Alteração..: 20/05/2021
Responsável........: Edilaine
Descrição..........: Integração com FDO Digital para rateio de lançamentos
--------------------------------------------------------------------------------
//N. SIG..........   : 115585
//Data da Alteração: : 18/05/2021 
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Retirada do campo FLGMAODEOBRA.
--------------------------------------------------------------------------------
N. SIG..........: 96771
Data............: 18/03/2020
Responsável.....: Rafael Vasconcelos
Descrição.......: Trazer contratos mesmo que não tenham produtoxitem para altera
                  o aditamento.
--------------------------------------------------------------------------------
SIG.............: 78503
Data............: 27/11/2018
Responsável.....: Taffarel Sevaybriker
Descrição.......: Ajuste para inserção das parcelas na tabela CTRLPARCELAMEDICAO
--------------------------------------------------------------------------------
SIG.............: SIG49931
Data............: 16/08/2017
Responsável.....: Fernando Xavier
Descrição.......: Impossibilidade de alterar o item, mesmo quando não há medição
                  lançada.
--------------------------------------------------------------------------------
N. Sol......: 264089
PPM.........: 1134273
Data........: 03/11/2015
Responsável.: Peterson Victor
Descrição...: incluido o parametro bParcela na função ListRateio
              para retornar as parcelas, na tela de Medição passar o parametro
              True, na tela Serviço/Produto x Item Contratual passar parametro
              False
--------------------------------------------------------------------------------
N. Sol......: 257896
PPM.........: 1014759
Data........: 27/08/2015
Responsável.: Petri Nocentini
Descrição...: Informação duplicada em rateio diferenciado na medição de
                  contrato
--------------------------------------------------------------------------------
N. Sol......: 218909/16724
PPM.........: 588170
Data........: 19/03/2015
Responsável.: Felipe A. Santos
Descrição...: controle de parcelas para medição.
--------------------------------------------------------------------------------
N. Sol......: 227975.16197
PPM.........: 430656
Data........: 26/06/2014
Responsável.: Thiago Melo
Descrição...: Manter estados das contas ao realizar alteração no rateio
--------------------------------------------------------------------------------
N. Sol......: 227975
N. Kintana..: 2061959
Data........: 06/06/2014
Responsável.: Thiago Melo
Descrição...: Ajustar a montagem da conta orçamentária para verificar saldo
--------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
Rotina      : InclusaoAlteracaoServProdxItemContr, ExclusaoServProdxItemContr 
SOL         : 185450
KINTANA     : 1745675
Responsável : Edilaine Ferraresi
Data        : 01/08/2012
Descrição   : Tratamento da mensagem de violação de integridade
--------------------------------------------------------------------------------
Pendência   : 15867
Responsável : Bruno Bastos
Data        : 25/10/2004
Descrição   : Alteração para a geração de contrato suportar múltiplas contas de
              baixa.
--------------------------------------------------------------------------------}

unit uCtrlServProdxItemContr;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, uCMTypes, uDbObjetosxItemContr, uDbRateioCentroCusto,
     UdbAditamento, udbLogAditamento,
     uDbCtrlParcelaMedicao;   // Felipe A. Santos - SOL218909/16724 PPM 588170

type
   TCtrlServProdxItemContr = Class(TCmControlObject)

   private
      FDbObjetosxItemContr  : TDbObjetosxItemContr;
      FDbRateioCentroCusto  : TDbRateioCentroCusto;
      FDbAditamento         : TDbAditamento;
      FDbLogAditamento      : TDbLogAditamento;
      FDbCtrlParcelaMedicao : TDbCtrlParcelaMedicao;  // Felipe A. Santos - SOL218909/16724 PPM 588170
      FCdsObjetosxItemContr : TCMClientDataSet;
      FCdsRateioCentroCusto : TCMClientDataSet;
      FCdsAditamento        : TCMClientDataSet;
      FCdsLogAditamento     : TCMClientDataSet;
      FCdsCtrlParcelaMedicao: TCMClientDataSet; // Felipe A. Santos - SOL218909/16724 PPM 588170
   public
      property CdsObjetosxItemContr: TCMClientDataSet read FCdsObjetosxItemContr write FCdsObjetosxItemContr;
      property CdsRateioCentroCusto: TCMClientDataSet read FCdsRateioCentroCusto write FCdsRateioCentroCusto;
      property CdsAditamento: TCMClientDataSet read FCdsAditamento write FCdsAditamento;
      property CdsLogAditamento: TCMClientDataSet read FCdsLogAditamento write FCdsLogAditamento;
      property CdsCtrlParcelaMedicao: TCMClientDataSet read FCdsCtrlParcelaMedicao write FCdsCtrlParcelaMedicao; // Felipe A. Santos - SOL218909/16724 PPM 588170

      constructor Create; override;
      destructor Destroy; override;

      function ListProdServXItem(rIDContrato, rIDObjeto, rIDItem: Double;
                                 bItensMedicao: Boolean): OleVariant;
      function ListProdServXItemContrOrig(rIDContrato: Double): OleVariant;

      function ListRateio(rIDContrato, rIDObjeto, rIDItem, rIDPessoa: Double; bParcelas: Boolean): OleVariant;

      function LookupContasOrcamen(const iEmpresa : Integer) : OleVariant;

      function  TestaProdServXItem(rIDContrato: Double; var rIDObjeto,rIDItemContr: Double): Boolean;
      function  InclusaoAlteracaoServProdxItemContr: Boolean;
      function  ExclusaoServProdxItemContr: Boolean;
      procedure OnCreateAppServer; override;

      // Início - Pendência 19333 - Marcos Topini - 01/08/2006
      function ExisteParcPendente(iIdEmpresaProp,rIDContrato,rIDObjeto,rIDItemContr: Double): Boolean;
      // Fim - Pendência 19333
      function ExisteMedicao(rIDContrato,rIDObjeto,rIDItemContr: Double): String; //SIG49931


   private
      function  AcertaTotalizaRateio: Boolean;

   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlCorrecoesContratuais }

constructor TCtrlServProdxItemContr.Create;
begin
   inherited;
   FDbObjetosxItemContr := TDbObjetosxItemContr.Create(Self);
   FDbRateioCentroCusto := TDbRateioCentroCusto.Create(Self);
   FDbAditamento        := TDbAditamento.Create(Self);
   FDbLogAditamento     := TDbLogAditamento.Create(Self);
   FDbCtrlParcelaMedicao := TDbCtrlParcelaMedicao.Create(Self);  // Felipe A. Santos - SOL218909/16724 PPM 588170
end;

destructor TCtrlServProdxItemContr.Destroy;
begin
  FDbObjetosxItemContr.Free;
  FDbRateioCentroCusto.Free;
  FDbAditamento.Free;
  FDbLogAditamento.Free;
  FDbCtrlParcelaMedicao.Free; // Felipe A. Santos - SOL218909/16724 PPM 588170
  if IsAppServer then begin
    FCdsObjetosxItemContr.Free;
    FCdsRateioCentroCusto.Free;
    FCdsAditamento.Free;
    FCdsLogAditamento.Free;
    FCdsCtrlParcelaMedicao.Free; // Felipe A. Santos - SOL218909/16724 PPM 588170
  end;
  inherited;
end;

procedure TCtrlServProdxItemContr.OnCreateAppServer;
begin
   inherited;
   FCdsObjetosxItemContr := TCMClientDataSet.Create(nil);
   FCdsRateioCentroCusto := TCMClientDataSet.Create(nil);
   FCdsAditamento        := TCMClientDataSet.Create(nil);
   FCdsLogAditamento     := TCMClientDataSet.Create(nil);
   FCdsCtrlParcelaMedicao := TCMClientDataSet.Create(nil);  // Felipe A. Santos - SOL218909/16724 PPM 588170
end;

procedure TCtrlServProdxItemContr.DoChangeDataBase;
begin
   inherited;
   FDbObjetosxItemContr.DataBaseName := DataBaseName;
   FDbRateioCentroCusto.DataBaseName := DataBaseName;
   FDbAditamento.DataBaseName        := DataBaseName;
   FDbLogAditamento.DataBaseName     := DataBaseName;
   FDbCtrlParcelaMedicao.DataBaseName:= DataBaseName; // Felipe A. Santos - SOL218909/16724 PPM 588170
end;

procedure TCtrlServProdxItemContr.AfterInitialize;
begin
   inherited;
end;

function TCtrlServProdxItemContr.TestaProdServXItem(rIDContrato: Double;
  var rIDObjeto, rIDItemContr: Double): Boolean;
begin
  with TCMClientDataSet.Create(nil) do begin
    try
      rIDObjeto    := 0;
      rIDItemContr := 0;
      Data   := ListProdServXItem(rIDContrato,0,0,False);
      Result := not(IsEmpty);
      if Result then begin
        First;
        rIDObjeto    := FieldByName('IDOBJETO').AsFloat;
        rIDItemContr := FieldByName('IDITEM').AsFloat;
      end;
    finally
      Free;
    end;
  end;
end;

function TCtrlServProdxItemContr.InclusaoAlteracaoServProdxItemContr: Boolean;
begin
  MessageInfo := '';
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.InclusaoAlteracaoServProdxItemContr(FCdsObjetosxItemContr.Data,
                                                                       FCdsRateioCentroCusto.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    StartTransaction;
    try
      //Faz acerto de IDContrato, IDObjeto e IDItem do Rateio (em caso de alteração de um destes)
      Result := AcertaTotalizaRateio;
      if not Result then raise Exception.create( 'Percentual de Rateio entre Centros de Custo não totaliza 100%' );

      Result := ApplyCds(FCdsObjetosxItemContr,FDbObjetosxItemContr,[FDbObjetosxItemContr.Idcontrato, FDbObjetosxItemContr.Idobjeto, FDbObjetosxItemContr.Iditem],[FDbObjetosxItemContr.Idcontrato, FDbObjetosxItemContr.Idobjeto, FDbObjetosxItemContr.Iditem], True);
      if not Result then raise Exception.create( FDbObjetosxItemContr.MessageInfo );

      Result := ApplyCds(FCdsRateioCentroCusto,FDbRateioCentroCusto,[FDbObjetosxItemContr.Idcontrato, FDbObjetosxItemContr.Idobjeto, FDbObjetosxItemContr.Iditem],[FDbObjetosxItemContr.Idcontrato, FDbObjetosxItemContr.Idobjeto, FDbObjetosxItemContr.Iditem],True);//SIG49931
      if not Result then raise Exception.create( FDbRateioCentroCusto.MessageInfo );

      Result := ApplyCds(FCdsAditamento,FDbAditamento,[FDbAditamento.Idaditamento,FDbObjetosxItemContr.Idcontrato],[FDbAditamento.Idaditamento,FDbObjetosxItemContr.Idcontrato]);
      if not Result then raise Exception.create( FDbAditamento.MessageInfo );

      // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
      Result := ApplyCds(FCdsCtrlParcelaMedicao, FDbCtrlParcelaMedicao, [FDbAditamento.Idaditamento,FDbObjetosxItemContr.Idcontrato, FDbObjetosxItemContr.Idobjeto, FDbObjetosxItemContr.Iditem], [FDbCtrlParcelaMedicao.IdAditamento, FDbObjetosxItemContr.Idcontrato, FDbObjetosxItemContr.Idobjeto, FDbObjetosxItemContr.Iditem], True);
      if not Result then raise Exception.Create( FDbCtrlParcelaMedicao.MessageInfo );
      // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim

      Result := ApplyCds(FCdsLogAditamento,FDbLogAditamento,[FDbAditamento.Idaditamento,FDbObjetosxItemContr.Idcontrato],[FDbLogAditamento.Idaditamento,FDbObjetosxItemContr.Idcontrato], True);
      if not Result then raise Exception.Create( FDbLogAditamento.MessageInfo );

      Commit;
    except
      on E:Exception do begin
         Result := False;
         Rollback;
         MessageInfo := E.Message;
         // Edilaine - SOL 185450 / KTN 1745675
         if (Pos('integrity constraint', MessageInfo) > 0) or
            (Pos('restrição de integridade', MessageInfo) > 0) then
         begin
           MessageInfo := 'Operação não pode ser efetuada por violar a relação Pai x Filhos';
         end;
         // Edilaine - SOL 185450 / KTN 1745675
      end;
    end;
  end;
end;

function TCtrlServProdxItemContr.ExclusaoServProdxItemContr: Boolean;
begin
  MessageInfo := '';
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExclusaoServProdxItemContr(FCdsObjetosxItemContr.Data,
                                                              FCdsRateioCentroCusto.Data,
                                                              FCdsCtrlParcelaMedicao.Data); //Taffarel - SIG78503
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    StartTransaction;
    try
      FCdsRateioCentroCusto.First;
      while not FCdsRateioCentroCusto.IsEmpty do FCdsRateioCentroCusto.Delete;

      //Taffarel - SIG78503 - inicio
      FCdsCtrlParcelaMedicao.First;
      while not FCdsCtrlParcelaMedicao.IsEmpty do FCdsCtrlParcelaMedicao.Delete;

      Result := ApplyCds(FCdsCtrlParcelaMedicao,FDbCtrlParcelaMedicao,[],[]);
      if not Result then raise Exception.create( FDbCtrlParcelaMedicao.MessageInfo );
      //Taffarel - SIG78503 - fim

      Result := ApplyCds(FCdsRateioCentroCusto,FDbRateioCentroCusto,[],[]);
      if not Result then raise Exception.create( FDbRateioCentroCusto.MessageInfo );

      Result := ApplyCds(FCdsObjetosxItemContr,FDbObjetosxItemContr,[],[]);
      if not Result then raise Exception.create( FDbObjetosxItemContr.MessageInfo );

      Result := ApplyCds(FCdsAditamento,FDbAditamento,[],[]);
      if not Result then raise Exception.create( FDbAditamento.MessageInfo );

      Commit;
    except
      on E:Exception do begin
         Result := False;
         Rollback;
         MessageInfo := E.Message;
         // Edilaine - SOL 185450 / KTN 1745675
         if (Pos('integrity constraint', MessageInfo) > 0) or
            (Pos('restrição de integridade', MessageInfo) > 0) then
         begin
           MessageInfo := 'Operação não pode ser efetuada por violar a relação Pai x Filhos';
         end;
         // Edilaine - SOL 185450 / KTN 1745675
      end;
    end;
  end;
end;

function TCtrlServProdxItemContr.ListProdServXItem(rIDContrato, rIDObjeto, rIDItem: Double;
                                                   bItensMedicao: Boolean): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   C.NOMECONTRATO, '+
         '   C.UNIDNEGOC, '+
         // '   OXI.*, '+ SIG 96771
         '  nvl(OXI.IDCONTRATO,C.IDCONTRATO) IDCONTRATO,OXI.IDOBJETO,OXI.IDITEM,OXI.MOECODIGO,OXI.IDPESSOA,OXI.QTDEITEM,OXI.CODMEDIDA,OXI.DATABASEITEM, '+
         '  OXI.VALORUNITARIOOBJETO,OXI.VALORTOTALOBJETO,OXI.TIPOTOLERANCIAOBJETO,OXI.TOLERANCIAMAISOBJETO,OXI.TOLERANCIAMENOSOBJETO,OXI.NUMPARCELAS,'+
         '  OXI.FREQUENCIA,OXI.INTERVALO,OXI.NUMMEDICOES,OXI.DATAINICIOCOBR,OXI.DATAULTGERACAO,OXI.DATAULTVENC,OXI.TRGDTINCLUSAO,OXI.TRGUSERINCLUSAO,OXI.OBSERVACAO,'+
         //Cássio Rovaroto - SIG nº 115585 - Início
         //'  OXI.IDPROGRAMA,OXI.IDPLANOPREV,OXI.IDPATRO,OXI.IDOBJABATCORR,OXI.IDITEMABATCORR,OXI.ATUACAO,OXI.FLGRESMENABAT,OXI.UNIDNEGOC,OXI.IDRESPONSAVEL,OXI.IDFORMORCADO,OXI.FLGMAODEOBRA, '+
         '  OXI.IDPROGRAMA,OXI.IDPLANOPREV,OXI.IDPATRO,OXI.IDOBJABATCORR,OXI.IDITEMABATCORR,OXI.ATUACAO,OXI.FLGRESMENABAT,OXI.UNIDNEGOC,OXI.IDRESPONSAVEL,OXI.IDFORMORCADO, '+
         //Cássio Rovaroto - SIG nº 115585 - Fim
     //    '   O.NOMEOBJETO, '+            // Paulo Nobre -  WO15750 
         '   I.NOME_ITEM, '+
         '   DECODE(ULT.ULTPARCELA, NULL, 0, ULT.ULTPARCELA) ULTPARCELA ' +  // Felipe A. Santos SOL 218909/16724 PPM 588170
         //' , NVL(OXI.FLGATIVO, ''S'') FLGATIVO ' + //WO3701 - Everson Cunha  //Everson Cunha - WO6785
         ' , NVL(OXI.FLGATIVO, ''N'') FLGATIVO ' +   //WO3701 - Everson Cunha  //Everson Cunha - WO6785

         // Paulo Nobre - WO20776 - Inicio
         // Paulo Nobre -  WO15750 - Inicio
         '   ,NVL(ULT.IDADITAMENTO,0) AS IDADITAMENTO, ' +

         // Paulo Nobre - WO39052 - Inicio.

         // Paulo Nobre - WO31928 - Inicio

         //MIGRACAO-ORACLE LEANDRO INICIO

      //   '   CAST(CASE               ' +
      //   '     WHEN NVL(ULT.IDADITAMENTO, 0) = 0 THEN (''Contrato - '' || O.NOMEOBJETO)  ' +
      //   '     WHEN A.FLGTIPO = ''A'' THEN (''Aditamento - '' || O.NOMEOBJETO || '' - ('' || A.CODADITAMENTO || '')'')  ' +
      //   '     WHEN A.FLGTIPO = ''O'' THEN (''Outros - '' || O.NOMEOBJETO || '' - ('' || A.CODADITAMENTO || '')'')      ' +
      //   '     ELSE (''Regulariza - '' || O.NOMEOBJETO || '' - ('' || A.CODADITAMENTO || '')'' )                        ' +
       //  '   END   AS VARCHAR2(250)) AS NOMEOBJETO ' +

         '   CAST(CASE                                                                                                  ' +
         '     WHEN ULT.ULTPARCELA = 0 THEN (''Contrato - '' || O.NOMEOBJETO)  ' +
         '     WHEN A.FLGTIPO = ''A'' THEN (''Aditamento - '' || O.NOMEOBJETO || '' - ('' || A.CODADITAMENTO || '')'')  ' +
         '     WHEN A.FLGTIPO = ''C'' THEN (''Outros - '' || O.NOMEOBJETO || '' - ('' || A.CODADITAMENTO || '')'')      ' +
         '     WHEN A.FLGTIPO = ''R'' THEN (''Regulariza - '' || O.NOMEOBJETO || '' - ('' || A.CODADITAMENTO || '')'' ) ' +
         '     ELSE (''Outros - '' || O.NOMEOBJETO || '' - ('' || A.CODADITAMENTO || '')'')                                                                                  ' +
         '   END AS VARCHAR2(250)) AS NOMEOBJETO ' +
         
         //MIGRACAO-ORACLE LEANDRO FIM
         // Paulo Nobre -  WO15750 - Fim
         // Paulo Nobre - WO20776 - Fim

         // Paulo Nobre - WO31928 - Fim

         // Paulo Nobre - WO39052 - Fim

         'FROM '+
         '   OBJETOSXITEMCONTR OXI, '+
         '   OBJETOCONTRATUAL O, '+
         '   ITEMCONTRATUAL I, '+
         '   CONTRATOCONTR C,'+
         '   ADITAMENTO A, '+    // Paulo Nobre -  WO15750

         //Everson Cunha - SIG130640 - Ini
         // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
         {'  (select IDCONTRATO, IDOBJETO, IDITEM, MAX(PARCELANUM) ULTPARCELA '+
         '     from CTRLPARCELAMEDICAO c'+
         '    where IDCONTRATO =  '+ FloatToStr(rIDContrato) +
         '      and FLGPARCELAMEDIDA = 1 '+
         '      and NVL(IDADITAMENTO,0) IN ((select IDADITAMENTO from (select nvl(max(IDADITAMENTO),0) IDADITAMENTO, IDCONTRATO, IDOBJETO, IDITEM ' +
         '                                                               from CTRLPARCELAMEDICAO C2 '+
         '                                                              where C2.IDCONTRATO = ' + FloatToStr(rIDContrato) +
         '                                                           group by IDCONTRATO, IDOBJETO, IDITEM))) ' +
         ' group by IDCONTRATO, IDOBJETO, IDITEM '+
         '   ) Ult ' +
         }// Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

         '(SELECT IDCONTRATO, IDOBJETO, IDITEM, IDADITAMENTO, NUM_PARC, ULTPARCELA ' +
//         '(SELECT IDCONTRATO, IDOBJETO, IDITEM, NUM_PARC, ULTPARCELA ' +
         '   FROM ( ' +
         ' SELECT CT.IDCONTRATO, CT.IDOBJETO, CT.IDITEM, CT.IDADITAMENTO, MAX(CT.PARCELANUM) NUM_PARC, COUNT(CT.IDMEDICAO) ULTPARCELA ' +
//         ' SELECT IDCONTRATO, IDOBJETO, IDITEM, MAX(PARCELANUM) NUM_PARC, COUNT(IDMEDICAO) ULTPARCELA ' +
         '   FROM CM.CTRLPARCELAMEDICAO CT ' +
// Inicio SIG 132615 Ferrari
         '             INNER JOIN ADITAMENTO AD ON AD.IDADITAMENTO = CT.IDADITAMENTO       ' +
         '             						     AND AD.DATAASSADITAMENTO =                          ' +
         '             						     (SELECT MAX(DATAASSADITAMENTO) FROM ADITAMENTO      ' +
         '             						      WHERE IDCONTRATO = ' + FloatToStr(rIDContrato)       +
         '                                    AND VL_ADITAMENTO > 0                        ' +    // Paulo Nobre -  WO15750
         '                                    AND NVL(FLGSALDOTRANSFERIDO, ''N'') = ''N'') ' +    // Paulo Nobre -  WO15750
// FIM SIG 132615
         '  WHERE CT.IDCONTRATO = ' + FloatToStr(rIDContrato) +
         '  GROUP BY CT.IDCONTRATO, CT.IDOBJETO, CT.IDITEM, CT.IDADITAMENTO ' +
//         '  GROUP BY IDCONTRATO, IDOBJETO, IDITEM ' +
// Inicio SIG 136705 Marcos Lima
'  UNION ALL ' +
'  					           SELECT CT.IDCONTRATO, ' +
'  					                  CT.IDOBJETO, ' +
'  					                  CT.IDITEM, ' +
'  					                  CT.IDADITAMENTO, ' +
'  					                  MAX(CT.PARCELANUM) NUM_PARC, ' +
'  					                  ( SELECT COUNT(IDMEDICAO) FROM CM.CTRLPARCELAMEDICAO '+
'                               WHERE IDCONTRATO = ' + FloatToStr(rIDContrato) +
'                                 AND IDADITAMENTO IS NULL )AS ULTPARCELA ' +
'  					           FROM CM.CTRLPARCELAMEDICAO CT' +
'                      JOIN CONTRATOCONTR C ON C.IDCONTRATO = CT.IDCONTRATO AND C.FLGSALDOTRANSFERIDO = ''N'' ' +
'  					           WHERE CT.IDCONTRATO = ' + FloatToStr(rIDContrato) +
'  					             AND CT.IDADITAMENTO IS NULL ' +
'  					           GROUP BY ' +
'  					             CT.IDCONTRATO, ' +
'  					             CT.IDOBJETO, ' +
'  					             CT.IDITEM, ' +
'  					             CT.IDADITAMENTO ' +
// Fim SIG 136705 Marcos Lima
//         '  ORDER BY CT.IDCONTRATO, CT.IDOBJETO, CT.IDITEM, CT.IDADITAMENTO ' +  // Paulo Nobre - B_MIGRACAO_ORACLE_2025
//         '  ORDER BY IDCONTRATO, IDOBJETO, IDITEM ' +
         '         ) WHERE NUM_PARC <> ULTPARCELA ' +
         ' ) ULT ' +
         //Everson Cunha - SIG130640 - Fim

         'WHERE '+
         '   (C.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
         '   (A.IDADITAMENTO(+) = ULT.IDADITAMENTO) AND '+   // Paulo Nobre -  WO15750
         '   (OXI.IDCONTRATO(+) = C.IDCONTRATO) AND '+ //SIG 96771 - Inclusão do (+)
         '   (OXI.IDOBJETO = O.IDOBJETO(+)) AND '+ //SIG 96771 - Inclusão do (+)
         '   (OXI.IDITEM = I.IDITEM(+)) AND ' + //SIG 96771 - Inclusão do (+)
         '   (OXI.IDCONTRATO = ULT.IDCONTRATO(+)) AND ' + 
         '   (OXI.IDOBJETO = ULT.IDOBJETO(+)) AND ' + 
         '   (OXI.IDITEM = ULT.IDITEM(+))';

   if (rIDItem<>0) then
       sSql:=sSql+'   AND (OXI.IDITEM = '+FloatToStr(rIDItem)+') ';

   if bItensMedicao then
      sSql:=sSql+'   AND (I.TIPOCOBRANCA IN (''PQ'',''PV'',''EQ'',''EV'')) ';

   if (rIDObjeto<>0) then
       sSql:=sSql+'   AND (OXI.IDOBJETO = '+FloatToStr(rIDObjeto)+') ';

//   sSql:=sSql+'ORDER BY OXI.IDCONTRATO';
   sSql:=sSql+'ORDER BY ULT.IDADITAMENTO';  // Paulo Nobre -  WO15750

   Result:=GetDataPacket(sSql);
end;


function TCtrlServProdxItemContr.ListProdServXItemContrOrig(
  rIDContrato: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   O.*, '+
         '   OC.NOMEOBJETO, '+
         '   IC.NOME_ITEM, '+
         '   MOEDA.MOEDESC, '+
         '   UM.DESCMEDIDA, '+
         '   PR.DESCPROGRAMA, '+
         '   P.NOME NOMEPATRO, '+
         '   PL.NOME NOMEPLANPREV '+
         'FROM '+
         '   OBJETOSXITEMCONTR O, '+
         '   OBJETOCONTRATUAL OC, '+
         '   ITEMCONTRATUAL IC, '+
         '   MOEDA, '+
         '   UNMEDIDA UM, '+
         '   PROGRAMA PR, '+
         '   PESSOA P, '+
         '   PLANPREVCONTABIL PL '+
         'WHERE '+
         '   (IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
         '   (O.IDOBJETO = OC.IDOBJETO) AND '+
         '   (O.IDITEM = IC.IDITEM) AND '+
         '   (O.MOECODIGO = MOEDA.MOECODIGO(+)) AND '+
         '   (O.CODMEDIDA = UM.CODMEDIDA(+)) AND '+
         '   (O.IDPROGRAMA = PR.IDPROGRAMA(+)) AND '+
         '   (O.IDPATRO = P.IDPESSOA(+)) AND '+
         '   (O.IDPLANOPREV = PL.IDPLANOPREV(+)) '+
         'ORDER BY  OC.NOMEOBJETO, IC.NOME_ITEM';
   Result:=GetDataPacket(sSql);
end;


function TCtrlServProdxItemContr.ListRateio(rIDContrato, rIDObjeto,
  rIDItem, rIDPessoa: Double; bParcelas: Boolean): OleVariant;
var sSql, sParam : String;
begin
   // Define Parametros
   sParam := ' AND R.IDEMPRESA = ' + FloatToStr(rIDPessoa) +#13;
   if rIdContrato <> 0 then
      sParam := sParam + ' AND R.IDCONTRATO = ' + FloatToStr(rIDContrato) +#13;
   if rIdObjeto   <> 0 then
      sParam := sParam + ' AND R.IDOBJETO = ' + FloatToStr(rIDObjeto) +#13;
   if rIdItem     <> 0 then
      sParam := sParam + ' AND R.IDITEM = ' + FloatToStr(rIDItem);

   // Define Sql
   sSql := 'SELECT R.IDRATEIOCCUSTO,   R.IDEMPRESA,   R.IDCONTRATO,     R.IDOBJETO,        '+#13+
           '       R.IDITEM,           R.IDPESSOA,    R.UNIDNEGOC,      R.IDPATRO,         '+#13+
           '       R.IDPLANOPREV,      R.IDPROGRAMA,  R.CODCENTROCUSTO, R.PERCRATEIOCONTR, '+#13+
           '       R.IDPLANOORCAMEN,   R.IDCONTAORCAMEN, ' + #13 +
           '       PR.DESCPROGRAMA AS NOMEPROG,  '+#13+
           '       CC.NOME AS DESCCC,            '+#13+
           '       PA.RAZAOSOCIAL AS NOME_PATRO, '+#13+
           '       PL.NOME AS NOME_PLANO,        '+#13+
           '       UN.NOME AS NOME_UNIDNEGOCIO,  '+#13+
           '       ''P''   AS DIVISOR            '+#13+
           ', OI.PLACONTA       '+#13+//Bruno Bastos - Pend. 15867 - 28/10/2004
           ', R.IDDESPESAORC, PR.IDPROGRAMAORCAMEN  '+#13+//Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
           ', NVL(TR.PLACONTACREDITO, E.CONTACFORN) AS CONTA '+#13+//Bruno Bastos - Pend. 15867 - 25/10/2004
           // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
           ', TR.CODTIPRECDES ' +#13+
           ', 0 AS TIPODESPESA ' +#13+
           ', 0 AS PLANOORIGEM ' +#13+
           ', 0 AS PATROORIGEM ' +#13+
           ', 0 AS ID_FDO      ' +#13+    //edilaine SIG115595
           ', ''                              '' AS COD_FDO  '+#13+    //edilaine SIG115595
           ', OI.PLANO ' +#13 ;

   if bParcelas then // Peterson Victor Sol 264089 PPM 1134273
      sSql := sSql + ', CPM.PARCELANUM ' +#13; //Petri SOL 257896 PPM 1014759

   //Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
   sSql := sSql + '  FROM RATEIOCENTROCUSTO R,                         '+#13+
           '       PESSOA PA, PLANPREVCONTABIL PL, CENTCUST CC, '+#13+
           '       PROGRAMA PR, UNIDNEGOCIO UN                  '+#13+
           '     , OBJETOXITEM OI, TIPORECEBDESEMB TR, CONTRATOCONTR C, '+#13+//Bruno Bastos - Pend. 15867 - 25/10/2004
           '       EMPRESAFORN E '+#13; //Bruno Bastos - Pend. 15867 - 25/10/2004

   if bParcelas then // Peterson Victor Sol 264089 PPM 1134273
      sSql := sSql + ', CTRLPARCELAMEDICAO CPM '; //Petri SOL 257896 PPM 1014759


   sSql := sSql + ' WHERE R.IDEMPRESA      = CC.IDEMPRESA      '+#13+
           '   AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO '+#13+
           '   AND R.IDPROGRAMA     = PR.IDPROGRAMA(+)  '+#13+
           '   AND R.IDPATRO        = PA.IDPESSOA(+)    '+#13+
           '   AND R.IDPLANOPREV    = PL.IDPLANOPREV(+) '+#13+
           '   AND R.IDPESSOA       = UN.IDPESSOA(+)    '+#13+
           '   AND R.UNIDNEGOC      = UN.UNIDNEGOC(+)   '+#13+ sParam +


           //Bruno Bastos - Pend. 15867 - 25/10/2004 - Início
           '   AND R.IDITEM         = OI.IDITEM '+
           '   AND R.IDOBJETO       = OI.IDOBJETO '+
           '   AND OI.IDPESSOA      = TR.IDPESSOA(+) '+
           '   AND OI.CODTIPRECDES  = TR.CODTIPRECDES(+) '+
           '   AND OI.RECPAG        = TR.RECPAG(+) '+
           '   AND R.IDCONTRATO     = C.IDCONTRATO '+
           '   AND C.IDFORCLI       = E.IDFORCLI '+
           '   AND E.IDPESSOA       = R.IDEMPRESA ';
           //Bruno Bastos - Pend. 15867 - 25/10/2004 - Fim

   if bParcelas then // Peterson Victor Sol 264089 PPM 1134273
      sSql := sSql +
           //Petri SOL 257896 PPM 1014759 inicio
           '   AND R.IDCONTRATO = CPM.IDCONTRATO(+) ' +
           '   AND R.IDITEM = CPM.IDITEM(+) ' +
           '   AND R.IDOBJETO = CPM.IDOBJETO(+) ' +
           '   AND NVL(CPM.IDADITAMENTO,0) = (SELECT NVL(MAX(IDADITAMENTO),0)  FROM CTRLPARCELAMEDICAO CPM2 ' +
           '           where CPM2.IDCONTRATO = r.IDCONTRATO ' +
           '           AND CPM2.IDITEM = r.IDITEM ' +
           '           AND CPM2.IDOBJETO = r.IDOBJETO) ';
           //Petri SOL 257896 PPM 1014759 fim

   sSql := sSql + ' ORDER BY DESCCC ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlServProdxItemContr.AcertaTotalizaRateio: Boolean;
var fTotal : Extended;
begin
   fTotal := 0;
   FCdsRateioCentroCusto.DisableControls;
   FCdsRateioCentroCusto.First;
   while not FCdsRateioCentroCusto.Eof do begin
      FCdsRateioCentroCusto.Edit;
      FCdsRateioCentroCusto.FieldByName('IDCONTRATO').AsFloat := FCdsObjetosxItemContr.FieldByName('IDCONTRATO').AsFloat;
      FCdsRateioCentroCusto.FieldByName('IDOBJETO').AsFloat   := FCdsObjetosxItemContr.FieldByName('IDOBJETO').AsFloat;
      FCdsRateioCentroCusto.FieldByName('IDITEM').AsFloat     := FCdsObjetosxItemContr.FieldByName('IDITEM').AsFloat;
      FCdsRateioCentroCusto.Post;

      // Totaliza percentual de rateio para validação
      fTotal := fTotal + FCdsRateioCentroCusto.FieldByName('PERCRATEIOCONTR').AsFloat;

      FCdsRateioCentroCusto.Next;
   end;
   FCdsRateioCentroCusto.EnableControls;
   if FormatFloat('000',fTotal) = '100' then
        Result := True
   else Result := False;
end;


function TCtrlServProdxItemContr.LookupContasOrcamen(const iEmpresa: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                      + #13 +
   '    P.MASCGRUPOORC, '                         + #13 +
   '    C.IDPLANOORCAMEN, '                       + #13 +
   '    C.IDCONTAORCAMEN, '                       + #13 +
   '    C.NOMECONTAORCAMEN '                      + #13 +
   'FROM '                                        + #13 +
   '    CONTASORCAMEN C, '                        + #13 +
   '    PARAMORCAMENTO P '                        + #13 +
   'WHERE '                                       + #13 +
   '    P.IDPESSOA       = ' + IntToStr(iEmpresa) + #13 +
   'AND C.IDPESSOA       = P.IDPESSOA '           + #13 +
   'AND P.IDPLANOORCAMEN = C.IDPLANOORCAMEN '     + #13 +
   'ORDER BY C.NOMECONTAORCAMEN '                 + #13;
   Result := GetDataPacket(sSQL);
end;


function TCtrlServProdxItemContr.ExisteParcPendente(iIdEmpresaProp, rIDContrato,rIDObjeto,rIDItemContr: Double): Boolean;
var
   sSQL             : String;
   cdsTemp          : TCMClientDataSet;
   iParcelasMedidas : Integer;
   iNumParcelas     : Integer;
   sFlfPermiteMed   : String;
begin
   try
     Result      := True;
     MessageInfo := '';
     cdsTemp := TCMClientDataSet.Create(nil);
     sSQL   := 'SELECT NVL(P.PARCELASMEDIDAS,0) AS PARCELASMEDIDAS,                        '  + #13 +
               '       OXI.NUMPARCELAS, C.FLGPERMITEMED, TRIM(I.NOME_ITEM) AS NOME_ITEM ,  '  + #13 +
               '       TRIM(CT.CODCONTRATOEMPR) AS CODCONTRATOEMPR                         '  + #13 +
               '  FROM OBJETOSXITEMCONTR OXI,                                              '  + #13 +
               '       PARAMCONTRATO C, ITEMCONTRATUAL I, CONTRATOCONTR CT,                '  + #13 +
               '       ( SELECT IDCONTRATO, IDOBJETO, IDITEM, COUNT(*) AS PARCELASMEDIDAS  '  + #13 +
               '           FROM PARCELAREALCONTR                                           '  + #13 +
               '          WHERE IDCONTRATO = ' + FloatToStr(rIDContrato)  + ' AND          '  + #13 +
               '                IDOBJETO   = ' + FloatToStr(rIDObjeto)    + ' AND          '  + #13 +
               '                IDITEM     = ' + FloatToStr(rIDItemContr)                     + #13 +
               '          GROUP BY IDCONTRATO, IDOBJETO, IDITEM ) P                        '  + #13 +
               ' WHERE                                                                     '  + #13 +
               '       OXI.IDCONTRATO = CT.IDCONTRATO AND                                  '  + #13 +
               '       OXI.IDITEM     = I.IDITEM AND                                       '  + #13 +
               '       OXI.IDOBJETO   = P.IDOBJETO(+)   AND                                '  + #13 +
               '       OXI.IDCONTRATO = P.IDCONTRATO(+) AND                                '  + #13 +
               '       OXI.IDITEM     = P.IDITEM(+)     AND                                '  + #13 +
               '         C.IDPESSOA   = ' + FloatToStr(iIdEmpresaProp) + '  AND            '  + #13 +
               '       OXI.IDOBJETO   = ' + FloatToStr(rIDObjeto)       + ' AND            '  + #13 +
               '       OXI.IDCONTRATO = ' + FloatToStr(rIDContrato)     + ' AND            '  + #13 +
               '       OXI.IDITEM     = ' + FloatToStr(rIDItemContr)                          + #13;

     cdstemp.Data     := GetDataPacket(sSQL);
     iParcelasMedidas := cdstemp.FieldByName('PARCELASMEDIDAS').AsInteger;
     iNumParcelas     := cdstemp.FieldByName('NUMPARCELAS').AsInteger;
     sFlfPermiteMed   := cdstemp.FieldByName('FLGPERMITEMED').AsString;

     If (iParcelasMedidas = 0) and (iNumParcelas = 0) then
      MessageInfo := ''
     else
      If ((iParcelasMedidas+1) > iNumParcelas) then begin
         MessageInfo := 'O ítem ' +  cdstemp.FieldByName('NOME_ITEM').AsString + ' do contrato ' +   cdstemp.FieldByName('CODCONTRATOEMPR').AsString + ' permite ' + IntToStr(iNumParcelas) + ' parcelas.' +
                        ' Parcelas medidas ' +  IntToStr(iParcelasMedidas+1);
       If sFlfPermiteMed = 'N' then Result := False;
      end
   finally
     FreeAndNil(cdsTemp);
   end;
end;
//SIG49931 inicio
function TCtrlServProdxItemContr.ExisteMedicao(rIDContrato, rIDObjeto,
  rIDItemContr: Double): String;

Var
   sSQL             : String;
   cdsTemp          : TCMClientDataSet;
begin

   try
     Result      := EmptyStr;
     cdsTemp := TCMClientDataSet.Create(nil);
     sSQL   := ' SELECT  C.NOMECONTRATO, I.NOME_ITEM AS ITEM ' + #13#10 +
               '   FROM  MEDICAO M ' + #13#10 +
               '  INNER  JOIN ITEMCONTRATUAL I ON (M.Iditem = I.Iditem) ' + #13#10 +
               '  INNER  JOIN CONTRATOCONTR C ON (M.IDCONTRATO = C.IDCONTRATO) '+ #13#10 +
               '          WHERE M.IDCONTRATO = ' + FloatToStr(rIDContrato)  + ' AND  '  + #13 +
               '                M.IDOBJETO   = ' + FloatToStr(rIDObjeto)    + ' AND  '  + #13 +
               '                M.IDITEM     = ' + FloatToStr(rIDItemContr);

     cdstemp.Data     := GetDataPacket(sSQL);


     If (Not(cdstemp.IsEmpty)) then
     begin
        MessageInfo := 'O Contrato: [' +  cdstemp.FieldByName('NOMECONTRATO').AsString + '] Item: [' +   cdstemp.FieldByName('ITEM').AsString + '] já possui medição e não poderá ser alterado.';
     end
     else
        MessageInfo := EmptyStr;

   finally
     Result := MessageInfo;
     FreeAndNil(cdsTemp);
   end;
end;
//SIG49931 final
end.

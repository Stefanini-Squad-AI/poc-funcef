{-------------------------------------------------------------------------------
----------------------ALTERAÇÕES / IMPLEMENTAÇÕES ------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 96977
Data........: 29/01/2020
Responsável.: Andre Imakawa
Descrição...: Criação das rotinas Change_LF_to_CR.
--------------------------------------------------------------------------------
Rotina......: BensNaLocalizacao
Nº SIG......: 48344
Data........: 12/12/2018
Responsável.: Everson Cunha
Descrição...: Segregação do inventário dos bens
De acordo com o MEG 075 de infraestrutura, subitem 5.1.10.1 - A COPAD realizará
inventário anual dos Bens Patrimoniais, exceto os equipamentos de TI.
Os equipamentos de TI serão inventariados pela GETIF.
--------------------------------------------------------------------------------}

unit uCtrlInventarioBens;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,  
     SysUtils, dbclient, Provider, uMidasUtil,
     dMTBem, uDBInventarioBens, uDBItensInvBens,
     uDBSelBaixa, uDBSelBaixaBens,
     uCtrlMovTransfBem, Classes;

Type
   TCtrlInventarioBens = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;
      procedure AfterInitialize; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbInventarioBens : TDbInventarioBens;
      _dbItensInvBens   : TDBItensInvBens;
      _dbSelBaixa       : TDBSelBaixa;
      _dbSelBaixaBens   : TDBSelBaixaBens;

      _dMTBem           : tdtmMTBem;

      Fcds : TClientDataSet;
      FcdsItensInvBens : TClientDataSet;
      FcdsImportaResultado : TClientDataSet;
      FcdsSelBaixa: TClientDataSet;
      FcdsSelBaixaBens: TClientDataSet;
      FcdsResInv: TClientDataSet;

      TransfBem : TCtrlMovTransfBem;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsItensInvBens(const Value: TClientDataSet);
      procedure SetcdsImportaResultado(const Value: TClientDataSet);
      procedure SetcdsSelBaixa(const Value: TClientDataSet);
      procedure SetcdsSelBaixaBens(const Value: TClientDataSet);
      procedure SetcdsResInv(const Value: TClientDataSet);

   Public
      Property cds                 : TClientDataSet read Fcds write Setcds;
      Property cdsItensInvBens     : TClientDataSet read FcdsItensInvBens write SetcdsItensInvBens;
      Property cdsImportaResultado : TClientDataSet read FcdsImportaResultado write SetcdsImportaResultado;
      Property cdsSelBaixa         : TClientDataSet read FcdsSelBaixa write SetcdsSelBaixa;
      Property cdsSelBaixaBens     : TClientDataSet read FcdsSelBaixaBens write SetcdsSelBaixaBens;
      //----------------------------------------------------------------------------------
      Property cdsResInv           : TClientDataSet read FcdsResInv write SetcdsResInv;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function ComplZeros(sCodigo : String; iTam : Integer) : string;
      function ProcurarInventarioBens(nEmpresaProp, nIdInventarioBens: Extended): OleVariant;
      function ProcurarItensInvBens(nEmpresaProp, nIdInventarioBens, nIdBem: Extended): OleVariant;
      function ListaInventarioBens(nEmpresaProp: Extended; nIdInventarioBens : Extended = -1) : OleVariant;
      function ListaItensInvBens(nEmpresaProp, nIdInventarioBens : Extended) : OleVariant;
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function ProximoInventario : Extended;
//      function BensNaLocalizacao(nEmpresaProp, nLocalizacao : Extended) : OleVariant;    //Everson Cunha - SIG48344
      function BensNaLocalizacao(nEmpresaProp, nLocalizacao : Extended; nTI : string = '0') : OleVariant; //Everson Cunha - SIG48344
      function ListaConjuntoxLocal(nEmpresaProp, nLocalizacao : Extended) : OleVariant;
      function AplicaImportacaoResultado(nEmpresaProp, nInventarioBens, nPlaca,
                                         nFlgPlaca, nLocalNovo, nConjuntoNovo,
                                         nFlgSitFisica : Extended) : Boolean;
      function AplicaPlacaNaoExportada(nEmpresaProp, nInventarioBens, nPlaca, nBem,
                                       nFlgPlaca, nLocalAtual, nConjuntoAtual,
                                       nLocalNovo, nConjuntoNovo,
                                       nFlgSitFisica : Extended): Boolean;
      function ResponsavelxLocal(nEmpresaProp, nLocalizacao : Extended) : Extended;
      function GerarTermoTransferencia(nEmpresaProp, nTermo : Extended;
                                       sProcesso : String; dDataTermo : TDateTime;
                                       nResponsavel : Extended;
                                       iDigMascPlaca : Integer) : Boolean;
      //----------------------------------------------------------------------------------
      // Coletor da CMNet
      //----------------------------------------------------------------------------------
      function AplicaResultInvColCMNet : Boolean;

      function Change_LF_to_CR(pArquivo: string): String; // Andre Imakawa - SIG 96977



   end;

implementation

{ TCtrlInventarioBens }

constructor TCtrlInventarioBens.Create;
begin
   inherited;
   _dbInventarioBens := TDbInventarioBens.Create(Self);
   _dbItensInvBens := TDbItensInvBens.Create(Self);
   _dbSelBaixa := TDbSelBaixa.Create(Self);
   _dbSelBaixaBens := TDbSelBaixaBens.Create(Self);

   Fcds := TClientDataSet.Create(nil);
   FcdsItensInvBens := TClientDataSet.Create(nil);
   FcdsImportaResultado := TClientDataSet.Create(nil);
   FcdsSelBaixa := TClientDataSet.Create(nil);
   FcdsSelBaixaBens := TClientDataSet.Create(nil);
   FcdsResInv := TClientDataSet.Create(nil);

   TransfBem := TCtrlMovTransfBem.Create;

   _dMTBem := tdtmMTBem.Create(Self);
end;

destructor TCtrlInventarioBens.Destroy;
begin
   TransfBem.Free;

   _dbInventarioBens.Free;
   _dbItensInvBens.Free;
   _dbSelBaixa.Free;
   _dbSelBaixaBens.Free;

   _dMTBem.Free;

   if IsAppServer then
      FreeCDS([Fcds, FcdsItensInvBens]);

   FcdsImportaResultado.Free;
   FcdsSelBaixa.Free;
   FcdsSelBaixaBens.Free;
   FcdsResInv.Free;

   inherited;
end;

procedure TCtrlInventarioBens.AfterInitialize;
begin
   inherited;
   TransfBem.InitializeAs(Self);
end;

procedure TCtrlInventarioBens.DoChangeDataBase;
begin
   inherited;
   _dbInventarioBens.DataBaseName := DataBaseName;
   _dbItensInvBens.DataBaseName := DataBaseName;
   _dbSelBaixa.DataBaseName := DataBaseName;
   _dbSelBaixaBens.DataBaseName := DataBaseName;
end;

procedure TCtrlInventarioBens.OnCreateAppServer;
begin
   inherited;
   Fcds             := TClientDataSet.Create(nil);
   FcdsItensInvBens := TClientDataSet.Create(nil);
end;

procedure TCtrlInventarioBens.SetcdsResInv(const Value: TClientDataSet);
begin
  FcdsResInv := Value;
end;

procedure TCtrlInventarioBens.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlInventarioBens.SetcdsItensInvBens(const Value: TClientDataSet);
begin
   FcdsItensInvBens := Value;
end;

procedure TCtrlInventarioBens.SetcdsImportaResultado(const Value: TClientDataSet);
begin
  FcdsImportaResultado := Value;
end;

procedure TCtrlInventarioBens.SetcdsSelBaixa(const Value: TClientDataSet);
begin
  FcdsSelBaixa := Value;
end;

procedure TCtrlInventarioBens.SetcdsSelBaixaBens(const Value: TClientDataSet);
begin
  FcdsSelBaixaBens := Value;
end;

function TCtrlInventarioBens.ProcurarInventarioBens(nEmpresaProp, nIdInventarioBens: Extended): OleVariant;
begin
   _dbInventarioBens.IDINVENTARIOBENS.AsFloat := nIdInventarioBens;
   _dbInventarioBens.IDEMPRESA.AsFloat := nEmpresaProp;
   Result := GetDataPacket(_dbInventarioBens.sSQLSelect);
end;

function TCtrlInventarioBens.ProcurarItensInvBens(nEmpresaProp, nIdInventarioBens, nIdBem: Extended): OleVariant;
begin
   _dbItensInvBens.IDINVENTARIOBENS.AsFloat := nIdInventarioBens;
   _dbItensInvBens.IDEMPRESA.AsFloat := nEmpresaProp;
   _dbItensInvBens.IIBIDBEM.AsFloat := nIdBem;
   Result := GetDataPacket(_dbItensInvBens.sSQLSelect);
end;

function TCtrlInventarioBens.ListaInventarioBens(nEmpresaProp, nIdInventarioBens : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT I.IDINVENTARIOBENS, ' + #13 +
           '        I.IDEMPRESA, ' + #13 +
           '        I.IDRESPONSAVEL, ' + #13 +
           '        R.NOME AS NOMERESPONSAVEL, ' + #13 +
           '        I.DATAINILEVANT, ' + #13 +
           '        I.DATAFIMLEVANT, ' + #13 +
           '        I.STATUS, ' + #13 +
           '        I.IDSELBAIXA ' + #13 +
           ' FROM INVENTARIOBENS I, ' + #13 +
           '      PESSOA R ' + #13 +
           ' WHERE I.IDEMPRESA = ' + floattostr(nEmpresaProp) + #13 ;
   //-------------------------------------------------------------------------------------
   if nIdInventarioBens <> -1 then
      sSql := sSql + '   AND I.IDINVENTARIOBENS = ' + floattostr(nIdInventarioBens) + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql +    '   AND I.IDRESPONSAVEL = R.IDPESSOA' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlInventarioBens.ListaItensInvBens(nEmpresaProp, nIdInventarioBens : Extended) : OleVariant;
begin
   _dMTBem.sqlItensInvBens.Prepare;
   _dMTBem.sqlItensInvBens.ParamByName('IDINVENTARIOBENS').AsFloat := nIdInventarioBens;
   _dMTBem.sqlItensInvBens.ParamByName('IDEMPRESA').AsFloat := nEmpresaProp;
   //-------------------------------------------------------------------------------------
   Result := _dMTBem.sqlItensInvBens.Data;
end;

function TCtrlInventarioBens.AplicaOperacao(sTipoOperacao: String): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoINVENTARIOBENS(sTipoOperacao,
                                                                  Fcds.Data,
                                                                  FcdsItensInvBens.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         if sTipoOperacao = 'EC' then // Inclusão e Alteração no Cadastro
         begin
            _dMTBem.sqlRemItensInvBens.Prepare;
            _dMTBem.sqlRemItensInvBens.ParamByName('IDEMPRESA').AsFloat        := Fcds.FieldByName('IDEMPRESA').AsFloat;
            _dMTBem.sqlRemItensInvBens.ParamByName('IDINVENTARIOBENS').AsFloat := Fcds.FieldByName('IDINVENTARIOBENS').AsFloat;
            if not ExecSQL(_dMTBem.sqlRemItensInvBens.SQLChanged, False) then
               Raise Exception.Create(MessageInfo);

            if not ApplyCds(Fcds,_dbInventarioBens,[],[]) then
               Raise Exception.Create(_dbInventarioBens.MessageInfo);

            if not ApplyCds(FcdsItensInvBens,_dbItensInvBens,[_dbInventarioBens.IdInventarioBens],[_dbItensInvBens.IdInventarioBens]) then
               Raise Exception.Create(_dbItensInvBens.MessageInfo);
         end else
         if sTipoOperacao = 'ER' then // Inclusão e Alteração no Resultado
         begin
            if not ApplyCds(Fcds,_dbInventarioBens,[],[]) then
               Raise Exception.Create(_dbInventarioBens.MessageInfo);

            if not ApplyCds(FcdsItensInvBens,_dbItensInvBens,[_dbInventarioBens.IdInventarioBens],[_dbItensInvBens.IdInventarioBens]) then
               Raise Exception.Create(_dbItensInvBens.MessageInfo);
         end else // Remoção
         begin
            if not ApplyCds(FcdsItensInvBens,_dbItensInvBens,[_dbInventarioBens.IdInventarioBens],[_dbItensInvBens.IdInventarioBens]) then
               Raise Exception.Create(_dbItensInvBens.MessageInfo);

            if not ApplyCds(Fcds,_dbInventarioBens,[],[]) then
               Raise Exception.Create(_dbInventarioBens.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception Do
         begin
            Rollback;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;

function TCtrlInventarioBens.ProximoInventario : Extended;
var
   sSql    : String;
   nResult : Extended;
begin
   sSql := ' SELECT MAX(IDINVENTARIOBENS) AS NUMERO' + #13 +
           ' FROM INVENTARIOBENS                   ' + #13;
   _cds.Data := GetDataPacket(sSql);
   //-------------------------------------------------------------------------------------
   if _cds.IsEmpty then
   begin
      Result := 1
   end else
   begin
      nResult := _cds.FieldByName('NUMERO').AsFloat;
      repeat
         nResult := nResult + 1;
         //-------------------------------------------------------------------------------
         sSql := ' SELECT IDINVENTARIOBENS ' + #13 +
                 ' FROM INVENTARIOBENS     ' + #13 +
                 ' WHERE IDINVENTARIOBENS = ' + floattostr(nResult);
         _cds.Data := GetDataPacket(sSql);
      until _cds.IsEmpty;
      //----------------------------------------------------------------------------------
      Result := nResult;
   end;
end;

function TCtrlInventarioBens.BensNaLocalizacao(nEmpresaProp, nLocalizacao : Extended; nTI : string) : OleVariant;
begin
   _dMTBem.sqlBensNaLocalizacao.Prepare;
   _dMTBem.sqlBensNaLocalizacao.ParamByName('IDPESSOA').AsFloat      := nEmpresaProp;
   _dMTBem.sqlBensNaLocalizacao.ParamByName('IDLOCALIZACAO').AsFloat := nLocalizacao;
   _dMTBem.sqlBensNaLocalizacao.ParamByName('FLGINVENTARIOTI').AsString := nTI; //Everson Cunha - SIG48344
 //---------------------------------------------------------------------------------------
   Result := _dMTBem.sqlBensNaLocalizacao.Data;
end;

function TCtrlInventarioBens.ListaConjuntoxLocal(nEmpresaProp, nLocalizacao : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT C.IDCONJUNTO, C.IDPESSOA, C.IDLOCALIZACAO, C.IDRESPONSAVEL, ' + #13 +
           '        C.DESCCONJUNTO, C.DISPONIVEL, C.ALUGADO, ' + #13 +
           '        L.NOME AS DESCLOCAL, P.NOME AS NOMERESP ' + #13 +
           ' FROM CONJUNTO C, ' + #13 +
           '      LOCALIZACAO L, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE C.IDLOCALIZACAO = ' + floattostr(nLocalizacao) + #13 +
           '   AND C.IDPESSOA      = ' + floattostr(nEmpresaProp) + #13 +
           '   AND C.IDLOCALIZACAO = L.IDLOCALIZACAO ' + #13 +
           '   AND C.IDPESSOA = L.IDPESSOA ' + #13 +
           '   AND C.IDRESPONSAVEL = P.IDPESSOA ' + #13 +
           ' ORDER BY C.DESCCONJUNTO ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlInventarioBens.AplicaImportacaoResultado(nEmpresaProp, nInventarioBens, nPlaca,
                                                       nFlgPlaca, nLocalNovo, nConjuntoNovo,
                                                       nFlgSitFisica : Extended): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaImportacaoResultado(nEmpresaProp, nInventarioBens, nPlaca,
                                                               nFlgPlaca, nLocalNovo, nConjuntoNovo,
                                                               nFlgSitFisica);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         _dMTBem.sqlImportacaoResultado.Prepare;
         _dMTBem.sqlImportacaoResultado.ParamByName('IDINVENTARIOBENS').AsFloat := nInventarioBens;
         _dMTBem.sqlImportacaoResultado.ParamByName('IDEMPRESA').AsFloat        := nEmpresaProp;
         _dMTBem.sqlImportacaoResultado.ParamByName('IIBPLACA').AsFloat         := nPlaca;
         _dMTBem.sqlImportacaoResultado.ParamByName('IIBFLGPLACA').AsFloat      := nFlgPlaca;
         //-------------------------------------------------------------------------------
         if nLocalNovo > 0 then
            _dMTBem.sqlImportacaoResultado.ParamByName('IIBLOCALNOVO').AsFloat := nLocalNovo
         else
            _dMTBem.sqlImportacaoResultado.ParamByName('IIBLOCALNOVO').Clear;
         //-------------------------------------------------------------------------------
         if nConjuntoNovo > 0 then
            _dMTBem.sqlImportacaoResultado.ParamByName('IIBCONJUNTONOVO').AsFloat := nConjuntoNovo
         else
            _dMTBem.sqlImportacaoResultado.ParamByName('IIBCONJUNTONOVO').Clear;
         //-------------------------------------------------------------------------------
         _dMTBem.sqlImportacaoResultado.ParamByName('IIBFLGSITFISICA').AsFloat := nFlgSitFisica;
         if not ExecSQL(_dMTBem.sqlImportacaoResultado.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception Do
         begin
            Rollback;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;

function TCtrlInventarioBens.AplicaPlacaNaoExportada(nEmpresaProp, nInventarioBens, nPlaca, nBem,
                                                     nFlgPlaca, nLocalAtual, nConjuntoAtual,
                                                     nLocalNovo, nConjuntoNovo,
                                                     nFlgSitFisica : Extended): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaPlacaNaoExportada(nEmpresaProp, nInventarioBens, nPlaca, nBem,
                                                             nFlgPlaca, nLocalAtual, nConjuntoAtual,
                                                             nLocalNovo, nConjuntoNovo,
                                                             nFlgSitFisica);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         _dMTBem.sqlInvInsPlaca.Prepare;
         _dMTBem.sqlInvInsPlaca.ParamByName('IDINVENTARIOBENS').AsFloat := nInventarioBens;
         _dMTBem.sqlInvInsPlaca.ParamByName('IDEMPRESA').AsFloat        := nEmpresaProp;
         _dMTBem.sqlInvInsPlaca.ParamByName('IIBIDBEM').AsFloat         := nBem;
         _dMTBem.sqlInvInsPlaca.ParamByName('IIBPLACA').AsFloat         := nPlaca;
         _dMTBem.sqlInvInsPlaca.ParamByName('IIBFLGPLACA').AsFloat      := nFlgPlaca;
         //-------------------------------------------------------------------------------
         if nLocalAtual > 0 then
            _dMTBem.sqlInvInsPlaca.ParamByName('IIBLOCALATUAL').AsFloat := nLocalAtual
         else
            _dMTBem.sqlInvInsPlaca.ParamByName('IIBLOCALATUAL').Clear;
         //-------------------------------------------------------------------------------
         if nConjuntoAtual > 0 then
            _dMTBem.sqlInvInsPlaca.ParamByName('IIBCONJUNTOATUAL').AsFloat := nConjuntoAtual
         else
            _dMTBem.sqlInvInsPlaca.ParamByName('IIBCONJUNTOATUAL').Clear;
         //-------------------------------------------------------------------------------
         if nLocalNovo > 0 then
            _dMTBem.sqlInvInsPlaca.ParamByName('IIBLOCALNOVO').AsFloat := nLocalNovo
         else
            _dMTBem.sqlInvInsPlaca.ParamByName('IIBLOCALNOVO').Clear;
         //-------------------------------------------------------------------------------
         if nConjuntoNovo > 0 then
            _dMTBem.sqlInvInsPlaca.ParamByName('IIBCONJUNTONOVO').AsFloat := nConjuntoNovo
         else
            _dMTBem.sqlInvInsPlaca.ParamByName('IIBCONJUNTONOVO').Clear;
         //-------------------------------------------------------------------------------
         _dMTBem.sqlInvInsPlaca.ParamByName('IIBFLGSITFISICA').AsFloat := nFlgSitFisica;
         if not ExecSQL(_dMTBem.sqlInvInsPlaca.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception Do
         begin
            Rollback;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;

function TCtrlInventarioBens.AplicaResultInvColCMNet : Boolean;
var
   nConjuntoAtual,
   nLocalAtual : Extended;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaResultInvColCMNet(FcdsResInv.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         FcdsResInv.First;
         while not FcdsResInv.EOF do
         begin
            //----------------------------------------------------------------------------
            // Identifica se o bem pertence a uma localização não selecionada
            // para levantamento e registra-o se for o caso
            //----------------------------------------------------------------------------
            _cds.Data := GetDataPacket(' SELECT IIBPLACA '{ivlm} +
                                       ' FROM ITENSINVBENS '{ivlm} +
                                       ' WHERE IDEMPRESA = '{ivlm} + FcdsResInv.FieldByName('IDEMPRESA').AsString +
                                       '   AND IDINVENTARIOBENS = '{ivlm} + FcdsResInv.FieldByName('IDINVENTARIOBENS').AsString +
                                       '   AND IIBIDBEM = '{ivlm} + FcdsResInv.FieldByName('IIBIDBEM').AsString +
                                       '   AND IIBPLACA = '{ivlm} + FcdsResInv.FieldByName('IIBPLACA').AsString);
            //----------------------------------------------------------------------------
            if _cds.IsEmpty then
            begin
               //-------------------------------------------------------------------------
               // Levanta os dados do bem caso ele não seja tipo 5 (Bem não Cadastrado)
               //-------------------------------------------------------------------------
               if FcdsResInv.FieldByName('IIBIDBEM').AsFloat > 0 then
               begin
                  _cds.Data := GetDataPacket(' SELECT B.IDCONJUNTO, C.IDLOCALIZACAO '{ivlm} +
                                             ' FROM BEM B, '{ivlm} +
                                             '      CONJUNTO C '{ivlm} +
                                             ' WHERE B.IDPESSOA = '{ivlm} + FcdsResInv.FieldByName('IDEMPRESA').AsString +
                                             '   AND B.IDBEM = '{ivlm} + FcdsResInv.FieldByName('IIBIDBEM').AsString +
                                             '   AND B.IDCONJUNTO = C.IDCONJUNTO '{ivlm} +
                                             '   AND B.IDPESSOA = C.IDPESSOA '{ivlm});
                  if _cds.IsEmpty then
                     Raise Exception.Create('O bem ' + FcdsResInv.FieldByName('IIBPLACA').AsString + ' (' + FcdsResInv.FieldByName('IIBIDBEM').AsString + ') ' +
                                            'não foi encontrado na base de dados! Verifique.');
                  //----------------------------------------------------------------------
                  nConjuntoAtual := _cds.FieldByName('IDCONJUNTO').AsFloat;
                  nLocalAtual := _cds.FieldByName('IDLOCALIZACAO').AsFloat;
               end else
               begin
                  nConjuntoAtual := 0;
                  nLocalAtual := 0;
               end;
               //-------------------------------------------------------------------------
               _dMTBem.sqlInvInsPlaca.Prepare;
               _dMTBem.sqlInvInsPlaca.ParamByName('IDINVENTARIOBENS').AsFloat := FcdsResInv.FieldByName('IDINVENTARIOBENS').AsFloat;
               _dMTBem.sqlInvInsPlaca.ParamByName('IDEMPRESA').AsFloat        := FcdsResInv.FieldByName('IDEMPRESA').AsFloat;
               _dMTBem.sqlInvInsPlaca.ParamByName('IIBIDBEM').AsFloat         := FcdsResInv.FieldByName('IIBIDBEM').AsFloat;
               _dMTBem.sqlInvInsPlaca.ParamByName('IIBPLACA').AsFloat         := FcdsResInv.FieldByName('IIBPLACA').AsFloat;
               _dMTBem.sqlInvInsPlaca.ParamByName('IIBFLGPLACA').AsFloat      := FcdsResInv.FieldByName('IIBFLGPLACA').AsFloat;
               //-------------------------------------------------------------------------
               if nLocalAtual > 0 then
               begin
                  _dMTBem.sqlInvInsPlaca.ParamByName('IIBLOCALATUAL').AsFloat := nLocalAtual
               end else
               begin
                  if FcdsResInv.FieldByName('IIBLOCALNOVO').AsFloat > 0 then
                     _dMTBem.sqlInvInsPlaca.ParamByName('IIBLOCALATUAL').AsFloat := FcdsResInv.FieldByName('IIBLOCALNOVO').AsFloat
                  else
                     _dMTBem.sqlInvInsPlaca.ParamByName('IIBLOCALATUAL').Clear;
               end;
               //-------------------------------------------------------------------------
               if nConjuntoAtual > 0 then
                  _dMTBem.sqlInvInsPlaca.ParamByName('IIBCONJUNTOATUAL').AsFloat := nConjuntoAtual
               else
                  _dMTBem.sqlInvInsPlaca.ParamByName('IIBCONJUNTOATUAL').Clear;
               //-------------------------------------------------------------------------
               if FcdsResInv.FieldByName('IIBLOCALNOVO').AsFloat > 0 then
                  _dMTBem.sqlInvInsPlaca.ParamByName('IIBLOCALNOVO').AsFloat := FcdsResInv.FieldByName('IIBLOCALNOVO').AsFloat
               else
                  _dMTBem.sqlInvInsPlaca.ParamByName('IIBLOCALNOVO').Clear;
               //-------------------------------------------------------------------------
               if FcdsResInv.FieldByName('IIBCONJUNTONOVO').AsFloat > 0 then
                  _dMTBem.sqlInvInsPlaca.ParamByName('IIBCONJUNTONOVO').AsFloat := FcdsResInv.FieldByName('IIBCONJUNTONOVO').AsFloat
               else
                  _dMTBem.sqlInvInsPlaca.ParamByName('IIBCONJUNTONOVO').Clear;
               //-------------------------------------------------------------------------
               _dMTBem.sqlInvInsPlaca.ParamByName('IIBFLGSITFISICA').AsFloat := FcdsResInv.FieldByName('IIBFLGSITFISICA').AsFloat;
               if not ExecSQL(_dMTBem.sqlInvInsPlaca.SQLChanged, True) then
                  Raise Exception.Create(MessageInfo);
            end else
            begin
               //-------------------------------------------------------------------------
               // Registra o resultado
               //-------------------------------------------------------------------------
               _dMTBem.sqlImportacaoResultado2.Prepare;
               _dMTBem.sqlImportacaoResultado2.ParamByName('IDINVENTARIOBENS').AsFloat := FcdsResInv.FieldByName('IDINVENTARIOBENS').AsFloat;
               _dMTBem.sqlImportacaoResultado2.ParamByName('IDEMPRESA').AsFloat        := FcdsResInv.FieldByName('IDEMPRESA').AsFloat;
               _dMTBem.sqlImportacaoResultado2.ParamByName('IIBIDBEM').AsFloat         := FcdsResInv.FieldByName('IIBIDBEM').AsFloat;
               _dMTBem.sqlImportacaoResultado2.ParamByName('IIBPLACA').AsFloat         := FcdsResInv.FieldByName('IIBPLACA').AsFloat;
               _dMTBem.sqlImportacaoResultado2.ParamByName('IIBFLGPLACA').AsFloat      := FcdsResInv.FieldByName('IIBFLGPLACA').AsFloat;
               //-------------------------------------------------------------------------
               if FcdsResInv.FieldByName('IIBLOCALNOVO').AsFloat > 0 then
                  _dMTBem.sqlImportacaoResultado2.ParamByName('IIBLOCALNOVO').AsFloat := FcdsResInv.FieldByName('IIBLOCALNOVO').AsFloat
               else
                  _dMTBem.sqlImportacaoResultado2.ParamByName('IIBLOCALNOVO').Clear;
               //-------------------------------------------------------------------------
               if FcdsResInv.FieldByName('IIBCONJUNTONOVO').AsFloat > 0 then
                  _dMTBem.sqlImportacaoResultado2.ParamByName('IIBCONJUNTONOVO').AsFloat := FcdsResInv.FieldByName('IIBCONJUNTONOVO').AsFloat
               else
                  _dMTBem.sqlImportacaoResultado2.ParamByName('IIBCONJUNTONOVO').Clear;
               //-------------------------------------------------------------------------
               _dMTBem.sqlImportacaoResultado2.ParamByName('IIBFLGSITFISICA').AsFloat := FcdsResInv.FieldByName('IIBFLGSITFISICA').AsFloat;
               if not ExecSQL(_dMTBem.sqlImportacaoResultado2.SQLChanged, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsResInv.Next;
         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception Do
         begin
            Rollback;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;

function TCtrlInventarioBens.ComplZeros(sCodigo : String; iTam : Integer) : string;
var
   iCont, iLen            : integer;
   sFull, sZeros, sResult : string;

begin
   sZeros := '';
   for iCont := 1 to iTam do
   begin
      sZeros := sZeros + '0';
   end;
   sFull := sZeros + trim(sCodigo);
   //-------------------------------------------------------------------------------------
   iLen := length(sFull);
   sResult := '';
   iCont := iTam;
   while iCont >= 1 do
   begin
      sResult := sFull[iLen] + sResult;
      iCont := iCont - 1;
      iLen  := iLen - 1;
   end;
   //-------------------------------------------------------------------------------------
   Result := sResult;
end;

function TCtrlInventarioBens.ResponsavelxLocal(nEmpresaProp, nLocalizacao : Extended) : Extended;
var
   sSql : String;

begin
   sSql := ' SELECT IDRESPONSAVEL ' + #13 +
           ' FROM LOCALIZACAO ' + #13 +
           ' WHERE IDLOCALIZACAO = ' + floattostr(nLocalizacao) + #13 +
           '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
   _cds.Data := GetDataPacket(sSql);
   //-------------------------------------------------------------------------------------
   if not _cds.IsEmpty then
      Result := _cds.FieldbyName('IDRESPONSAVEL').AsFloat
   else
      Result := -1;
end;

function TCtrlInventarioBens.GerarTermoTransferencia(nEmpresaProp, nTermo : Extended;
                                                     sProcesso : String; dDataTermo : TDateTime;
                                                     nResponsavel : Extended;
                                                     iDigMascPlaca : Integer) : Boolean;
var
   nGrupoNovo,
   nRespAtual, nRespNovo  : Extended;
   _cdsBensEscravos       : TClientDataSet;
   iTam                   : Integer;
   sPlacaBase             : String;

begin
   _cdsBensEscravos := TClientDataSet.Create(nil);
   Result := False;
   try
      if ConnectionSide = cnsClient then
      begin
         Result := Connection.AppServer.GerarTermoTransferencia(nEmpresaProp, nTermo, sProcesso,
                                                                dDataTermo, nResponsavel, iDigMascPlaca,
                                                                cds.Data, cdsItensInvBens.Data);
         if not Result then
            MessageInfo := Connection.AppServer.MessageInfo;
      end else
      begin
         try
            StartTransaction;
            //----------------------------------------------------------------------------
            // Inicializa os cds do Termo de Transferencia
            //----------------------------------------------------------------------------
            FcdsSelBaixa.Data := TransfBem.ListaSelBaixa(nEmpresaProp, 0);
            FcdsSelBaixaBens.Data := TransfBem.ListaSelBaixaBens(nEmpresaProp, 0);
            //----------------------------------------------------------------------------
            // Registra o Mestre
            //----------------------------------------------------------------------------
            FcdsSelBaixa.Append;
            FcdsSelBaixa.FieldByName('IDPESSOA').AsFloat          := nEmpresaProp;
            FcdsSelBaixa.FieldByName('SBTIPOMOV').AsInteger       := 1;            // Seleção para Transferencia
            FcdsSelBaixa.FieldByName('SBXTERMO').AsFloat          := nTermo;
            FcdsSelBaixa.FieldByName('SBXPROCESSO').AsString      := sProcesso;
            FcdsSelBaixa.FieldByName('SBXDATA').AsDateTime        := dDataTermo;
            FcdsSelBaixa.FieldByName('IDRESPONSAVEL').AsFloat     := nResponsavel;
            FcdsSelBaixa.FieldByName('SBXFLGEXECUTADO').AsInteger := 0;            // Não Executado
            FcdsSelBaixa.Post;
            //----------------------------------------------------------------------------
            FcdsItensInvBens.First;
            while not FcdsItensInvBens.EOF do
            begin
               //-------------------------------------------------------------------------
               // Seleciona o novo grupo contábil do bem de acordo com o relacionamento
               // Classe do Bem x Grupo Contabil x Centro de Custo da Localização
               //
               // Alterado em 22/01/2008 - Sergio
               //
               //-------------------------------------------------------------------------
               nGrupoNovo := TransfBem.RetornaGrupoContabil(nEmpresaProp,
                                                            FcdsItensInvBens.FieldByName('IDCLASSEBEM').AsFloat,
                                                            FcdsItensInvBens.FieldByName('IIBLOCALNOVO').AsFloat);
               if nGrupoNovo <= 0 then
                  Raise Exception.Create('O Centro de Custo da nova Localização do Bem ' + FcdsItensInvBens.FieldByName('PLACA').AsString + ' não está associado a somente um dos Grupos Contábeis associados a Classe deste Bem!');
               //-------------------------------------------------------------------------
               // Verificar se a mudança de localização/conjunto irá acarretar uma mudança
               // de grupo
               //-------------------------------------------------------------------------
               //if TransfBem.VerificaGrupo(nEmpresaProp,
               //                           FcdsItensInvBens.FieldByName('IDGRUPO').AsFloat,
               //                           FcdsItensInvBens.FieldByName('IIBCONJUNTONOVO').AsFloat) then
               //begin
               //   nGrupoNovo := TransfBem.RetornaGrupoContabil(nEmpresaProp,
               //                                                FcdsItensInvBens.FieldByName('IDCLASSEBEM').AsFloat,
               //                                                FcdsItensInvBens.FieldByName('IIBLOCALNOVO').AsFloat);
               //end else
               //begin
               //   nGrupoNovo := FcdsItensInvBens.FieldByName('IDGRUPO').AsFloat;
               //end;
               //-------------------------------------------------------------------------
               FcdsSelBaixaBens.Append;
               FcdsSelBaixaBens.FieldbyName('IDPESSOA').AsFloat     := nEmpresaProp;
               FcdsSelBaixaBens.FieldbyName('IDBEM').AsFloat        := FcdsItensInvBens.FieldByName('IDBEM').AsFloat;
               FcdsSelBaixaBens.FieldbyName('IDCONJATUAL').AsFloat  := FcdsItensInvBens.FieldByName('IDCONJUNTO').AsFloat;
               FcdsSelBaixaBens.FieldbyName('IDGRUPATUAL').AsFloat  := FcdsItensInvBens.FieldByName('IDGRUPO').AsFloat;
               FcdsSelBaixaBens.FieldbyName('IDLOCALATUAL').AsFloat := FcdsItensInvBens.FieldByName('IIBLOCALATUAL').AsFloat;
               //-------------------------------------------------------------------------
               // Captura o responsavel atual
               //-------------------------------------------------------------------------
               nRespAtual := ResponsavelxLocal(nEmpresaProp,
                                               FcdsItensInvBens.FieldByName('IIBLOCALATUAL').AsFloat);
               if nRespAtual > 0 then
                  FcdsSelBaixaBens.FieldbyName('IDRESPATUAL').AsFloat := nRespAtual;
               //-------------------------------------------------------------------------
               FcdsSelBaixaBens.FieldByName('IDCONJUNTO').AsFloat := FcdsItensInvBens.FieldByName('IIBCONJUNTONOVO').AsFloat;
               FcdsSelBaixaBens.FieldByName('IDGRUPO').AsFloat := nGrupoNovo;
               FcdsSelBaixaBens.FieldByName('IDLOCALIZACAO').AsFloat := FcdsItensInvBens.FieldByName('IIBLOCALNOVO').AsFloat;
               //-------------------------------------------------------------------------
               // Captura o responsavel novo
               //-------------------------------------------------------------------------
               nRespNovo := ResponsavelxLocal(nEmpresaProp,
                                              FcdsItensInvBens.FieldByName('IIBLOCALNOVO').AsFloat);
               if nRespNovo > 0 then
                  FcdsSelBaixaBens.FieldbyName('IDRESPONSAVEL').AsFloat := nRespNovo;
               //-------------------------------------------------------------------------
               FcdsSelBaixaBens.Post;
               //-------------------------------------------------------------------------
               // Gravação dos bens escravos do bem principal
               //-------------------------------------------------------------------------
               iTam := length(FcdsItensInvBens.FieldByName('IIBPLACA').AsString) - iDigMascPlaca;
               sPlacaBase := copy(FcdsItensInvBens.FieldByName('IIBPLACA').AsString, 1, iTam);
               _dMTBem.sqlBensEscravos.Prepare;
               _dMTBem.sqlBensEscravos.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
               _dMTBem.sqlBensEscravos.ParamByName('TAM').AsInteger := iTam;
               _dMTBem.sqlBensEscravos.ParamByName('PLACABASE').AsString := sPlacaBase;
               _dMTBem.sqlBensEscravos.ParamByName('PLACAMESTRE').AsFloat := FcdsItensInvBens.FieldByName('IIBPLACA').AsFloat;
               _cdsBensEscravos.Data := _dMTBem.sqlBensEscravos.Data;
               while not _cdsBensEscravos.EOF do
               begin
                  if length(_cdsBensEscravos.FieldByName('PLACA').AsString) = length(FcdsItensInvBens.FieldByName('IIBPLACA').AsString) then
                  begin
                     FcdsSelBaixaBens.Append;
                     FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat         := _cdsBensEscravos.FieldByName('IDBEM').AsFloat;
                     FcdsSelBaixaBens.FieldByName('IDPESSOA').AsFloat      := _cdsBensEscravos.FieldByName('IDPESSOA').AsFloat;
                     //-------------------------------------------------------------------
                     FcdsSelBaixaBens.FieldByName('IDCONJATUAL').AsFloat   := FcdsItensInvBens.FieldByName('IDCONJUNTO').AsFloat;
                     FcdsSelBaixaBens.FieldByName('IDGRUPATUAL').AsFloat   := FcdsItensInvBens.FieldByName('IDGRUPO').AsFloat;
                     FcdsSelBaixaBens.FieldByName('IDLOCALATUAL').AsFloat  := FcdsItensInvBens.FieldByName('IIBLOCALATUAL').AsFloat;
                     FcdsSelBaixaBens.FieldByName('IDRESPATUAL').AsFloat   := nRespAtual;
                     //-------------------------------------------------------------------
                     FcdsSelBaixaBens.FieldByName('IDCONJUNTO').AsFloat    := FcdsItensInvBens.FieldByName('IIBCONJUNTONOVO').AsFloat;
                     FcdsSelBaixaBens.FieldByName('IDGRUPO').AsFloat       := nGrupoNovo;
                     //-------------------------------------------------------------------
                     FcdsSelBaixaBens.FieldByName('IDLOCALIZACAO').AsFloat := FcdsItensInvBens.FieldByName('IIBLOCALNOVO').AsFloat;
                     FcdsSelBaixaBens.FieldByName('IDRESPONSAVEL').AsFloat := nRespNovo;
                     //-------------------------------------------------------------------
                     FcdsSelBaixaBens.Post;
                  end;
                  _cdsBensEscravos.Next;
               end;
               FcdsItensInvBens.Next;
            end;
            //----------------------------------------------------------------------------
            if not ApplyCds(FcdsSelBaixa,_dbSelBaixa,[],[]) then
               Raise Exception.Create(_dbSelBaixa.MessageInfo);

            if not ApplyCds(FcdsSelBaixaBens,_dbSelBaixaBens,[_dbSelBaixa.IdSelBaixa],[_dbSelBaixaBens.IdSelBaixa]) then
               Raise Exception.Create(_dbSelBaixaBens.MessageInfo);
            //----------------------------------------------------------------------------
            Fcds.Edit;
            Fcds.FieldByName('STATUS').AsInteger := 2;                                // Inventário Processado
            Fcds.FieldByName('IDSELBAIXA').AsFloat := _dbSelBaixa.IdSelBaixa.AsFloat; // Termo de Transf. Gerado.
            Fcds.Post;
            if not ApplyCds(Fcds,_dbInventarioBens,[],[]) then
               Raise Exception.Create(_dbInventarioBens.MessageInfo);
            //----------------------------------------------------------------------------
            Commit;
            Result := True;
         except
            On E : Exception Do
            begin
               Rollback;
               MessageInfo := E.Message;
               Result := False;
            end;
         end;
      end;
   finally
      _cdsBensEscravos.Free;
   end;
end;


// Andre Imakawa - SIG 96977 - Inicio
function TCtrlInventarioBens.Change_LF_to_CR(pArquivo: string): String;
Type
  TFileBuffer  = Array [ 0..16383 ] Of Byte;
Var
  Uf, CRf : File;
  FileBuffer, FileBuffer2 : ^TFileBuffer;
  BytesIn, BytesOut, i : Integer;
  sArquivo, sFileName, sPath: String;
Begin

  sFileName := extractfilename(pArquivo);
  sPath     := ExtractFilePath(pArquivo);
  sFileName := FormatDateTime('ddmmyyyy_hhnnss',Now) + '_' +sFileName;
  sArquivo  := sPath + sFileName;
  New (FileBuffer);
  AssignFile ( Uf, pArquivo );    { the input Unix file }
  Reset  ( Uf, 1 );                { i.e., "Record" size of 1 }

  Repeat
    BlockRead ( Uf,  FileBuffer^, SizeOf ( FileBuffer^ ), BytesIn );
    If BytesIn > 0 Then
    Begin
      For i := 1 To BytesIn Do
      If FileBuffer^ [i]  = Ord (13) Then
      begin
        Result := pArquivo;
        CloseFile ( Uf );
        If FileBuffer <> Nil Then
          Dispose (FileBuffer);
        Exit;
      end;
    End;
  Until BytesIn = 0;
  CloseFile ( Uf );
  If FileBuffer <> Nil Then
    Dispose (FileBuffer);

  New (FileBuffer2);
  AssignFile ( Uf, pArquivo );    { the input Unix file }
  Reset  ( Uf, 1 );                { i.e., "Record" size of 1 }
  AssignFile (CRf, sArquivo);
  Rewrite(CRf, 1 );                { Again "Record" size of 1 }

  Repeat
    BlockRead ( Uf,  FileBuffer2^, SizeOf ( FileBuffer2^ ), BytesIn );
    If BytesIn > 0 Then
       Begin
       For i := 1 To BytesIn Do
         If FileBuffer2^ [i]  = Ord (10) Then  { changing every lf tocr }
           FileBuffer2^ [i] := Ord (13);
         BlockWrite ( CRf, FileBuffer2^, BytesIn, BytesOut );
       If BytesIn <> BytesOut Then
          Begin
          CloseFile ( Uf );
          CloseFile ( CRf);
          End; {begin}
       End;
  Until BytesIn = 0;
  CloseFile ( Uf );
  CloseFile ( CRf);
  If FileBuffer <> Nil Then
     Dispose (FileBuffer2);
  Result := sArquivo;
End;
// Andre Imakawa - SIG 96977 - Fim
end.


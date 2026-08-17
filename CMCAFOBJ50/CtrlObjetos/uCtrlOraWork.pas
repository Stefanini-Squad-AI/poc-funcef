unit uCtrlOraWork;

interface

Uses DB, uCmDbObject, uCmControlObject, SysUtils, dbclient, Provider,
     uMidasUtil, uSistema, uCMTypes;

Type
   TCtrlOraWork = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;

   Private

   Public
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function ExecutaSQLText(sSQLText : String) : Boolean;
      function CommitSQLText : Boolean;
      function RollBackCommitSQLText : Boolean;
   end;

implementation

{ TCtrlAlmoxCAF }

constructor TCtrlAlmoxCAF.Create;
begin
   inherited;
   _dbBensPendentes   := TDBBensPendentes.Create(Self);
   _dbConjunto        := TDbConjunto.Create(Self);
   _dbRateioCustos    := TDbRateioCustos.Create(Self);

   FcdsConjunto       := TClientDataSet.Create(nil);
   FcdsRateioCustos   := TClientDataSet.Create(nil);
   FCdsBensPendentes  := TClientDataSet.Create(nil);

   ParamCAF           := TCtrlParamCAF.Create;
   Bem                := TCtrlBem.Create;
   Conjunto           := TCtrlConjunto.Create;
end;

destructor TCtrlAlmoxCAF.Destroy;
begin
   fCdsBensPendentes.Free;
   FcdsConjunto.Free;
   FcdsRateioCustos.Free;

   _dbBensPendentes.Free;
   _dbConjunto.Free;
   _dbRateioCustos.Free;

   Conjunto.Free;
   ParamCAF.Free;
   Bem.Free;
   inherited;
end;

procedure TCtrlAlmoxCAF.AfterInitialize;
begin
   inherited;
   ParamCAF.InitializeAs(Self);
   Bem.InitializeAs(Self);
   Conjunto.InitializeAs(Self);
end;

procedure TCtrlAlmoxCAF.DoChangeDataBase;
begin
   inherited;
   _dbBensPendentes.DataBaseName := DataBaseName;
   _dbConjunto.DataBaseName := DataBaseName;
   _dbRateioCustos.DataBaseName := DataBaseName;
end;

procedure TCtrlAlmoxCAF.SetcdsBensPendentes(const Value: TClientDataSet);
begin
   FcdsBensPendentes := Value;
end;

procedure TCtrlAlmoxCAF.SetcdsConjunto(const Value: TClientDataSet);
begin
  FcdsConjunto := Value;
end;

procedure TCtrlAlmoxCAF.SetcdsRateioCustos(const Value: TClientDataSet);
begin
  FcdsRateioCustos := Value;
end;
//========================================================================================
function TCtrlAlmoxCAF.ListarAlmoxCAF(nIdPessoa, nIdItensRecDev : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDBENSPENDENTES, IDPESSOA, IDITENSRECDEV, IDFORNSERV, IDMODULO, '  + #13 +
           '        IDGRUPO, IDCLASSEBEM, IDCONJUNTO, IDSITUACAO, CONTROLE, PLACA, '   + #13 +
           '        DESBEM, IDNOTA, COMPLNOTA, DTANOTA, DTAINCLUSAO, VALORG, NUMSERIE,'+ #13 +
           '        (0) AS QUANTIDADE '+ #13 +
           ' FROM BENSPENDENTES   '+ #13 +
           ' WHERE (IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdItensRecDev <> -1 then
      sSql := sSql + '   AND (IDITENSRECDEV = ' + floattostr(nIdItensRecDev) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;
//========================================================================================
function TCtrlAlmoxCAF.ListarBensPendentes(nIdPessoa, nIdItensRecDev : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDBENSPENDENTES, IDPESSOA, IDITENSRECDEV, IDFORNSERV, IDMODULO, '  + #13 +
           '        IDGRUPO, IDCLASSEBEM, IDCONJUNTO, IDSITUACAO, CONTROLE, PLACA, '   + #13 +
           '        DESBEM, IDNOTA, COMPLNOTA, DTANOTA, DTAINCLUSAO, VALORG, NUMSERIE '+ #13 +
           ' FROM BENSPENDENTES   '+ #13 +
           ' WHERE (IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdItensRecDev <> -1 then
      sSql := sSql + '   AND (IDITENSRECDEV = ' + floattostr(nIdItensRecDev) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;
//========================================================================================
// Função que executa a entrada de um item na pendencia de cadastramento do Ativo Fixo
//----------------------------------------------------------------------------------------
function TCtrlAlmoxCaf.ExecutaEntradaBensPendentes : Boolean;
Var
   iQtd           : Integer;
   nPlacaAtual    : Extended;
   sDigMascPlaca  : String;

begin
   try
      FcdsBensPendentes.First;
      while not FcdsBensPendentes.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Verifica se a Empresa Proprietária foi informada
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('IDPESSOA').IsNull then
         begin
            MessageInfo := 'Código da EMPRESA PROPRIETÁRIA Inválido!';
            Raise Exception.Create(MessageInfo);
         end else
         begin
            _cds.Data := GetDataPacket(' SELECT NOME '+
                                       ' FROM PESSOA '+
                                       ' WHERE (IDPESSOA = ' + FcdsBensPendentes.FieldbyName('IDPESSOA').AsString + ')');
            if _cds.isEmpty then
            begin
               MessageInfo := 'Código da EMPRESA PROPRIETÁRIA Inválido ou não cadastrado!';
               Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(FcdsBensPendentes.FieldByName('IDPESSOA').AsFloat) then
         begin
            MessageInfo := 'Parâmetros do Ativo Fixo inválidos para esta Empresa!';
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Validação dos parâmetros obrigatórios
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('QUANTIDADE').AsInteger <= 0 then
         begin
            MessageInfo := 'A quantidade de bens deve ser informada!';
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('IDITENSRECDEV').IsNull then
         begin
            MessageInfo := 'O campo de ligação entre o Almoxarifado e o Controle do Ativo Fixo não foi informado!';
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if not FcdsBensPendentes.FieldbyName('IDFORNSERV').IsNull then
         begin
            _cds.Data := GetDataPacket(' SELECT NOME '+
                                       ' FROM PESSOA '+
                                       ' WHERE (IDPESSOA = ' + FcdsBensPendentes.FieldbyName('IDFORNSERV').AsString + ')' );
            if _cds.isEmpty then
            begin
               MessageInfo := 'Código do FORNECEDOR Inválido ou não cadastrado!';
               Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('IDMODULO').IsNull then
         begin
            MessageInfo := 'Código do módulo CM inválido!';
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('IDGRUPO').IsNull then
         begin
            MessageInfo := 'Código do GRUPO CONTÁBIL do bem inválido!';
            Raise Exception.Create(MessageInfo);
         end else
         begin
            _cds.Data := GetDataPacket(' SELECT G.IDGRUPO, G.NOME, G.FLGSEMPLACA '+
                                       ' FROM PLANOGRUPO PG, '+
                                       '      GRUPO G '+
                                       ' WHERE (PG.IDPESSOA = ' + FcdsBensPendentes.FieldbyName('IDPESSOA').AsString + ')' +
                                       '   AND (PG.IDGRUPO  = ' + FcdsBensPendentes.FieldbyName('IDGRUPO').AsString + ')'  +
                                       '   AND (PG.IDGRUPO = G.IDGRUPO)');
            if _cds.IsEmpty then
            begin
               MessageInfo := 'Código do GRUPO CONTÁBIL do bem inexistente ou inválido!';
               Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            iFlgSemPlaca := _cds.FieldByName('FLGSEMPLACA').AsInteger;
         end;
         //-------------------------------------------------------------------------------
         if not FcdsBensPendentes.FieldbyName('PLACA').IsNull then
         begin
            if not Bem.PlacaUnica(FcdsBensPendentes.FieldbyName('IDPESSOA').AsFloat,
                                  FcdsBensPendentes.FieldbyName('PLACA').AsString) then
            begin
               MessageInfo := 'O número da PLACA DE TOMBAMENTO já foi alocado a outro bem!';
               Raise Exception.Create(MessageInfo);
            end;
         end else
            if iFlgSemPlaca = 0 then
            begin
               MessageInfo := 'O número da PLACA DE TOMBAMENTO deve ser fornecido para o Grupo Contábil informado!';
               Raise Exception.Create(MessageInfo);
            end;
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('IDCLASSEBEM').IsNull then
         begin
            MessageInfo := 'Código da CLASSE do bem inválido!';
            Raise Exception.Create(MessageInfo);
         end else
         begin
            _cds.Data := GetDataPacket(' SELECT IDCLASSEBEM ' +
                                       ' FROM CLASSEDEBEM ' +
                                       ' WHERE (IDCLASSEBEM = ' + FcdsBensPendentes.FieldbyName('IDCLASSEBEM').AsString + ')') ;
            if _cds.IsEmpty then
            begin
               MessageInfo := 'Código de CLASSE de bem inexistente ou inválido!';
               Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('IDCONJUNTO').IsNull then
         begin
            MessageInfo := 'Código do CONJUNTO do bem inválido!';
            Raise Exception.Create(MessageInfo);
         end else
         begin
            _cds.Data := GetDataPacket(' SELECT IDLOCALIZACAO, IDRESPONSAVEL, DESCCONJUNTO '+
                                       ' FROM CONJUNTO '+
                                       ' WHERE (IDPESSOA = '   + FcdsBensPendentes.FieldbyName('IDPESSOA').AsString + ')' +
                                       '   AND (IDCONJUNTO = ' + FcdsBensPendentes.FieldbyName('IDCONJUNTO').AsString + ')');
            if _cds.IsEmpty then
            begin
               MessageInfo := 'Código do CONJUNTO do bem inexistente ou inválido!';
               Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('CONTROLE').IsNull then
         begin
            MessageInfo := 'É obrigatório fornecer a Forma de Controle do bem!';
            Raise Exception.Create(MessageInfo);
         end else
            if not ((FcdsBensPendentes.FieldbyName('CONTROLE').AsString = 'T') or
                    (FcdsBensPendentes.FieldbyName('CONTROLE').AsString = 'F')) then
            begin
               MessageInfo := 'Código de controle inválido!';
               Raise Exception.Create(MessageInfo);
            end;
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('DESBEM').IsNull then
         begin
            MessageInfo := 'A descrição do Bem deve ser fornecida!';
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('IDNOTA').IsNull then
         begin
            MessageInfo := 'O número do documento de entrada não foi informado!';
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('DTANOTA').IsNull then
         begin
            MessageInfo := 'A data do documento de entrada não foi informado!';
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if FcdsBensPendentes.FieldbyName('DTAINCLUSAO').IsNull then
         begin
            MessageInfo := 'A data de entrada do bem na empresa não foi informado!';
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Complementa a placa com os digitos de subplaca
         //-------------------------------------------------------------------------------
         if not FcdsBensPendentes.FieldByName('PLACA').IsNull then
         begin
            nPlacaAtual := FcdsBensPendentes.FieldByName('PLACA').AsFloat;
            //----------------------------------------------------------------------------
            _cds.Data := GetDataPacket(' SELECT DIGMASCPLACA '+
                                       ' FROM PARAMETROSCAFMANUT '+
                                       ' WHERE (IDPESSOA = ' + FcdsBensPendentes.FieldbyName('IDPESSOA').AsString + ')');
            sDigMascPlaca := StringOfChar('0',_cds.FieldByName('DIGMASCPLACA').AsInteger);
            //----------------------------------------------------------------------------
            nPlacaAtual := strtofloat(floattostr(nPlacaAtual) + sDigMascPlaca);
            //----------------------------------------------------------------------------
            FcdsBensPendentes.Edit;
            FcdsBensPendentes.FieldByName('PLACA').AsFloat := nPlacaAtual;
            FcdsBensPendentes.Post;
         end else
         begin
            nPlacaAtual := 0;
         end;
         //===============================================================================
         // Gravação dos dados do bem na tabela BENSPENDENTES na quantidade informada
         //===============================================================================

         iQtd := 1;
         while iQtd <= FcdsBensPendentes.FieldByName('QUANTIDADE').AsInteger do
         begin
            _dbBensPendentes.IDITENSRECDEV.AsFloat  := FcdsBensPendentes.FieldByName('IDITENSRECDEV').AsFloat;
            _dbBensPendentes.IDPESSOA.AsFloat       := FcdsBensPendentes.FieldByName('IDPESSOA').AsFloat;
            _dbBensPendentes.CONTROLE.AsString      := FcdsBensPendentes.FieldByName('CONTROLE').AsString;
            _dbBensPendentes.COMPLNOTA.AsString     := FcdsBensPendentes.FieldByName('COMPLNOTA').AsString;
            _dbBensPendentes.DTANOTA.AsDateTime     := FcdsBensPendentes.FieldByName('DTANOTA').AsDateTime;
            _dbBensPendentes.DTAINCLUSAO.AsDateTime := FcdsBensPendentes.FieldByName('DTAINCLUSAO').AsDateTime;
            _dbBensPendentes.DESBEM.AsString        := FcdsBensPendentes.FieldByName('DESBEM').AsString;
            _dbBensPendentes.IDNOTA.AsString        := FcdsBensPendentes.FieldByName('IDNOTA').AsString;
            _dbBensPendentes.IDMODULO.AsFloat       := FcdsBensPendentes.FieldByName('IDMODULO').AsFloat;
            _dbBensPendentes.IDGRUPO.AsFloat        := FcdsBensPendentes.FieldByName('IDGRUPO').AsFloat;
            _dbBensPendentes.IDFORNSERV.AsFloat     := FcdsBensPendentes.FieldByName('IDFORNSERV').AsFloat;
            _dbBensPendentes.IDCONJUNTO.AsFloat     := FcdsBensPendentes.FieldByName('IDCONJUNTO').AsFloat;
            _dbBensPendentes.IDCLASSEBEM.AsFloat    := FcdsBensPendentes.FieldByName('IDCLASSEBEM').AsFloat;
            _dbBensPendentes.VALORG.AsFloat         := FcdsBensPendentes.FieldByName('VALORG').AsFloat;
            _dbBensPendentes.PLACA.AsFloat          := FcdsBensPendentes.FieldByName('PLACA').AsFloat;
            //----------------------------------------------------------------------------
            if not _dbBensPendentes.Insert then
               Raise Exception.Create(_dbBensPendentes.MessageInfo);
            //----------------------------------------------------------------------------
            iQtd := iQtd + 1;
            //----------------------------------------------------------------------------
            if iQtd <= FcdsBensPendentes.FieldbyName('QUANTIDADE').AsInteger then
            begin
               //-------------------------------------------------------------------------
               // Gera o Número da Placa para o próximo pré-bem
               //-------------------------------------------------------------------------
               if nPlacaAtual <> 0 then
               begin
                  FcdsBensPendentes.Edit;
                  FcdsBensPendentes.FieldbyName('PLACA').AsFloat := GeraProxPlacaTomb(FcdsBensPendentes.FieldbyName('IDPESSOA').AsFloat,
                                                                                      FcdsBensPendentes.FieldbyName('IDGRUPO').AsFloat,
                                                                                      FcdsBensPendentes.FieldbyName('IDCLASSEBEM').AsFloat,
                                                                                      FcdsBensPendentes.FieldbyName('PLACA').AsFloat);
                  FcdsBensPendentes.Post;
               end;
               //-------------------------------------------------------------------------
               // Replicar o conjunto para o próximo pré-bem se o método do
               // conjunto for Tipo 1
               //-------------------------------------------------------------------------
               if ParamCAF.TIPOCONJUNTO = 0 then
               begin
                  //----------------------------------------------------------------------
                  // Replicar o Conjunto
                  //----------------------------------------------------------------------
                  _cds.Data := Conjunto.ListaConjunto(FcdsBensPendentes.FieldbyName('IDPESSOA').AsFloat,
                                                      FcdsBensPendentes.FieldbyName('IDCONJUNTO').AsFloat);
                  //----------------------------------------------------------------------
                  _dbConjunto.IDPESSOA.AsFloat      := _cds.FieldByName('IDPESSOA').AsFloat;
                  _dbConjunto.IDLOCALIZACAO.AsFloat := _cds.FieldByName('IDLOCALIZACAO').AsFloat;
                  _dbConjunto.IDRESPONSAVEL.AsFloat := _cds.FieldByName('IDRESPONSAVEL').AsFloat;
                  _dbConjunto.DESCCONJUNTO.AsString := _cds.FieldByName('DESCCONJUNTO').AsString;
                  _dbConjunto.DISPONIVEL.AsInteger  := _cds.FieldByName('DISPONIVEL').AsInteger;
                  _dbConjunto.ALUGADO.AsInteger     := _cds.FieldByName('ALUGADO').AsInteger;
                  //----------------------------------------------------------------------
                  if not _dbConjunto.Insert then
                     Raise Exception.Create(_dbConjunto.MessageInfo);
                  //----------------------------------------------------------------------
                  // Replicar o Rateio de Custos
                  //----------------------------------------------------------------------
                  _cds.Data := Conjunto.ListaRateioCustos(_dbConjunto.FieldByName('IDPESSOA').AsFloat,
                                                          _dbConjunto.FieldByName('IDCONJUNTO').AsFloat);
                  while not _cds.Eof do
                  begin
                     _dbRateioCustos.IDCONJUNTO.AsFloat      := _cds.FieldByName('IDCONJUNTO').AsFloat;
                     _dbRateioCustos.DTAINICIO.AsDateTime    := _cds.FieldByName('DTAINICIO').AsDateTime;
                     _dbRateioCustos.IDEMPRESA.AsFloat       := _cds.FieldByName('IDEMPRESA').AsFloat;
                     _dbRateioCustos.CODCENTROCUSTO.AsString := _cds.FieldByName('CODCENTROCUSTO').AsString;
                     _dbRateioCustos.PARTICIPACAO.AsFloat    := _cds.FieldByName('PARTICIPACAO').AsFloat;
                     //--------------------------------------------------------------------
                     if not _dbRateioCustos.Insert then
                        Raise Exception.Create(_dbConjunto.MessageInfo);
                     //--------------------------------------------------------------------
                     _cds.Next;
                  end;
                  //----------------------------------------------------------------------
                  FcdsBensPendentes.Edit;
                  FcdsBensPendentes.FieldByName('IDCONJUNTO').AsFloat := _dbConjunto.IDCONJUNTO.AsFloat;
                  FcdsBensPendentes.Post;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         FcdsBensPendentes.Next;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que estorna a entrada de um item na pendencia de cadastramento do Ativo Fixo,
// devido a exclusão do documento de entrada.
//----------------------------------------------------------------------------------------
//
// nIdItensRecDev  : Link do Almoxarifado com o Controle do Ativo Fixo
//----------------------------------------------------------------------------------------
function TCtrlAlmoxCaf.EstornaEntradaBensPendentes(nIdPessoa, nIdItensRecDev : Extended) : Boolean;
Var
   sSql : string;

begin
   try
      //----------------------------------------------------------------------------------
      // Verifica se Link foi informado
      //----------------------------------------------------------------------------------
      if nIdItensRecDev <= 0 then
      begin
         MessageInfo := 'O campo de ligação entre o Almoxarifado e o Controle do Ativo Fixo não foi informado!';
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Remove os itens do documento informado ainda não registrados como bens
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM BENSPENDENTES ' +
              ' WHERE (IDITENSRECDEV = '+ FloatToStr(nIDITENSRECDEV) + ')' +
              '   AND (IDPESSOA      = '+ FloatToStr(nIdPessoa) + ')';
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      // Remove os itens do documento informado já registrados como bens
      //----------------------------------------------------------------------------------
      _cds.Data := GetDataPacket(' SELECT IDMODULO, IDPESSOA, IDBEM, DTAINCLUSAO ' +
                                 ' FROM BEM ' +
                                 ' WHERE (IDITENSRECDEV = ' + FloatToStr(nIdItensRecDev)  + ')' +
                                 '   AND (IDPESSOA      = ' + FloatToStr(nIdPessoa) + ')' );
      while not _cds.EOF do
      begin
         if not Bem.EstornaEntrada(_cds.FieldByName('IDMODULO').AsInteger,
                                   _cds.FieldByName('IDPESSOA').AsInteger,
                                   _cds.FieldByName('IDBEM').AsInteger,
                                   _cds.FieldByName('DTAINCLUSAO').AsDateTime,
                                   _cds.FieldByName('DTAINCLUSAO').AsDateTime, 0) then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         _cds.Next;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
function TCtrlAlmoxCAF.GeraProxPlacaTomb(nEmpresa, nGrupo, nClasse, nPlacaAtual : Extended) : Extended;
var
   sMascaraEmpresa,
   sCodPlaca, sClasse, sGrupo,
   sProximoCodigo, sProxPlaca,
   sDigMascPlaca, sSql           : String;
   iAux                          : Integer;
   bEdPlaca, bOk                 : boolean;

begin
   try
      //----------------------------------------------------------------------------------
      // Recarga dos parametros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresa) then
      begin
         MessageInfo := 'Parâmetros do Ativo Fixo inválidos para esta Empresa!';
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      bEdPlaca := ParamCAF.EDITACODBEM = 1;
      //----------------------------------------------------------------------------------
      case ParamCAF.SEQBEMEMP of
         0 : sCodPlaca := 'E'; {sequencial por Empresa}
         1 : sCodPlaca := 'G'; {sequencial por Grupo}
         2 : sCodPlaca := 'C'; {sequencial por Classe}
         3 : sCodPlaca := 'S'; {sequencial Puro}
      end;
      //----------------------------------------------------------------------------------
      sProxPlaca := '';
      bOk := False;
      while not bOk do
      begin
         if bEdPlaca then
         begin
            //----------------------------------------------------------------------------
            // Calcula o Numero da Próxima Placa de Patrimônio
            //----------------------------------------------------------------------------
            if ParamCAF.PROXIMAPLACA <= 0 then
            begin
               sProximoCodigo := '1';
            end else
            begin
               sProximoCodigo := FloatToStr(ParamCAF.PROXIMAPLACA);
            end;
            sDigMascPlaca := StringOfChar('0',ParamCAF.DIGMASCPLACA);
            //----------------------------------------------------------------------------
            sSql := ' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' + floattostr(strtofloat(sProximoCodigo) + 1) +
                    ' WHERE (IDPESSOA = ' + floattostr(nEmpresa) + ')';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            // Recarga dos parametros do sistema após a atualização
            //----------------------------------------------------------------------------
            if not ParamCAF.CarregaProp(nEmpresa) then
            begin
               MessageInfo := 'Parâmetros do Ativo Fixo inválidos para esta Empresa!';
               Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Calculo por GRUPO
            //----------------------------------------------------------------------------
            if sCodPlaca = 'G' then
            begin
               _cds.Data := GetDataPacket(' SELECT CLASSE FROM GRUPO ' +
                                          ' WHERE (IDGRUPO  = ' + floattostr(nGrupo) + ') ');
               sGrupo := trim(_cds.FieldByName('CLASSE').AsString);
               //-------------------------------------------------------------------------
               sProxPlaca := sGrupo + Bem.ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo por CLASSE
            //----------------------------------------------------------------------------
            if sCodPlaca = 'C' then
            begin
               _cds.Data := GetDataPacket(' SELECT CODHIERARQ FROM CLASSEDEBEM '+
                                          ' WHERE (IDCLASSEBEM  = ' + floattostr(nClasse) + ') ');
               sClasse := trim(_cds.FieldByName('CODHIERARQ').AsString);
               //-------------------------------------------------------------------------
               sProxPlaca := sClasse + Bem.ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo por EMPRESA
            //----------------------------------------------------------------------------
            if sCodPlaca = 'E' then
            begin
               sMascaraEmpresa := '';
               for iAux := 1 to length(trim(floattostr(nEmpresa))) do
               begin
                  sMascaraEmpresa := sMascaraEmpresa + '9';
               end;
               //-------------------------------------------------------------------------
               sProxPlaca := Bem.ComplZeros(copy(floattostr(nPlacaAtual),1,length(sMascaraEmpresa))+
                                            sProximoCodigo,(Length(sMascaraEmpresa) + 9)) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo SEQUENCIAL
            //----------------------------------------------------------------------------
            if sCodPlaca = 'S' then
            begin
               sProxPlaca := sProximoCodigo + sDigMascPlaca;
            end;
         end else
         begin
            sDigMascPlaca := StringOfChar('0',ParamCAF.DIGMASCPLACA);
            //----------------------------------------------------------------------------
            if length(sDigMascPlaca) > 0 then
            begin
               sProxPlaca := copy(FloatToStr(nPlacaAtual),1,
                                  length(FloatToStr(nPlacaAtual))-length(sDigMascPlaca));
               sProxPlaca := FloatToStr(StrToFloat(sProxPlaca) + 1) + sDigMascPlaca;
            end else
            begin
               sProxPlaca := FloatToStr(nPlacaAtual + 1);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Confere se a placa calculada já existe
         //-------------------------------------------------------------------------------
         bOk := Bem.PlacaUnica(nEmpresa, sProxPlaca);
      end;
      Result := StrToFloat(sProxPlaca);
   except
      On E : Exception Do
      begin
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
function TCtrlAlmoxCAF.GeraPlacaTomb(nEmpresa, nGrupo, nClasse : Extended) : Extended;
var
   sMascaraEmpresa,
   sCodPlaca, sClasse, sGrupo,
   sProximoCodigo, sProxPlaca,
   sDigMascPlaca, sSql           : String;
   iAux                          : Integer;
   bEdPlaca, bOk                 : boolean;

begin
   try
      //----------------------------------------------------------------------------------
      // Recarga dos parametros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresa) then
      begin
         MessageInfo := 'Parâmetros do Ativo Fixo inválidos para esta Empresa!';
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      bEdPlaca := ParamCAF.EDITACODBEM = 1;
      //----------------------------------------------------------------------------------
      case ParamCAF.SEQBEMEMP of
         0 : sCodPlaca := 'E'; {sequencial por Empresa}
         1 : sCodPlaca := 'G'; {sequencial por Grupo}
         2 : sCodPlaca := 'C'; {sequencial por Classe}
         3 : sCodPlaca := 'S'; {sequencial Puro}
      end;
      //----------------------------------------------------------------------------------
      sProxPlaca := '';
      bOk := False;
      while not bOk do
      begin
         if bEdPlaca then
         begin
            //----------------------------------------------------------------------------
            // Calcula o Numero da Próxima Placa de Patrimônio
            //----------------------------------------------------------------------------
            if ParamCAF.PROXIMAPLACA <= 0 then
            begin
               sProximoCodigo := '1';
            end else
            begin
               sProximoCodigo := FloatToStr(ParamCAF.PROXIMAPLACA);
            end;
            sDigMascPlaca := StringOfChar('0',ParamCAF.DIGMASCPLACA);
            //----------------------------------------------------------------------------
            sSql := ' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' + floattostr(strtofloat(sProximoCodigo) + 1) +
                    ' WHERE (IDPESSOA = ' + floattostr(nEmpresa) + ')';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            // Recarga dos parametros do sistema após a atualização
            //----------------------------------------------------------------------------
            if not ParamCAF.CarregaProp(nEmpresa) then
            begin
               MessageInfo := 'Parâmetros do Ativo Fixo inválidos para esta Empresa!';
               Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Calculo por GRUPO
            //----------------------------------------------------------------------------
            if sCodPlaca = 'G' then
            begin
               _cds.Data := GetDataPacket(' SELECT CLASSE FROM GRUPO ' +
                                          ' WHERE (IDGRUPO  = ' + floattostr(nGrupo) + ') ');
               sGrupo := trim(_cds.FieldByName('CLASSE').AsString);
               //-------------------------------------------------------------------------
               sProxPlaca := sGrupo + Bem.ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo por CLASSE
            //----------------------------------------------------------------------------
            if sCodPlaca = 'C' then
            begin
               _cds.Data := GetDataPacket(' SELECT CODHIERARQ FROM CLASSEDEBEM '+
                                          ' WHERE (IDCLASSEBEM  = ' + floattostr(nClasse) + ') ');
               sClasse := trim(_cds.FieldByName('CODHIERARQ').AsString);
               //-------------------------------------------------------------------------
               sProxPlaca := sClasse + Bem.ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo por EMPRESA
            //----------------------------------------------------------------------------
            if sCodPlaca = 'E' then
            begin
               sMascaraEmpresa := '';
               for iAux := 1 to length(trim(floattostr(nEmpresa))) do
               begin
                  sMascaraEmpresa := sMascaraEmpresa + '9';
               end;
               //-------------------------------------------------------------------------
               sProxPlaca := FloatToStr(nEmpresa) + Bem.ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo SEQUENCIAL
            //----------------------------------------------------------------------------
            if sCodPlaca = 'S' then
            begin
               sProxPlaca := sProximoCodigo + sDigMascPlaca;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Confere se a placa calculada já existe
         //-------------------------------------------------------------------------------
         bOk := Bem.PlacaUnica(nEmpresa, sProxPlaca);
      end;
      result := StrToFloat(sProxPlaca);
   except
      On E : Exception Do
      begin
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;

end.


unit uCtrlHistBemxDep;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{------------------------------------------------------------------------------
Rotina...........: VerificaAltPosterior, AplicaOperacao
Nº SOL...........: 154197
Nº KINTANA.......: 1170381
Data da Alteração: 16/03/2011
Responsável......: Thaise Amaral Martins
Descrição........: Criação da função VerificaAltPosterior para comparar as datas de movimentação;
                   Alteração da AplicaOperacao, passando a data correta na ExecutaDepreVida, pois
                   a data tem que ser sempre o dia 1º do mês que se está inserindo.
------------------------------------------------------------------------------}

//------------------------------------------------------------------------------
//Rotina...........:  -
//Nº SOL...........: 142551
//Nº KINTANA.......: 911676
//Data da Alteração: 06/12/2010
//Responsável......: Helen V. Bianchi
//Descrição........: Criação Ctrl
//------------------------------------------------------------------------------

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,SysUtils, dbclient,
     Provider, uDBHistBemxDep,uMidasUtil,uCtrlBem,
     uCtrlParamCAF,uCMClientDataSet, uDBBemxDep,
     uDBSelDepreciacao,uDBSelDepreciacaoBens,dMTBem, uDBBem, Usistema,
     uDbHistAcrescValorxDep,uDbReavalxDep,uDbAcrescValorxDep,
     uCtrlMovAcrescimoValor, uCtrlFechamento, uCtrlPadroes;

Type
   TCtrlHistBemxDep = class(TCmControlObject)
   Protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;
   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbBem         : TDBBem;
      _dbHistBemxDep : TDbHistBemxDep;
      _dbBemxDep     : TDBBemxDep;
      _dbSelDepreciacao      : TDBSelDepreciacao;
      _dbSelDepreciacaoBens  : TDBSelDepreciacaoBens;
      _dbHistAcrescValorxDep : TDbHistAcrescValorxDep;
      _dbAcrescValorxDep     : TDBAcrescValorxDep;

      _dMTBem                : tdtmMTBem;
      Bem         : TCtrlBem;
      ParamCAF    : TCtrlParamCAF;
      AcrescimoValor : TCtrlMovAcrescimoValor;
      

      FcdsBemxDep: TClientDataSet;
      FcdsHistBemxDep: TClientDataSet;
      Fcds: TClientDataSet;
      FcdsSelDepreciacaoBens: TClientDataSet;
      FcdsSelDepreciacao: TClientDataSet;
      FcdsBem: TCMClientDataSet;
      FcdsSelBens: TClientDataSet;
      FcdsSelDepreciacaoBens_Alter: TClientDataSet;
      FcdsConsReavalxDep : TClientDataSet;
      FcdsHistAcrescValorxDep : TClientDataSet;
      FcdsAcrescValorxDep     : TClientDataSet;
      FcdsBemxMoeda       : TClientDataSet;
      FcdsHistReavalxDep : TClientDataSet;
      //----------------------------------------------------------------------------------
      // Barra de Progresso
      //----------------------------------------------------------------------------------
      iPrgBarPos: Integer;
      iPrgBarMax: Integer;
      sPrgBarMsg: String;
      Soperacao : String;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsSelDepreciacaoBens(const Value: TClientDataSet);
      procedure SetcdsHistBemxDep(const Value: TClientDataSet);
      procedure SetcdsSelBens(const Value: TClientDataSet);
      procedure SetcdsSelDepreciacaoBens_Alter(const Value: TClientDataSet);
      procedure SetcdsConsReavalxDep(const Value: TClientDataSet);
      procedure SetcdsHistAcrescValorxDep(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxDep(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsHistReavalxDep(const Value: TClientDataSet);
      procedure VoltaDepreciacao();
      function CMTranslate(sIgor : String) : String;
   Public

      FListaSelDepreciacao: string;
      property cds : TClientDataSet read Fcds write Setcds;
      property cdsSelDepreciacaoBens : TClientDataSet read FcdsSelDepreciacaoBens write SetcdsSelDepreciacaoBens;
      property cdsHistBemxDep : TClientDataSet read FcdsHistBemxDep write SetcdsHistBemxDep;
      property cdsSelBens : TClientDataSet read FcdsSelBens write SetcdsSelBens;
      property cdsSelDepreciacaoBens_Alter : TClientDataSet read FcdsSelDepreciacaoBens_Alter write SetcdsSelDepreciacaoBens_Alter;
      property cdsConsReavalxDep : TClientDataSet read FcdsConsReavalxDep write SetcdsConsReavalxDep;  
      property cdsHistAcrescValorxDep : TClientDataSet read FcdsHistAcrescValorxDep write SetcdsHistAcrescValorxDep;
      property cdsAcrescValorxDep : TClientDataSet read FcdsAcrescValorxDep write SetcdsAcrescValorxDep;
      property cdsBemxMoeda : TClientDataSet read FcdsBemxMoeda write SetcdsBemxMoeda;
      
      property cdsHistReavalxDep : TClientDataSet read FcdsHistReavalxDep write SetcdsHistReavalxDep;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;

      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function Procurar(nDataVigencia : Extended) : OleVariant;
      function ListaHistAcrescValorxDep(sClausula : String ) : OleVariant;
      function ListaHistReavalxDep(sClausula : String ) : OleVariant;
      function ListaHistBemxDep(sClausula : String ) : OleVariant;
      function ListaBemxDep(sClausula : String ) : OleVariant;
      function ListaBemxDep2(sClausula : String ) : OleVariant;
      function ListaSelDepreBens(nIdPessoa, nIdSelDepreciacao: Extended): OleVariant;
      function ListaSelDepre(nIdPessoa, nIdSelDepreciacao: Extended): OleVariant;
      function ListaSelDepreBens_Bens(nIdPessoa, nIdSelDepreciacao: Extended): OleVariant;
      function ListaConsRealValXDep(nIdPessoa,  nIdBem : Extended): OleVariant;
      function ListaAcrescValorxDep(nIdPessoa,  nIdBem : Extended): OleVariant;
      //----------------------------------------------------------------------------------
      function AplicaDepreciacao(nModulo, nEmpresaProp, nUsuario,nBem : Extended;
                               dDataMov: TDateTime; nTaxaDep: Extended;
                               iVidaUtil: Integer;dDataRetr: TDateTime) : Boolean;
      function ExecutaDepreVida(nModulo, nEmpresaProp, nUsuario,nTaxaDep, nSelDepreciacao: Extended;
                                iVidaUtil: Integer; dDataMov,dDataRetr : TDateTime) : Boolean;
      function VerificaCodigoEm(St, Comparado: string; Separador: char): integer;
      procedure ExtraiString(var Str, StrAtual: string; Separador: string);
      function VerificaAltPosterior(nEmpresaProp, nBem: Extended; dDataMov: TDateTime;
                                    Desbem, Placa: String): Boolean;

      //----------------------------------------------------------------------------------
   end;

implementation

{ TCtrlHistBemxDep}
function TCtrlHistBemxDep.VerificaCodigoEm(St, Comparado: string; Separador: char): integer;
var
  AuxSt, AtualSt: string;
begin
  Result := -1;
  if (Trim(St) <> '') and (Trim(Comparado) <> '') and (Trim(Separador) <> '') then
  begin
    Result  := 0;
    AuxSt   := St;
    AtualSt := St;
    repeat
      ExtraiString(AuxSt, AtualSt, Separador);

      if (AtualSt = Comparado) then
      begin
        Result := 1;
        break;
      end;
    until (AuxSt = '');
  end;
end;

function TCtrlHistBemxDep.ExecutaDepreVida(nModulo, nEmpresaProp, nUsuario,nTaxaDep, nSelDepreciacao: Extended;
                                           iVidaUtil: Integer; dDataMov,dDataRetr : TDateTime)  : Boolean;
var  bTransacao : Boolean;   sSql :String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaDepreVida(nModulo, nEmpresaProp, nUsuario,nTaxaDep,
                                                      nSelDepreciacao,iVidaUtil,dDataMov,dDataRetr);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         bTransacao := True;
         //-------------------------------------------------------------------------------
         bTransacao := Self.OpenTransaction;
         Self.OpenTransaction := False;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Processa as Depreciações
         //-------------------------------------------------------------------------------
         if (Soperacao = 'E')  then
         begin
             FcdsSelDepreciacaoBens.First;
             FListaSelDepreciacao := '';
             while not FcdsSelDepreciacaoBens.eof do
             begin
                   FListaSelDepreciacao := FcdsSelDepreciacaoBens.FieldByName('IDBEM').asString + ',' +FListaSelDepreciacao ;
                   FcdsSelDepreciacaoBens.next;
             end;
             FcdsSelDepreciacaoBens_Alter.First;
             while not FcdsSelDepreciacaoBens_Alter.eof do
             begin
                 if not (VerificaCodigoEm(FListaSelDepreciacao, FcdsSelDepreciacaoBens_Alter.FieldByName('IDBEM').AsString,',') = 1) then
                 begin
                    FcdsBemxDep.Data             := ListaBemxDep2(' WHERE IDBEM = ' + FcdsSelDepreciacaoBens_Alter.FieldByName('IDBEM').AsString);
                    FcdsHistBemxDep.Data         := ListaHistBemxDep(' IDBEM = ' + FcdsSelDepreciacaoBens_Alter.FieldByName('IDBEM').AsString );


                    VoltaDepreciacao;
                 end;
                 FcdsSelDepreciacaoBens_Alter.next   ;
             end;
         end;
         FcdsSelDepreciacaoBens.First;
         while not FcdsSelDepreciacaoBens.EOF do
         begin
            //----------------------------------------------------------------------------
            if not AplicaDepreciacao(nModulo, nEmpresaProp, nUsuario,
                             FcdsSelDepreciacaoBens.FieldByName('IDBEM').AsInteger,
                             dDataMov,nTaxaDep,iVidaUtil,dDataRetr) then
               Raise Exception.Create(MessageInfo + #13 + #13 + 'na Depreciação do bem ' +
                                      FcdsSelDepreciacaoBens.FieldByName('PLACA').AsString + ' - ' +
                                      FcdsSelDepreciacaoBens.FieldByName('DESBEM').AsString);
            //----------------------------------------------------------------------------
            FcdsSelDepreciacaoBens.Next;
         end;
         //-------------------------------------------------------------------------------
         Self.OpenTransaction := bTransacao;
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception do
         begin
            Self.OpenTransaction := bTransacao;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;


end;
procedure TCtrlHistBemxDep.ExtraiString(var Str, StrAtual: string; Separador: string);
var
  iPos: integer;
begin
  iPos := Pos(Separador, Str);
  if (iPos > 0) then
  begin
    StrAtual := Copy(Str, 1, iPos-1);
    Delete(Str, 1, iPos + Length(Separador)-1);
  end
  else
  begin
    StrAtual := Str;
    Str := '';
  end;
end;

function TCtrlHistBemxDep.AplicaDepreciacao(nModulo, nEmpresaProp, nUsuario,nbem: Extended;
                                          dDataMov: TDateTime; nTaxaDep: Extended;
                                          iVidaUtil: Integer;dDataRetr: TDateTime) : Boolean;
var
   dDataUltMov, dDataUltDep, dDataInicioDep, dDataFimDep : TDateTime;
   nUltTaxaDep, nUltVidaUtil, nAcrescTaxa , codSel : Extended;
   sSql : String;
   _cdsCodigo : TClientDataSet;
begin
   try
       //-------------------------------------------------------------------------------
       // Posiciona a Tabela BEM
       //-------------------------------------------------------------------------------
       if FcdsBem.Active then
          FcdsBem.close;
       FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
       if FcdsBem.IsEmpty then
          Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
       //-------------------------------------------------------------------------------
       // Valida os Parâmetros obrigatórios para reavaliação de bens
       //-------------------------------------------------------------------------------
       if nModulo <= 0 then
          Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
       else
          if nModulo <> FcdsBem.FieldByName('IDMODULO').AsFloat then
             Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipulá-lo'));
       //-------------------------------------------------------------------------------
       if nEmpresaProp <= 0 then
          Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!'))
       else
          if nEmpresaProp <> FcdsBem.FieldByName('IDPESSOA').AsFloat then
             Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
       //-------------------------------------------------------------------------------
       if FcdsBem.FieldByName('CONTROLE').AsString = 'F' then
       begin
          MessageInfo := CMTranslate('Bem em Controle Físico!');
          Raise Exception.Create(MessageInfo);
       end else
       if FcdsBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
       begin
          MessageInfo := CMTranslate('Bem em Saída Temporária!');
          Raise Exception.Create(MessageInfo);
       end else
       if FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
       begin
          MessageInfo := CMTranslate('Bem Baixado!');
          Raise Exception.Create(MessageInfo);
       end;
       //-------------------------------------------------------------------------------
       // Carga dos parâmetros do sistema
       //-------------------------------------------------------------------------------
       if not ParamCAF.CarregaProp(nEmpresaProp) then
       begin
          MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
          Raise Exception.Create(MessageInfo);
       end;
       //-------------------------------------------------------------------------------
       // Verifica se a data da movimentação é válida
       //-------------------------------------------------------------------------------
       if  (Soperacao <> '') then
       begin
           if  (Soperacao <> 'S') then
           begin
               if not Bem.VerificaPeriodoCAF(nEmpresaProp, nBem,
                                             FcdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                             '08', dDataMov, dDataUltMov, dDataUltDep) then
                  Raise Exception.Create(Bem.MessageInfo);
           end;
       end;
       //----------------------------------------------------------------------------------
       FcdsBemxDep.Data        := ListaBemxDep2(' WHERE IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString);
       FcdsHistBemxDep.Data    := ListaHistBemxDep(' IDBEM = ' + FcdsSelDepreciacaoBens.FieldByName('IDBEM').AsString );

       FcdsHistAcrescValorxDep.Data := ListaHistAcrescValorxDep(' IDSELDEPRECIACAO = ' + FloatToStr(FcdsSelDepreciacaoBens.FieldByName('IDSELDEPRECIACAO').asFloat) );
       FcdsAcrescValorxDep.Data     := ListaAcrescValorxDep(FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                      FcdsBem.FieldByName('IDBEM').AsFloat );
       if not FcdsAcrescValorxDep.eof then
          FcdsAcrescValorxDep.First;

       FcdsConsReavalxDep.Data     := ListaConsRealValXDep(FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                      FcdsBem.FieldByName('IDBEM').AsFloat );


       if (Soperacao <> 'I') and (not FcdsHistBemxDep.eof) then
       begin
            VoltaDepreciacao;
       end;
       if (Soperacao <> 'S')  then
       begin
           if (Soperacao <> '') then
           begin
               FcdsHistBemxDep.Append;
               FcdsHistBemxDep.FieldByName('VIDAUTIL').AsInteger      := FcdsBemxDep.FieldByName('VIDAUTIL').AsInteger;
               FcdsHistBemxDep.FieldByName('USERINCLUSAO').AsString   := FcdsBemxDep.FieldByName('TRGUSERINCLUSAO').AsString;
               FcdsHistBemxDep.FieldByName('DTINCLUSAO').asDateTime   := FcdsBemxDep.FieldByName('TRGDTINCLUSAO').asDateTime ;
               FcdsHistBemxDep.FieldByName('TAXADEP').AsFloat         := FcdsBemxDep.FieldByName('TAXADEP').AsFloat;
               FcdsHistBemxDep.FieldByName('MOECODIGO').Asfloat       := FcdsBemxDep.FieldByName('MOECODIGO').AsFloat;
               FcdsHistBemxDep.FieldByName('IDPESSOA').AsInteger      := FcdsBemxDep.FieldByName('IDPESSOA').AsInteger;
               FcdsHistBemxDep.FieldByName('IDBEMXDEP').AsInteger     := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
               FcdsHistBemxDep.FieldByName('IDBEM').AsInteger         := FcdsBemxDep.FieldByName('IDBEM').AsInteger;
               FcdsHistBemxDep.FieldByName('FLGDEPSUSPENSA').AsInteger:= FcdsBemxDep.FieldByName('FLGDEPSUSPENSA').AsInteger;
               FcdsHistBemxDep.FieldByName('FLGDEPREC').AsFloat       := FcdsBemxDep.FieldByName('FLGDEPREC').AsFloat;
               FcdsHistBemxDep.FieldByName('DEPLANC').AsFloat         := FcdsBemxDep.FieldByName('DEPLANC').AsFloat;
               FcdsHistBemxDep.FieldByName('DATAVIGENCIA').AsDateTime := dDataMov;
               if FcdsBemxDep.FieldByName('DATAULTDEP').AsString <> '' then
                  FcdsHistBemxDep.FieldByName('DATAULTDEP').AsDateTime   := FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime;
               if FcdsBemxDep.FieldByName('DATAULTCM').AsString <> '' then
                  FcdsHistBemxDep.FieldByName('DATAULTCM').AsDateTime    := FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime;
               if FcdsBemxDep.FieldByName('DATAINICIODEP').AsString <> '' then
                  FcdsHistBemxDep.FieldByName('DATAINICIODEP').AsDateTime:= FcdsBemxDep.FieldByName('DATAINICIODEP').AsDateTime;
               if FcdsBemxDep.FieldByName('DATAFIMDEP').AsString <> '' then
                  FcdsHistBemxDep.FieldByName('DATAFIMDEP').AsDateTime   := FcdsBemxDep.FieldByName('DATAFIMDEP').AsDateTime;
               FcdsHistBemxDep.FieldByName('CMDEP').AsFloat           := FcdsBemxDep.FieldByName('CMDEP').AsFloat;
               FcdsHistBemxDep.post;

               if not ApplyCds(FcdsHistBemxDep,_dbHistBemxDep,[],[]) then
                  Raise Exception.Create(_dbHistBemxDep.MessageInfo);

               FcdsBemxDep.Delete;
               if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
                  Raise Exception.Create(_dbBemxDep.MessageInfo);
               FcdsBemxDep.Append;
               FcdsBemxDep.FieldByName('VIDAUTIL').AsInteger      := iVidaUtil;
               FcdsBemxDep.FieldByName('TAXADEP').AsFloat         := nTaxaDep;
               FcdsBemxDep.FieldByName('MOECODIGO').Asfloat       := FcdsHistBemxDep.FieldByName('MOECODIGO').Asfloat ;
               FcdsBemxDep.FieldByName('IDPESSOA').AsInteger      := FcdsHistBemxDep.FieldByName('IDPESSOA').AsInteger;
               FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger     := FcdsHistBemxDep.FieldByName('IDBEMXDEP').AsInteger;
               FcdsBemxDep.FieldByName('IDBEM').AsInteger         := FcdsHistBemxDep.FieldByName('IDBEM').AsInteger;
               FcdsBemxDep.FieldByName('FLGDEPSUSPENSA').AsInteger:= FcdsHistBemxDep.FieldByName('FLGDEPSUSPENSA').AsInteger;
               FcdsBemxDep.FieldByName('FLGDEPREC').AsFloat       := FcdsHistBemxDep.FieldByName('FLGDEPREC').AsFloat;
               FcdsBemxDep.FieldByName('DEPLANC').AsFloat         := FcdsHistBemxDep.FieldByName('DEPLANC').AsFloat;
               if FcdsHistBemxDep.FieldByName('DATAULTDEP').AsString <> '' then
                  FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime   := FcdsHistBemxDep.FieldByName('DATAULTDEP').AsDateTime;
               FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime    := FcdsHistBemxDep.FieldByName('DATAULTCM').AsDateTime;
               FcdsBemxDep.FieldByName('CMDEP').AsFloat           := FcdsHistBemxDep.FieldByName('CMDEP').AsFloat;
               FcdsBemxDep.FieldByName('DATAINICIODEP').AsDateTime:= dDataMov ;
               //Utilizado este campo para gravar a data Retroativa, não estava sendo utilizado .
               FcdsBemxDep.FieldByName('DATAFIMDEP').AsDateTime   := dDataRetr;
               FcdsBemxDep.FieldByName('FLGDEPREC').AsInteger := 0;
               FcdsBemxDep.Post;
               if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
                  Raise Exception.Create(_dbBemxDep.MessageInfo);

               if FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger > 0 then
               begin
                   FcdsAcrescValorxDep.First;
                   codSel := 0;
                   while not FcdsAcrescValorxDep.eof do
                   begin
                       FcdsHistAcrescValorxDep.Append;
                       FcdsHistAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger   := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger ;
                       FcdsHistAcrescValorxDep.FieldByName('USERINCLUSAO').AsString   := FcdsAcrescValorxDep.FieldByName('TRGUSERINCLUSAO').AsString;
                       FcdsHistAcrescValorxDep.FieldByName('DTINCLUSAO').asDateTime   := FcdsAcrescValorxDep.FieldByName('TRGDTINCLUSAO').asDateTime ;
                       FcdsHistAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').Asfloat := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').Asfloat;
                       FcdsHistAcrescValorxDep.FieldByName('TAXADEP').Asfloat         := FcdsAcrescValorxDep.FieldByName('TAXADEP').Asfloat;
                       FcdsHistAcrescValorxDep.FieldByName('DEPLANC').Asfloat         := FcdsAcrescValorxDep.FieldByName('DEPLANC').Asfloat;
                       if FcdsAcrescValorxDep.FieldByName('CMDEP').AsString <> '' then
                          FcdsHistAcrescValorxDep.FieldByName('CMDEP').Asfloat        := FcdsAcrescValorxDep.FieldByName('CMDEP').Asfloat
                       else
                          FcdsHistAcrescValorxDep.FieldByName('CMDEP').Asfloat := 0;
                       if FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsString <> '' then
                          FcdsHistAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime := FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime;
                       if FcdsAcrescValorxDep.FieldByName('DATAULTCM').AsString <> '' then
                          FcdsHistAcrescValorxDep.FieldByName('DATAULTCM').AsDateTime := FcdsAcrescValorxDep.FieldByName('DATAULTCM').AsDateTime;
                       if FcdsHistAcrescValorxDep.FieldByName('FLGDEPREC').AsString <> '' then
                          FcdsHistAcrescValorxDep.FieldByName('FLGDEPREC').AsFloat    := FcdsAcrescValorxDep.FieldByName('FLGDEPREC').AsFloat
                       else
                          FcdsHistAcrescValorxDep.FieldByName('FLGDEPREC').AsFloat := 0;
                       FcdsHistAcrescValorxDep.FieldByName('VIDAUTIL').AsFloat         := FcdsAcrescValorxDep.FieldByName('VIDAUTIL').AsFloat;
                       if FcdsAcrescValorxDep.FieldByName('DATAFIMDEP').AsString <> '' then
                          FcdsHistAcrescValorxDep.FieldByName('DATAFIMDEP').AsDateTime := FcdsAcrescValorxDep.FieldByName('DATAFIMDEP').AsDateTime;
                       if FcdsAcrescValorxDep.FieldByName('DATAINICIODEP').AsString <> '' then
                          FcdsHistAcrescValorxDep.FieldByName('DATAINICIODEP').AsDateTime := FcdsAcrescValorxDep.FieldByName('DATAINICIODEP').AsDateTime;
                       FcdsHistAcrescValorxDep.FieldByName('FLGDEPSUSPENSA').Asfloat      := FcdsAcrescValorxDep.FieldByName('FLGDEPSUSPENSA').Asfloat;
                       if FcdsSelDepreciacaoBens.FieldByName('IDSELDEPRECIACAO').Asfloat = 0 then
                       begin
                           if codSel = 0 then
                           begin
                              _cdsCodigo                   := TClientDataSet.Create(nil);
                              sSql   := 'SELECT (MAX(IDSELDEPRECIACAO)) AS CODIGO FROM SELDEPRECIACAO';
                              _cdsCodigo.data := GetDataPacket(sSql);
                              codSel := _cdsCodigo.FieldByName('CODIGO').Asfloat   ;
                              FreeAndNil(_cdsCodigo);
                           end;
                            FcdsHistAcrescValorxDep.FieldByName('IDSELDEPRECIACAO').Asfloat    := codSel;
                       end
                       else
                          FcdsHistAcrescValorxDep.FieldByName('IDSELDEPRECIACAO').Asfloat    := FcdsSelDepreciacaoBens.FieldByName('IDSELDEPRECIACAO').Asfloat;
                       FcdsHistAcrescValorxDep.FieldByName('MOECODIGO').Asfloat           := FcdsAcrescValorxDep.FieldByName('MOECODIGO').Asfloat;
                       FcdsHistAcrescValorxDep.post;


                       nAcrescTaxa := 0;
                       if FcdsConsReavalxDep.IsEmpty then begin
                          FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp, nBem);
                          nAcrescTaxa := AcrescimoValor.CalculaTaxaDep((FcdsBemxDep.FieldByName('DEPLANC').AsFloat +
                                                     FcdsBemxDep.FieldByName('CMDEP').AsFloat),
                                                    (FcdsBemxMoeda.FieldByName('VALORG').AsFloat +
                                                     FcdsBemxMoeda.FieldByName('CMBEM').AsFloat),
                                                     FcdsBemxDep.FieldByName('TAXADEP').asFloat,
                                                     dDataMov);
                       end
                       else
                       begin
                           FcdsConsReavalxDep.Last;
                           nAcrescTaxa := AcrescimoValor.CalculaTaxaDep((FcdsConsReavalxDep.FieldByName('DEPLANC').AsFloat +
                                                             FcdsConsReavalxDep.FieldByName('CMDEP').AsFloat),
                                                            (FcdsConsReavalxDep.FieldByName('VALORG').AsFloat +
                                                             FcdsConsReavalxDep.FieldByName('CMBEM').AsFloat),
                                                             FcdsConsReavalxDep.FieldByName('TAXADEP').asFloat,
                                                             dDataMov);
                       end;
                       if nAcrescTaxa < 0 then
                          nAcrescTaxa := 0;

                       sSql := 'UPDATE ACRESCVALORXDEP SET ' +
                               ' TAXADEP = ' + QuotedStr(FloatToStr(nAcrescTaxa)) +
                               ' WHERE IDACRESCIMO = ' + floattostr(FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').Asfloat) +
                               '   AND MOECODIGO = ' + floattostr(FcdsAcrescValorxDep.FieldByName('MOECODIGO').Asfloat)+
                               '   AND IDACRESCIMOXDEP = ' + floattostr(FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').Asfloat);
                       if not ExecSQL(sSql, True) then
                          Raise Exception.Create(CMTranslate('Não foi possível Alterar os dados do Acréscimo de Valor do Bem ') +
                                       trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                       floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
                       //-------------------------------------------------------------------------------
                       FcdsAcrescValorxDep.next;
                   end;
                    if not ApplyCds(FcdsHistAcrescValorxDep,_dbHistAcrescValorxDep,[],[]) then
                       Raise Exception.Create(_dbHistAcrescValorxDep.MessageInfo);
               end;

           end;
       end;
        Result := True;
    except
       On E : Exception do
       begin
          MessageInfo := E.Message;
          Result := False;
       end;
    end;
end;

function TCtrlHistBemxDep.AplicaOperacao(sTipoOperacao: String): Boolean;
Var
   sMensagem,sSql : String;
   dDataUltMov, dDataUltDep: TDateTime;
   dDataTaxa_1: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoHISTBEMXDEP( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         Soperacao := sTipoOperacao;
         dDataTaxa_1:= FormatDateTime('01/MM/YYYY', Fcds.FieldByName('SDDATA').AsDateTime);
         //-------------------------------------------------------------------------------
         if (sTipoOperacao = 'I') or (sTipoOperacao = 'E')   then // Inclusão e Alteração
         begin
            Result := ApplyCds(Fcds,_dbSelDepreciacao,[],[]);
            sMensagem := _dbSelDepreciacao.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsSelDepreciacaoBens,_dbSelDepreciacaoBens,[_dbSelDepreciacao.IdSelDepreciacao],[_dbSelDepreciacaoBens.IdSelDepreciacao]);
            sMensagem := _dbSelDepreciacaoBens.MessageInfo;

            if not Result then Raise Exception.Create(sMensagem);


            if not ExecutaDepreVida(Sistema.IdModulo, Sistema.IdEmpresa,Sistema.IdUsuario,
                                    Fcds.FieldByName('SDTAXA').asFloat,
                                    Fcds.FieldByName('IDSELDEPRECIACAO').asFloat,
                                    Fcds.FieldByName('SDVIDA').AsInteger,
                                    //Thaise SOL 154197 - A data a ser verificada, tem que ser o primeiro dia do mês
                                    //passado como parâmetro
                                    //Fcds.FieldByName('SDDATA').AsDateTime, //Mudar
                                    StrToDate(dDataTaxa_1),
                                    Fcds.FieldByName('SDDATARET').AsDateTime) then
               Raise Exception.Create(MessageInfo);
               
         end else
         //-------------------------------------------------------------------------------
         begin
               if Fcds.FieldByName('IDSELDEPRECIACAO').asString <> '' then
               begin
                   sSql := ' DELETE FROM SELDEPRECIACAOBENS ' +
                          ' WHERE IDSELDEPRECIACAO = ' + Fcds.FieldByName('IDSELDEPRECIACAO').asString;
                   if not ExecSQL(sSql, True) then
                      Raise Exception.Create(MessageInfo);

                   sSql := ' DELETE FROM SELDEPRECIACAO ' +
                          ' WHERE IDSELDEPRECIACAO = ' + Fcds.FieldByName('IDSELDEPRECIACAO').asString;
                   if not ExecSQL(sSql, True) then
                      Raise Exception.Create(MessageInfo);

                   if not ExecutaDepreVida(Sistema.IdModulo, Sistema.IdEmpresa,Sistema.IdUsuario,
                                 Fcds.FieldByName('SDTAXA').asFloat,
                                 Fcds.FieldByName('IDSELDEPRECIACAO').asFloat,
                                 Fcds.FieldByName('SDVIDA').AsInteger,
                                 StrToDate(dDataTaxa_1),
                                 Fcds.FieldByName('SDDATARET').AsDateTime) then
                      Raise Exception.Create(Bem.MessageInfo);
               end;
         end;
         Commit;
      except
         On E : Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

constructor TCtrlHistBemxDep.Create;
begin
   inherited;
   _dbHistBemxDep         := TDbHistBemxDep.Create(Self);
   _dbBemxDep             := TDBBemxDep.Create(Self);
   _dbBem                 := TDBBem.Create(Self);

   _dbSelDepreciacao      := TDBSelDepreciacao.Create(Self);
   _dbSelDepreciacaoBens  := TDbSeldepreciacaobens.Create(Self);
   _dbHistAcrescValorxDep := TDbHistAcrescValorxDep.Create(Self);

   _dMTBem          := tdtmMTBem.Create(Self);

   fCds                   := TClientDataSet.Create(nil);
   FcdsSelDepreciacaoBens := TClientDataSet.Create(nil);
   FcdsBem          := TCMClientDataSet.Create(nil);
   FcdsBemxDep      := TClientDataSet.Create(nil);
   FcdsHistBemxDep  := TClientDataSet.Create(nil);
   FcdsSelBens      := TClientDataSet.Create(nil);
   FcdsHistAcrescValorxDep := TClientDataSet.Create(nil);
   FcdsAcrescValorxDep := TClientDataSet.Create(nil);
   FcdsHistReavalxDep := TClientDataSet.Create(nil);
   FcdsConsReavalxDep := TClientDataSet.Create(nil);
   FcdsBemxMoeda      := TClientDataSet.Create(nil);

   Bem               := TCtrlBem.Create;
   ParamCAF          := TCtrlParamCAF.Create;
   AcrescimoValor    := TCtrlMovAcrescimoValor.Create;
   
  
end;

destructor TCtrlHistBemxDep.Destroy;
begin
   if fCds.Active then fCds.Close;
   if FcdsBem.Active then FcdsBem.Close;
   if FcdsSelDepreciacaoBens.Active then FcdsSelDepreciacaoBens.Close;
   if FcdsBemxDep.Active then FcdsBemxDep.Close;
   if FcdsHistBemxDep.Active then FcdsHistBemxDep.Close;
   if FcdsSelBens.Active then FcdsSelBens.Close;
   if FcdsHistAcrescValorxDep.Active then FcdsHistAcrescValorxDep.Close;
   if FcdsAcrescValorxDep.Active then FcdsAcrescValorxDep.Close;
   if FcdsHistReavalxDep.Active then FcdsHistReavalxDep.Close;
   if FcdsConsReavalxDep.Active then FcdsConsReavalxDep.Close;
   if FcdsBemxMoeda.Active then FcdsBemxMoeda.Close;

   fCds                   := nil;
   FcdsSelDepreciacaoBens := nil;
   FcdsSelDepreciacaoBens_Alter := nil;
   FcdsBem                := nil;
   FcdsBemxDep            := nil;
   FcdsHistBemxDep        := nil;
   FcdsSelBens            := nil;
   FcdsConsReavalxDep     := nil;

   FcdsHistAcrescValorxDep := nil;
   FcdsAcrescValorxDep     := nil;
   FcdsHistReavalxDep      := nil;
   FcdsBemxMoeda           := nil;

   fCds.Free;
   FcdsSelDepreciacaoBens.Free;
   FcdsSelDepreciacaoBens_Alter.Free;
   FcdsBem.Free;
   FcdsBemxDep.Free;
   FcdsHistBemxDep.Free;
   FcdsSelBens.Free;
   FcdsConsReavalxDep.Free;
   FcdsBemxMoeda.Free;
   FcdsHistAcrescValorxDep.Free;
   FcdsAcrescValorxDep.Free;
   FcdsHistReavalxDep.Free;

   _dbHistBemxDep.Free;
   _dbBemxDep.Free;
   _dbBem.Free;
   _dbSelDepreciacao.Free;
   _dbSelDepreciacaoBens.Free;
   _dMTBem.Free;
   _dbHistAcrescValorxDep.Free;

   Bem.Free;
   ParamCAF.Free;
   AcrescimoValor.Free;
  
   inherited;
end;

procedure TCtrlHistBemxDep.DoChangeDataBase;
begin
   inherited;
   _dbHistBemxDep.DataBaseName    := DataBaseName;
   _dbBemxDep.DataBaseName        := DataBaseName;
   _dbBem.DataBaseName            := DataBaseName;
   _dbSelDepreciacao.DataBaseName := DataBaseName;
   _dbSelDepreciacaoBens.DataBaseName := DataBaseName;
   _dbHistAcrescValorxDep.DataBaseName:= DataBaseName;
end;

function TCtrlHistBemxDep.ListaBemxDep(sClausula: String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT BD.IDBEMXDEP , BD.IDBEM ,BD.IDPESSOA ,BD.MOECODIGO, ' + #13 +
           ' BD.TAXADEP,  BD.DEPLANC , BD.CMDEP ,  BD.DATAULTDEP ,  BD.DATAULTCM, ' + #13 +
           ' BD.FLGDEPREC, BD.VIDAUTIL,  BD.DATAFIMDEP , BD.DATAINICIODEP,BD.FLGDEPSUSPENSA,' + #13 +
           ' B.PLACA,B.TAXADEP, B.DESBEM,B.BAIXATOTAL ' + #13 +
           ' FROM BEMXDEP BD, BEM B  ' + #13 +
           ' WHERE BD.IDBEM = B.IDBEM ';
   //-------------------------------------------------------------------------------------
   if sClausula <> '' then
      sSql := sSql + ' AND ( ' +  sClausula +  ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY BD.DATAULTDEP ';
   Result := GetDataPacket(sSql);
end;
function TCtrlHistBemxDep.ListaBemxDep2(sClausula: String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT BD.IDBEMXDEP ,BD.IDBEM ,BD.IDPESSOA ,BD.MOECODIGO, ' + #13 +
           ' BD.TAXADEP,BD.DEPLANC,BD.CMDEP,BD.DATAULTDEP,BD.DATAULTCM , ' + #13 +
           ' BD.FLGDEPREC,BD.TRGDTINCLUSAO,BD.TRGUSERINCLUSAO ,' + #13 +
           ' BD.VIDAUTIL, BD.DATAFIMDEP ,BD.DATAINICIODEP , BD.FLGDEPSUSPENSA ' + #13 +
           ' FROM BEMXDEP BD  ' + #13 ; 
   //-------------------------------------------------------------------------------------
   if sClausula <> '' then
      sSql := sSql +  sClausula ;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY BD.DATAULTDEP ';
   Result := GetDataPacket(sSql);
end;

function TCtrlHistBemxDep.ListaHistBemxDep(sClausula: String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT IDBEMXDEP ,IDBEM ,IDPESSOA,MOECODIGO,DATAVIGENCIA,TAXADEP,  ' + #13 +
           ' DEPLANC,CMDEP ,DATAULTDEP,DATAULTCM ,FLGDEPREC,DTINCLUSAO , ' + #13 +
           ' USERINCLUSAO,VIDAUTIL , DATAFIMDEP ,DATAINICIODEP,FLGDEPSUSPENSA  ' + #13 +
           ' FROM HISTBEMXDEP ' + #13 ;
   //-------------------------------------------------------------------------------------
   if sClausula <> '' then
      sSql := sSql + ' WHERE ( ' +  sClausula +  ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY DATAVIGENCIA ';
   Result := GetDataPacket(sSql);
end;

function TCtrlHistBemxDep.Procurar(nDataVigencia: Extended): OleVariant;
begin
   _dbHistBemxDep.DATAVIGENCIA.asDateTime := nDataVigencia;
   Result := GetDataPacket(_dbHistBemxDep.sSQLSelect);
end;

procedure TCtrlHistBemxDep.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

function TCtrlHistBemxDep.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

procedure TCtrlHistBemxDep.AfterInitialize;
begin
  inherited;
  Bem.InitializeAs(Self);
  ParamCAF.InitializeAs(Self);
  AcrescimoValor.InitializeAs(Self);
end;


procedure TCtrlHistBemxDep.SetcdsSelBens(const Value: TClientDataSet);
begin
    FcdsSelBens := Value;
end;

procedure TCtrlHistBemxDep.SetcdsSelDepreciacaoBens( const Value: TClientDataSet);
begin
    FcdsSelDepreciacaoBens := Value;
end;

function TCtrlHistBemxDep.ListaSelDepreBens(nIdPessoa,nIdSelDepreciacao: Extended): OleVariant;
begin
   _dMTBem.sqlListaSelDepreBens.Prepare;
   _dMTBem.sqlListaSelDepreBens.ParamByName('IDSELDEPREC').AsFloat := nIdSelDepreciacao;
   _dMTBem.sqlListaSelDepreBens.ParamByName('IDPESSOA').AsFloat := nIdPessoa;
   Result := _dMTBem.sqlListaSelDepreBens.Data;
end;

procedure TCtrlHistBemxDep.SetcdsHistBemxDep(const Value: TClientDataSet);
begin
    FcdsHistBemxDep := Value;
end;

function TCtrlHistBemxDep.ListaSelDepre(nIdPessoa, nIdSelDepreciacao: Extended): OleVariant;
var
   sSql : String;
begin
     sSql := ' SELECT SD.IDSELDEPRECIACAO, SD.IDPESSOA,SD.SDTAXA, SD.SDDATA, '+ #13 +
           '   SD.SDVIDA, SD.SDDATARET,SD.SDFLGEXECUTADO,SD.SDDTAEXECUTADO, P.NOME AS NOMERESP  ' + #13 +
           ' FROM SELDEPRECIACAO SD, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE SD.IDPESSOA = ' + floattostr(nIdPessoa) + #13;
   //----------------------------------------------------------------------------------
   if (nIdSelDepreciacao <> -1)  then
      sSql := sSql + '   AND SD.IDSELDEPRECIACAO = ' + floattostr(nIdSelDepreciacao) + #13;
   //----------------------------------------------------------------------------------
   sSql := sSql + '  AND SD.IDPESSOA = P.IDPESSOA(+) ' + #13 +
                  '  ORDER BY SD.SDDATA, SD.IDSELDEPRECIACAO ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;
function TCtrlHistBemxDep.ListaSelDepreBens_Bens(nIdPessoa, nIdSelDepreciacao: Extended): OleVariant;
var
   sSql : String;
begin
     sSql := ' SELECT HB.idbemxdep,HB.idbem, HB.IDPESSOA, HB.MOECODIGO,HB.DATAVIGENCIA '+ #13 +
           '   FROM SELDEPRECIACAOBENS SDB,SELDEPRECIACAO SD, HISTBEMXDEP HB  ' + #13 +
           '   WHERE SDB.IDSELDEPRECIACAO = ' + floattostr(nIdSelDepreciacao) + #13 +
           '      AND SDB.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
           '      AND SDB.IDBEM = HB.IDBEM ' + #13 +
           '      AND SDB.IDPESSOA = HB.IDPESSOA ' + #13 +
           '      AND SDB.IDSELDEPRECIACAO = SD.IDSELDEPRECIACAO ' + #13  +
           '      AND HB.DATAVIGENCIA = SD.SDDATA ' + #13 +
           '   ORDER BY  HB.DATAVIGENCIA ' + #13;
   Result := GetDataPacket(sSql);
end;

procedure TCtrlHistBemxDep.VoltaDepreciacao;
var sSql : String;
begin
    if not FcdsBemxDep.eof  then
      FcdsBemxDep.Delete;
    if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
       Raise Exception.Create(_dbBemxDep.MessageInfo);
    FcdsHistBemxDep.Last;
    FcdsBemxDep.Append;
    FcdsBemxDep.FieldByName('VIDAUTIL').AsInteger      := FcdsHistBemxDep.FieldByName('VIDAUTIL').AsInteger;
    FcdsBemxDep.FieldByName('TAXADEP').AsFloat         := FcdsHistBemxDep.FieldByName('TAXADEP').AsFloat;
    FcdsBemxDep.FieldByName('MOECODIGO').Asfloat       := FcdsHistBemxDep.FieldByName('MOECODIGO').AsFloat;
    FcdsBemxDep.FieldByName('IDPESSOA').AsInteger      := FcdsHistBemxDep.FieldByName('IDPESSOA').AsInteger;
    FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger     := FcdsHistBemxDep.FieldByName('IDBEMXDEP').AsInteger;
    FcdsBemxDep.FieldByName('IDBEM').AsInteger         := FcdsHistBemxDep.FieldByName('IDBEM').AsInteger;
    FcdsBemxDep.FieldByName('FLGDEPSUSPENSA').AsInteger:= FcdsHistBemxDep.FieldByName('FLGDEPSUSPENSA').AsInteger;
    FcdsBemxDep.FieldByName('FLGDEPREC').AsFloat       := FcdsHistBemxDep.FieldByName('FLGDEPREC').AsFloat;
    FcdsBemxDep.FieldByName('DEPLANC').AsFloat         := FcdsHistBemxDep.FieldByName('DEPLANC').AsFloat;
    if FcdsHistBemxDep.FieldByName('DATAULTDEP').AsString <> '' then
       FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime   := FcdsHistBemxDep.FieldByName('DATAULTDEP').AsDateTime;
    FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime    := FcdsHistBemxDep.FieldByName('DATAULTCM').AsDateTime;
    FcdsBemxDep.FieldByName('DATAINICIODEP').AsDateTime:= FcdsHistBemxDep.FieldByName('DATAINICIODEP').AsDateTime;
    FcdsBemxDep.FieldByName('DATAFIMDEP').AsDateTime   := FcdsHistBemxDep.FieldByName('DATAFIMDEP').AsDateTime;
    FcdsBemxDep.FieldByName('CMDEP').AsFloat           := FcdsHistBemxDep.FieldByName('CMDEP').AsFloat;
    FcdsBemxDep.FieldByName('TRGUSERINCLUSAO').AsString:= FcdsHistBemxDep.FieldByName('USERINCLUSAO').AsString;
    FcdsBemxDep.FieldByName('TRGDTINCLUSAO').AsDateTime:= FcdsHistBemxDep.FieldByName('DTINCLUSAO').AsDateTime;
    FcdsBemxDep.post;

     if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
        Raise Exception.Create(_dbBemxDep.MessageInfo);

    FcdsHistBemxDep.Delete;
    if not ApplyCds(FcdsHistBemxDep,_dbHistBemxDep,[],[]) then
      Raise Exception.Create(_dbHistBemxDep.MessageInfo);

    FcdsHistAcrescValorxDep.Data := ListaHistAcrescValorxDep(' IDSELDEPRECIACAO = ' + FloatToStr(FcdsSelDepreciacaoBens.FieldByName('IDSELDEPRECIACAO').asFloat) );

    if FcdsHistAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger > 0 then
    begin
        FcdsHistAcrescValorxDep.First;
        while not FcdsHistAcrescValorxDep.eof do
        begin
             sSql := 'UPDATE ACRESCVALORXDEP SET ' +
                     ' TAXADEP = ' + QuotedStr(FloatToStr(FcdsHistAcrescValorxDep.FieldByName('TAXADEP').AsFloat)) ;
             {if FcdsHistAcrescValorxDep.FieldByName('DATAFIMDEP').AsString <> '' then
                 sSql := ssql + ' ,DATAFIMDEP = To_date('+ QuotedStr(DateToStr(FcdsHistAcrescValorxDep.FieldByName('DATAFIMDEP').AsdateTime))+',''dd/mm/yyyy'')' ;
             if FcdsHistAcrescValorxDep.FieldByName('DATAINICIODEP').AsString <> '' then
                 sSql := ssql + ' ,DATAINICIODEP = To_date('+ QuotedStr(DateToStr(FcdsHistAcrescValorxDep.FieldByName('DATAFIMDEP').AsdateTime))+',''dd/mm/yyyy'')' ;
             if FcdsHistAcrescValorxDep.FieldByName('DATAULTCM').AsString <> '' then
                 sSql := ssql + ' ,DATAULTCM = To_date('+ QuotedStr(DateToStr(FcdsHistAcrescValorxDep.FieldByName('DATAULTCM').AsdateTime))+',''dd/mm/yyyy'')' ;
             if FcdsHistAcrescValorxDep.FieldByName('DATAULTDEP').AsString <> '' then
                 sSql := ssql + ' ,DATAULTDEP = To_date('+ QuotedStr(DateToStr(FcdsHistAcrescValorxDep.FieldByName('DATAULTDEP').AsdateTime))+',''dd/mm/yyyy'')' ;
             }
             sSql := ssql + ' WHERE IDACRESCIMO = ' + floattostr(FcdsHistAcrescValorxDep.FieldByName('IDACRESCIMO').Asfloat) +
                     '   AND MOECODIGO = ' + floattostr(FcdsHistAcrescValorxDep.FieldByName('MOECODIGO').Asfloat)+
                     '   AND IDACRESCIMOXDEP = ' + floattostr(FcdsHistAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').Asfloat);
             if not ExecSQL(sSql, True) then
                Raise Exception.Create(CMTranslate('Não foi possível Alterar os dados do Acréscimo de Valor do Bem ') +
                             trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
             floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
             sSql := 'DELETE FROM HISTACRESCVALORXDEP' +
                ' WHERE IDSELDEPRECIACAO = ' + FcdsSelDepreciacaoBens.FieldByName('IDSELDEPRECIACAO').asString +
                     '   AND IDACRESCIMO = ' + floattostr(FcdsHistAcrescValorxDep.FieldByName('IDACRESCIMO').Asfloat) +
                     '   AND MOECODIGO = ' + floattostr(FcdsHistAcrescValorxDep.FieldByName('MOECODIGO').Asfloat)+
                     '   AND IDACRESCIMOXDEP = ' + floattostr(FcdsHistAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').Asfloat);
        if not ExecSQL(sSql, True) then
          Raise Exception.Create(CMTranslate('Não foi possível Alterar os dados do Acréscimo de Valor do Bem ') +
             trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
             floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);

             FcdsHistAcrescValorxDep.Next;
        end;

    end;
end;

procedure TCtrlHistBemxDep.SetcdsSelDepreciacaoBens_Alter( const Value: TClientDataSet);
begin
   FcdsSelDepreciacaoBens_Alter := Value;
end;

procedure TCtrlHistBemxDep.SetcdsHistAcrescValorxDep(const Value: TClientDataSet);
begin
    FcdsHistAcrescValorxDep := Value;

end;

procedure TCtrlHistBemxDep.SetcdsHistReavalxDep(const Value: TClientDataSet);
begin
    FcdsHistReavalxDep := Value;
end;

function TCtrlHistBemxDep.ListaHistAcrescValorxDep(  sClausula: String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT HAV.IDSELDEPRECIACAO , HAV.IDACRESCIMO ,  HAV.MOECODIGO,HAV.IDACRESCIMOXDEP,' + #13 +
           ' HAV.TAXADEP , HAV.DEPLANC, HAV.CMDEP,HAV.DATAULTDEP,HAV.DATAULTCM ,HAV.FLGDEPREC, ' + #13 +
           ' HAV.TRGDTINCLUSAO , HAV.TRGUSERINCLUSAO, HAV.VIDAUTIL , HAV.DATAFIMDEP ,' + #13 +
           ' HAV.DATAINICIODEP,HAV.FLGDEPSUSPENSA ,HAV.DTINCLUSAO ,HAV.USERINCLUSAO ' + #13 +
           ' FROM HISTACRESCVALORXDEP HAV' + #13 ;
   //-------------------------------------------------------------------------------------
   if sClausula <> '' then
      sSql := sSql + ' WHERE ( ' +  sClausula +  ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY HAV.IDSELDEPRECIACAO ';
   Result := GetDataPacket(sSql);
end;

function TCtrlHistBemxDep.ListaHistReavalxDep(sClausula: String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT HRV.IDSELDEPRECIACAO,HRV.IDREAVALXDEP,HRV.IDREAVALIACAO,' + #13 +
           ' HRV.MOECODIGO,HRV.TAXADEP,HRV.DEPLANC,HRV.CMDEP,HRV.DATAULTDEP,' + #13 +
           ' HRV.DATAULTCM,HRV.FLGDEPREC,HRV.TRGDTINCLUSAO,HRV.TRGUSERINCLUSAO,' + #13 +
           ' HRV.VIDAUTIL,HRV.DATAFIMDEP,HRV.DATAINICIODEP,HRV.FLGDEPSUSPENSA,' + #13 +
           ' HRV.DTINCLUSAO,HRV.USERINCLUSAO' + #13 +
           ' FROM HISTREAVALXDEP HRV  ' + #13 ;

   //-------------------------------------------------------------------------------------
   if sClausula <> '' then
      sSql := sSql + ' WHERE ( ' +  sClausula +  ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER HRV.IDSELDEPRECIACAO ';
   Result := GetDataPacket(sSql);
end;


function TCtrlHistBemxDep.ListaConsRealValXDep(nIdPessoa,  nIdBem : Extended): OleVariant;
var
   sSql : String;
begin
     sSql := ' SELECT  R.IDBEM, R.IDPESSOA, RD.MOECODIGO, RD.IDREAVALIACAO, '+ #13 +
           '   RD.IDREAVALXDEP, RD.TAXADEP, RD.DEPLANC, RD.CMDEP, RD.DATAULTDEP,   ' + #13 +
           '   RD.DATAULTCM, RD.FLGDEPREC,RM.VALORG, RM.CMBEM '  + #13 +
           '   FROM REAVALIACAO R,REAVALXDEP RD ,REAVALXMOEDA RM'  + #13 +
           '   WHERE  R.IDBEM =  ' + floattostr(nIdBem) + #13 +
           '      AND R.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
           '      AND (R.FLGULTREAVAL  = 1) ' + #13 +
           '      AND (R.IDREAVALIACAO = RD.IDREAVALIACAO) ' + #13 +
           '      AND (R.IDREAVALIACAO = RM.IDREAVALIACAO)  ' + #13;
   Result := GetDataPacket(sSql);
end;

procedure TCtrlHistBemxDep.SetcdsConsReavalxDep(const Value: TClientDataSet);
begin
    FcdsConsReavalxDep := Value;
end;

function TCtrlHistBemxDep.ListaAcrescValorxDep(nIdPessoa,  nIdBem: Extended): OleVariant;
var
   sSql: String;
begin
   sSql := ' SELECT AVD.IDACRESCIMO,AVD.MOECODIGO,  AVD.IDACRESCIMOXDEP,  AVD.TAXADEP , '+ #13 +
           '  AVD.DEPLANC,AVD.CMDEP,AVD.DATAULTDEP,AVD.DATAULTCM,AVD.FLGDEPREC ,   ' + #13 +
           '  AVD.TRGDTINCLUSAO ,AVD.TRGUSERINCLUSAO,AVD.VIDAUTIL, AVD.DATAFIMDEP, ' + #13 +
           '  AVD.DATAINICIODEP  , AVD.FLGDEPSUSPENSA ' + #13 +
           '  FROM  ACRESCIMOVALOR AV,ACRESCVALORXDEP AVD ' + #13 +
           '  WHERE AV.IDBEM = ' + floattostr(nIdBem) + #13 +
           '      AND AV.IDPESSOA =  ' + floattostr(nIdPessoa) + #13 +
           '      AND AV.IDACRESCIMO = AVD.IDACRESCIMO ' ;
   Result := GetDataPacket(sSql);

end;

procedure TCtrlHistBemxDep.SetcdsAcrescValorxDep( const Value: TClientDataSet);
begin
   FcdsAcrescValorxDep := Value;
end;

procedure TCtrlHistBemxDep.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
   FcdsBemxMoeda := Value;
end;

//Thaise SOL 154197 - Criação desta funcção pra verificar se a ultima data de movimentação é maior
//que a data passada como parâmetro. Essa alteração foi criada para saber se existe movimentação posterior
//ao bem cadastrado. Se tiver, nenhuma alteração, exclusão ou insersão poderá ser feita.
function TCtrlHistBemxDep.VerificaAltPosterior(nEmpresaProp,
  nBem: Extended; dDataMov: TDateTime; Desbem, Placa: String): Boolean;

  var dDataUltMov: TDateTime;
      cdsAux: TCMClientDataSet;
      sSql: String;
begin
   MessageInfo := '';
   Result := True;

   cdsAux:= TCMClientDataSet.Create(Nil);
   try
     //-------------------------------------------------------------------------------------
     // Data da Última Movimentação
     //-------------------------------------------------------------------------------------
     sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
             ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
             ' WHERE  (IDBEM    = ' + floattostr(nBem) + ') ' + #13 +
             '   AND  (IDPESSOA = ' + floattostr(nEmpresaProp) + ') ';
     cdsAux.Data := GetDataPacket(sSql);
     if not cdsAux.IsEmpty then
     begin
       dDataUltMov := cdsAux.FieldByName('DATAULTMOV').AsDateTime;

       if dDataUltMov > dDataMov then
       begin
         MessageInfo := 'Existem movimentações com data posterior. Consulte Histórico de Movimentações!' + #13#10 +
                        'na Depreciação do bem ' + Placa + ' - ' + Desbem;
         Result := False;
       end;
     end;
   finally
     cdsAux.Close;
     FreeAndNil(cdsAux);
   end;

end;

end.

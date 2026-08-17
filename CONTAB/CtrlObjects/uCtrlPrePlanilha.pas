//ALTERAÇÕES
//------------------------------------------------------------------------------
//Rotina..........: VerificaPlanilha, Apagar
//N. Sol..........: 127363
//N. Kintana......: 674938
//Data............: 25/11/2009
//Responsável.....: Marilza Colpani
//Descrição.......: Ao excluir uma planilha da tela Cadastro/Planilhas/Lançamentos Automáticos,
//                  que seja atualizada essa exclusão na tela Planilhas/Automático/Lançamento Automático.
//------------------------------------------------------------------------------
// Rotinas........: CopiarPrePlanilha, ListPrePlanilha
// Data...........: 10/07/2004
// Autor..........: David Ayrolla
// Pendência......: 16743
// Descrição......: Incluído campo FLGINTEGRAPLAN na tabela PREPLANILHA.
//------------------------------------------------------------------------------
(*==============================================================================
Analista : Alex Pereira
Data     : 08/01/04
Pendência: 14451 Nova estrutura para segregação
Solução  : Criar a estrutura FLGSEGREGACRITER
           Determina qual das contas "debito" ou "crédito" será critério para
           segregação

Métodos atualizados: ListPrePlanilha
==============================================================================*)

unit uCtrlPrePlanilha;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask,CMProcura,DBTables,uDbPreDetalhe, uCtrlPadroes,
     uDbPrePlanilha, uCMTypes, UMensErro;

  Type

    TCtrlPrePlanilha = Class(TCmControlObject)

    private
       //-------------------------------------------------------------------------
       // Classes de Persistência
       //-------------------------------------------------------------------------
        FdbPrePlanilha  :TDbPrePlanilha;
        FdbPreDetalhe   :TDbPreDetalhe;
        FcdsPrePlanilha :TClientDataSet;
        FcdsPreDetalhe  :TClientDataSet;
        Padroes         :TCtrlPadroes;

        FcdsPrePlanilhaCopia :TClientDataSet;
        FcdsPreDetalheCopia  :TClientDataSet;

        procedure SetcdsPrePlanilha(const Value: TClientDataSet);
        procedure SetcdsPreDetalhe(const Value: TClientDataSet);

        procedure SetcdsPrePlanilhaCopia(const Value: TClientDataSet);
        procedure SetcdsPreDetalheCopia(const Value: TClientDataSet);

    protected
        procedure DoChangeDataBase;override;
        procedure AfterInitialize;override;
        procedure OnCreateAppServer;override;

    published
        Property cdsPrePlanilha      : TClientDataSet read FcdsPrePlanilha write SetcdsPrePlanilha;
        Property cdsPreDetalhe       : TClientDataSet read FcdsPreDetalhe write SetcdsPreDetalhe;

        Property cdsPrePlanilhaCopia : TClientDataSet read FcdsPrePlanilhaCopia write SetcdsPrePlanilhaCopia;
        Property cdsPreDetalheCopia  : TClientDataSet read FcdsPreDetalheCopia write SetcdsPreDetalheCopia;

        Property dbPrePlanilha : TDbPrePlanilha read FdbPrePlanilha write FdbPrePlanilha;
        Property dbPreDetalhe  : TDbPreDetalhe  read FdbPreDetalhe write  FdbPreDetalhe;

        {Esta função verifica se uma determinada planilha está sendo cadastrada com o mesmo nome}
        function PlanilhaTemNomesIguais(sNomePla :string;dPanCod:Double) :Boolean;

        {Esta função tem como objetivo gravar dados na tabela pre-planilha}
        function Gravar(dEmpresa,dModulo,dUsuario:Double) :Boolean;
        function CopiarPrePlanilha(dEmpresa,dModulo,dUsuario:Double;NovoNomePla:String) :Boolean;

        {Esta função tem como objetivo apagar dados na tabela pre-planilha}
        function Apagar(dEmpresa,dModulo,dUsuario:Double) :Boolean;
        function ApagarPreDetalhe(dEmpresa, dModulo, dUsuario:Double): boolean;
    public
        Constructor Create; Override;
        Destructor Destroy; Override;

        {Esta função tem como objetivo retorna registro da tabela preplanulha}
        Function ListPrePlanilha(dPanCodigo,dIdPessoa:Double;sPanIdent:string) :OleVariant;

        function ListVerifPlanil(const iPanCodigo, iIdEmpresa: integer; const sDataGera: string) : OleVariant;

        //Marilza Colpani - SOL 127363/Kintana 674938
        //Esta funcão retorna a quantidade de registros, quando o campo PANCODIGO da tabela PLANILHA
        // for igual ao retornado pelo clientdataset FcdsPreDetalhe
        function VerificaPlanilha (const iPanCodigo: integer): OleVariant;

    End;


implementation

constructor TCtrlPrePlanilha.Create;
begin
  inherited;
  FDbPrePlanilha := TDbPrePlanilha.Create(Self);
  FDbPreDetalhe  := TDbPreDetalhe.Create(Self);
  Padroes := TCtrlPadroes.Create;
end;

procedure TCtrlPrePlanilha.OnCreateAppServer;
begin
  inherited;
    FCdsPrePlanilha  := TClientDataSet.Create(nil);
    FCdsPreDetalhe   := TClientDataSet.Create(nil);

    FCdsPrePlanilhaCopia  := TClientDataSet.Create(nil);
    FCdsPreDetalheCopia   := TClientDataSet.Create(nil);
end;

destructor TCtrlPrePlanilha.Destroy;
begin
   If IsAppServer Then
   Begin
     FcdsPrePlanilha.Free;
     FcdsPreDetalhe.Free;
     FcdsPrePlanilhaCopia.Free;
     FcdsPreDetalheCopia.Free;
   End;

  //-------------------------------------------
  FdbPrePlanilha.Free;
  FdbPreDetalhe.Free;
  Padroes.free;

  inherited;

end;

procedure TCtrlPrePlanilha.DoChangeDataBase;
begin
  inherited;
  FdbPrePlanilha.DataBaseName := DataBaseName;
  FdbPreDetalhe.DataBaseName  := DataBaseName;
end;


function TCtrlPrePlanilha.PlanilhaTemNomesIguais(sNomePla :string;dPanCod:Double): Boolean;
var
  sSql :string;
begin

     sSql := 'SELECT PANCODIGO FROM PREPLANILHA ' +
             ' WHERE RTRIM(PANDESCRICAO) = ' + quotedStr(Trim(sNomePla));


     _cds.Data := GetDataPacket(sSql);

     If _cds.IsEmpty Then
        Result := False
     Else
     Begin
        if _cds.FieldByName('PANCODIGO').asFloat = dPanCod then
          Result := False
        else
          Result := True;
     End;
end;


function TCtrlPrePlanilha.Gravar(dEmpresa,dModulo,dUsuario:Double): Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarPrePlanilha( dEmpresa,dModulo,dUsuario,FcdsPrePlanilha.Data, FcdsPreDetalhe.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // Mestre
           Result := ApplyCds(FcdsPrePlanilha, FdbPrePlanilha,[],[] );
           Msg    :=  FdbPrePlanilha.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Detalhe
           Result := ApplyCds(FcdsPreDetalhe,FdbPreDetalhe,[FdbPrePlanilha.Pancodigo],[ FdbPreDetalhe.Pancodigo ] );
           Msg    := FdbPreDetalhe.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Pre-Planilha - Gravação',False) then
              Raise Exception.Create( Padroes.MessageInfo );
           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;
function TCtrlPrePlanilha.CopiarPrePlanilha(dEmpresa,dModulo,dUsuario:Double;NovoNomePla:String): Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.CopiarPrePlanilha( dEmpresa,dModulo,dUsuario,FcdsPrePlanilhaCopia.Data, FcdsPreDetalheCopia.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

          FcdsPrePlanilhaCopia.Insert;
          FcdsPrePlanilhaCopia.FieldByName('PANIDENTIFICACAO').AsString := FcdsPrePlanilha.FieldByName('PANIDENTIFICACAO').AsString;
          FcdsPrePlanilhaCopia.FieldByName('PANDESCRICAO').asString     := NovoNomePla;
          FcdsPrePlanilhaCopia.FieldByName('PANOK100').AsString         := FcdsPrePlanilha.FieldByName('PANOK100').AsString;
          FcdsPrePlanilhaCopia.FieldByName('PANCONTAPERC').AsString     := FcdsPrePlanilha.FieldByName('PANCONTAPERC').AsString;
          FcdsPrePlanilhaCopia.FieldByName('PANFASE').AsFloat           := FcdsPrePlanilha.FieldByName('PANFASE').AsFloat;
          FcdsPrePlanilhaCopia.FieldByName('PANINATIVO').AsString       := FcdsPrePlanilha.FieldByName('PANINATIVO').AsString;
          FcdsPrePlanilhaCopia.FieldByName('PANVALORFIXO').asFloat      := FcdsPrePlanilha.FieldByName('PANVALORFIXO').asFloat;
          FcdsPrePlanilhaCopia.FieldByName('PANNUMPARC').AsFloat        := FcdsPrePlanilha.FieldByName('PANNUMPARC').AsFloat;
          FcdsPrePlanilhaCopia.FieldByName('PANPARCATUAL').AsFloat      := FcdsPrePlanilha.FieldByName('PANPARCATUAL').AsFloat;
          FcdsPrePlanilhaCopia.FieldByName('PANPROCESSADA').AsString    := FcdsPrePlanilha.FieldByName('PANPROCESSADA').AsString;
          FcdsPrePlanilhaCopia.FieldByName('IDPESSOA').asFloat          := FcdsPrePlanilha.FieldByName('IDPESSOA').asFloat;
          FcdsPrePlanilhaCopia.FieldByName('FLGPERIODOGERA').asString   := FcdsPrePlanilha.FieldByName('FLGPERIODOGERA').asString;
          FcdsPrePlanilhaCopia.FieldByName('PANPERIODOGERA').asFloat    := FcdsPrePlanilha.FieldByName('PANPERIODOGERA').asFloat;
          FcdsPrePlanilhaCopia.FieldByName('FLGINTEGRAPLAN').AsString   := FcdsPrePlanilha.FieldByName('FLGINTEGRAPLAN').AsString;

          FcdsPrePlanilhaCopia.Post;
          //
          FCdsPreDetalhe.First;
          While Not FCdsPreDetalhe.Eof do
          Begin
            FcdsPreDetalheCopia.Insert;
            FcdsPreDetalheCopia.FieldByName('IDEMPRESA').AsFloat         := FcdsPreDetalhe.FieldByName('IDEMPRESA').AsFloat;
            FcdsPreDetalheCopia.FieldByName('CODCENTROCUSTO').asString   := FCdsPreDetalhe.FieldByName('CODCENTROCUSTO').asString;
            FcdsPreDetalheCopia.FieldByName('PLANO').asFloat             := FCdsPreDetalhe.FieldByName('PLANO').asFloat;
            FcdsPreDetalheCopia.FieldByName('PLACONTA').asString         := FCdsPreDetalhe.FieldByName('PLACONTA').asString;
            FcdsPreDetalheCopia.FieldByName('HITCODHIST').asString       := FCdsPreDetalhe.FieldByName('HITCODHIST').asString;
            FcdsPreDetalheCopia.FieldByName('IDPESSOA').asFloat          := FCdsPreDetalhe.FieldByName('IDPESSOA').asFloat;
            FcdsPreDetalheCopia.FieldByName('PANTIPO').asString          := FCdsPreDetalhe.FieldByName('PANTIPO').asString;
            FcdsPreDetalheCopia.FieldByName('IDUSUARIOINCLUSAO').asFloat := FCdsPreDetalhe.FieldByName('IDUSUARIOINCLUSAO').asFloat;
            FcdsPreDetalheCopia.FieldByName('UNIDNEGOC').asFloat         := FCdsPreDetalhe.FieldByName('UNIDNEGOC').asFloat;
            FcdsPreDetalheCopia.FieldByName('PLANOME').asString          := FCdsPreDetalhe.FieldByName('PLANOME').asString;
            FcdsPreDetalheCopia.FieldByName('UNECODIGO').asString        := FCdsPreDetalhe.FieldByName('UNECODIGO').asString;
            FcdsPreDetalheCopia.FieldByName('CODSUBCONTA').asFloat       := FCdsPreDetalhe.FieldByName('CODSUBCONTA').asFloat;
            FcdsPreDetalheCopia.FieldByName('NUMDOC').asString           := FCdsPreDetalhe.FieldByName('NUMDOC').asString;
            FcdsPreDetalheCopia.FieldByName('TIPCODIGO').asString        := FCdsPreDetalhe.FieldByName('TIPCODIGO').asString;
            FcdsPreDetalheCopia.Post;
            FCdsPreDetalhe.Next;
           End;


           // Mestre
           Result := ApplyCds(FcdsPrePlanilhaCopia, FdbPrePlanilha,[],[] );
           Msg    :=  FdbPrePlanilha.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Detalhe
           Result := ApplyCds(FcdsPreDetalheCopia,FdbPreDetalhe,[FdbPrePlanilha.Pancodigo],[ FdbPreDetalhe.Pancodigo ] );
           Msg    := FdbPreDetalhe.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Copia da Pre-Planilha - Gravação',False) then
              Raise Exception.Create( Padroes.MessageInfo );
           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;

function TCtrlPrePlanilha.Apagar(dEmpresa,dModulo,dUsuario:Double): Boolean;
Var
   Msg  : String;
   sPlanilha : integer;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ApagarPrePlanilha(dEmpresa,dModulo,dUsuario, FcdsPreDetalhe.Data,FcdsPrePlanilha.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           //Marilza Colpani - SOL 127363/Kintana 674938
           if (VerificaPlanilha(FcdsPreDetalhe.FieldByname('PANCODIGO').AsInteger) = 0) then
           begin
               FcdsPreDetalhe.First;
               while FcdsPreDetalhe.RecordCount > 0 do
               begin
                 FcdsPreDetalhe.Delete;
                 FcdsPreDetalhe.First;
               end;

               // Detalhe
               Result := ApplyCds(FcdsPreDetalhe,FdbPreDetalhe,[],[] );
               Msg    := FdbPreDetalhe.MessageInfo;
               If Not Result Then Raise Exception.Create(Msg);

               // Mestre
               Result := ApplyCds(FcdsPrePlanilha, FdbPrePlanilha,[],[] );
               Msg    :=  FdbPrePlanilha.MessageInfo;
               If Not Result Then Raise Exception.Create(Msg);

               If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Pre-Planilha - Deleção',False) then
                  Raise Exception.Create( Padroes.MessageInfo );

               Commit;
           end
           else
           begin
             raise Exception.Create('Planilha não pode ser excluída, pois existem lançamentos contábeis.');
           end
        except
               On E:Exception Do
                Begin
                   Rollback;
                   Result := False;
                   MessageInfo := E.Message;
                End;
        End;
     End;

end;

function TCtrlPrePlanilha.ListPrePlanilha(dPanCodigo,dIdPessoa:Double;sPanIdent:string) :OleVariant;
var
  sSql, sfiltro, sOrdena :string;
begin
      sSql := 'SELECT ' +
              '   PANIDENTIFICACAO, ' +
              '   PANDESCRICAO,     ' +
              '   PANOK100,         ' +
              '   PANCONTAPERC,     ' +
              '   PANFASE,          ' +
              '   PANINATIVO,       ' +
              '   PANVALORFIXO,     ' +
              '   PANNUMPARC,       ' +
              '   PANPARCATUAL,     ' +
              '   PANPROCESSADA,    ' +
              '   PANCODIGO,        ' +
              '   IDPESSOA,         ' +
              '   FLGPERIODOGERA,   ' +
              '   PANPERIODOGERA,   ' +
              '   FLGSEGREGACRITER, ' +
              '   FLGINTEGRAPLAN    ' +
              'FROM ' +
              '   PREPLANILHA ';

      //-----------------------------------------------------------------
      sFiltro := '';
      If (dPanCodigo <> 0) Then
      Begin
         sFiltro :=  'WHERE (PANCODIGO = ' +FloatToStr(dPanCodigo)+') ';
      End;
      //-----------------------------------------------------------------
      if dIdPessoa <> 0 then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (IDPESSOA = ' +FloatToStr(dIdPessoa)+') '
         else
            sFiltro := sFiltro +  'AND (IDPESSOA = '+FloatToStr(dIdPessoa)+') ';
      End;
      //-----------------------------------------------------------------
      if sPanIdent <> '' then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (PANIDENTIFICACAO = ''' + sPanIdent + ''') '
         else
            sFiltro := sFiltro +  'AND (PANIDENTIFICACAO = ''' + sPanIdent + ''') ';
      End;
      //-----------------------------------------------------------------

      sOrdena := 'ORDER BY PANDESCRICAO ';

      sSql := sSql + sFiltro + sOrdena;

      Result := GetDataPacket(sSql);

end;

procedure TCtrlPrePlanilha.SetcdsPrePlanilha(const Value: TClientDataSet);
begin
  FcdsPrePlanilha := Value;
end;

procedure TCtrlPrePlanilha.SetcdsPreDetalhe(const Value: TClientDataSet);
begin
  FcdsPreDetalhe := Value;
end;


procedure TCtrlPrePlanilha.AfterInitialize;
begin
  inherited;
  Padroes.initializeas(self);
  Padroes.OnMessageInfo := nil;

end;

procedure TCtrlPrePlanilha.SetcdsPreDetalheCopia(
  const Value: TClientDataSet);
begin
  FcdsPreDetalheCopia := Value;

end;

procedure TCtrlPrePlanilha.SetcdsPrePlanilhaCopia(
  const Value: TClientDataSet);
begin
  FcdsPrePlanilhaCopia := Value;

end;

function TCtrlPrePlanilha.ListVerifPlanil(const iPanCodigo,
  iIdEmpresa: integer; const sDataGera: string): OleVariant;
var
   sSql: String;
begin
   sSql := 'SELECT PLNCODIGO, PLNPLANIL, PLNDATDIA ' + #13 +
             'FROM PLANILHA                          ' + #13 +
             'WHERE (PANCODIGO = ' + IntToStr(iPanCodigo) + ' )  ' + #13 +
             '  AND (PLNDATDIA = TO_DATE( ' + QuotedStr(sDataGera) + ' ,''DD/MM/YYYY''))  ' + #13 +
             '  AND (IDPESSOA  = ' + IntToStr(iIdEmpresa) + ' ) ';

   Result := GetDataPacket ( sSql);
end;

function TCtrlPrePlanilha.ApagarPreDetalhe(dEmpresa, dModulo,
  dUsuario: Double): boolean;
var
  Msg  : String;
begin
  if ConnectionSide = cnsClient Then
  begin
    Result := Connection.AppServer.Deletar( FcdsPrePlanilha.Data, FcdsPreDetalhe.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      FcdsPreDetalhe.First;
      while FcdsPreDetalhe.RecordCount > 0 do
      begin
        FcdsPreDetalhe.Delete;
        FcdsPreDetalhe.First;
      end;

      Result := ApplyCds( FcdsPreDetalhe, FDbPreDetalhe,
                         [FdbPrePlanilha.Pancodigo], [FDbPreDetalhe.Pancodigo] );
      Msg    := FDbPreDetalhe.MessageInfo;
      if not Result then raise Exception.Create( Msg );

      Commit;
    except
      On E:Exception Do
      begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
       end;
    end;
  end;
end;

function TCtrlPrePlanilha.VerificaPlanilha(
  const iPanCodigo: integer): OleVariant;
var
  sSql : string;
  cdsAux : TClientDataSet;
begin
  cdsAux := TClientDataSet.Create( nil );

  sSql := 'SELECT COUNT (PANCODIGO) as PANCODIGO ' + #13 +
            'FROM PLANILHA                          ' + #13 +
           'WHERE (PANCODIGO = ' + IntToStr(iPanCodigo) + ' )  ';

  cdsAux.data :=  GetDataPacket ( sSql);
  Result := cdsAux.FieldByname('PANCODIGO').AsInteger;
  FreeAndNil(cdsAux);
end;

end.

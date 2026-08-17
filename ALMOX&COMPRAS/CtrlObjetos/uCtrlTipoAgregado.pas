unit uCtrlTipoAgregado;

interface

Uses DB, uDataBase,Classes,uCmDbObject, uCmControlObject,uDbTipoAgre,
     uDBTipCustAgregConta,  sysUtils, dbclient, uSistema,
     uMidasUtil, uCMTypes, uCtrlImpostoRetido;

Type
  TCtrlTipoAgregado = class(TCmControlObject)
  Protected
    Procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
     _DbTipoAgre          : TDbTipoAgre;
     _DBTipCustAgregConta : TDBTipCustAgregConta;
    //-------------------------------------------------------------------------
    // Componentes de uso interno
    //-------------------------------------------------------------------------
    _ImpostoRetido : TCtrlImpostoRetido;
    //
    Fcds: TClientDataSet;
    FcdsContab: TClientDataSet;
    FBase: Double;
    FAliquota: Double;
    FValor: Double;
    FPercImp: Double;
    FBaseImp: Double;
    FValorImp: Double;
    FcdsValorAgregTela: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsContab(const Value: TClientDataSet);
    procedure SetAliquota(const Value: Double);
    procedure SetBase(const Value: Double);
    procedure SetValor(const Value: Double);
    procedure SetBaseImp(const Value: Double);
    procedure SetcdsValorAgregTela(const Value: TClientDataSet);
    procedure SetPercImp(const Value: Double);
    procedure SetValorImp(const Value: Double);

  Public
    Property cds       : TClientDataSet read Fcds write Setcds;
    Property cdsContab : TClientDataSet read FcdsContab write SetcdsContab;
    Property Base      : Double read FBase write SetBase;
    Property Aliquota  : Double read FAliquota write SetAliquota;
    Property Valor     : Double read FValor write SetValor;
    Property cdsValorAgregTela : TClientDataSet read FcdsValorAgregTela write SetcdsValorAgregTela;
    Property BaseImp  : Double read FBaseImp write SetBaseImp;
    Property PercImp  : Double read FPercImp write SetPercImp;
    Property ValorImp : Double read FValorImp write SetValorImp;

    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    {**
       Grava os Custos Agregados e sua contabilidade
    **}
    Function Gravar : Boolean;
    {**
       Apaga os Custos Agregados e sua contabilidade
    **}
    Function Excluir : Boolean;
    {**
       Busca os Custos Agregados e sua contabilidade
    **}
    Function Procurar( CodTipoCustAgreg : Double ) : OleVariant;
    {**
       Busca a contabilização do custo agregado
    **}
    Function GetContab( CodTipoCustAgreg : Double; IdPessoa : Integer) : OleVariant;    
    {**
       Lista os custos agregados
    **}
    Function ListAgregados( IncideCompra : String = 'S' ) : OleVariant;
    {**
       Calcula a base de calculo e o percentual/valor  do agregados
     **}
    Procedure CalculaAgregado(CodProduto : String; CodTipCustAgreg : Double; CodEstado : String; IdPais,ValorItem: Double);
   //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   // funcões do Frame Agregado
   //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Function CalcImpAuto(idPais,idCodTipDoc, idForCli, idEmpresa, rValorBase: Double; dDataPagto, dDataCot : TDateTime; sTipoDesemb, sCodProduto, sCodEstado : String): Boolean;

    Procedure CalcImposto( sCODPRODUTO, sCODUF : String;
                                       iIDPAIS, iCODTIPOCUSTAGREG, rValorItem : Double);
    procedure AtuBase(rBaseInf: Double);
   //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


End;

implementation

{ TCtrlSCPrePronta }

procedure TCtrlTipoAgregado.AfterInitialize;
begin
  inherited;
  _ImpostoRetido.InitializeAs( Self );
end;                           

procedure TCtrlTipoAgregado.AtuBase(rBaseInf: Double);
Var
   rAcumBase  : Double;
   bmMarca    : TBookMark;
Begin
  If FcdsValorAgregTela.FieldByName('FLGBASE').AsString = 'S' Then
     Begin
        FcdsValorAgregTela.Edit;
        FcdsValorAgregTela.FieldByName('BASE').AsFloat := rBaseInf;
     End
  Else
     Begin
        bmMarca   := FcdsValorAgregTela.GetBookmark;
        rAcumBase := 0;
        FcdsValorAgregTela.DisableControls;
        FcdsValorAgregTela.First;
        While Not FcdsValorAgregTela.EOF Do
           Begin
              rAcumBase := rAcumBase + FcdsValorAgregTela.FieldByName('ACUMBASE').AsFloat;
              FcdsValorAgregTela.Next;
           End;
        FcdsValorAgregTela.GotoBookmark(bmMarca);
        FcdsValorAgregTela.FreeBookmark(bmMarca);
        FcdsValorAgregTela.EnableControls;
        FcdsValorAgregTela.Edit;
        FcdsValorAgregTela.FieldByName('BASE').AsFloat := rBaseInf + rAcumBase;
     End;
end;

function TCtrlTipoAgregado.CalcImpAuto(idPais, idCodTipDoc, idForCli,
  idEmpresa, rValorBase: Double; dDataPagto, dDataCot: TDateTime;
  sTipoDesemb, sCodProduto, sCodEstado: String): Boolean;
begin
  Result := True;
  FcdsValorAgregTela.DisableControls;
  Try
     If trim(sTipoDesemb) <> '' Then
        Begin
           //Gravar impostos vinculados ao fornecedor, tipo de desembolso e Classificacao Fiscal
           _ImpostoRetido.IdEmpresa         := Trunc(idEmpresa);
           _ImpostoRetido.RecPag            := 'P';
           _ImpostoRetido.DataProgramada    := dDataPagto;
           _ImpostoRetido.OperacaoDocumento := '2 ';
           _ImpostoRetido.IdForCli          := Trunc(idForCli);
           _ImpostoRetido.CodDocumento      := 0;
           _ImpostoRetido.NumLancto         := 0;
           _ImpostoRetido.ValorLancto       := rValorBase;
           _ImpostoRetido.ValorLiquido      := rValorBase;
           _ImpostoRetido.DataLancto        := dDataCot;
           _ImpostoRetido.DataEmissao       := dDataCot;
           _ImpostoRetido.DebCre            := 'C';
           _ImpostoRetido.CodTipRecDes      := sTipoDesemb;
           _ImpostoRetido.MomentoLancamento := mlLancamento;
           _ImpostoRetido.CodTipoDoc        := Trunc(idCodTipDoc);
           _ImpostoRetido.Incluir;
           //
           If Not _ImpostoRetido.CdsSimulacao.IsEmpty Then
              Begin
                 _ImpostoRetido.CdsSimulacao.First;
                 While not _ImpostoRetido.CdsSimulacao.EOF do begin
                    if FcdsValorAgregTela.Locate('CODTIPOCUSTAGREG',_ImpostoRetido.CdsSimulacao.FieldByName('IDIMPOSTO').AsInteger,[]) Then
                       Begin
                          FcdsValorAgregTela.Edit;
                          FcdsValorAgregTela.FieldByName('PERCENT').AsFloat := _ImpostoRetido.CdsSimulacao.FieldByName('PERCIMPOSTO').AsFloat;
                          FcdsValorAgregTela.FieldByName('VALOR').AsFloat   := _ImpostoRetido.CdsSimulacao.FieldByName('VALORIMPOSTO').AsFloat;
                          FcdsValorAgregTela.FieldByName('BASE').AsFloat    := _ImpostoRetido.CdsSimulacao.FieldByName('VALORBASE').AsFloat;
                          FcdsValorAgregTela.Post;
                       End;
                    _ImpostoRetido.CdsSimulacao.Next;
                 end;
             End;
        end;
     //
     //Gravar impostos vinculados ao item e ao estado
     FcdsValorAgregTela.First;
     While not FcdsValorAgregTela.EOF do
        Begin
           If FcdsValorAgregTela.FieldByName('CODTRATFISCE').AsString < '8' Then
              Begin
                 FBaseImp :=rValorBase;
                 AtuBase(FBaseImp);
                 FBaseImp  := FcdsValorAgregTela.FieldByName('BASE').AsFloat;
                 FPercImp  := 0;
                 FValorImp := 0;
                 CalcImposto( sCodProduto,
                              sCodEstado,
                              idPais,
                              FcdsValorAgregTela.FieldByName('CODTIPOCUSTAGREG').asInteger,
                              FcdsValorAgregTela.FieldByName('BASE').AsFloat);
                 If FBaseImp = 0 then
                    FBaseImp := rValorBase;
                 FcdsValorAgregTela.Edit;
                 FcdsValorAgregTela.FieldByName('PERCENT').asFloat  := FPercImp;
                 FcdsValorAgregTela.FieldByName('BASE').asFloat     := FBaseImp;
                 FcdsValorAgregTela.FieldByName('VALOR').asFloat    := FValorImp;
                 FcdsValorAgregTela.Post;
              End;
           FcdsValorAgregTela.Next;
        End;
     Finally
        FcdsValorAgregTela.First;
        FcdsValorAgregTela.EnableControls;
     End;
end;

procedure TCtrlTipoAgregado.CalcImposto(sCODPRODUTO, sCODUF: String;
  iIDPAIS, iCODTIPOCUSTAGREG, rValorItem: Double);
var
    rPercBase : Double;
    sSql      : String;
    CdsAux    : TClientDataSet;
begin
   CdsAux := TClientDataSet.Create(nil);
   Try
      sSql := 'SELECT PERCIMPOSTO,PERCBASEIMP '+
              'FROM IMPOSTOSXPRODUTOS '+
              'WHERE (CODPRODUTO = '''+Copy(sCODPRODUTO+'        ',1,6)+''')'+
              '  AND (CODTIPOCUSTAGREG = '+FloatToStr(iCODTIPOCUSTAGREG)+') '+
              '  AND (CODESTADO  = '''+Copy(sCODUF+'        ',1,3)+''') '+
              '  AND (IDPAIS     = '+FloatToStr(iIDPAIS)+') ';
      //
      CdsAux.Data := GetDataPacket(sSql);
      If Not CdsAux.IsEmpty Then
         Begin
            rPercBase:= CdsAux.FieldByName('PERCBASEIMP').asFloat;
            FPercImp := CdsAux.FieldByName('PERCIMPOSTO').asFloat;
            //
            FBaseImp := rValorItem*(rPercBase/100);
            FValorImp:= FBaseImp*(FPercImp/100);
         End
      Else
         Begin
            FBaseImp := 0;
            FPercImp := 0;
            FValorImp:= 0;
         End;
   Finally
      CdsAux.Free;
   End;
end;

Procedure TCtrlTipoAgregado.CalculaAgregado(CodProduto: String;
  CodTipCustAgreg: Double; CodEstado: String; IdPais,ValorItem: Double);
Var
   SQL : String;
begin
   CodProduto := Copy(CodProduto + '          ',1,6);
   SQL := ' SELECT PERCIMPOSTO,PERCBASEIMP '+
               ' FROM IMPOSTOSXPRODUTOS '+
               ' WHERE '+
               '      (RTRIM(CODPRODUTO) = '+QuotedStr(CodProduto) +') '+
               '  AND (CODTIPOCUSTAGREG = '+ FloatToStr(CodTipCustAgreg) +') '+
               '  AND (CODESTADO  = '''+ CodEstado +''') '+
               '  AND (IDPAIS     = '+ FloatToStr(IdPais) +') ';

   _cds.Data := GetDataPacket(SQL);

   If Not _cds.IsEmpty Then
      Begin
         FBase     := _cds.FieldByName('PERCBASEIMP').asFloat;
         FAliquota := _cds.FieldByName('PERCIMPOSTO').asFloat;
         //
         FBase     := ValorItem * (FBase/100);
         FValor    := FBase * (FAliquota/100);
      End
   Else
      Begin
         FBase     := 0;
         FAliquota := 0;
         FValor    := 0;
      End;
end;

constructor TCtrlTipoAgregado.Create;
begin
  inherited;
  _DbTipoAgre          := TDbTipoAgre.Create(Self);
  _DBTipCustAgregConta := TDBTipCustAgregConta.Create(Self);
  _ImpostoRetido       := TCtrlImpostoRetido.Create;
end;

destructor TCtrlTipoAgregado.Destroy;
begin
  If IsAppServer Then
     FreeCds([Fcds, FcdsContab,FcdsValorAgregTela]);

  _DbTipoAgre.Free;
  _DBTipCustAgregConta.Free;
  _ImpostoRetido.Free;

  inherited;
end;

procedure TCtrlTipoAgregado.DoChangeDataBase;
begin
  inherited;
  _DbTipoAgre.DataBaseName          := DataBaseName;
  _DBTipCustAgregConta.DataBaseName := DataBaseName;
end;

function TCtrlTipoAgregado.Excluir: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirTipoAgregado ( Fcds.Data, FcdsContab.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // itens Filhos
           Result := ApplyCds(FcdsContab,_DBTipCustAgregConta,[],[] );
           Msg    := _DBTipCustAgregConta.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Pai
           Result := ApplyCds(Fcds,_DbTipoAgre,[],[] );
           Msg    := _DbTipoAgre.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

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

function TCtrlTipoAgregado.GetContab(CodTipoCustAgreg: Double; IdPessoa: Integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Append('SELECT                        ');
      SQL.Append('     TC.IDTIPCUSTAGREGCON,    ');
      SQL.Append('     TC.IDPESSOA,             ');
      SQL.Append('     TC.CODTIPOCUSTAGREG,     ');
      SQL.Append('     TC.UNIDNEGOC,            ');
      SQL.Append('     TC.CODSUBCONTA,          ');
      SQL.Append('     TC.IDEMPRESA,            ');
      SQL.Append('     TC.CODCENTROCUSTO,       ');
      SQL.Append('     TC.PLANO,                ');
      SQL.Append('     TC.PLACONTA,             ');
      SQL.Append('     CC.NOME AS CENTCUST,     ');
      SQL.Append('     UN.NOME AS DESUNIDNEGOC  ');
      SQL.Append('FROM                          ');
      SQL.Append('     TIPCUSTAGREGCONTA TC,    ');
      SQL.Append('     CENTCUST CC,             ');
      SQL.Append('     UNIDNEGOCIO UN           ');
      SQL.Append('WHERE                         ');
      SQL.Append('         (TC.CODTIPOCUSTAGREG = '+FloatToStr(CodTipoCustAgreg)+')');
      SQL.Append('     AND (TC.IDPESSOA  = '+IntToStr( IdPessoa )+') ');
      SQL.Append('     AND (TC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ');
      SQL.Append('     AND (TC.IDEMPRESA = CC.IDEMPRESA(+))           ');
      SQL.Append('     AND (TC.UNIDNEGOC = UN.UNIDNEGOC)              ');
      SQL.Append('     AND (TC.IDPESSOA  = UN.IDPESSOA)               ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlTipoAgregado.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarTipoAgregado( Fcds.Data, FcdsContab.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // Pai
           Result := ApplyCds(Fcds,_DbTipoAgre,[],[] );
           Msg    := _DbTipoAgre.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // itens Filhos
           Result := ApplyCds(FcdsContab,_DBTipCustAgregConta,[_DbTipoAgre.CodTipoCustAgreg],[_DBTipCustAgregConta.CodTipoCustAgreg] );
           Msg    := _DBTipCustAgregConta.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

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

function TCtrlTipoAgregado.ListAgregados(IncideCompra: String): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Append('SELECT                  ');
      SQL.Append('      CODTIPOCUSTAGREG, ');
      SQL.Append('      DESCCUSTAGREG,    ');
      SQL.Append('      FLGBASE,          ');
      SQL.Append('      PERCVALOR,        ');
      SQL.Append('      (0) AS BASE,      ');
      SQL.Append('      (0) AS ALIQUOTA,  ');
      SQL.Append('      (0) AS VALOR,     ');
      SQL.Append('      (0) ACUMBASE      ');
      SQL.Append('FROM                    ');
      SQL.Append('      TIPOAGRE          ');
      SQL.Append('WHERE                   ');
      SQL.Append('     (FLGINCIDECOMPRA = '+QuotedStr(IncideCompra)+') ');
      SQL.Append('ORDER BY FLGBASE DESC,  ');
      SQL.Append('         DESCCUSTAGREG  ');

      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;

end;

procedure TCtrlTipoAgregado.OnCreateAppServer;
begin
  inherited;
  FCds               := TClientDataSet.Create(nil);
  FCdsContab         := TClientDataSet.Create(nil);
  FcdsValorAgregTela := TClientDataSet.Create(nil);
end;

Function TCtrlTipoAgregado.Procurar(CodTipoCustAgreg: Double ) : OleVariant;
begin
   _DbTipoAgre.CodTipoCustAgreg.AsFloat := CodTipoCustAgreg;
   Result := GetDataPacket(_DbTipoAgre.SSqlSelect);
end;

procedure TCtrlTipoAgregado.SetAliquota(const Value: Double);
begin
  FAliquota := Value;
end;

procedure TCtrlTipoAgregado.SetBase(const Value: Double);
begin
  FBase := Value;
end;

procedure TCtrlTipoAgregado.SetBaseImp(const Value: Double);
begin
  FBaseImp := Value;
end;

procedure TCtrlTipoAgregado.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlTipoAgregado.SetcdsContab(const Value: TClientDataSet);
begin
  FcdsContab := Value;
end;

procedure TCtrlTipoAgregado.SetcdsValorAgregTela(
  const Value: TClientDataSet);
begin
  FcdsValorAgregTela := Value;
end;

procedure TCtrlTipoAgregado.SetPercImp(const Value: Double);
begin
  FPercImp := Value;
end;

procedure TCtrlTipoAgregado.SetValor(const Value: Double);
begin
  FValor := Value;
end;

procedure TCtrlTipoAgregado.SetValorImp(const Value: Double);
begin
  FValorImp := Value;
end;

end.

























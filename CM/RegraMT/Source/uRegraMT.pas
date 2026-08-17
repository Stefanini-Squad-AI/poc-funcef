{==============================================================================}
{  REGRA                                                                       }
{  Unit    - uRegraMT                                                          }
{  Data    - 06/11/01                                                          }
{  Objetivo: Inteface com os Sistemas, desenvolvida para manter compatibilidade}
{            com os sistemas que ainda rodam em 2 camadas.                     }
{------------------------------------------------------------------------------}
{  Alterações:                                                                 }
{  Augusto 27/06/2006 - Novo método CopiaData, para passar um DATA para o CTRL }
{  Augusto 07/02/2006 - Novo método CopiaData, para passar um DATA para o CTRL }
{  Augusto 09/05/2006 - Acerto na passagem dos parametros no erro de regra     }
{                                                                              }
{==============================================================================}
unit uRegraMT;

interface

uses
  Windows, SysUtils, Classes, Forms, registry, uDiasUteis,
  uCmControlObject, VcF1, uFuncoesRegraMT, ADODb, DB, uCMClientDataSet, Dialogs,
  uDataBase, uCtrlRegra, uMensErro, wwQuery, uVersoes, uTiposRegraMT,
  {$IFNDEF VERSAO0505} uCMTypes, uCmFileUtils, {$ENDIF} Provider;
type
  Str10 = String[10];

  { Eventos }
  TOnGetResult = Procedure(Sender:TObject) Of Object;

  {----------------------------------------------------------------------------}
  TRegraMT = class(TComponent)

  private
    { Private declarations }
    CtrlRegraInterna : TCtrlRegra;   { Componente 3 camadas do Regra }

    FOnGetResult     : TOnGetResult;
    FDatabaseName: String;
    FError       : Boolean;
    FReloadRule  : Boolean; { Evento executado a cada registro processado pelo Regra }
    FTipoCliente : TTipoCliente;

    { Metodos de Escrita e Leituras das propriedades }
    function  GetIdcalculo : LongInt;
    procedure SetIdCalculo(const Value : LongInt);
    function  GetIdEmpresa: Integer;
    procedure SetIdEmpresa(const Value : Integer);
    function  GetPassoaPasso: Boolean;
    procedure SetPassoaPasso(const Value : Boolean);
    function  GetPersistente: Boolean;
    procedure SetPersistente(const Value : Boolean);
    procedure SetDataRef(DataRef : Str10);
    function  GetDbConnectionType: TDbConnectionType;
    procedure SetDbConnectionType(const Value : TDbConnectionType);
    function  GetGravaCalculo: Boolean;
    procedure SetGravaCalculo(const Value : Boolean);
    function  GetQueryIn: TwwQuery;
    procedure SetQueryIn(const Value: TwwQuery);

    function  GetResult  : String;
    {------------------------------------------------}

    Procedure MensagemErro( sMessageInfo: string );
    Function  PegaParametro( sIdRegra, sIdCampoVar, sMsg : String ) : String;
    Function  ExibePasso : Boolean;
    function  GetDataRef: Str10;
    function  GetVariaveis(const Name: string): string;
    procedure SetVariaveis(const Name, Value: string);
    procedure SetDatabaseName(const Value: String);
    procedure SetReloadRule(const Value: Boolean);
    procedure SetError(const Value: Boolean);
    function  GetRuleNumber: String;
    procedure SetRuleNumber(const Value: String);
    function  GetTipoCliente: TTipoCliente;
    procedure SetTipoCliente(const Value: TTipoCliente);


  protected
    { Protected declarations }
    FRuleNumber        : String;

    FIdCalculo         : LongInt;
    FIdEmpresa         : Integer;
    FPassoaPasso       : Boolean; { Indica se Regra será Depurada     }
    FPersistente       : Boolean; { Indica se execução será Persistente (Dados gravados no Banco) }
    FGravaCalculo      : Boolean; { Indica se as gravações na DETCALCULO serão efetuadas }
    FDataRef           : Str10;
    FDbConnectionType  : TDbConnectionType;
    FResult            : String;
    FQueryIn           : TwwQuery;

    iProxPasso         : Integer;
    iProxRegra         : Integer;

    FVariaveis  : Array[1..500,1..2] Of String;


  public
    { Public declarations }
    property Result             : String    read GetResult;

    property Variaveis[const Name: string]: string read GetVariaveis write SetVariaveis;

    Constructor Create(AOwner: TComponent); Override;
    Destructor  Destroy; Override;

    Procedure CopiaDataSet;
    Procedure CopiaData( Data : OleVariant );

    Procedure GeraDataSet( sSQL : String );

    Function  Execute : Boolean;

    Procedure CarregaTabuasServico( iTab_Masculino, iTab_Feminino, iTab_Pensao : Integer ); { ClaudioR 26/05/2006 }

  published
    { Published declarations }

    { Propriedades do Componente }
    property RuleNumber   : String   read GetRuleNumber    write SetRuleNumber;
    property IdCalculo    : LongInt  read GetIdCalculo     write SetIdCalculo;
    property IdEmpresa    : Integer  read GetIdEmpresa     write SetIdEmpresa     Default 0;
    property PassoaPasso  : Boolean  read GetPassoaPasso   write SetPassoaPasso   Default False;
    property Persistente  : Boolean  read GetPersistente   write SetPersistente   Default False;
    property GravaCalculo : Boolean  read GetGravaCalculo  write SetGravaCalculo  Default False;
    property ReloadRule   : Boolean  read FReloadRule      write SetReloadRule    Default False;
    property DataRef      : Str10    read GetDataRef       write SetDataRef;
    property DatabaseName : String   read FDatabaseName    write SetDatabaseName;
    property QueryIn      : TwwQuery read GetQueryIn       write SetQueryIn;
    property Error        : Boolean  read FError           write SetError         Default False;
    Property TipoCliente  : TTipoCliente read GetTipoCliente write SetTipoCliente Default tcFundacao;


    property DbConnectionType : TDbConnectionType read GetDbConnectionType write SetDbConnectionType;
    { Eventos }
    property OnGetResult  : TOnGetResult read FOnGetResult write FOnGetResult ;

  end;

procedure Register;

implementation

Uses FInputVarMT, FPassoaPassoMT, dBaseDados, uSistema;


procedure Register;
begin
  RegisterComponents('CM', [TRegraMT]);
end;

{------------------------------------------------------------------------------}
{ Contrutor da Classe TRegraMT. Cria e Inicia Componentes, Consultas           }
Constructor TRegraMT.Create(AOwner: TComponent);
Begin
  { Executa Heranca }
  Inherited Create(AOwner);

  iProxPasso := 0;
  iProxRegra := 0;

  { Cria e inicializa o objeto de controle Regra em tempo de execução }
  If Not (csDesigning in ComponentState) Then Begin
    CtrlRegraInterna := TCtrlRegra.Create;
    CtrlRegraInterna.Initialize( DtmBaseDados.dbBaseDados , True, FDbConnectionType,
                                 cnsServer, nil, false, MensagemErro, Nil );
  End;
end;

{------------------------------------------------------------------------------}
{ Destrutor da Classe TCtrlRegra, Fecha e Libera Componentes etc..             }
Destructor  TRegraMT.Destroy;
begin
  { Libera objeto Regra }
  FreeAndNil( CtrlRegraInterna );

  { Executa Heranca }
  Inherited Destroy;
end;

{------------------------------------------------------------------------------}
{ Métodos de Escrita e Leirura das propriedades                                }
function TRegraMT.GetRuleNumber: String;
begin
  Result := FRuleNumber;
end;

procedure TRegraMT.SetRuleNumber(const Value: String);
begin
  FRuleNumber := Value;
end;

function TRegraMT.GetIdcalculo: LongInt;
begin
  Result := FIdCalculo;
end;

Procedure TRegraMT.SetIdCalculo(const Value: longint);
begin
  FIdCalculo := Value;
end;

function TRegraMT.GetIdEmpresa: Integer;
begin
  Result := FIdEmpresa;
end;
 
procedure TRegraMT.SetIdEmpresa(const Value: Integer);
begin
  FIdEmpresa := Value;
end;

function TRegraMT.GetPassoaPasso: Boolean;
begin
  Result := FPassoaPasso;
end;

procedure TRegraMT.SetPassoaPasso(const Value: Boolean);
begin
  FPassoaPasso := Value;
  { Caso Depurando, seta persistencia }
  If Value = True Then Begin
    SetPersistente(Value);
  End;
end;

function TRegraMT.GetPersistente: Boolean;
begin
  Result := FPassoaPasso;
end;

procedure TRegraMT.SetPersistente(const Value: Boolean);
begin
  FPassoaPasso := Value;
end;

function TRegraMT.GetDataRef: Str10;
begin
  Result := FDataRef;
end;

Procedure TRegraMT.SetDataRef(DataRef:Str10);
begin
  CtrlRegraInterna.DataRef := DataRef;
end;

function TRegraMT.GetQueryIn: TwwQuery;
begin
  Result := FQueryIn;
end;

procedure TRegraMT.SetQueryIn(const Value: TwwQuery);
begin
  FQueryIn := Value;
end;

function TRegraMT.GetGravaCalculo: Boolean;
begin
  Result := FGravaCalculo;
end;

procedure TRegraMT.SetGravaCalculo(const Value: Boolean);
begin
  FGravaCalculo := Value;
end;

function TRegraMT.GetDbConnectionType: TDbConnectionType;
begin
  Result := FDbConnectionType;
end;

procedure TRegraMT.SetDbConnectionType(const Value: TDbConnectionType);
begin
  FDbConnectionType := Value;
end;

function TRegraMT.GetResult: String;
begin
  Result := CtrlRegraInterna.Result;
end;

function TRegraMT.GetVariaveis(const Name: string): string;
Var
  I : Integer;
begin
  Result := '';

  For I := 1 To 500 Do Begin
    If FVariaveis[I,1] = Name Then Begin
      Result := FVariaveis[I,2]
    End;
    { Caso não possua mais variaveis sai fora }
    If FVariaveis[I,1] = '' Then Exit;
  End;
end;

procedure TRegraMT.SetVariaveis(const Name, Value: string);
Var
  I : Integer;
begin
  For I := 1 To 500 Do Begin
    If FVariaveis[I,1] = Name Then Begin
      FVariaveis[I,2] := Value;
    End;

    { Caso não possua mais variaveis sai fora }
    If FVariaveis[I,1] = '' Then Exit;
  End;
end;

procedure TRegraMT.SetDatabaseName(const Value: String);
begin
  FDatabaseName := Value;
end;

procedure TRegraMT.SetReloadRule(const Value: Boolean);
begin
  FReloadRule := Value;
end;

procedure TRegraMT.SetError(const Value: Boolean);
begin
  FError := Value;
end;

function TRegraMT.GetTipoCliente: TTipoCliente;
begin
  Result := FTipoCliente;
end;

procedure TRegraMT.SetTipoCliente(const Value: TTipoCliente);
begin
  FTipoCliente := Value;
end;


{------------------------------------------------------------------------------}

{=================================================================}
{ Este método executa toda a regra cujo "ID" esta na propriedade  }
function TRegraMT.Execute: Boolean;
Var
  I : Integer;
begin

  FError := False;

  { Preenche parametros relevantes }
  CtrlRegraInterna.Executando      := False;

  CtrlRegraInterna.RuleNumber      := FRuleNumber;
  CtrlRegraInterna.GravaCalculo    := FGravaCalculo;
  CtrlRegraInterna.Persistente     := FPersistente;
  CtrlRegraInterna.PassoaPasso     := FPassoaPasso;
  CtrlRegraInterna.IdCalculo       := FIdCalculo;
  CtrlRegraInterna.IdEmpresa       := FIdEmpresa;
  CtrlRegraInterna.TipoCliente     := FTipoCliente;

  CtrlRegraInterna.OnGetResult     := FOnGetResult;

  {----------------------------------------------------------------------------}
  { Loop de Execução                                                           }
  While True do begin

    { Executa Regra }
    CtrlRegraInterna.Execute;

    { Caso tenha ocorrido um erro seta Propriedade e sai fora }
    If CtrlRegraInterna.Error = True Then Begin
      FError := True;
      Break;
    End;

    { Tendo retornado da execução, testa se ainda esta executando a Regra  }
    if CtrlRegraInterna.Executando then begin

      { Pede informação ou mostra mensagem de acordo com parametro }
      if CtrlRegraInterna.AguardandoEntrada then begin
        CtrlRegraInterna.Parametro := PegaParametro( CtrlRegraInterna.RuleNumber,
                                                     CtrlRegraInterna.Variavel,
                                                     CtrlRegraInterna.Mensagem );
      end else if (
                    ( CtrlRegraInterna.RecRegraAtual.iTipoPassoExecutado   = StrToInt(tpOutput) )
                    or
                    ( ( CtrlRegraInterna.RecRegraAtual.iTipoPassoExecutado = StrToInt(tpNone) )
                      and
                      ( CtrlRegraInterna.TipoPassoExecutado                = StrToInt(tpOutput) ) )
                  )
      then begin
        MsgDlg( Trim( CtrlRegraInterna.Mensagem )+ ' ' +
                Trim( CtrlRegraInterna.ConteudoVar ),'Mensagem do Regra',
                mtCustom, [MbOk],0 );
      end;

    end else begin
      { Caso não esteja executando sai fora }
      Break;
    end;

    { Caso esteja executando PassoaPasso mostra interface }
    If CtrlRegraInterna.PassoaPasso Then Begin
      { Caso não queira mais exibir os passos sair }
      If Not ExibePasso Then Break;
    End;

    { Guarda Resultado }
    FResult := CtrlRegraInterna.Result;

  End; { While True }
  {----------------------------------------------------------------------------}


  { Recpera dados do Objeto de Controle }
  FResult    := CtrlRegraInterna.Result;
  FIdCalculo := CtrlRegraInterna.IdCalculo;

  iProxRegra := 0;
  iProxPasso := 0;

end; { Execute }


{ Tratamnto de Erro }
procedure TRegraMT.MensagemErro(sMessageInfo: string);
begin

  { Mostra mensagem de Erro e pergunta se deseja ver os passos da regra }
  If  MsgDlg ('Regra '+ CtrlRegraInterna.RuleNumber +' '+ 'não concluida, o passo '+
              IntToStr(CtrlRegraInterna.NumPassoExecutado)+ ' contem um erro. '+ #13 +
              'Mensagem do sistema: '+ #13 + #13 + sMessageInfo + #13 + #13 +

              'Deseja visualizar o passo ? ',

              'Regra - Erro', mtError, [mbYes, mbNo],0) = idYes
  Then Begin

// Mostra Formulario de Passos

    Try

      CtrlRegraInterna.RecRegraAtual.RuleNumber          := CtrlRegraInterna.RuleNumber;
      CtrlRegraInterna.RecRegraAtual.iNumPassoExecutado  := CtrlRegraInterna.NumPassoExecutado;
      CtrlRegraInterna.RecRegraAtual.iTipoPassoExecutado := CtrlRegraInterna.TipoPassoExecutado;

    Finally

      ExibePasso;

    End

  End;

end; { MensagemErro }


{------------------------------------------------------------------------------}
{ Mostra tela para informar parametro                                          }
function TRegraMT.PegaParametro(sIdRegra, sIdCampoVar,
  sMsg: String): String;
Var
  FrmInputMT : TFrmInputVarMT;
Begin
  Try

    FrmInputMT := TfrmInputVarMT.Create(Self);
    FrmInputMT.Caption := 'Regra '+CtrlRegraInterna.NomeRegra;
    If sMsg = '' Then Begin
      FrmInputMT.LblValor.Caption := 'Informe o valor a ser atribuido à ' + sIdCampoVar
    End Else Begin
      FrmInputMT.LblValor.Caption := sMsg;
    End;

    FrmInputMT.edValor.Text := '0';
    FrmInputMT.ShowModal;

    Result := FrmInputMT.EdValor.Text;
  Finally
    FrmInputMT.Free;
  End;

end; { PegaParametro }

{------------------------------------------------------------------------------}
{ Exibe a tela de depuração da Regra                                           }
Function TRegraMT.ExibePasso :Boolean;
begin
  Result := True;
  { Caso parando em regra especifica, testa se esta é a atual }
  If ( (iProxRegra = 0) Or (StrToInt(CtrlRegraInterna.RuleNumber) = iProxRegra) ) Then Begin

    { Caso parando em passo especifico, testa se este é o atual }
    If ( (iProxPasso = 0) Or (CtrlRegraInterna.NumPassoExecutado >= iProxPasso) ) Then Begin
      Try
        { Cria tela de depuração da Regra }
        FrmPassoAPassoMT := TFrmPassoAPassoMT.Create(Self);
        FrmPassoaPassoMT.RegraLocal := CtrlRegraInterna;

        { Processa informações }
        If iProxPasso > 0 Then Begin
          If iProxRegra > 0 Then
            FrmPassoAPassoMT.PnlUltimo.Caption := IntToStr(iProxRegra)+'/'+
                                                  IntToStr(iProxPasso)
          Else
            FrmPassoAPassoMT.PnlUltimo.Caption := IntToStr(iProxPasso);
        End;
        FrmPassoAPassoMT.EdProxPasso.Clear;
        iProxPasso := 0;

        If iProxPasso <> 0 Then Begin
          FrmPassoAPassoMT.EdProxPasso.Text := IntToStr(iProxRegra)+'/'+
                                               IntToStr(iProxPasso);
        End;

        { Mostra tela de Depuração da Regra }
        FrmPassoAPassoMT.ShowModal;

        { Caso usuário tenha excolhido não ver mais tela de Debug }
        If FrmPassoAPassoMT.Resultado = 2 Then Begin
          Result := False;
        End;

        { Guarda dados alteraveis na Tela }
        If Trim(FrmPassoAPassoMT.EdProxPasso.Text) <> '' Then Begin
          { Caso seja apenas passo sem "/" }
          If Pos('/', FrmPassoAPassoMT.EdProxPasso.Text) = 0 Then Begin
            iProxRegra := 0;
            iProxPasso := StrToInt(FrmPassoAPassoMT.EdProxPasso.Text)
          End Else Begin
            { Caso seja Regra "/" Passo }
            iProxRegra := StrToInt(Copy(FrmPassoAPassoMT.EdProxPasso.Text,1,
                                        (Pos('/',FrmPassoAPassoMT.EdProxPasso.Text)-1)));
            iProxPasso := StrToInt(Copy(FrmPassoAPassoMT.EdProxPasso.Text,
                                        (Pos('/',FrmPassoAPassoMT.EdProxPasso.Text)+1),
                                        Length(FrmPassoAPassoMT.EdProxPasso.Text)));
          End;
        End Else Begin
          iProxPasso := 0;
        End;

      Finally
        FrmPassoaPassoMT.Free;
      End;

    End;

  End;

end;

{------------------------------------------------------------------------------}
{ Transporta dados da Query de entrada para o ClientDataSet que servirá ao     }
{ CtrlObject do Regra 3C.                                                      }
procedure TRegraMT.CopiaDataSet;
Var
  PrvRegra : TProvider;
  CdsRegra : TCMClientDataSet;
  I : Integer;
begin
  { Passagem dos dados do Regra (Query) para DataPack do CtrlRegra }
  If (FQueryIn <> Nil)  Then Begin
    PrvRegra := TProvider.Create(Self);
    CdsRegra := TCMClientDataSet.Create(Self);
    Try
      PrvRegra.DataSet := FQueryIn;
      CdsRegra.SetProvider(PrvRegra);

      CdsRegra.Open;

      CtrlRegraInterna.CopiaData(CdsRegra.Data); { Passa dados para o ControlRegra }

      CdsRegra.Close;
    Finally
      { Fecha e Libera objetos locais }
      FreeAndNil( PrvRegra );
      FreeAndNil( CdsRegra );
    End;
  End;
end;

{------------------------------------------------------------------------------}
{ Transfere string com o SQL que servirá ao CtrlObject do Regra 3C.            }
procedure TRegraMT.GeraDataSet(sSQL: String);
begin
  CtrlRegraInterna.GeraDataSet( sSQL );
end;

procedure TRegraMT.CopiaData(Data: OleVariant);
begin

  CtrlRegraInterna.CopiaData( Data ); { Passa dados para o ControlRegra }

end;

procedure TRegraMT.CarregaTabuasServico(iTab_Masculino, iTab_Feminino, iTab_Pensao: Integer);
begin

  CtrlRegraInterna.CarregaTabuasServico( iTab_Masculino, iTab_Feminino, iTab_Pensao ); { Passa dados para o ControlRegra }
  
end;



end.
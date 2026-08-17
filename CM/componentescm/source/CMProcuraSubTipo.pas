{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit CMProcuraSubTipo;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, mask, buttons, extctrls, db, dbctrls, uMensErro,
  MontaSelect, dsgnintf, uCmTypes, uCMSqlParams, DbClient;

type
  TCampoEdit = (ceRazaoSocial, ceNome);

  TMensagens = class(TPersistent)
  private
    FMsgEmBranco,
    FMsgNaoExiste : string;
    procedure SetMsgEmBranco(m:string);
    procedure SetMsgNaoExiste(m:string);
  published
    property EmBranco: string read FMsgEmBranco write SetMsgEmBranco ;
    property NaoExiste: string read FMsgNaoExiste write SetMsgNaoExiste ;
  end;

    TSubTipoReg = class(TPersistent)
    private
       FRazaoSocial,
       FNome,
       FDocumento : string;
       FId : longint;
    published
       property RazaoSocial : string read FRazaoSocial ;
       property Nome : string read FNome  ;
       property Documento : string read FDocumento  ;
       property Id : LongInt read FId ;
    end;

  TCMCustomProcuraSubTipo = class(TGroupBox)
  private
    { Private declarations }
    FBevel : TBevel;
    FBtn : TBitBtn;
    FPanelEdit : TPanel;
    FEdit : TMaskEdit;
    FDataLink : TDataLink;
    FDataField : TFieldDataLink;
    FOnChange,
    FOnApertouBotao,
    FOnExit : TNotifyEvent;
    FMostraMensagens,
    FPermiteChaveInvalida,
    FPermiteChaveEmBranco : boolean;
    FValida : TValida;
    FMontaSelect : TMontaSelect;
    FMensagens : TMensagens;
    FSubTipoReg : TSubTipoReg;
    FProcura : boolean;
    FCampoEdit : TCampoEdit;
    FIdEmpresaProp : string;
    procedure Clicou(Sender: TObject);
    procedure Mudou(Sender: TObject);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure MudouDado(Sender: TObject);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value:TDataSource);
    function GetDataField: string;
    procedure SetDataField(const Value: string);
    function GetText: string;
    procedure SetText(const Value: string);
    procedure SetCampoEdit(c: TCampoEdit);
    procedure Mens(m:string);
    procedure FazLookup(Id : integer);
  protected
    { Protected declarations }
    _SqlLookupParams, _NSqlLookupParams: TCMSqlParams;
    _LookupCds, _NLookupCds: TClientDataSet;

    property OnApertouBotao: TNotifyEvent read FOnApertouBotao write FOnApertouBotao;
    property OnExit: TNotifyEvent read FOnExit write FOnExit;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property SubTipoReg: TSubTipoReg read FSubTipoReg write FSubTipoReg;
    property IdEmpresaProp : string read FIdEmpresaProp write FIdEmpresaProp;
    procedure ApertouBotao; virtual;
    procedure MudouEdit; virtual;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    function CriaMontaSelect : TMontaSelect;
  public
    { Public declarations }
    property Text : string read GetText write SetText;
    property MontaSelect: TMontaSelect read FMontaSelect write FMontaSelect ;
    constructor create(AOwner:TComponent); override;
    destructor Destroy; override;
    function Valida : TValida; virtual;
  published
    { Published declarations }
    property CampoEdit : TCampoEdit read FCampoEdit write SetCampoEdit ;
    property MostraMensagens: boolean read FMostraMensagens write FMostraMensagens ;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: string read GetDataField write SetDataField;
    property Mensagens : TMensagens read FMensagens write FMensagens;
    property PermiteChaveInvalida: boolean read FPermiteChaveInvalida write FPermiteChaveInvalida ;
    property PermiteChaveEmBranco: boolean read FPermiteChaveEmBranco write FPermiteChaveEmBranco ;
  end;

  TCMProcuraSubTipo = class(TCMCustomProcuraSubTipo)
  private
    FSubTipo : TSubTipo;
    FFiltraSubTipo : boolean;
    procedure SetSubTipo(SubTipo : TSubTipo);
    procedure SetFiltraSubTipo(b : boolean);
  public
    { Public declarations }
    constructor create(AOwner:TComponent); override;
    destructor Destroy; override;
    property SubTipoReg;
  protected

  published
    { Public declarations }
    property OnApertouBotao;
    property SubTipo        :TSubTipo read FSubTipo        write SetSubTipo;
    property FiltraSubTipo  :boolean  read FFiltraSubTipo  write SetFiltraSubTipo;
  end;

// TCMProcuraForCli
    TForCli = (fcFornecedor, fcCliente);
    TStatusForCli = (fcAtivo, fcInativo, fcAll);

    TForCliReg = class(TSubTipoReg)
    private
       FCContabil, FSubConta, FCentroCusto,
       FCAdiantamento, FCReceita, FCDespesa, FUnidNegoc : string;
    public
       property CContabil : string read FCContabil ;
       property SubConta : string read FSubConta ;
       property CentroCusto : string read FCentroCusto ;
       property CAdiantamento : string read FCAdiantamento ;
       property CReceita : string read FCReceita ;
       property CDespesa : string read FCDespesa;
       property UnidNegoc : string read FUnidNegoc;
    end;

  TCMProcuraForCli = class(TCMCustomProcuraSubTipo)
  private
     FForCli : TForCli;
     FForCliReg : TForCliReg;
     FMostraEndereco : boolean;
    FStatusForCli: TStatusForCli;
    FMostraStatusCredito: Boolean;
     procedure SetForCli(s : TForCli);
     procedure SetMostraEndereco(b : boolean);
    procedure SetStatusForCli(const Value: TStatusForCli);
    procedure SetMostraStatusCredito(const Value: Boolean);
  protected
    procedure ApertouBotao; override;
  public
    { Public declarations }
    constructor create(AOwner:TComponent); override;
    destructor Destroy; override;
    property ForCliReg : TForCliReg read FForCliReg write FForCliReg;
    function Valida : TValida; override;
  published
    property OnApertouBotao;
    property OnChange;
    property ForCli : TForCli read FForCli write SetForCli;
    property MostraEndereco: boolean read FMostraEndereco write SetMostraEndereco;
    property StatusForCli :TStatusForCli read FStatusForCli write SetStatusForCli;
    property MostraStatusCredito: Boolean read FMostraStatusCredito write SetMostraStatusCredito;
    {FLGSITCREDITO}

  end;

implementation

uses uSistema;

// TCMCustomProcuraSubTipo
constructor TCMCustomProcuraSubTipo.Create(AOwner : TComponent);
begin
     inherited;
     Height := 50;

     if (csDesigning in ComponentState) Or (Sistema = nil) then
        FIdEmpresaProp := '0'
     else
        FIdEmpresaProp := IntToStr(Sistema.IdEmpresa);

     FSubTipoReg := TSubTipoReg.Create;
     FDataLink := TDataLink.Create;
     FDataField := TFieldDataLink.Create;
     FDataField.OnDataChange := MudouDado;
     FValida := vcSemTeste;
     FPermiteChaveInvalida := false;
     FPermiteChaveEmBranco := false;
     FMostraMensagens := true;
     FMensagens := TMensagens.Create;
     FMensagens.EmBranco := '';
     FMensagens.NaoExiste := '';

     FPanelEdit := TPanel.Create(self);
     with FPanelEdit do
     begin
          Font.Style := [fsBold];
          Parent := self;
          height := 27;
          BevelOuter := bvNone;
     end;
     FBevel := TBevel.Create(FPanelEdit);
     with FBevel do
     begin
          Parent := FPanelEdit;
          Shape := bsFrame;
          Top := 0;
          Left := 5;
          Height := 27;
     end;
     FEdit := TMaskEdit.Create(self);
     with FEdit do
     begin
          Parent := FPanelEdit;
          Top := FBevel.Top+3;
          Left := FBevel.Left+3;
          Font.Style := [];
          OnChange := Mudou;
          TabOrder := 0;
          AutoSelect := false;
          TabStop := true;
     end;

     FBtn := TBitBtn.Create(self);
     with FBtn do
     begin
          Parent := FPanelEdit;
          Top    := FBevel.Top;
          Height := FBevel.Height;
          width := Height;
          Glyph.LoadFromResourceName(HINSTANCE,'Botao');
          TabOrder := 1;
     end;
     FBtn.OnClick := Clicou;

     MontaSelect := CriaMontaSelect;

     _LookupCds := TClientDataSet.Create(Self);
     _NLookupCds := TClientDataSet.Create(Self);

     _SqlLookupParams := TCMSqlParams.Create(Self);
     _SqlLookupParams.ClientDataSet := _LookupCds;

     _NSqlLookupParams := TCMSqlParams.Create(Self);
     _NSqlLookupParams.ClientDataSet := _NLookupCds;
end;

destructor TCMCustomProcuraSubTipo.Destroy;
begin
     FDataField.free;
     FDataLink.free;
     FMensagens.Free;
     FBevel.free;
     FEdit.free;
     FBtn.free;
     FPanelEdit.free;
     FSubTipoReg.free;

     _LookupCds.free;
     _NLookupCds.free;
     _SqlLookupParams.free;
     _NSqlLookupParams.free;

     inherited;
end;

procedure TMensagens.SetMsgEmBranco(m:string);
begin
     if trim(m) = '' then
        m := 'Chave não pode estar em branco';
     if m <> FMsgEmBranco then
     begin
          FMsgEmBranco := m;
     end;
end;

procedure TMensagens.SetMsgNaoExiste(m:string);
begin
     if trim(m) = '' then
        m := 'Chave não existe';
     if m <> FMsgNaoExiste then
     begin
          FMsgNaoExiste := m;
     end;
end;

procedure TCMCustomProcuraSubTipo.WMSize(var Message: TWMSize);
begin
     FpanelEdit.Align := AlTop;
     FBevel.width := width-45;
     FEdit.width  := width-51;
     FBtn.Left    := width-35;
     Invalidate;
end;

function TCMCustomProcuraSubTipo.CriaMontaSelect : TMontaSelect;
begin
     Result := TMontaSelect.Create(self);
     with Result do
     begin
          RepeteConsulta := True;

          CamposChave.Add('PESSOA.IDPESSOA');
          Colunas.Add('PESSOA.RAZAOSOCIAL');
          Colunas.Add('PESSOA.NOME');
          Colunas.Add('PESSOA.NUMDOCUMENTO');
          Colunas.Add('PESSOA.IDPESSOA');

          Descricao.Add('Razão Social');
          Descricao.Add('Nome');
          Descricao.Add('Documento');
          Descricao.Add('Identificador');

          Larguras.Add('40');
          Larguras.Add('40');
          Larguras.Add('18');
          Larguras.Add('10');

          Mascaras.Add('');
          Mascaras.Add('');
          Mascaras.Add('');
          Mascaras.Add('');

          Tabelas.Add('PESSOA');

          TipodeDado.Add('C');
          TipodeDado.Add('C');
          TipodeDado.Add('C');
          TipodeDado.Add('N');          
     end;
end;

function TCMCustomProcuraSubTipo.GetDataSource: TDataSource;
begin
     Result := FDataLink.DataSource;
end;

procedure TCMCustomProcuraSubTipo.SetDataSource(Value: TDataSource);
begin
     if Value <> FDataLink.DataSource then
     begin
          FDataLink.DataSource := value;
          FDataField.DataSource := Value;
     end;
end;

procedure TCMCustomProcuraSubTipo.Clicou(Sender: TObject);
begin
     if Assigned(FOnApertouBotao) then FOnApertouBotao(self);
     ApertouBotao;
end;

procedure TCMCustomProcuraSubTipo.ApertouBotao;
begin

     while FMontaSelect.SensivelACaixa.count < FMontaSelect.Colunas.count do
           FMontaSelect.SensivelACaixa.Add('');

     If (Sistema <> nil) And (Sistema.SoUpperPessoa) Then
     Begin
        FMontaSelect.SensivelACaixa[0] := 'S';
        FMontaSelect.SensivelACaixa[1] := 'S';
        FMontaSelect.SensivelACaixa[2] := 'S';
     End;

     FMontaSelect.Executar;
     if FMontaSelect.RetornouValor then
     begin
          FazLookup(StrToInt(FMontaSelect.ValoresChave[0]));
          FProcura := true;
          Valida;
     end;
     if FEdit.CanFocus then
        FEdit.SetFocus;
end;

procedure TCMCustomProcuraSubTipo.FazLookup(Id : integer);
begin
    If _LookupCds.Active Then _LookupCds.Close;
    _SqlLookupParams.Prepare;
    _SqlLookupParams.ParamByName('iIdPessoa').AsInteger := Id;
    _SqlLookupParams.Open;

    if fCampoEdit = ceNome then
      FEdit.Text := (_LookupCds.FieldByName('NOME').AsString)
    else
      FEdit.Text := (_LookupCds.FieldByName('RAZAOSOCIAL').AsString);
end;

procedure TCMCustomProcuraSubTipo.MudouDado(Sender: TObject);
begin
     if FDataField.Field <> nil then
        FazLookup(FDataField.Field.AsInteger);
end;

procedure TCMCustomProcuraSubTipo.Mudou(Sender: TObject);
begin
     if Assigned(FOnChange) then FOnChange(Self);
     MudouEdit;
end;

procedure TCMCustomProcuraSubTipo.WMSetFocus(var Message: TWMSetFocus);
begin
     if FEdit.CanFocus then
        FEdit.SetFocus;
end;

procedure TCMCustomProcuraSubTipo.MudouEdit;
begin
     FSubTipoReg.FRazaoSocial := '';
     FSubTipoReg.FNome        := '';
     FSubTipoReg.FDocumento   := '';
     FSubTipoReg.FId          := 0;
     FProcura := false;

     if FEdit.Text = '' then
     Begin
       if FDataField.Editing then FDataField.Field.Clear;

        FMontaSelect.ItemsBusca.clear
     End
     else
     begin
          if FMontaSelect.ItemsBusca.count = 0 then
             FMontaSelect.ItemsBusca.Add('');

          If (Sistema <> nil) And Sistema.SoUpperPessoa Then
             FMontaSelect.ItemsBusca[0] := AnsiUpperCase(FEdit.Text)
          Else
             FMontaSelect.ItemsBusca[0] := AnsiLowerCase(FEdit.Text);
     end;
end;

function TCMCustomProcuraSubTipo.Valida : TValida;
begin
     FValida := vcSemTeste;
     if (_LookupCds <> nil) and not (csLoading in ComponentState) then
     begin
          if not FProcura then
          begin
               _NSqlLookupParams.Prepare;
               _NSqlLookupParams.ParamByName('sNome').AsString := FEdit.Text;
               _NSqlLookupParams.Open;

               if FEdit.Text = '' then
               begin
                    if FPermiteChaveEmBranco then
                       FValida := vcOk
                    else
                        FValida := vcEmBranco;
               end
               else
               begin
                    if _NLookupCds.IsEmpty then
                         FValida := vcNaoExiste
                    else if _NLookupCds.RecordCount = 1 then // Verifica se existem nomes iguais
                         FValida := vcOk
                    else
                    begin
                         ApertouBotao;
                         Result := FValida;
                         exit;
                    end;
               end;
               if (FValida = vcOk) then
               begin
                    FSubTipoReg.FRazaoSocial := _NLookupCds.FieldByName('RAZAOSOCIAL').AsString;
                    FSubTipoReg.FNome        := _NLookupCds.FieldByName('NOME').AsString;
                    FSubTipoReg.FDocumento   := _NLookupCds.FieldByName('NUMDOCUMENTO').AsString;
                    FSubTipoReg.FId          := _NLookupCds.FieldByName('IDPESSOA').AsInteger;

                    _SqlLookupParams.Prepare;
                    _SqlLookupParams.ParamByName('iIdPessoa').AsInteger := _NLookupCds.FieldByName('IDPESSOA').AsInteger;
                    _SqlLookupParams.Open;
               end;
          end
          else
          begin
               FValida := vcOk;
               FSubTipoReg.FRazaoSocial := _LookupCds.FieldByName('RAZAOSOCIAL').AsString;
               FSubTipoReg.FNome        := _LookupCds.FieldByName('NOME').AsString;
               FSubTipoReg.FDocumento   := _LookupCds.FieldByName('NUMDOCUMENTO').AsString;
               FSubTipoReg.FId          := _LookupCds.FieldByName('IDPESSOA').AsInteger;
          end;
     end;

     if (FValida = vcEmBranco) then
     begin
          if (not FPermiteChaveEmBranco) then
          begin
               Mens(FMensagens.EmBranco);

               if (Owner Is TForm) And (Tform(Owner).Visible) And FEdit.CanFocus then
                  FEdit.SetFocus;
          end;
     end
     else
         if (not FPermiteChaveInvalida) and (FValida <> vcOk) then
         begin
              Mens(FMensagens.NaoExiste);
              if (Owner Is TForm) And (Tform(Owner).Visible) And FEdit.CanFocus then
                 FEdit.SetFocus;
         end;

     if FDataField.Editing then
        FDataField.Field.Value := FSubTipoReg.Id
     else if (FDataField.Active) and (FDataField.Field.Value <> null) then
          FazLookup(FDataField.Field.Value);

     Result := FValida;
end;

function TCMCustomProcuraSubTipo.GetDataField: string;
begin
  Result := FDataField.FieldName;
end;

procedure TCMCustomProcuraSubTipo.SetDataField(const Value: string);
begin
  FDataField.FieldName := Value;
end;

function TCMCustomProcuraSubTipo.GetText: string;
begin
     Result := FEdit.Text;
end;

procedure TCMCustomProcuraSubTipo.SetText(const Value: string);
begin
     FEdit.Text := Value;
end;

procedure TCMCustomProcuraSubTipo.Mens(m : string);
begin
     if (FMostraMensagens) and
        (not(csDesigning in ComponentState))
        then
        Msgdlg(m, FEdit.EditText, mtWarning,[mbOk],0);
end;

procedure TCMCustomProcuraSubTipo.SetCampoEdit(c: TCampoEdit);
begin
     FCampoEdit := c;
     with FMontaSelect do
     begin
          if FCampoEdit = ceNome then
          begin
               Colunas[0] := ('PESSOA.NOME');
               Colunas[1] := ('PESSOA.RAZAOSOCIAL');
               Descricao[0] := ('Nome');
               Descricao[1] := ('Razão Social');
          end
          else
          begin
               Colunas[0] := 'PESSOA.RAZAOSOCIAL';
               Colunas[1] := 'PESSOA.NOME';
               Descricao[0] := 'Razão Social';
               Descricao[1] := 'Nome';
          end;
     end;
end;

// TCMProcuraSubTipo
constructor TCMProcuraSubTipo.Create(AOwner : TComponent);
begin
  inherited;
  FFiltraSubTipo  := true;
end;

destructor TCMProcuraSubTipo.Destroy;
begin
  MontaSelect.free;
  inherited;
end;

procedure TCMProcuraSubTipo.SetFiltraSubTipo(b : boolean);
begin
     FFiltraSubTipo := b;
     SetSubTipo(FSubTipo);
end;

procedure TCMProcuraSubTipo.SetSubTipo(SubTipo : TSubTipo);
begin
     FSubTipo := SubTipo;
     with _LookupCds do
     begin
          If Active Then close;

          _SqlLookupParams.SQL.clear;
          if FFiltraSubTipo then
          begin
               _SqlLookupParams.SQL.Add('SELECT S.'+ListaSubTipo[FSubTipo].CampoId+', P.RAZAOSOCIAL, P.NOME, P.IDPESSOA, P.NUMDOCUMENTO ');
               _SqlLookupParams.SQL.Add('FROM PESSOA P, '+ListaSubTipo[FSubTipo].Tabela+' S');
               _SqlLookupParams.SQL.Add('WHERE (S.'+ListaSubTipo[FSubTipo].CampoId+' = :iIdPessoa) AND (P.IDPESSOA = S.'+ListaSubTipo[FSubTipo].CampoId+')');
          end
          else
          begin
               _SqlLookupParams.SQL.Add('SELECT P.RAZAOSOCIAL, P.NOME, P.IDPESSOA, P.NUMDOCUMENTO ');
               _SqlLookupParams.SQL.Add('FROM PESSOA P');
               _SqlLookupParams.SQL.Add('WHERE (P.IDPESSOA = :iIdPessoa)');
          end;

          _SqlLookupParams.Prepare;
     end;

     with _NLookupCds do
     begin
          If Active Then close;
          _NSqlLookupParams.SQL.clear;
          if FFiltraSubTipo then
          begin
               _NSqlLookupParams.SQL.Add('SELECT S.'+ListaSubTipo[FSubTipo].CampoId+', P.RAZAOSOCIAL, P.NOME, P.IDPESSOA, P.NUMDOCUMENTO ');
               _NSqlLookupParams.SQL.Add('FROM PESSOA P, '+ListaSubTipo[FSubTipo].Tabela+' S');

               if FCampoEdit = ceNome then
                  _NSqlLookupParams.SQL.Add('WHERE (P.NOME = :sNome) AND (P.IDPESSOA = S.'+ListaSubTipo[FSubTipo].CampoId+')')
               else
                  _NSqlLookupParams.SQL.Add('WHERE (P.RAZAOSOCIAL = :sNome) AND (P.IDPESSOA = S.'+ListaSubTipo[FSubTipo].CampoId+')');
          end
          else
          begin
               _NSqlLookupParams.SQL.Add('SELECT P.RAZAOSOCIAL, P.NOME, P.IDPESSOA, P.NUMDOCUMENTO ');
               _NSqlLookupParams.SQL.Add('FROM PESSOA P');
               if FCampoEdit = ceNome then
                  _NSqlLookupParams.SQL.Add('WHERE (P.NOME = :sNome)')
               else
                  _NSqlLookupParams.SQL.Add('WHERE (P.RAZAOSOCIAL = :sNome)');
          end;

          _NSqlLookupParams.Prepare;
     end;

     with FMontaSelect do
     begin
          Filtro.Clear;



          Tabelas.Clear;
          Tabelas.Add('PESSOA');

          if FFiltraSubTipo then
          begin
               Filtro.Add('PESSOA.IDPESSOA = '+ListaSubTipo[FSubTipo].Tabela+'.'+ ListaSubTipo[FSubTipo].CampoId);
               Tabelas.Add(ListaSubTipo[FSubTipo].Tabela);
          end;
     end;
end;

// TCMProcuraForCli
constructor TCMProcuraForCli.Create(AOwner : TComponent);
begin
  inherited;
  FMostraStatusCredito := False;
    
  FForCliReg      := TForCliReg.Create;

  if (csDesigning in ComponentState) OR (Sistema = nil) then
    FMostraEndereco := false
  Else
    FMostraEndereco := false or Sistema.UsaEnderecoPessoa;

  fStatusForCli := fcAll;
end;

destructor TCMProcuraForCli.Destroy;
begin
    FForCliReg.free;
    inherited;
end;

procedure TCMProcuraForCli.SetMostraEndereco(b : boolean);
begin
     if (csDesigning in ComponentState) Or (Sistema = nil) then
        FMostraEndereco := b
     Else
        FMostraEndereco := b or Sistema.UsaEnderecoPessoa;
        
     MontaSelect := CriaMontaSelect;
end;

function TCMProcuraForCli.Valida : TValida;
begin
     Result := inherited Valida;
     if not (csLoading in ComponentState) and (Result = vcOk)then
     begin
          with FForCliReg do
          begin
               FRazaoSocial   := _LookupCds.FieldByName('RAZAOSOCIAL').AsString;
               FNome          := _LookupCds.FieldByName('NOME').AsString;
               FDocumento     := _LookupCds.FieldByName('NUMDOCUMENTO').AsString;
               FId            := _LookupCds.FieldByName('IDPESSOA').AsInteger;
               FSubConta      := _LookupCds.FieldByName('CODSUBCONTA').AsString;
               FCentroCusto   := _LookupCds.FieldByName('CODCENTROCUSTO').AsString;
               FCAdiantamento := _LookupCds.FieldByName('CONTACADIANTAMENTO').AsString;
               FUnidNegoc     := _LookupCds.FieldByName('UNIDNEGOC').AsString;

               If Trim(FUnidNegoc) = '' Then FUnidNegoc := '0';


               if FForCLi = fcCliente then
               begin
                    FCContabil := _LookupCds.FieldByName('CONTACCLIENTE').AsString;
                    FCReceita  := _LookupCds.FieldByName('CONTACRECEITA').AsString;
                    FCDespesa  := '';
               end
               else
               if FForCLi = fcFornecedor then
               begin
                    FCContabil := _LookupCds.FieldByName('CONTACFORN').AsString;
                    FCReceita  := '';
                    FCDespesa  := _LookupCds.FieldByName('CONTACDESPESA').AsString;
               end;
          end;
     end;
end;

procedure TCMProcuraForCli.ApertouBotao;
Var
  iNumMaxCol: Integer;
begin
     with MontaSelect do
     begin
          while Filtro.count < 4 do
                Filtro.Add('');

          while Tabelas.count < 3 do
                Tabelas.Append('');

          Case FForCli of
           fcCliente:
           Begin
                Filtro[0]  := '(EMPRESACLIENTE.IDPESSOA='+IdEmpresaProp+')';
                Filtro[1]  := '(PESSOA.IDPESSOA=EMPRESACLIENTE.IDFORCLI)';
                Filtro[2]  := '(PESSOA.IDPESSOA=CLIENTEPESS.IDPESSOA)';
                Case fStatusForCli Of
                   fcAtivo : Filtro[3]   := '  (EMPRESACLIENTE.FLGSTATUS = ''A'' OR EMPRESACLIENTE.FLGSTATUS IS NULL)';
                   fcInativo : Filtro[3] := '  (EMPRESACLIENTE.FLGSTATUS = ''I'')';
                End;
                Tabelas[1] := 'EMPRESACLIENTE';
                Tabelas[2] := 'CLIENTEPESS';
           End;
           fcFornecedor:
           begin
                Filtro[0]  := '(EMPRESAFORN.IDPESSOA='+IdEmpresaProp+')';
                Filtro[1]  := '(PESSOA.IDPESSOA=EMPRESAFORN.IDFORCLI)';
                Filtro[2]  := '(PESSOA.IDPESSOA=FORNSERV.IDPESSOA)';
                Case fStatusForCli Of
                   fcAtivo : Filtro[3]   :='  (EMPRESAFORN.FLGSTATUS = ''A'' OR EMPRESAFORN.FLGSTATUS IS NULL)';
                   fcInativo : Filtro[3] :='  (EMPRESAFORN.FLGSTATUS = ''I'')';
                End;
                Tabelas[1] := 'EMPRESAFORN';
                Tabelas[2] := 'FORNSERV';
           end;
          End;

          if FMostraEndereco then
          begin
               while Filtro.Count < 8 do
                     Filtro.Add('');
               Filtro[4] := '(ENDPESS.IDENDERECO(+) = PESSOA.IDENDCOMERCIAL)';
               Filtro[5] := '(CIDADES.IDCIDADES(+) = ENDPESS.IDCIDADES)';
               Filtro[6] := '(ESTADO.IDESTADO(+) = CIDADES.IDESTADO)';
               Filtro[7] := '(PAIS.IDPAIS(+) = ESTADO.IDPAIS)';

               while Tabelas.count < 7 do  Tabelas.Add('');

               Tabelas[3] := 'ENDPESS';
               Tabelas[4] := 'CIDADES';
               Tabelas[5] := 'ESTADO';
               Tabelas[6] := 'PAIS';

               while Colunas.count < 8 do
               begin
                     Colunas.Add('');
                     Descricao.Add('');
                     Mascaras.Add('');
                     TipodeDado.Add('C');
               end;

              Case FForCli of
               fcCliente:
               Begin
                   Colunas[3] := 'CLIENTEPESS.CODCLIENTE';
                   Descricao[3] := 'Código Correspondente';
               End;
               fcFornecedor:
               begin
                   Colunas[3] := 'FORNSERV.CODCORRESP';
                   Descricao[3] := 'Código Correspondente';
               end;
              End;

              Colunas[4] := 'ENDPESS.LOGRADOURO';
              Colunas[5] := 'CIDADES.NOME';
              Colunas[6] := 'ESTADO.CODESTADO';
              Colunas[7] := 'PAIS.NOMEPAIS';

              Descricao[4] := 'Logradouro';
              Descricao[5] := 'Cidade';
              Descricao[6] := 'UF';
              Descricao[7] := 'Pais';

              If ( FForCli = fcCliente ) And
                 ( FMostraStatusCredito ) And
                 ( Colunas.count < 9 ) Then
              Begin
                 Colunas.Add('DECODE(EMPRESACLIENTE.FLGSITCREDITO,''L'',''Liberado'', ( DECODE(EMPRESACLIENTE.FLGSITCREDITO,''B'',''Bloqueado Pelo Hotel'', ( DECODE(EMPRESACLIENTE.FLGSITCREDITO,''M'',''Bloqueado Pela Matriz'', EMPRESACLIENTE.FLGSITCREDITO ) ) ) ) )');
                 Descricao.Add('Status Crédito');
                 Mascaras.Add('');
                 TipodeDado.Add('C');
              end;
          end
          else
          begin
               while Filtro.Count > 3 do
                     Filtro.Delete(3);

               while Tabelas.Count > 3 do
                     Tabelas.Delete(3);

               If ( FForCli = fcCliente ) And ( FMostraStatusCredito ) Then
                  iNumMaxCol := 4
               Else
                  iNumMaxCol := 3;

               while Colunas.Count > iNumMaxCol do
               begin
                    Colunas.Delete(iNumMaxCol);
                    Descricao.Delete(iNumMaxCol);
                    Mascaras.Delete(iNumMaxCol);
                    TipodeDado.Delete(iNumMaxCol);
               end;

               while Colunas.count < 4 do
               begin
                     Colunas.Add('');
                     Descricao.Add('');
                     Mascaras.Add('');
                     TipodeDado.Add('C');
               end;

               Case FForCli of
                fcCliente:
                Begin
                    Colunas[3] := 'CLIENTEPESS.CODCLIENTE';
                    Descricao[3] := 'Código Correspondente';
                End;
                fcFornecedor:
                begin
                    Colunas[3] := 'FORNSERV.CODCORRESP';
                    Descricao[3] := 'Código Correspondente';
                end;
               End;

               If ( FForCli = fcCliente ) And
                  ( FMostraStatusCredito ) And
                  ( Colunas.count < 5 ) Then
               Begin
                  Colunas.Add('DECODE(EMPRESACLIENTE.FLGSITCREDITO,''L'',''Liberado'', ( DECODE(EMPRESACLIENTE.FLGSITCREDITO,''B'',''Bloqueado Pelo Hotel'', ( DECODE(EMPRESACLIENTE.FLGSITCREDITO,''M'',''Bloqueado Pela Matriz'', EMPRESACLIENTE.FLGSITCREDITO ) ) ) ) )');
                  Descricao.Add('Status Crédito');
                  Mascaras.Add('');
                  TipodeDado.Add('C');
               end;
          end;

          If (Filtro.Count > 3) And (Trim(Filtro[3]) = '') Then Filtro.Delete(3)
     end;



     inherited;
end;

procedure TCMProcuraForCli.SetForCli(s : TForCli);
Var
   sFiltroStatus :String;
begin
     FForCli := s;

     Case s Of
       fcCliente:
       Begin
          Case fStatusForCli Of
            fcAtivo : sFiltroStatus := ' AND (C.FLGSTATUS = ''A'' OR C.FLGSTATUS IS NULL)';
            fcInativo : sFiltroStatus := ' AND (C.FLGSTATUS = ''I'')';
            fcAll : sFiltroStatus := '';
          End;
       End;
       fcFornecedor:
       Begin
          Case fStatusForCli Of
            fcAtivo : sFiltroStatus := ' AND (F.FLGSTATUS = ''A'' OR F.FLGSTATUS IS NULL)';
            fcInativo : sFiltroStatus := ' AND (F.FLGSTATUS = ''I'')';
            fcAll : sFiltroStatus := '';
          End;
       End;
     End;


     with _LookupCds do
     begin
          If Active Then close;
          _SqlLookupParams.Sql.clear;

          if s = fcCliente then
          begin
               _SqlLookupParams.Sql.Add('SELECT P.RAZAOSOCIAL, P.NOME, P.IDPESSOA, P.NUMDOCUMENTO, ');
               _SqlLookupParams.Sql.Add('C.IDFORCLI, C.CONTACCLIENTE, C.CODSUBCONTA, C.CODCENTROCUSTO, C.CONTACADIANTAMENTO, C.CONTACRECEITA, C.IDPESSOA, C.UNIDNEGOC ');
               _SqlLookupParams.Sql.Add('FROM PESSOA P, EMPRESACLIENTE C ');
               _SqlLookupParams.Sql.Add('WHERE (C.IDFORCLI = :iIdPessoa) AND (P.IDPESSOA = C.IDFORCLI) AND (C.IDPESSOA = '+IdEmpresaProp+')' + sFiltroStatus);

          end
          else
          if s = fcFornecedor then
          begin
                _SqlLookupParams.Sql.Add('SELECT P.RAZAOSOCIAL, P.NOME, P.IDPESSOA, P.NUMDOCUMENTO, ');
                _SqlLookupParams.Sql.Add('F.IDFORCLI, F.CONTACFORN, F.CODSUBCONTA, F.CODCENTROCUSTO, F.CONTACADIANTAMENTO, F.CONTACDESPESA, F.IDPESSOA, F.UNIDNEGOC ');
                _SqlLookupParams.Sql.Add('FROM PESSOA P, EMPRESAFORN F ');
                _SqlLookupParams.Sql.Add('WHERE (F.IDFORCLI = :iIdPessoa) AND (P.IDPESSOA = F.IDFORCLI) AND (F.IDPESSOA = '+IdEmpresaProp+')' + sFiltroStatus);
          end;

          _SqlLookupParams.Prepare;
     end;

     with _NLookupCds do
     begin
          If Active Then close;
          _NSqlLookupParams.Sql.clear;
          if s = fcCliente then
          begin
                _NSqlLookupParams.Sql.Add('SELECT P.RAZAOSOCIAL, P.NOME, P.IDPESSOA, P.NUMDOCUMENTO, ');
                _NSqlLookupParams.Sql.Add('C.IDFORCLI, C.CONTACCLIENTE, C.CODSUBCONTA, C.CODCENTROCUSTO, C.CONTACADIANTAMENTO, C.CONTACRECEITA, C.IDPESSOA, C.UNIDNEGOC ');
                _NSqlLookupParams.Sql.Add('FROM PESSOA P, EMPRESACLIENTE C ');

                if FCampoEdit = ceNome then
                   _NSqlLookupParams.Sql.Add('WHERE (C.IDPESSOA = '+IdEmpresaProp+') AND (P.NOME = :sNome) AND (P.IDPESSOA = C.IDFORCLI) AND (C.IDPESSOA = '+IdEmpresaProp+')' + sFiltroStatus)
                else
                   _NSqlLookupParams.Sql.Add('WHERE (C.IDPESSOA = '+IdEmpresaProp+') AND (P.RAZAOSOCIAL = :sNome) AND (P.IDPESSOA = C.IDFORCLI) AND (C.IDPESSOA = '+IdEmpresaProp+')' + sFiltroStatus);
          end
          else
            if s = fcFornecedor then
            begin
                  _NSqlLookupParams.Sql.Add('SELECT P.RAZAOSOCIAL, P.NOME, P.IDPESSOA, P.NUMDOCUMENTO, ');
                  _NSqlLookupParams.Sql.Add('F.IDFORCLI, F.CONTACFORN, F.CODSUBCONTA, F.CODCENTROCUSTO, F.CONTACADIANTAMENTO, F.CONTACDESPESA, F.IDPESSOA, F.UNIDNEGOC ');
                  _NSqlLookupParams.Sql.Add('FROM PESSOA P, EMPRESAFORN F ');

                  if FCampoEdit = ceNome then
                     _NSqlLookupParams.Sql.Add('WHERE (F.IDPESSOA = '+IdEmpresaProp+') AND (P.NOME = :sNome) AND (P.IDPESSOA = F.IDFORCLI) AND (F.IDPESSOA = '+IdEmpresaProp+')'  + sFiltroStatus)
                  else
                     _NSqlLookupParams.Sql.Add('WHERE (F.IDPESSOA = '+IdEmpresaProp+') AND (P.RAZAOSOCIAL = :sNome) AND (P.IDPESSOA = F.IDFORCLI) AND (F.IDPESSOA = '+IdEmpresaProp+')' + sFiltroStatus);
            end;

          _NSqlLookupParams.Prepare;
     end;
end;
procedure TCMProcuraForCli.SetStatusForCli(const Value: TStatusForCli);
begin
  FStatusForCli := Value;
  SetForCli(FForCli);
end;

procedure TCMProcuraForCli.SetMostraStatusCredito(const Value: Boolean);
begin
  FMostraStatusCredito := Value;
end;

end.


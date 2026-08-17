{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 24/08/2011
// Nº SOL........: 160740
// Nº KINTANA....: 1358934
// Rotina........: TCMCustomProcuraMask.EditText
// Descrição.....: Adicionado propriedade EditText na classe TCMCustomProcuraMask
---------------------------------------------------------------------------------------------------}

{-------------------------------------------------------------------------------
Atualização:
em : 28/05/2004 - Andre tavares - pendencia 16904 - Criado na classe TCMCustomProcuraMask
das propriedades DADOEXIBIDO(o campo que será exibido no db control) e LOOKUPSQL (para
preencher com o código sql que buscará o dado digitado) para que seja possível a exibição de um campo que não é aquele
que será gravado.
--------------------------------------------------------------------------------}
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
unit CMProcuraMask;

interface
{$R *.RES}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, mask, buttons, extctrls, db, dbctrls, uMensErro,
  MontaSelect,dsgnintf, uCMTypes, wwQuery, uCmSqlParams, DBClient;

type
  TTipoConta = (SoAnalitica, SoSintetica, Indiferente);
  TStatusConta = (scSoAtiva, scSoInativa, scAmbas);
  TCampoPesquisa = (cpPlaConta, cpPlaReduz, cpPlaCorresp);
  TMensagens = class(TPersistent)
  private
    FMsgEmBranco,
    FMsgNaoExiste,
    FMsgSintetica,
    FMsgAnalitica : string;
    procedure SetMsgEmBranco(m:string);
    procedure SetMsgNaoExiste(m:string);
    procedure SetMsgAnalitica(m:string);
    procedure SetMsgSintetica(m:string);
  published
    property EmBranco: string read FMsgEmBranco write SetMsgEmBranco ;
    property NaoExiste: string read FMsgNaoExiste write SetMsgNaoExiste ;
    property Sintetica: string read FMsgSintetica write SetMsgSintetica ;
    property Analitica: string read FMsgAnalitica write SetMsgAnalitica ;
  end;

  TCMCustomProcuraMask = class(TGroupBox)
  private
    { Private declarations }
    _UsaMascara: Boolean;

    fLookupSQLParams: TCMSqlParams;

    fParamAux : string;
    

    FBevel : TBevel;
    FBtn : TBitBtn;
    FPanelEdit, FPanelDesc : TPanel;
    FlblDesc : TLabel;
    FEdit : TMaskEdit;
    FMascara,
    FLookupChave,
    FLookupTipo,
    FLookupDesc : string;
    FDataLink : TDataLink;
    FDataField : TFieldDataLink;
    FOnChange,
    FOnApertouBotao,
    FOnExit : TNotifyEvent;
    FLookupQuery : TDataSet;
    FLookupParam,
    FPlaTipo1,
    FPlaTipo2 : string;
    FMostraDescricao,
    FMostraMensagens,
    FPermiteChaveInvalida,
    FPermiteChaveEmBranco : boolean;
    FValida : TValida;
    FMontaSelect : TMontaSelect;
    FMensagens : TMensagens;
    FAceitaTipoConta : TTipoConta;
    FCampoPesquisa: TCampoPesquisa;
    FDadoExibido: string;
    FLookupSql: TStringList;
    procedure Clicou(Sender: TObject);
    procedure Mudou(Sender: TObject);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure MudouDado(Sender: TObject);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value:TDataSource);
    function GetDataField: string;
    procedure SetDataField(const Value: string);
    procedure Mens(m:string);
    procedure SetMascara(m:string);
    procedure SetAceitaTipoConta(t:TTipoConta);
    procedure SetPermiteChaveEmBranco(b:Boolean);
    procedure SetPermiteChaveInvalida(b:Boolean);
    procedure SetDadoExibido(const Value: string);
    procedure SetLookupSql(const Value: TStringList);
    //Ricardo
    function  RetornaEdit:String;


  protected
    { Protected declarations }
    property LookupQuery : TDataSet read FLookupQuery write FLookupQuery;
    property LookupSQLParams: TCmSqlParams read fLookupSQLParams write fLookupSQLParams;
    property LookupParam: string read FLookupParam write FLookupParam;
    property LookupChave: string read FLookupChave write FLookupChave;
    property LookupTipo: string read FLookupTipo write FLookupTipo;
    property LookupDescricao: string read FLookupDesc write FLookupDesc;
    property MontaSelect: TMontaSelect read FMontaSelect write FMontaSelect ;
    property OnApertouBotao: TNotifyEvent read FOnApertouBotao write FOnApertouBotao;
    property OnExit: TNotifyEvent read FOnExit write FOnExit;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    procedure ApertouBotao; virtual;
    procedure MudouEdit; virtual;
    property Mascara : string read FMascara write SetMascara;
    property AceitaTipoConta: TTipoConta read FAceitaTipoConta write SetAceitaTipoConta ;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
  public
    { Public declarations }
    constructor create(AOwner:TComponent); override;
    destructor Destroy; override;
    function Valida : TValida; virtual;
    procedure Clear;
    //Ricardo
    property EditText : string read RetornaEdit;
  published
    { Published declarations }
    property MostraMensagens: boolean read FMostraMensagens write FMostraMensagens ;
    property MostraDescricao: boolean read FMostraDescricao write FMostraDescricao ;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: string read GetDataField write SetDataField;
    property Mensagens : TMensagens read FMensagens write FMensagens;
    property PermiteChaveInvalida: boolean read FPermiteChaveInvalida write SetPermiteChaveInvalida ;
    property PermiteChaveEmBranco: boolean read FPermiteChaveEmBranco write SetPermiteChaveEmBranco ;

    property DadoExibido: string read FDadoExibido write SetDadoExibido;
    property LookupSql: TStringList read FLookupSql write SetLookupSql;
    
  end;

  TCMProcuraMask = class(TCMCustomProcuraMask)
  private
  published
    { Public declarations }
    property AceitaTipoConta;
    property Mascara;
    property MontaSelect;
    property LookupQuery;
    property LookupSQLParams;
    property LookupParam;
    property LookupChave;
    property LookupTipo;
    property LookupDescricao;
    property OnApertouBotao;
  end;

    TContaContabil = class(TPersistent)
    private
       FNumero,
       FNome : string;
       FObrigaSC,
       FObrigaCC : boolean;

    published
       property Numero : string read FNumero ;
       property Nome : string read FNome ;
       property ObrigaSubConta : boolean read FObrigaSC ;
       property ObrigaCentrodeCusto : boolean read FObrigaCC ;
    end;

  TCMProcuraMaskContabil = class(TCMCustomProcuraMask)
  private
     _CampoPesquisa: String;
     FPlano : integer;
     FConta : TContaContabil;
     FPlaInativa1,
     FPlaInativa2 : string;
     FStatus : TStatusConta;
     procedure SetPlanoConta(p:integer);
     procedure SetStatus(p:TStatusConta);
    procedure SetCampoPesquisa(const Value: TCampoPesquisa);
    procedure MontaParametrosPesquisa;
  protected
    procedure MudouEdit; override;
    procedure ApertouBotao; override;
  public
    { Public declarations }
    property Conta : TContaContabil read FConta write FConta;
    constructor create(AOwner:TComponent); override;
    destructor Destroy; override;
  published
    property CampoPesquisa: TCampoPesquisa read FCampoPesquisa write SetCampoPesquisa default cpPlaConta;
    property AceitaTipoConta;
    property Mascara;
    property Plano : integer read FPlano write SetPlanoConta;
    property Status : TStatusConta read FStatus write SetStatus;
    property OnApertouBotao;
    property OnChange;
  end;


implementation
// TCMProcuraMask
constructor TCMCustomProcuraMask.Create(AOwner : TComponent);
begin
     inherited;
     _UsaMascara := True;

     FDataLink := TDataLink.Create;
     FDataField := TFieldDataLink.Create;
     FDataField.OnDataChange := MudouDado;
     FValida := vcSemTeste;
     FPermiteChaveInvalida := false;
     FPermiteChaveEmBranco := false;
     FMostraDescricao := true;
     FMostraMensagens := true;
     FAceitaTipoConta := Indiferente;
     FMensagens := TMensagens.Create;
     FMensagens.Analitica := '';
     FMensagens.EmBranco := '';
     FMensagens.NaoExiste := '';
     FMensagens.Sintetica := '';
     FPlaTipo1 := 'A';
     FPlaTipo2 := 'S';

     FLookupSql := TStringList.Create;       

///*** Painel onde aparece o edit e os botoes
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
     end;
     //Cria o botão
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
///***

///*** Painel de descrição
     FPanelDesc := TPanel.Create(self);
     with FPanelDesc do
     begin
          Parent := self;
          BevelOuter := bvNone;
          BorderWidth := 5;
     end;
     FlblDesc := TLabel.Create(self);
     with FlblDesc do
     begin
          Parent := FPanelDesc;
          Align := alClient;
          AutoSize := false;
          Top := 10;
          Left := 12;
          height := 27;
          WordWrap := true;
     end;


     fParamAux := '';
     
end;

destructor TCMCustomProcuraMask.Destroy;
begin
     FDataField.free;
     FDataLink.free;
     FMensagens.Free;
     FBevel.free;
     FEdit.free;
     FBtn.free;
     FlblDesc.free;
     FPanelEdit.free;
     FPanelDesc.free;
     FLookupSql.free;
     inherited;
end;

procedure TCMCustomProcuraMask.WMSetFocus(var Message: TWMSetFocus);
begin
     if FEdit.CanFocus then
        FEdit.SetFocus;
end;

procedure TCMCustomProcuraMask.SetPermiteChaveEmBranco(b:Boolean);
begin
     if b <> FPermiteChaveEmBranco then
     begin
          FPermiteChaveEmBranco := b;
          MudouEdit;
     end;
end;

procedure TCMCustomProcuraMask.SetPermiteChaveInvalida(b:Boolean);
begin
     if b <> FPermiteChaveInvalida then
     begin
          FPermiteChaveInvalida := b;
          MudouEdit;
     end;
end;

procedure TCMCustomProcuraMask.SetAceitaTipoConta(t:TTipoConta);
begin
     if t <> FAceitaTipoConta then
     begin
          FAceitaTipoConta := t;
          

          FPlaTipo1 := 'A';
          FPlaTipo2 := 'S';

          MudouEdit;
     end;
end;

procedure TCMCustomProcuraMask.SetMascara(m:string);
begin
     if m <> FMascara then
     begin
          FMascara := m;
          if (m <> '') And _UsaMascara then
             FEdit.EditMask := m+';0; '
          else
             FEdit.EditMask := '';
     end;
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

procedure TMensagens.SetMsgAnalitica(m:string);
begin
     if trim(m) = '' then
        m := 'Chave não pode ser analítica';
     if m <> FMsgAnalitica then
     begin
          FMsgAnalitica := m;
     end;
end;

procedure TMensagens.SetMsgSintetica(m:string);
begin
     if trim(m) = '' then
        m := 'Chave não pode ser sintética';
     if m <> FMsgSintetica then
     begin
          FMsgSintetica := m;
     end;
end;

procedure TCMCustomProcuraMask.WMSize(var Message: TWMSize);
begin
     FpanelEdit.Align := AlTop;
     FpanelDesc.Align := AlClient;
     FBevel.width := width-45;
     FEdit.width  := width-51;
     FBtn.Left    := width-35;
     Invalidate;
end;

function TCMCustomProcuraMask.GetDataSource: TDataSource;
begin
     Result := FDataLink.DataSource;
end;

procedure TCMCustomProcuraMask.SetDataSource(Value: TDataSource);
begin
     if Value <> FDataLink.DataSource then
     begin
          FDataLink.DataSource := value;
          FDataField.DataSource := Value;
     end;
end;

procedure TCMCustomProcuraMask.Clicou(Sender: TObject);
begin
     if Assigned(FOnApertouBotao) then FOnApertouBotao(self);
       ApertouBotao;
end;

procedure TCMCustomProcuraMask.ApertouBotao;
begin

     fParamAux := '';
     if (Trim(FDadoExibido) <> '') and (FMontaSelect.CamposChave.Count < 2) then
       FMontaSelect.CamposChave.Append(UPPERCASE(FDadoExibido));

     FMontaSelect.Executar;
     if FMontaSelect.RetornouValor then

     if Trim(FDadoExibido) <> '' then
     begin
       fParamAux := Trim(FMontaSelect.ValoresChave[1]);
       fLookupSQLParams.ClientDataset.Close;
       FEdit.Text := Trim(FMontaSelect.ValoresChave[1]);
     end
     else

        FEdit.Text := Trim(FMontaSelect.ValoresChave[0]);
     if FEdit.CanFocus then
        FEdit.SetFocus;
end;

procedure TCMCustomProcuraMask.MudouDado(Sender: TObject);
begin

  if (fLookupSQLParams <> nil) and (Trim(FDadoExibido) <> '') then
  begin
    fParamAux := '';
    if (FDataField.Field <> nil) then
    begin
      if (FDataField.Field.IsNull) then
        FEdit.Text := ''
      else
      begin
        FLookupQuery.Close;
        fLookupSQLParams.Prepare;
        If fLookupSQLParams.ParamExists(FLookupParam) Then
          fLookupSQLParams.ParamByName(FLookupParam).AsString := FDataField.Field.AsString;
        fLookupSQLParams.Open;
        FEdit.Text := FLookupQuery.FieldByName(Trim(FDadoExibido)).AsString;
        fParamAux := FEdit.Text;
      end;
    end
  end
  else
    if FDataField.Field <> nil then
      FEdit.Text := Trim(FDataField.Field.AsString);


end;

procedure TCMCustomProcuraMask.Mudou(Sender: TObject);
begin
     if Assigned(FOnChange) then FOnChange(Self);
     MudouEdit;
end;

procedure TCMCustomProcuraMask.MudouEdit;
  var  
      sqlAux : TCMSqlParams;
      cdsAux : TClientDataSet;
      sSql   : string;
begin
     sSql := '';
     FValida := vcSemTeste;

     if (FLookupQuery <> nil) and
        (not (csLoading in ComponentState)) and
        (not (csDesigning in ComponentState))then
     begin
          If FLookupQuery.Active Then FLookupQuery.Close;

          If (FLookupQuery Is TClientDataSet) Or
             (fLookupSQLParams <> nil)  Then
          Begin
              fLookupSQLParams.Prepare;

          
              if (Trim(FDadoExibido) <> '') and (trim(FLookupSql.text) <> '') and (Trim(Fedit.Text) <> '') then
              begin
                fLookupSQLParams.ClientDataSet.Close;
                cdsAux := TClientDataSet.Create(nil);
                sqlAux := TCMSqlParams.Create(nil);
                sqlAux.ClientDataset := cdsAux;
                cdsAux.Close;
                sSql := fLookupSql.Text + ' AND ' + fDadoExibido + ' = ' + quotedStr(FEdit.Text);
                sqlAux.Sql.Text := sSql;
                sqlAux.Prepare;
                sqlAux.Open;
                fParamAux := cdsAux.FieldByName(FLookupParam).asString;
                fLookupSQLParams.Prepare;
                if fLookupSQLParams.ParamExists(FLookupParam) then
                  fLookupSQLParams.ParamByName(FLookupParam).AsString := fParamAux;

                sqlAux.Free;
                cdsAux.Free;
              end;

              If fLookupSQLParams.ParamExists(FLookupParam) AND (Trim(FDadoExibido) = '') Then
                 fLookupSQLParams.ParamByName(FLookupParam).AsString := FEdit.Text;

          


              If fLookupSQLParams.ParamExists('sPlaTipo1') Then
                 fLookupSQLParams.ParamByName('sPlaTipo1').AsString := FPlaTipo1;

              If fLookupSQLParams.ParamExists('sPlaTipo2') Then
                 fLookupSQLParams.ParamByName('sPlaTipo2').AsString := FPlaTipo2;

              fLookupSQLParams.Open;
          End
          Else
          Begin
          

              if (Trim(FDadoExibido) <> '') and (trim(FLookupSql.text) <> '') and (Trim(Fedit.Text) <> '') then
              begin
                TwwQuery(FLookupQuery).Close;
                cdsAux := TClientDataSet.Create(nil);
                sqlAux := TCMSqlParams.Create(nil);
                sqlAux.ClientDataset := cdsAux;
                cdsAux.Close;
                sSql := fLookupSql.Text + ' AND ' + fDadoExibido + ' = ' + quotedStr(FEdit.Text);
                sqlAux.Sql.Text := sSql;
                sqlAux.Prepare;
                sqlAux.Open;
                fParamAux := cdsAux.FieldByName(FLookupParam).asString;
                TwwQuery(FLookupQuery).Prepare;
                if TwwQuery(FLookupQuery).Params.FindParam(FLookupParam) <> nil then
                  TwwQuery(FLookupQuery).ParamByName(FLookupParam).AsString := fParamAux;

                sqlAux.Free;
                cdsAux.Free;
              end;

              If (TwwQuery(FLookupQuery).Params.FindParam(FLookupParam) <> nil) AND (Trim(FDadoExibido) = '') Then
                 TwwQuery(FLookupQuery).ParamByName(FLookupParam).AsString := FEdit.Text;
          

              If TwwQuery(FLookupQuery).Params.FindParam('sPlaTipo1') <> nil Then
                 TwwQuery(FLookupQuery).ParamByName('sPlaTipo1').AsString := FPlaTipo1;

              If TwwQuery(FLookupQuery).Params.FindParam('sPlaTipo2') <> nil Then
                 TwwQuery(FLookupQuery).ParamByName('sPlaTipo2').AsString := FPlaTipo2;

              FLookupQuery.Open;
          End;

          if FEdit.Text = '' then
          begin
               FlblDesc.Caption := '';
               if FPermiteChaveEmBranco then
                  FValida := vcOk
               else
                   FValida := vcEmBranco;
          end
          else
          begin
               if FMostraDescricao then
                  FlblDesc.Caption := FLookupQuery.FieldByName(FLookupDesc).AsString;
               if FLookupQuery.IsEmpty then
               begin
                    FValida := vcNaoExiste;
               end
               else
               begin
                    if ((FAceitaTipoConta = SoAnalitica) and
                        (FLookupQuery.FieldByName(FLookupTipo).AsString='S')) then
                    begin
                         FValida := vcSintetica;
                    end
                    else if ((FAceitaTipoConta = SoSintetica) and
                            (FLookupQuery.FieldByName(FLookupTipo).AsString='A')) then
                    begin
                         FValida := vcAnalitica;
                    end
                    else
                    begin
                       
                         FValida := vcOk;
                    end;
                    if (FPermiteChaveInvalida) and (FValida <> vcOk) then
                       FValida := vcOk;
               end;
          end;
     end;

     if (FValida = vcOk) then
        if FDataField.Editing then

          FDataField.Field.Value := FLookupQuery.FieldByName(Trim(FLookupChave)).AsString

end;

function TCMCustomProcuraMask.Valida : TValida;
begin
     if (FValida = vcEmBranco) then
     begin
          if (not FPermiteChaveEmBranco) then
          begin
               Mens(FMensagens.EmBranco);

               if (Owner is TForm) And (TForm(Owner).Visible) And FEdit.CanFocus then
                  FEdit.SetFocus;
          end;
     end
     else
         if (not FPermiteChaveInvalida) and (FValida <> vcOk) then
         begin
              case FValida of
                vcAnalitica: Mens(FMensagens.Analitica);
                vcSintetica: Mens(FMensagens.Sintetica);
                vcNaoExiste:
                begin
                     Mens(FMensagens.NaoExiste);
                     if (Owner is TForm) And (TForm(Owner).Visible) And FEdit.CanFocus then
                        FEdit.SetFocus;
                end;
              end;
         end;
     Result := FValida;
end;

function TCMCustomProcuraMask.GetDataField: string;
begin
  Result := FDataField.FieldName;
end;

procedure TCMCustomProcuraMask.SetDataField(const Value: string);
begin
  FDataField.FieldName := Value;
end;

procedure TCMCustomProcuraMask.Mens(m : string);
begin
     if (FMostraMensagens) and
        (not(csDesigning in ComponentState))
         then
        Msgdlg(m, FEdit.EditText, mtWarning,[mbOk],0);
end;

{ TCMProcuraMask }


{ TCMProcuraMask }

{function TCMProcuraMask.EditText: string;
begin

end;}

// TCMProcuraMaskContabil
constructor TCMProcuraMaskContabil.Create(AOwner : TComponent);
begin
   inherited;
   _CampoPesquisa := 'PLACONTA';
   _UsaMascara := True;

   FPlaInativa1 := 'A';
   FPlaInativa2 := 'A';
   FConta := TContaContabil.create;
   FPlano := 0;
   FMontaSelect := TMontaSelect.Create(self);
   FLookupQuery := TClientDataSet.Create(self);
   fLookupSQLParams := TCMSqlParams.Create(self);
   fLookupSQLParams.ClientDataSet := TClientDataSet(FLookupQuery);

   MontaParametrosPesquisa;
end;

destructor TCMProcuraMaskContabil.Destroy;
begin
    FLookupQuery.free;
    fLookupSQLParams.Free;

    FMontaSelect.free;
    FConta.free;
    inherited;
end;

procedure TCMProcuraMaskContabil.MudouEdit;
begin
     fLookupSQLParams.ParamByName('sPlaInativa1').AsString := FPlaInativa1;
     fLookupSQLParams.ParamByName('sPlaInativa2').AsString := FPlaInativa2;

     inherited;

     if (not (csLoading in ComponentState)) and (not (csDesigning in ComponentState)) then
     begin
          Conta.FNome := FLookupQuery.FieldByName(FLookupDesc).AsString;

          Conta.FNumero := FLookupQuery.FieldByName('PLACONTA').AsString;
          Conta.FObrigaCC := (FLookupQuery.FieldByName('PLACCUST').AsString = 'S');
          Conta.FObrigaSC := (FLookupQuery.FieldByName('PLASUBCONTA').AsString = 'S');
     end;
end;

procedure TCMProcuraMaskContabil.SetPlanoConta(p:integer);
begin
    if FPlano <> p then
    begin
        FPlano := p;
        fLookupSQLParams.ParamByName('iPlano').AsInteger := p;
    end;
end;

procedure TCMProcuraMaskContabil.SetStatus(p:TStatusConta);
begin
     if FStatus <> p then
     begin
          FStatus := p;
          case p of
               scSoAtiva   : begin
                                  FPlaInativa1 := 'A';
                                  FPlaInativa2 := 'A';
                             end;
               scSoInativa : begin
                                  FPlaInativa1 := 'I';
                                  FPlaInativa2 := 'I';
                             end;
               scAmbas     : begin
                                  FPlaInativa1 := 'A';
                                  FPlaInativa2 := 'I';
                             end;
          end;
          fLookupSQLParams.ParamByName('sPlaInativa1').AsString := FPlaInativa1;
          fLookupSQLParams.ParamByName('sPlaInativa2').AsString := FPlaInativa2;

          MudouEdit;
     end;
end;

procedure TCMProcuraMaskContabil.ApertouBotao;
begin
     FMontaSelect.Filtro.clear;
     FMontaSelect.Filtro.Add('PLANO = '+IntToStr(FPlano));
     FMontaSelect.Filtro.Add('PLATIPO IN ('''+FPlaTipo1+''','''+FPlaTipo2+''')');
     FMontaSelect.Filtro.Add('PLAINATIVA IN ('''+FPlaInativa1+''','''+FPlaInativa2+''')');

     Case FCampoPesquisa of
       cpPlaConta: FMontaSelect.Mascaras[0] := FMascara+';0; ';
       cpPlaReduz: FMontaSelect.Mascaras[4] := FMascara+';0; ';
       cpPlaCorresp: FMontaSelect.Mascaras[3] := FMascara+';0; ';
     End;

     inherited;
end;


procedure TCMCustomProcuraMask.Clear;
begin
   FEdit.Clear;
end;

procedure TCMProcuraMaskContabil.SetCampoPesquisa(
  const Value: TCampoPesquisa);
begin
  FCampoPesquisa := Value;

  Case FCampoPesquisa of
    cpPlaConta:
    Begin
       _CampoPesquisa := 'PLACONTA';
       _UsaMascara := True;
    End;
    cpPlaReduz:
    Begin
       _CampoPesquisa := 'PLAREDUZ';
       _UsaMascara := False;
    End;
    cpPlaCorresp:
    Begin
       _CampoPesquisa := 'PLACONCORRESP';
       _UsaMascara := False;
    End;
  End;

  MontaParametrosPesquisa;
end;

procedure TCMProcuraMaskContabil.MontaParametrosPesquisa;
Begin
   with FMontaSelect do
   begin
        RepeteConsulta := True;

        CamposChave.Clear;
        Colunas.Clear;
        Descricao.Clear;
        Larguras.Clear;
        Mascaras.Clear;
        Tabelas.Clear;
        TipoDeDado.Clear;

        CamposChave.Add(_CampoPesquisa);

        Case FCampoPesquisa of
          cpPlaConta: Colunas.Add('PLACONTA');
          cpPlaReduz: Colunas.Add('PLAREDUZ');
          cpPlaCorresp: Colunas.Add('PLACONCORRESP');
        End;

        Colunas.Add('PLANOME');
        Colunas.Add('PLATIPO');

        Case FCampoPesquisa of
          cpPlaConta, cpPlaReduz: Colunas.Add('PLACONCORRESP');
          cpPlaCorresp: Colunas.Add('PLACONTA');
        End;

        Case FCampoPesquisa of
          cpPlaConta, cpPlaCorresp: Colunas.Add('PLAREDUZ');
          cpPlaReduz: Colunas.Add('PLACONTA');
        End;


        Case FCampoPesquisa of
          cpPlaConta: Descricao.Add('Conta Contábil');
          cpPlaReduz: Descricao.Add('Código reduzido');
          cpPlaCorresp: Descricao.Add('Conta Correspondente');
        End;

        Descricao.Add('Descrição');
        Descricao.Add('Tipo');

        Case FCampoPesquisa of
          cpPlaConta, cpPlaReduz: Descricao.Add('Conta Correspondente');
          cpPlaCorresp: Descricao.Add('Conta Contábil');
        End;

        Case FCampoPesquisa of
          cpPlaConta, cpPlaCorresp: Descricao.Add('Código reduzido');
          cpPlaReduz: Descricao.Add('Conta Contábil');
        End;


        Larguras.Add('18');
        Larguras.Add('40');
        Larguras.Add('1');
        Larguras.Add('18');
        Larguras.Add('18');

        Case FCampoPesquisa of
          cpPlaConta: Mascaras.Add(FMascara);
          cpPlaReduz, cpPlaCorresp: Mascaras.Add('');
        End;
        Mascaras.Add('');
        Mascaras.Add('');

        Case FCampoPesquisa of
          cpPlaConta, cpPlaReduz: Mascaras.Add('');
          cpPlaCorresp: Mascaras.Add(FMascara);
        End;

        Case FCampoPesquisa of
          cpPlaConta, cpPlaCorresp: Mascaras.Add('');
          cpPlaReduz: Mascaras.Add(FMascara);
        End;

        Tabelas.Add('PLANOCONTA');

        TipoDeDado.Add('C');
        TipoDeDado.Add('C');
        TipoDeDado.Add('C');
        TipoDeDado.Add('C');
        TipoDeDado.Add('C');
   end;

   with FLookupQuery do
   begin
        fLookupSQLParams.SQL.Clear;
        fLookupSQLParams.SQL.Add('SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST, PLASUBCONTA, PLAINATIVA, PLAREDUZ, PLACONCORRESP ');
        fLookupSQLParams.SQL.Add('FROM PLANOCONTA');
        fLookupSQLParams.SQL.Add('WHERE (PLANO = :iPlano) AND (RTRIM(' + _CampoPesquisa +') = :sPlaConta) AND (PLATIPO IN (:sPlaTipo1,:sPlaTipo2)) AND (PLAINATIVA IN (:sPlaInativa1,:sPlaInativa2))');
        fLookupSQLParams.Prepare;
   end;

   FLookupChave := _CampoPesquisa;
   FLookupDesc  := 'PLANOME';
   FLookupTipo  := 'PLATIPO';
   FLookupParam := 'sPlaConta';
end;


procedure TCMCustomProcuraMask.SetDadoExibido(const Value: string);
begin
  FDadoExibido := Value;
end;


procedure TCMCustomProcuraMask.SetLookupSql(const Value: TStringList);
begin
  FLookupSql.Assign( Value );
end;

function TCMCustomProcuraMask.RetornaEdit: String;
begin
     Result := Trim(FEdit.Text);
end;

end.



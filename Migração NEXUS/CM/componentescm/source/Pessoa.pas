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
unit Pessoa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  tb97, tb97Cmn, tb97Cnst, tb97Ctls, TB97Reg, TB97Tlbr, TB97Tlwn,
  comctrls, stdctrls, extctrls, TabControlDetalhe, db, wwQuery, uCmTypes;

type
  TPessoaEvent = procedure (IdPessoa:integer) of object;

  TFormControls = Class(TPersistent)
  Private
    FLabelDocumento: TLabel;
    FLabelNome: TLabel;
    FPainelFoto: TPanel;
    FPainelMestre: TPanel;
    FCampoDocum: TStringField;
    FBotaoFisFur: TToolbarButton97;
    procedure SetBotaoFisFur(const Value: TToolbarButton97);
    procedure SetCampoDocum(const Value: TStringField);
    procedure SetLabelDocumento(const Value: TLabel);
    procedure SetLabelNome(const Value: TLabel);
    procedure SetPainelFoto(const Value: TPanel);
    procedure SetPainelMestre(const Value: TPanel);

  Published
    property BotaoFisFur  : TToolbarButton97 read FBotaoFisFur write SetBotaoFisFur;
    property PainelMestre : TPanel read FPainelMestre write SetPainelMestre;
    property PainelFoto   : TPanel read FPainelFoto write SetPainelFoto;
    property LabelDocumento : TLabel read FLabelDocumento write SetLabelDocumento;
    property LabelNome : TLabel read FLabelNome write SetLabelNome;
    property CampoDocum : TStringField read FCampoDocum write SetCampoDocum;
  End;


  TPessoa = class(TComponent)
  private
    { Private declarations }
    FTipoPessoa      : TTipoPessoa;
    FNomeTabela,
    FNomeCampoId,
    FFormCaption     : string;
    FSQLFiltro       : Tstrings;
    FEJuridica,
    FMudaCaption,
    FMostraFoto      : Boolean;
    FSubTipo         : TSubTipo;
    FIdEmpresa,
    IdRegra,
    FIdDocChave      : Integer;
    fUsaPessoaFisica :Boolean;
    FOnSaveSubtipo: TNotifyEvent;
    FOnChangeSubtipo: TPessoaEvent;
    FOnChangePessoa: TPessoaEvent;
    FFormControls: TFormControls;
    FSaveModuloRespon: boolean;
    FObrigaDocumento: Boolean;
    procedure SetOnChangePessoa(const Value: TPessoaEvent);
    procedure SetOnChangeSubtipo(const Value: TPessoaEvent);
    procedure SetOnSaveSubtipo(const Value: TNotifyEvent);
    procedure SetFormControls(const Value: TFormControls);
    procedure SetSaveModuloRespon(const Value: boolean);
    procedure SetObrigaDocumento(const Value: Boolean);
  protected
    { Protected declarations }
    procedure SetMudaCaption(Value:Boolean);
    procedure SetSubTipo(SubTipo : TSubTipo) ;
    procedure SetTipoPessoa(TipoPessoa : TTipoPessoa) ;
    procedure SetString(n:string);
    procedure SetTString(n:Tstrings);
    procedure SetBoolean(n:Boolean);
    procedure SetMostraFoto(n:Boolean);
    procedure AtuSubTipo ;
    procedure AtuTipoPessoa ;
    procedure SetSQLFiltro(s:TStrings) ;
    procedure SetIdEmpresa(Id:integer);
    procedure SetFormCaption(n:string);

  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;

    property EJuridica : Boolean read FEJuridica write FEJuridica;
    property NomeTabela : string read FNomeTabela;
    property NomeCampoId : string read FNomeCampoId;
    property SQLFiltro : Tstrings read FSQLFiltro write SetSQLFiltro;
    property IdEmpresaPropria : Integer read FIdEmpresa write SetIdEmpresa;
    property IdDocChave : Integer read FIdDocChave write FIdDocChave;

    procedure HabilitaPessoa;
    procedure ChangePessoa(IdPessoa:integer);
    procedure ChangeSubtipo(IdPessoa:integer);
    procedure SaveSubtipo(Sender :TObject);

    function DocumValido(sDocum:string):Boolean;
    function MaskField(sMascara:string) : string;

  published
    property MudaCaption: Boolean read FMudaCaption write SetMudacaption ;
    property TipoPessoa: TTipoPessoa read FTipoPessoa write SetTipoPessoa ;
    property SubTipo: TSubTipo read FSubTipo write SetSubTipo;
    property FormCaption: string read FFormCaption write SetFormCaption;
    property MostraFoto: Boolean read FMostraFoto write SetMostraFoto;
    property UsaPessoaFisica: Boolean read fUsaPessoaFisica write fUsaPessoaFisica;
    property FormControls: TFormControls read FFormControls write SetFormControls;
    property SaveModuloRespon: boolean read FSaveModuloRespon write SetSaveModuloRespon;
    property ObrigaDocumento: Boolean read FObrigaDocumento write SetObrigaDocumento;

    property OnChangePessoa :TPessoaEvent read FOnChangePessoa write SetOnChangePessoa;
    property OnChangeSubtipo :TPessoaEvent read FOnChangeSubtipo write SetOnChangeSubtipo;
    property OnSaveSubtipo :TNotifyEvent read FOnSaveSubtipo write SetOnSaveSubtipo;
  end;

implementation

uses dbTables, uValidaDoc;

constructor TPessoa.Create(AOwner:TComponent);
begin
   inherited;
   FSQLFiltro := TSTringList.Create;
   FMudaCaption := true;
   FMostraFoto := true;
   fUsaPessoaFisica := false;
   FormControls := TFormControls.Create;
   FSaveModuloRespon := false;
   fObrigaDocumento := True;
end;

destructor TPessoa.Destroy;
begin
   FSQLFiltro.free;
   FormControls.Free;
   inherited;
end;

procedure TPessoa.SetSubTipo(SubTipo : TSubTipo);
begin
     FSubTipo := SubTipo;
     AtuSubTipo;
end;

procedure TPessoa.SetFormCaption( n : string);
begin
     FFormCaption := n;
     AtuSubTipo;
end;

procedure TPessoa.SetSQLFiltro(s:TStrings);
begin
  FSQLFiltro.Assign(s);
end;

procedure TPessoa.SetTipoPessoa(TipoPessoa : TTipoPessoa);
begin
     FTipoPessoa := TipoPessoa;
     AtuTipoPessoa;
     HabilitaPessoa;
end;

procedure TPessoa.AtuTipoPessoa;
begin
     if fFormControls.FBotaoFisFur <> nil then
        fFormControls.FBotaoFisFur.Visible := false;
     case FTipoPessoa of
          tpFisica: FEJuridica := false;
          tpJuridica : FEJuridica := True;
          tpOpcional:
          begin
             FEJuridica := true;
             fFormControls.FBotaoFisFur.Visible := true;
          end;
     end;
end;

procedure TPessoa.SetMostraFoto(n:Boolean);
begin
     if n <> FMostraFoto then
     begin
          FMostraFoto := n;
          fFormControls.FPainelFoto.Visible := n;
     end;
end;

procedure TPessoa.SetString(n:string);
begin
end;

procedure TPessoa.SetTString(n:Tstrings);
begin
end;

procedure TPessoa.SetBoolean(n:Boolean);
begin
end;

procedure TPessoa.AtuSubTipo;
begin
     if FMudaCaption then
        TForm(Owner).Caption := ListaSubTipo[FSubTipo].Caption
     else
         TForm(Owner).Caption := FFormCaption;

     FNomeTabela  := ListaSubTipo[FSubTipo].Tabela;
     FNomeCampoId := ListaSubTipo[FSubTipo].CampoId;

     FsqlFiltro.Clear;
     FsqlFiltro.Add(FNomeTabela+'.'+FNomeCampoId+' = PESSOA.IDPESSOA');
     HabilitaPessoa;
end;

procedure TPessoa.HabilitaPessoa;
var qry : TwwQuery;
begin
     if (fFormControls.FPainelMestre <> nil) then
     begin
          if FEJuridica then
          begin
               fFormControls.FLabelNome.Caption := 'Nome Fantasia';
               fFormControls.FPainelMestre.Height := 105;
          end
          else
          begin
               fFormControls.FLabelNome.Caption := 'Nome';
               fFormControls.FPainelMestre.Height := 53;
          end;

          if (Application.FindComponent('dtmBaseDados') <> nil) and
             (TDataBase(Application.FindComponent('dtmBaseDados').FindComponent('dbBaseDados')).connected) then
          begin
               qry := TwwQuery.Create(self);
               qry.DataBasename := 'BaseDados';
               qry.SQL.Add('SELECT DOCPFISICA, DOCPJURIDICA FROM PARAMGLOBAL WHERE PARAMGLOBAL.IDPESSOA = '+IntToStr(FIdEmpresa));
               qry.Open;

               if FEJuridica then
                  FIdDocChave := qry.FieldByName('DOCPJURIDICA').AsInteger
               else
                   FIdDocChave := qry.FieldByName('DOCPFISICA').AsInteger;

               with qry do
               begin
                    Close;
                    SQL.clear;
                    SQL.Add('SELECT NOMEDOCUMENTO, MASCARA, IDREGRA FROM TIPODOCPESSOA WHERE IDDOCUMENTO = '+IntToStr(FIdDocChave));
                    Open;

                    fFormControls.FLabelDocumento.Caption := FieldByName('NOMEDOCUMENTO').AsString;
                    fFormControls.FCampoDocum.EditMask := MaskField(FieldByName('MASCARA').AsString);
                    IdRegra := FieldByName('IDREGRA').AsInteger;
                    Free;
               end;
          end;
     end;
end;

procedure TPessoa.SetMudaCaption(Value:Boolean);
begin
     if Value <> FMudaCaption then
     begin
          FMudaCaption := Value;
          AtuSubTipo;
     end;
end;

procedure TPessoa.SetIdEmpresa(Id:integer);
begin
     if Id <> FIdEmpresa then
     begin
          FIdEmpresa := Id;
          AtuTipoPessoa;
     end;
end;

function TPessoa.DocumValido(sDocum:string):Boolean;
Var
  ValidaDoc :TCMValidaDoc;
begin
   Result := false;

   ValidaDoc := TCMValidaDoc.Create(self);
   ValidaDoc.NumDocumento := sDocum;

   Case IdRegra Of
    -1: ValidaDoc.TipoDocumento := tdCGC;
    -2: ValidaDoc.TipoDocumento := tdCPF;
    -3: ValidaDoc.TipoDocumento := tdCUIT;
    Else
      Result := True;
   End;

   If Not Result Then
      Result := ValidaDoc.DocumentoValido;

   ValidaDoc.Free;
end;

function TPessoa.MaskField(sMascara:string) : string;
var i : integer;
    tempString : string;
begin
     Result := '';
     for i := 1 to length(sMascara) do
     begin
          tempString := Copy(sMascara,i,1);
          if (tempString = '9') or (tempString ='#') then
             Result := Result+tempString
          else
              Result := Result+'\'+tempString;
     end;
     if Result <> '' then
        Result := Result+';0; ';
end;

procedure TPessoa.ChangePessoa(IdPessoa: integer);
begin
   If Assigned(OnChangePessoa) Then OnChangePessoa(IdPessoa);
end;

procedure TPessoa.ChangeSubtipo(IdPessoa: integer);
begin
   If Assigned(OnChangeSubtipo) Then OnChangeSubtipo(IdPessoa);
end;

procedure TPessoa.SaveSubtipo(Sender :TObject);
begin
   If Assigned(OnSaveSubtipo) Then OnSaveSubtipo(Sender);
end;

procedure TPessoa.SetOnChangePessoa(const Value: TPessoaEvent);
begin
  FOnChangePessoa := Value;
end;

procedure TPessoa.SetOnChangeSubtipo(const Value: TPessoaEvent);
begin
  FOnChangeSubtipo := Value;
end;

procedure TPessoa.SetOnSaveSubtipo(const Value: TNotifyEvent);
begin
  FOnSaveSubtipo := Value;
end;

{ TFormControls }

procedure TFormControls.SetBotaoFisFur(const Value: TToolbarButton97);
begin
  FBotaoFisFur := Value;
end;

procedure TFormControls.SetCampoDocum(const Value: TStringField);
begin
  FCampoDocum := Value;
end;

procedure TFormControls.SetLabelDocumento(const Value: TLabel);
begin
  FLabelDocumento := Value;
end;

procedure TFormControls.SetLabelNome(const Value: TLabel);
begin
  FLabelNome := Value;
end;

procedure TFormControls.SetPainelFoto(const Value: TPanel);
begin
  FPainelFoto := Value;
end;

procedure TFormControls.SetPainelMestre(const Value: TPanel);
begin
  FPainelMestre := Value;
end;

procedure TPessoa.SetFormControls(const Value: TFormControls);
begin
  FFormControls := Value;
end;

procedure TPessoa.SetSaveModuloRespon(const Value: boolean);
begin
  FSaveModuloRespon := Value;
end;

procedure TPessoa.SetObrigaDocumento(const Value: Boolean);
begin
  FObrigaDocumento := Value;
end;

end.



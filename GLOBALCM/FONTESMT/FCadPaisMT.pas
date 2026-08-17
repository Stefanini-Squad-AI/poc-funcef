{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 17/01/2002                             }
{                                                       }
{*******************************************************}

unit FCadPaisMT;

{--------------------------------------------------------------------------------
N. Sol......: 229353-16212
N. Kintana..: 434575
Data........: 18-09-2014
Responsável.: Higor Nayde
Descrição...: ajuste referente ao e-social
--------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlPais
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TFrmCadPais = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedPais: TwwDBEdit;
    dbedNacional: TwwDBEdit;
    dbedCodReceita: TwwDBEdit;
    dbedCodInter: TwwDBEdit;
    DbEdMascara: TwwDBEdit;
    DbEdCodRegiao: TwwDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    edteSocial: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure edteSocialKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    pais: TCtrlPais;
    Procedure Seleciona( IdPais: Double = 0 );
  public
    { Public declarations }
  end;

var
  FrmCadPais: TFrmCadPais;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TFrmCadPais.Seleciona( IdPais: Double );
begin
  cds.Data := Pais.ListaPais( idPais );
end;

procedure TFrmCadPais.FormCreate(Sender: TObject);
begin
  inherited;
  Pais := TCtrlPais.Create;
  Pais.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Pais.cds := cds;
  Seleciona( -1 );
end;

procedure TFrmCadPais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Pais.Free;
end;

procedure TFrmCadPais.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
end;

procedure TFrmCadPais.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Pais.Gravar;
end;

procedure TFrmCadPais.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Pais.Gravar;
end;

procedure TFrmCadPais.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Pais.Gravar;
end;

procedure TFrmCadPais.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( Pais.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TFrmCadPais.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedPais.SetFocus;
end;

procedure TFrmCadPais.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedPais.SetFocus;
end;

// Higor SOL 229353-16212 / PPM 434575
procedure TFrmCadPais.edteSocialKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
     key:=#0;
  inherited;

end;

procedure TFrmCadPais.bbtnConfirmarClick(Sender: TObject);
begin
  if (edteSocial.Text = '') then begin     // Higor SOL 229353-16212 / PPM 434575
      MsgDlg('Preencha o Código do eSocial', 'Informação', mtWarning, [ mbOK ], 0 );
      Exit;
  end;
  if (dbedPais.Text = '') then begin
      MsgDlg('O Campo Nome não foi informado', 'Informação', mtWarning, [ mbOK ], 0 );
      Exit;
  end;
  inherited;

end;

procedure TFrmCadPais.sbtnApagarClick(Sender: TObject);
begin
  if (MsgDlg('Deseja realmente excluir este registro?', 'Informação', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
       Exit;
  inherited;

end;

end.

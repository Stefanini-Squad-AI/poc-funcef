unit FCadAlmoxarifado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Provider, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  DBTables, Wwquery, DBCtrls, Mask, wwdblook, uCtrlAlmox, MConnect,
  SConnect, ObjBrkr;

type
  TFrmCadAlmoxarifado = class(TFrmCadastroMT)
    Label1: TLabel;
    Label3: TLabel;
    edAlmoxa: TLabel;
    dblkcmbUnCusteio: TwwDBLookupCombo;
    dblkcmbCentroCusto: TwwDBLookupCombo;
    dbedDesc: TDBEdit;
    rgrpTipoAlmox: TDBRadioGroup;
    CdsUnCusteio: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    Skt: TSocketConnection;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlAlmox : TCtrlAlmox;
    procedure Sel(n: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadAlmoxarifado: TFrmCadAlmoxarifado;

implementation

{$R *.DFM}

Uses uSistema, DBaseDados;

procedure TFrmCadAlmoxarifado.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAlmox := TCtrlAlmox.Create;
  //Atribui o ClientDataSet local a ser persistido pelo objeto de negócios
  CtrlAlmox.cdsAlmox := Cds;
  //DataBase para conexão
  CtrlAlmox.DataBase := dtmBaseDados.dbBaseDados;
  //Indica se o controle de trasação é feito pela classe de negócio
  CtrlAlmox.OpenTransaction := True;
  //Tipo de conexão
  CtrlAlmox.DbConnectionType := cntBDE;
  //Forma de trabalho da classe de negócios
  Sistema.ConnectionSide := cnsServer;
  CtrlAlmox.ConnectionSide := Sistema.ConnectionSide;
  //
  Case Sistema.ConnectionSide Of
      //Persistir dados com a aplicação servidora
      cnsClient: Begin
                    //Conecção com a aplicação servidora
                    CtrlAlmox.Connection := Skt;
                    //Abre a Conexão com a aplicação servidora
                    If Not CtrlAlmox.Connection.Connected Then
                       CtrlAlmox.Connection.Open;
                    //Abre conexão do DataBaseRemoto com o Banco de acordo com a conexão do sistema local
                    If Not CtrlAlmox.ConectaDb(Sistema.UsuarioDB,Sistema.SenhaUsuarioDB,Sistema.AliasDB) Then
                       ShowMessage(CtrlAlmox.MessageInfo);
                 End;
      //Para Trabalhar local
      CnsServer: Begin
                    //Cds.RemoteServer := nil;
                    CtrlAlmox.ConnectionSide := cnsServer;
                 End;
  End;
  //
  If CdsCentroCusto.Active Then CdsCentroCusto.Close;
  CdsCentroCusto.Params[0].Value := Sistema.IdEmpresa;
  CdsCentroCusto.Open;
  //
  If CdsUnCusteio.Active Then CdsUnCusteio.Close;
  CdsUnCusteio.Params[0].Value := Sistema.IdEmpresa;
  CdsUnCusteio.Open;
  //
  Sel( -1 );
  //
  MontaSelect.Filtro.Add('ALMOX.IDPESSOA = '+IntToStr( Sistema.IdEmpresa ));
end;

Procedure TFrmCadAlmoxarifado.Sel( n : LongInt );
Begin
  If Cds.Active Then Cds.Close;
  Cds.Params[0].Value := n;
  Cds.Open;
End;


procedure TFrmCadAlmoxarifado.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If dbedDesc.CanFocus Then dbedDesc.SetFocus;
  Cds.Fields.FieldByName('PRINCIPSECUND').asString :=  'P';
end;

procedure TFrmCadAlmoxarifado.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If dbedDesc.CanFocus Then dbedDesc.SetFocus;
end;

procedure TFrmCadAlmoxarifado.CmeCadastroFind(Sender: TObject);
begin
  inherited;
    If MontaSelect.RetornouValor Then
       Begin
           Sel( StrToInt( MontaSelect.ValoresChave[0] ) );
       End;
end;

procedure TFrmCadAlmoxarifado.CmeCadastroConfirma(Sender: TObject);
Var
  bConfirmaCadastro: Boolean;
begin
  If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
     Begin
       If Not (Cds.State In [DsEdit, DsInsert]) Then Cds.Edit;
       Cds.Fields.FieldByName('CONTABIL').AsString    := CdsUnCusteio.Fields.FieldByName('UCCONTABIL').AsString;
       Cds.Fields.FieldByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
       Cds.Fields.FieldByName('IDEMPRESA').AsInteger  := Sistema.IdEmpresa;
     End;

  inherited;

  bConfirmaCadastro := False;
  Case CmeCadastro.Operacao Of
     opInserir : bConfirmaCadastro := Not CtrlAlmox.Inserir;
     opAlterar : bConfirmaCadastro := Not CtrlAlmox.Alterar;
     opApagar  : bConfirmaCadastro := Not CtrlAlmox.Deletar(Cds.Params[0].AsFloat);
  End;

  If bConfirmaCadastro Then
  Begin
    showMessage(CtrlAlmox.MessageInfo);
    Abort;
  End;
end;

procedure TFrmCadAlmoxarifado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlAlmox.Connection.Close;
end;

end.

//******************************************************************************
//Data	  : 10/11/2004
//Linha    : AL_2
//Motivo(S): Habilitando o componente TDBComboBox
//******************************************************************************
//Data	  : 10/11/2004
//Linha    : AL_1
//Motivo(S): Desabilitando o componente TDBComboBox
//******************************************************************************
//Data	  : 10/11/2004
//Origem	  : FUNCEF
//Motivo(S): Acrescentado o componente TDBCheckBox representando o campo FLGATIVO
//******************************************************************************
//Data	  : 10/11/2004
//Query 	  : qry e upd
//Motivo(S): Acrescentado o campo FLGATIVO e filtrando a consulta por FLGATIVO
//******************************************************************************
//Data	          : 29/06/2004
//Query 	  : QryUsuarioSistema
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

unit FCadAutOperacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook, DBCtrls,
  FCadastroCSInv, fcLabel;

type
  TfrmCadAutOperacao = class(TfrmCadastroCSInv)
    QryUsuarioSistema: TwwQuery;
    lblUsuario: TLabel;
    dblUsuarioSistema: TwwDBLookupCombo;
    QryUsuarioSistemaIDUSUARIO: TFloatField;
    QryUsuarioSistemaNOMEUSUARIO: TStringField;
    qryIDUSUARIO: TFloatField;
    qryNOMEUSUARIO: TStringField;
    dbchkInativo: TDBCheckBox;
    qryFLGATIVO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroBeforeConfirma(sender: TObject;var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Posiciona(IdUsuarioSistema : Integer);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAutOperacao: TfrmCadAutOperacao;

implementation

uses UmensErro,UDataBase;

{$R *.DFM}

procedure TfrmCadAutOperacao.FormShow(Sender: TObject);
begin
  inherited;
   QryUsuarioSistema.Open;
   if dblUsuarioSistema.CanFocus then
      dblUsuarioSistema.SetFocus;
end;

procedure TfrmCadAutOperacao.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
   Qry.Close;
   QryUsuarioSistema.Close;
end;

procedure TfrmCadAutOperacao.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := True;

   qry.FieldByName('NOMEUSUARIO').AsString  := QryUsuarioSistema.FieldByName('NOMEUSUARIO').AsString;

   if Trim(dblUsuarioSistema.Text) = '' then
   begin
      MsgDlg('Usuário não informado.', 'Atenção', mtWarning, [mbOk], 0);
      Accept := False;
   end;
end;

procedure TfrmCadAutOperacao.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor Then
      Posiciona(StrToInt(MontaSelect.ValoresChave[0]))
   Else
      Posiciona(-1);
end;

procedure TfrmCadAutOperacao.FormCreate(Sender: TObject);
begin
  inherited;
   Posiciona(-1)
end;

procedure TfrmCadAutOperacao.Posiciona(IdUsuarioSistema : Integer);
begin
   qry.Close;
   qry.ParamByName('IDUSUARIO').AsFloat := IdUsuarioSistema;
   qry.Open;
end;

procedure TfrmCadAutOperacao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dblUsuarioSistema.Text := '';
   dbchkInativo.Checked:=False;
end;

procedure TfrmCadAutOperacao.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   QryUsuarioSistema.Open;
   if dblUsuarioSistema.CanFocus then
      dblUsuarioSistema.SetFocus;
   dblUsuarioSistema.Enabled:=True;
end;

procedure TfrmCadAutOperacao.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  //AL_1
  dblUsuarioSistema.Enabled:=False;

end;

procedure TfrmCadAutOperacao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //AL_2
  dblUsuarioSistema.Enabled:=True;

end;

procedure TfrmCadAutOperacao.qryNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryFLGATIVO.AsString:='S';
end;

end.

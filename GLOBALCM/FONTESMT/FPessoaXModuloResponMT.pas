unit FPessoaXModuloResponMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, Grids, Wwdbigrd,
  Wwdbgrid, MontaSelect, Mask, DBCtrls, wwdblook, DBTables, uCtrlPessoaXModulo,
  uCtrlModulo;

type
  TFrmPessoaXModuloRespon = class(TfrmOkCancelar)
    DbgLista: TwwDBGrid;
    Panel2: TPanel;
    Panel1: TPanel;
    Ds: TDataSource;
    Cds: TCMClientDataSet;
    MontaSelect: TMontaSelect;
    BtnPesquisarPessoa: TBitBtn;
    lblFormaRecPag: TLabel;
    Label1: TLabel;
    BtnDesassociar: TBitBtn;
    BtnRelacionar: TBitBtn;
    CdsModulo: TCMClientDataSet;
    EdNome: TEdit;
    DbLcbModulo: TwwDBLookupCombo;
    procedure BtnPesquisarPessoaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDesassociarClick(Sender: TObject);
    procedure BtnRelacionarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IdPessoa: Double;
    Modulo: TCtrlModulo;
    PessoaxModulo: TCtrlPessoaxModulo;
  end;

var
  FrmPessoaXModuloRespon: TFrmPessoaXModuloRespon;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TFrmPessoaXModuloRespon.FormCreate(Sender: TObject);
begin
  inherited;
  Modulo := TCtrlModulo.Create;
  Modulo.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  PessoaxModulo := TCtrlPessoaxModulo.Create;
  PessoaxModulo.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  PessoaxModulo.cds := cds;
  CdsModulo.Data    := Modulo.ListaModulo;
  Cds.Data          := PessoaxModulo.ListaPessoaxModulo( -1 );
end;

procedure TFrmPessoaXModuloRespon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If ( Not cds.IsEmpty ) And ( MessageDlg( Translate('Confirma o abandono das alterações?'), MtConfirmation, [MbYes, MbNo], 0 ) <> MrYes ) Then
     Action := CaNone
  Else Begin
     Modulo.Free;
     PessoaxModulo.Free;
  End;
end;

procedure TFrmPessoaXModuloRespon.BtnPesquisarPessoaClick(
  Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  
  If MontaSelect.RetornouValor Then Begin
     EdNome.Text := MontaSelect.ValoresChave[ 1 ];
     IdPessoa    := StrToFloat( MontaSelect.ValoresChave[ 0 ] );

     If MontaSelect.ValoresChave[ 2 ] <> '' Then
        DbLcbModulo.Value := MontaSelect.ValoresChave[ 2 ];
  End;
end;

procedure TFrmPessoaXModuloRespon.BtnDesassociarClick(Sender: TObject);
begin
  inherited;
  DbLcbModulo.Value := '';
end;

procedure TFrmPessoaXModuloRespon.BtnRelacionarClick(Sender: TObject);
begin
  inherited;
  With Cds Do Begin
       Append;
       FieldByName( 'IdPessoa'{ivlm} ).AsFloat    := IdPessoa;
       FieldByName( 'NomePessoa'{ivlm} ).AsString := EdNome.Text;

       If DbLcbModulo.Value <> '' Then Begin
          FieldByName( 'IdModuloRespon'{ivlm} ).AsFloat := StrToFloat( DbLcbModulo.Value );
          FieldByName( 'NomeModulo'{ivlm} ).AsString    := CdsModulo.FieldByName( 'NomeModulo'{ivlm} ).AsString;
       End Else Begin
          FieldByName( 'IdModuloRespon'{ivlm} ).Clear;
          FieldByName( 'NomeModulo'{ivlm} ).AsString := '';
       End;

       Post;
  End;
  
  IdPessoa := 0;
  EdNome.Text := '';
  DbLcbModulo.Value := '';
end;

procedure TFrmPessoaXModuloRespon.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If MessageDlg( Translate('Confirma Gravação?'), MtConfirmation, [MbYes, MbNo], 0 ) = MrYes Then
     PessoaxModulo.Gravar;
end;

procedure TFrmPessoaXModuloRespon.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  If MessageDlg( Translate('Confirma o Cancelamento?'), MtConfirmation, [MbYes, MbNo], 0 ) <> MrYes Then
     Exit;

  cds.EmptyDataset;
  IdPessoa := 0;
  EdNome.text := '';
  DbLcbModulo.Value := '';
  BtnPesquisarPessoa.SetFocus;
end;

end.


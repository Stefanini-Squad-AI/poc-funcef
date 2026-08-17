unit FTipoMercadoBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, Mask, UOperacaoInvest, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TfrmTipoMercadoBMF = class(TfrmCadastroCS)
    dbeDescricao: TDBEdit;
    Label1: TLabel;
    qryIDTIPOMERCADOBMF: TFloatField;
    qryIDMERCADO: TFloatField;
    qryDESCTPMERCADOBMF: TStringField;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
  private
    { Private declarations }
    procedure Sel(N : Longint);
  public
    { Public declarations }
  end;

var
  frmTipoMercadoBMF: TfrmTipoMercadoBMF;

implementation

{$R *.DFM}
uses uMensErro, UDataBase,UBibliotecaInvest;

procedure TfrmTipoMercadoBMF.Sel(N : Longint);
begin
  qry.Close;
  qry.ParamByName('P_IDMERCADO').AsInteger := pRPI.IDMERCADO;
  qry.ParamByName('P_IDTIPOMERCADOBMF').AsInteger := N;
  qry.Open;
end;

procedure TfrmTipoMercadoBMF.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  Accept := False;
  if Trim(dbeDescricao.Text) = '' then
     begin
       MsgDlg('Tipo de Contrato de BM & F não preenchido', 'Erro', mtError, [mbOk], 0);
       dbeDescricao.SetFocus;
     end
  else
    Accept := True;
end;

procedure TfrmTipoMercadoBMF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmTipoMercadoBMF.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.State = dsInsert then
     begin
       qryIDTIPOMERCADOBMF.AsInteger := LeUltRegistro(nil, 'TIPOMERCADOBMF');
       qryIDMERCADO.AsInteger := pRPI.IDMERCADO;
     end;
  inherited;
end;

procedure TfrmTipoMercadoBMF.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

end.

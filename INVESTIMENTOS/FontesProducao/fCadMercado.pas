unit fCadMercado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, wwdblook, Mask,
  wwdbedit;

type
  TfrmCadMercado = class(TfrmCadastroCSInv)
    qryIDMERCADO: TFloatField;
    qryDESCMERCADO: TStringField;
    qryIDTIPOINVEST: TFloatField;
    Label1: TLabel;
    dbeMercado: TwwDBEdit;
    dblTipoInvest: TwwDBLookupCombo;
    Label2: TLabel;
    qryTipoInvest: TwwQuery;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(iChave: Integer);
  public
    { Public declarations }
  end;

var
  frmCadMercado: TfrmCadMercado;

implementation

uses UOperComum, uMensErro, UDataBase;

{$R *.DFM}

{ TfrmCadMercado }

procedure TfrmCadMercado.Sel(iChave: Integer);
begin
   OperComum.LimpaParametros(qry);
   if iChave > -2 then
      qry.ParamByName('IDMERCADO').Asinteger := iChave;
   qry.Open;
end;

procedure TfrmCadMercado.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if Trim(dblTipoInvest.Text) = '' then
  begin
    MsgDlg('Selecione um tipo de investimento.', 'Warning', mtWarning, [mbOk], 0);
    if dblTipoInvest.CanFocus then
       dblTipoInvest.SetFocus;
  end
  else
  if Trim(dbeMercado.Text) = '' then
  begin
    MsgDlg('Informe a descrição do mercado.', 'Warning', mtWarning, [mbOk], 0);
    if dbeMercado.CanFocus then
       dbeMercado.SetFocus;
  end
  else
  begin
     Accept := True;
     if qry.State = dsInsert then
        qryIDMERCADO.AsInteger := LeUltRegistro(nil, 'MERCADO');
  end;
end;

procedure TfrmCadMercado.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadMercado.FormShow(Sender: TObject);
begin
   inherited;
   Sel(-1);
end;

procedure TfrmCadMercado.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if dblTipoInvest.CanFocus then
      dblTipoInvest.SetFocus;
end;

procedure TfrmCadMercado.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if dblTipoInvest.CanFocus then
      dblTipoInvest.SetFocus;
end;

end.

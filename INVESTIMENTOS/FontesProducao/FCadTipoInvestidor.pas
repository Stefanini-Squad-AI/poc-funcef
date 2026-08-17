unit FCadTipoInvestidor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList;

type
  TfrmCadTipoInvestidor = class(TfrmCadastroCS)
    qryIDTIPOINVESTIDOR: TFloatField;
    qryDESCTPINVESTIDOR: TStringField;
    dbeDescricao: TwwDBEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(N : Longint);
  public
    { Public declarations }
  end;

var
  frmCadTipoInvestidor: TfrmCadTipoInvestidor;

implementation

{$R *.DFM}

uses uMensErro, UDataBase;

procedure TfrmCadTipoInvestidor.Sel(N : Longint);
begin
  qry.Close;
  qry.ParamByName('P_IDTIPOINVESTIDOR').AsInteger := N;
  qry.Open;
end;

procedure TfrmCadTipoInvestidor.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  SelectFirst;
end;

procedure TfrmCadTipoInvestidor.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  Accept := False;
  if Trim(dbeDescricao.Text) = '' then
     begin
       MsgDlg('Descrição não preenchida', 'Erro', mtError, [mbOk], 0);
       dbeDescricao.SetFocus;
     end
  else
     Accept := True;
end;

procedure TfrmCadTipoInvestidor.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipoInvestidor.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.State = dsInsert then
     qryIDTIPOINVESTIDOR.AsInteger := LeUltRegistro(nil, 'TIPOINVESTIDOR');
  inherited;
end;

procedure TfrmCadTipoInvestidor.FormCreate(Sender: TObject);      
begin
  inherited;
  Sel(-1);
end;

end.

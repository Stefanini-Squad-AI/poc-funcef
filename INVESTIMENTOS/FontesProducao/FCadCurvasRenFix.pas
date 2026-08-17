unit FCadCurvasRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, fcLabel, Mask, wwdbedit;

type
  TfrmCadCurvasRenFix = class(TfrmCadastroCSInv)
    dbeDescCurvasRenFix: TwwDBEdit;
    Label1: TLabel;
    qryIDCURVARENFIX: TFloatField;
    qryDESCCURVARENFIX: TStringField;
    qryDeletaItens: TwwQuery;
    qryDeletaItensIDITEMRENFIX: TFloatField;
    qryDeletaItensDESCITEMRENFIX: TStringField;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    iCurvaAtu: Integer;
    procedure Sel(N : Longint);
  public
    { Public declarations }
  end;

var
  frmCadCurvasRenFix: TfrmCadCurvasRenFix;

implementation

{$R *.DFM}

uses uMensErro, UDataBase;

{ TfrmCadCurvasRenFix }

procedure TfrmCadCurvasRenFix.Sel(N: Integer);
begin
  qry.Close;
  if N > -2 then
     qry.ParamByName('IDCURVARENFIX').AsInteger := N;
  qry.Open;
end;

procedure TfrmCadCurvasRenFix.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if Trim(dbeDescCurvasRenFix.Text) = '' then
  begin
    MsgDlg('Falta o Nome da Curva.', 'Warning', mtWarning, [mbOk], 0);
    dbeDescCurvasRenFix.SetFocus;
  end
  else
  begin
     Accept := True;
     if qry.State = dsInsert then
     begin
        iCurvaAtu := LeUltRegistro(nil, 'CURVASRENFIX');
        qryIDCURVARENFIX.AsInteger := iCurvaAtu;
     end;
  end;
end;

procedure TfrmCadCurvasRenFix.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     iCurvaAtu := StrToInt(MontaSelect.ValoresChave[0]);
     Sel(iCurvaAtu);
  end;
end;

procedure TfrmCadCurvasRenFix.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

procedure TfrmCadCurvasRenFix.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if dbeDescCurvasRenFix.CanFocus then
    dbeDescCurvasRenFix.SetFocus;
end;

procedure TfrmCadCurvasRenFix.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if dbeDescCurvasRenFix.CanFocus then
    dbeDescCurvasRenFix.SetFocus;
end;

procedure TfrmCadCurvasRenFix.sbtnApagarClick(Sender: TObject);
begin
  try
    qryDeletaItens.ParamByName('IDCURVARENFIX').AsInteger := iCurvaAtu;
    qryDeletaItens.Prepare;
    qryDeletaItens.ExecSQL;
    inherited;
    Sel(iCurvaAtu);
  except
  end;
end;

end.

unit FConsAvancada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, StdCtrls, ExtCtrls, Buttons, Db, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, MAHlpBtn, FTelaAut, FOkCancelar, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmConsAvancada = class(TfrmOkCancelar)
    grpResultado: TGroupBox;
    pnlResult: TPanel;
    pnlConsultar: TPanel;
    anmLupa: TAnimate;
    bbtnConsultar: TButton;
    pgctrlConsulta: TPageControl;
    tbsPrincipal: TTabSheet;
    tbsAvancada: TTabSheet;
    lstTabelas: TListBox;
    pnlPesqAvanc: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    sbtnOU: TSpeedButton;
    sbtnE: TSpeedButton;
    sbtnApagar: TSpeedButton;
    rgrpSinal: TRadioGroup;
    lstCampo: TListBox;
    edConteudo: TEdit;
    lstResult: TListBox;
    procedure bbtnConsultarClick(Sender: TObject);
    procedure Consulta; Virtual;
    procedure sbtnEMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnEClick(Sender: TObject);
    procedure sbtnOUMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lstCampoClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnOUClick(Sender: TObject);
    function  ConteudoPreenchido(var pSQLParc : string) : string; virtual;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  protected
    { Protected declarations }
    sSQLParcial,
    sSQLAvanc   : string;
    lstSQL    : TStringList; { items da cláusula WHERE }
  end;

var
  frmConsAvancada: TfrmConsAvancada;

implementation

{$R *.DFM}

procedure TfrmConsAvancada.Consulta;
begin
  ShowMessage('Você não implementou a rotina Consulta');
end;

function TfrmConsAvancada.ConteudoPreenchido(var pSQLParc : string) : string;
begin
  result := edConteudo.Text;
end;

procedure TfrmConsAvancada.bbtnConsultarClick(Sender: TObject);

begin
  inherited;
  anmLupa.Active := true;
  Consulta;
  anmLupa.Active := False;
end;

procedure TfrmConsAvancada.sbtnEMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var  sConteudo : string;
begin
  inherited;
  if (lstCampo.Items.Count <= 0) then
  begin
    sbtnE.Hint := '... E ... ';
    Exit;
  end;

  sConteudo := ConteudoPreenchido(sSQLParcial);
  if sConteudo = '' then
    sConteudo := '[Conteúdo]';

  if (lstCampo.Items.Count <= 0) or (lstCampo.ItemIndex < 0) then
    sbtnE.Hint := '... E [Campo] '
  else
    sbtnE.Hint := '... E '+lstCampo.Items[lstCampo.ItemIndex];

  case rgrpSinal.ItemIndex of
     0 : {+ } sbtnE.Hint := sbtnE.Hint+' = ';
     1 : {> } sbtnE.Hint := sbtnE.Hint+' > ';
     2 : {< } sbtnE.Hint := sbtnE.Hint+' < ';
     3 : {>=} sbtnE.Hint := sbtnE.Hint+' >= ';
     4 : {<=} sbtnE.Hint := sbtnE.Hint+' <= ';
     else
         sbtnE.Hint := sbtnE.Hint + ' [Comparação] ';
  end;
  sbtnE.Hint := sbtnE.Hint + sConteudo;
end;

procedure TfrmConsAvancada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  lstSQL.Free;
  Action := caFree;
end;

procedure TfrmConsAvancada.FormShow(Sender: TObject);
begin
  inherited;
  pgctrlConsulta.ActivePage := tbsPrincipal;
end;

procedure TfrmConsAvancada.sbtnEClick(Sender: TObject);
var sResult : string;
begin
  inherited;
  if (lstCampo.Items.Count <= 0) or (lstCampo.ItemIndex < 0) or
     (lstTabelas.Items.Count <= 0) or (lstTabelas.ItemIndex < 0) or
     (rgrpSinal.ItemIndex < 0) then
    exit;

  //Colocar nome do campo no Resultado
  if lstResult.Items.Count <> 0 then
    sResult := ' E  '+lstCampo.Items[lstCampo.ItemIndex]
  else
    sResult := lstCampo.Items[lstCampo.ItemIndex];

  //Colocar sinal do campo no Resultado
  case rgrpSinal.ItemIndex of
     0 : {+ } sResult := sResult + '=';
     1 : {> } sResult := sResult + '>';
     2 : {< } sResult := sResult + '<';
     3 : {>=} sResult := sResult + '>=';
     4 : {<=} sResult := sResult + '<=';
  end;

  //Colocar valor do campo no Resultado
  sResult := sResult + ConteudoPreenchido(sSQLParcial);
  lstResult.Items.Add(sResult);
end;

procedure TfrmConsAvancada.sbtnOUMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var sConteudo : string;
begin
  inherited;

  if (lstCampo.Items.Count <= 0) then
  begin
    sbtnOU.Hint := '... OU ... ';
    exit;
  end;

  if (lstCampo.Items.Count <= 0) then
  begin
    sbtnOU.Hint := '... OU ... ';
    exit;
  end;

  sConteudo := ConteudoPreenchido(sSQLParcial);
  if sConteudo = '' then
    sConteudo := '[Conteúdo]';

  if (lstCampo.Items.Count <= 0) or (lstCampo.ItemIndex < 0) then
    sbtnOU.Hint := '... OU [Campo] '
  else
    sbtnOU.Hint := '... OU '+lstCampo.Items[lstCampo.ItemIndex];

  case rgrpSinal.ItemIndex of
     0 : {+ } sbtnOU.Hint := sbtnOU.Hint+' = ';
     1 : {> } sbtnOU.Hint := sbtnOU.Hint+' > ';
     2 : {< } sbtnOU.Hint := sbtnOU.Hint+' < ';
     3 : {>=} sbtnOU.Hint := sbtnOU.Hint+' >= ';
     4 : {<=} sbtnOU.Hint := sbtnOU.Hint+' <= ';
     else
         sbtnOU.Hint := sbtnOU.Hint + ' [Comparação] ';
  end;
  sbtnOU.Hint := sbtnOU.Hint + sConteudo;
end;

procedure TfrmConsAvancada.lstCampoClick(Sender: TObject);
begin
  inherited;
  if (lstCampo.Items.Count <= 0) then
    exit;
  rgrpSinal.ItemIndex := -1;
  edConteudo.Text := '';
end;

procedure TfrmConsAvancada.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  lstResult.Items.Delete(lstResult.ItemIndex);
end;

procedure TfrmConsAvancada.sbtnOUClick(Sender: TObject);
var sResult : string;
begin
  inherited;
  if (lstCampo.Items.Count <= 0) or (lstCampo.ItemIndex < 0) or
     (rgrpSinal.ItemIndex < 0) then
    exit;
  //Colocar nome do campo no Resultado
  if lstResult.Items.Count <> 0 then
    sResult := ' OU '+lstCampo.Items[lstCampo.ItemIndex]
  else
    sResult := lstCampo.Items[lstCampo.ItemIndex];

  //Colocar sinal do campo no Resultado
  case rgrpSinal.ItemIndex of
     0 : {+ } sResult := sResult + '=';
     1 : {> } sResult := sResult + '>';
     2 : {< } sResult := sResult + '<';
     3 : {>=} sResult := sResult + '>=';
     4 : {<=} sResult := sResult + '>=';
  end;

  //Colocar conteudo do campo no Resultado
  sResult := sResult + ConteudoPreenchido(sSQLParcial);

  lstResult.Items.Add(sResult);
end;

procedure TfrmConsAvancada.FormCreate(Sender: TObject);
begin
  inherited;
  //Criar lista de items da cláusula WHERE
  lstSQL := TStringList.Create;
end;

procedure TfrmConsAvancada.bbtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.

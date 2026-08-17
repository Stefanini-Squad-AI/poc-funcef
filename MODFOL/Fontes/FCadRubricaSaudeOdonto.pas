{*******************************************************}
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Mose Cornetta           }
{ Atualizado Em: 21/01/2013                             }
{*******************************************************}

unit fCadRubricaSaudeOdonto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, MontaSelect,
  Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, uCtrlVlrRubrica, DBTables, Wwquery, UDatabase, Wwdotdot,
  Wwdbcomb;

type
  TfrmCadRubricaSaudeOdonto = class(TFrmCadastroMT)
    GroupBox1: TGroupBox;
    grp2: TGroupBox;
    dbedValor: TDBEdit;
    dbedAno: TwwDBSpinEdit;
    dbcRubrica: TDBLookupComboBox;
    cdsRubrica: TCMClientDataSet;
    dsRub: TwwDataSource;
    QRY: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    dbcMes: TwwDBComboBox;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlVlrRubrica: TCtrlVlrRubrica;
    iproximoId: Integer;

  public
    { Public declarations }
    procedure Sel(IdVlrRubrica: string);

    function  GravarRegistro: boolean;
  end;

var
  frmCadRubricaSaudeOdonto: TfrmCadRubricaSaudeOdonto;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadRubricaSaudeOdonto.Sel(IdVlrRubrica: string);
begin
  Cds.Data := CtrlVlrRubrica.ListGeral(IdVlrRubrica);
end;

procedure TfrmCadRubricaSaudeOdonto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlVlrRubrica := TCtrlVlrRubrica.Create;
  CtrlVlrRubrica.InitializeAs(Padroes);

  cdsRubrica.Data := CtrlVlrRubrica.CarregaRubricas;

  CtrlVlrRubrica.Cds := Cds;
//  CarregaRubricas;
  

  Sel('-1');


end;

procedure TfrmCadRubricaSaudeOdonto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlVlrRubrica);
  inherited;
end;

procedure TfrmCadRubricaSaudeOdonto.CmeCadastroFind(Sender: TObject);
var qtcarac : Integer;
var    mes: string ;
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(MontaSelect.ValoresChave[0]);
  Cds.Edit;
  if (Cds.FieldByName('MES').AsString<>'')    then
  dbcMes.ItemIndex := Cds.FieldByName('MES').AsInteger - 1;
  

end;


procedure TfrmCadRubricaSaudeOdonto.CmeCadastroInsert(Sender: TObject);
begin
  Sel('-1');
  inherited;
end;

procedure TfrmCadRubricaSaudeOdonto.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRubricaSaudeOdonto.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRubricaSaudeOdonto.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;
              
function TfrmCadRubricaSaudeOdonto.GravarRegistro: boolean;
begin

  Result := CtrlVlrRubrica.Gravar;
  if not(Result) then
    raise exception.Create(CtrlVlrRubrica.MessageInfo);
end;


procedure TfrmCadRubricaSaudeOdonto.bbtnConfirmarClick(Sender: TObject);
var mes, edita : Integer;

begin
  if (Trim(dbedValor.Text) = '') then
  begin
    MsgDlg('Obrigatório o preenchimento do campo "Valor"', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedValor.SetFocus;
  end
  else
  if ((Trim(dbcMes.Text) = '') or (Trim(dbedAno.Text) = '')) then
  begin
    MsgDlg('Obrigatório o preenchimento do campo "Mes e Ano de Referencia"', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbcMes.SetFocus;
  end
  else
  Cds.Edit;
  mes := dbcMes.ItemIndex;
  if ((dbcMes.ItemIndex + 1) < 10 ) then
  begin
  Cds.FieldByName('MES').AsString:= '0' + IntToStr(dbcMes.ItemIndex + 1);
  end
  else
  Cds.FieldByName('MES').AsString:= IntToStr(dbcMes.ItemIndex + 1);
  if (Cds.State in [dsEdit])   then
  edita := 1;
  inherited;
  if (edita = 1)   then
  dbcMes.ItemIndex := Cds.FieldByName('MES').AsInteger - 1;
  edita :=0;
end;

procedure TfrmCadRubricaSaudeOdonto.bbtnCancelarClick(Sender: TObject);
var edita : Integer;
begin

  if (Cds.State in [dsEdit])   then
  edita := 1;
    inherited;
  if (edita = 1)   then
  dbcMes.ItemIndex := Cds.FieldByName('MES').AsInteger - 1;
  edita :=0;
end;

procedure TfrmCadRubricaSaudeOdonto.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dbcMes.ItemIndex := Cds.FieldByName('MES').AsInteger - 1;
end;

end.

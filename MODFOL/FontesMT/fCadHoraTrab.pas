unit fCadHoraTrab;

//***************************************************************************************
//Nº SOL:            259921-18014
//Nº KINTANA:        1217940
//Data da Alteração: 19/02/2016
//Alteração Form:    Add campo JornadaDiaria
//Responsável:       André Imakawa
//Descrição:         Incluido campo JornadaDiaria(campo obrigatorio)
//                   Inclui Exit nas validações de preenchimento dos campo
//                   Codigo e descrição.
//**************************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, TREdit, DBCtrls, Mask, ImgList,
  DBClient, CmEventosCadastro, FCadastroMT, uCMClientDataSet, uCtrlHoraTrab;

type
  TfrmCadHoraTrab = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    dbrgTipoHorario: TDBRadioGroup;
    Label3: TLabel;
    dbedJornada: TDBEdit;
    gbxEscala: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbreFolga1: TDBRealEdit;
    dbreServico: TDBRealEdit;
    dbreFolga2: TDBRealEdit;
    lblJornDiaria: TLabel;
    dbedJornadaDiaria: TDBEdit;
    procedure dbrgTipoHorarioChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlHoraTrab: TCtrlHoraTrab;

    procedure Sel(IdHorario: integer);
    function  GravarRegistro: boolean;
  end;

var
  frmCadHoraTrab: TfrmCadHoraTrab;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadHoraTrab.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);
  CtrlHoraTrab.CdsHoraTrab := Cds;
  Sel(-1);
end;

procedure TfrmCadHoraTrab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHoraTrab);
  inherited;
end;

procedure TfrmCadHoraTrab.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
    dbrgTipoHorarioChange(Sender);
  end;
end;

procedure TfrmCadHoraTrab.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('FLGTIPOHORARIO').asInteger := 0;
end;

procedure TfrmCadHoraTrab.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadHoraTrab.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadHoraTrab.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadHoraTrab.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadHoraTrab.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadHoraTrab.dbrgTipoHorarioChange(Sender: TObject);
begin
  gbxEscala.Visible := (dbrgTipoHorario.ItemIndex = 1)
end;

procedure TfrmCadHoraTrab.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
    Exit; // André Imakawa SOL 259921-18014 PPM 1217940
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
    Exit; // André Imakawa SOL 259921-18014 PPM 1217940
  end
  // André Imakawa SOL 259921-18014 PPM 1217940 - Inicio
  else
  if (Trim(dbedJornadaDiaria.Text) = '') then
  begin
    MsgDlg('Preencha a jornada diária em minutos.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedJornadaDiaria.SetFocus;
    Exit;
  end
  // André Imakawa SOL 259921-18014 PPM 1217940 - Fim
  else
  if (dbrgTipoHorario.ItemIndex = 1) then
  begin
    if (dbreFolga1.Value >= 24) then
    begin
      MsgDlg('Folga 1 deve ser inferiror a 24.', 'Aviso', mtInformation, [mbOK,mbHelp], 0);
      dbreFolga1.SetFocus;
    end
    else
    if (dbreFolga1.Value = 0) and (dbreServico.Value = 0) and (dbreFolga2.Value = 0) then
    begin
      MsgDlg('A Qtde. de Horas da Escala deve ser preeenchida.', 'Aviso', mtInformation, [mbOK,mbHelp], 0);
      dbreFolga1.SetFocus;
    end;
  end;

  bInserindo := (Cds.State = dsInsert);
  inherited;
  if not(bInserindo) then
    CmeCadastroFind(Sender);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadHoraTrab.Sel(IdHorario: integer);
begin
  Cds.Data := CtrlHoraTrab.ListHoraTrab(IdHorario);
end;

function TfrmCadHoraTrab.GravarRegistro: boolean;
begin
  Result := CtrlHoraTrab.GravarHoraTrab;
  if not(Result) then
    raise Exception.Create(CtrlHoraTrab.MessageInfo);
end;

end.
